(id "stklos")
(title "STklos")
(long-title "STklos Scheme")
(tagline "R7RS interpreter with GTK GUI and CLOS-like object system")
(based-on "stk")

(homepage-url "https://www.stklos.net/")
(github "egallesio/STklos")
(repology "stklos")

(releases
 (release
  (version "1.70")
  (date "2021-11-24")
  (sources
   (archive
    (url "http://www.stklos.net/download/stklos-1.70.tar.gz")
    (sha-256
     "15a1251a0e72d66051011bb95ba9122b22f7acd8a5a0d0e4f8737cc9fcbb83c7")
    (basename "stklos-1.70.tar.gz")))
  (build-deps
   "gcc" "any-make" "file" "texinfo"
   "bdw-gc" "gmp" "libffi" "pcre")
  (run-deps
   "bdw-gc" "gmp" "libffi" "pcre")
  (build-steps
   (run (exec "./configure"
              "--without-provided-bignum"
              "--without-provided-gc"
              "--without-provided-regexp"))
   (run (exec "make"))
   (run (exec "make" "install")))
  (scheme-banner "stklos")))
