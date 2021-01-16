#!/usr/bin/env scheme-script
;; -*- mode: scheme; coding: utf-8 -*-
;; SPDX-License-Identifier: MIT
;; © 2021 Göran Weinholt

;;; Create/update .dehs(s) files in the current directory based on .watch files.

;; This script scans for .watch files in the current directory. The
;; .watch file format is documented here:
;; <https://manpages.debian.org/buster/devscripts/uscan.1.en.html>. It
;; runs uscan to update the DEHS data. The data is written to the
;; .dehs file in XML format and the .dehss file in SXML format.

;; If the file FOO.version exists then it should contain a single line
;; with the "latest" version number, i.e. the version that we have a
;; container for. This version number is used for the status field in
;; the DEHS data. It's set to "newer package available" if there's a
;; newer version that we have a container for.

;; Tested with Chibi Scheme 0.9.1.

(import (scheme base)
        (scheme file)
        (scheme process-context)
        (srfi 1)
        (srfi 115)
        (srfi 166)
        (only (okmij ssax) ssax:xml->sxml)
        (only (chibi process) process->string)
        (chibi match))

(cond-expand
 ((library (chibi filesystem)) (import (only (chibi filesystem) directory-files)))
 (else (import (only (srfi 170) directory-files))))

(define packages
  (if (pair? (cdr (command-line)))
      (cdr (command-line))
      (filter-map (lambda (fn)
                    (cond ((regexp-matches (rx ($ (+ any)) ".watch") fn)
                           => (lambda (m)
                                (regexp-match-submatch m 1)))
                          (else #f)))
                  (directory-files "."))))

(for-each
 (lambda (package-name)
   ;; Filenames
   (define fn-dehs (string-append package-name ".dehs"))
   (define fn-dehss (string-append package-name ".dehss"))
   (define fn-watch (string-append package-name ".watch"))
   (define fn-version (string-append package-name ".version"))

   ;; Parse the .dehs file, if it exists
   (define old-dehs
     (if (file-exists? fn-dehs)
         (call-with-input-file fn-dehs
           (lambda (p)
             (match (ssax:xml->sxml p '())
               (('*TOP* x) x))))
         `(dehs "" (package ,package-name) (upstream-version "0"))))
   (define latest-version
     (if (file-exists? fn-version)
         (call-with-input-file fn-version read-line)
         (let lp ((x* old-dehs))
           (match x*
             ((('upstream-version x) . _) x)
             ((_ . x*) (lp x*))))))
   (let* ((new-dehs (process->string `("uscan" "--dehs"
                                      "--package" ,package-name
                                      "--upstream-version" ,latest-version
                                      "--watchfile" ,fn-watch)))
          (new-dehss (ssax:xml->sxml (open-input-string new-dehs) '())))
     ;; Write the new .dehss and .dehs files
     (call-with-output-file fn-dehss
       (lambda (p)
         (show p (pretty new-dehss))))
     (call-with-output-file fn-dehs
       (lambda (p)
         (show p (displayed new-dehs))))

     ;; Show status on stdout
     (show (current-output-port) (pretty new-dehss))
     (newline)))
 packages)
