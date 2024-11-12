
(release
  (version . "latest")
  (sources
    (archive
      (url . "https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/12.1/mit-scheme-12.1-x86-64.tar.gz")
      (hash . "8cfbb21b0e753ab8874084522e4acfec7cadf83e516098e4ab788368b748ae0c")))
  (build-deps (apt ("build-essential" "m4")))
  (build-directory . "src")
  (build-steps ("./configure" "make"))
  (install-steps ("make install")))

(scheme-banner . "mit-scheme -V && exec mit-scheme\"$@\"")

(scheme-r7rs . "exec mit-scheme \"$@\"")
