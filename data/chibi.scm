(release
  (version . "0.11")
  (sources
    (archive
      (url . "https://github.com/ashinn/chibi-scheme/archive/refs/tags/0.11.tar.gz")
      (hash . "b4404d5304b51b243684702fa7b5f2d82f77cb7ef470bcfca1d94f8ed7660342")))
  (build-deps (apt ("build-essential")))
  (run-deps (apt ("curl")))
  (build-steps ("make" "make install")))

(release
  (version . "head")
  (sources
    (git
      (url . "https://github.com/ashinn/chibi-scheme.git")))
  (build-deps (apt ("build-essential")))
  (run-deps (apt ("curl")))
  (build-steps ("make" "make install")))

(scheme-banner . "chibi-scheme -V && exec chibi-scheme \"$@\"")

(scheme-r7rs . "exec chibi-scheme -r \"$@\"")
