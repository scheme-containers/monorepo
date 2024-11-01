((versions
   ("head" (git-url . "https://github.com/lojikil/digamma.git")))
 (build-image-debian . "debian:bullseye-slim")
 (run-image-debian . "debian:bullseye-slim")
 (apt-build-dependencies . "llvm-10 llvm-10-dev clang-10 lld-10 cpio libgc-dev")
 (apk-build-dependencies . "llvm clang lld cpio gc-dev")
 (scheme-banner . "chibi-scheme -V && exec chibi-scheme \"$@\"")
 (scheme-r7rs . "exec chibi-scheme -r \"$@\""))
