((versions
   ("0"
    (url . "https://github.com/vyzo/gerbil/archive/v0.16.tar.gz")
    (checksum . "1157d4ef60dab6a0f7c4986d5c938391973045093c470a03ffe02266c4d3e119"))
   ("latest"
    (url . "https://github.com/vyzo/gerbil/archive/v0.16.tar.gz")
    (checksum . "1157d4ef60dab6a0f7c4986d5c938391973045093c470a03ffe02266c4d3e119")))
 (build-image . "schemers/gambit:latest")
 (apt-build-dependencies . "libsqlite3-dev libssl-dev openssl sqlite3 zlib1g-dev")
 (apt-dependencies . "ca-certificates gcc git libc-dev")
 (apk-build-dependencies . "sqlite-dev libssl3 openssl sqlite zlib-dev")
 (apk-dependencies . "gcc git musl-dev")
 (scheme-banner . "gxi \"$@\"")
 (scheme-r7rs . "gxi --lang r7rs \"$@\""))
