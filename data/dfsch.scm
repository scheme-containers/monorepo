((versions
   ("0"
    (url . "https://github.com/adh/dfsch/archive/refs/tags/rel-0.4.0.tar.gz")
    (checksum . "6fecb6956385fb6ff7c41981b242c4b30f98cbd0c4f64b38f01374dcfc7875c4"))
   ("latest"
    (url . "https://github.com/adh/dfsch/archive/refs/tags/rel-0.4.0.tar.gz")
    (checksum . "6fecb6956385fb6ff7c41981b242c4b30f98cbd0c4f64b38f01374dcfc7875c4"))
   ("head" (git-url . "https://github.com/adh/dfsch.git")))
 (configure-command . "./bootstrap.sh && ./configure --prefix=$PREFIX")
 (apt-build-dependencies . "libgc-dev libexpat1-dev zlib1g-dev")
 (apk-build-dependencies . "gc-dev expat-dev zlib-dev")
 (scheme-banner . "dfsch-repl"))
