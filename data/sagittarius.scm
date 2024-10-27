((versions
   ("0"
    (url . "https://bitbucket.org/ktakashi/sagittarius-scheme/downloads/sagittarius-0.9.12.tar.gz")
    (checksum . "c3a690902effbca3bc7b1bc3a6c4ac2f22d7ae6e0548a87c5d818982c784208d"))
   ("latest"
    (url . "https://bitbucket.org/ktakashi/sagittarius-scheme/downloads/sagittarius-0.9.12.tar.gz")
    (checksum . "c3a690902effbca3bc7b1bc3a6c4ac2f22d7ae6e0548a87c5d818982c784208d"))
   ("head"
    (git-url . "https://bitbucket.org/ktakashi/sagittarius-scheme.git")))
 (configure-command . "cmake .")
 (apt-build-dependencies . "cmake libffi-dev libgc-dev libssl-dev libz-dev")
 (apt-dependencies . "libffi8 libgc1 libssl3")
 (apk-build-dependencies . "cmake libffi gc-dev openssl-dev zlib")
 (apk-dependencies . "libffi-dev gc-dev openssl")
 (scheme-banner . "#!/bin/sh\\nset -eu\\nsagittarius -v\\nexec sagittarius \"$@\"")
 (scheme-r7rs . "#!/bin/sh\\nexec sagittarius -r 7 \"$@\"\\n"))
