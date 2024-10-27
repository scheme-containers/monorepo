(define implementations
  '((bigloo
      (versions
        ("4"
         (url . "ftp://ftp-sop.inria.fr/indes/fp/Bigloo/bigloo-4.5b.tar.gz")
         (checksum . "864d525ee6a7ff339fd9a8c973cc46bf9a623a3827d84bfb6e04a29223707da5"))
        ("latest"
         (url . "ftp://ftp-sop.inria.fr/indes/fp/Bigloo/bigloo-4.5b.tar.gz")
         (checksum . "864d525ee6a7ff339fd9a8c973cc46bf9a623a3827d84bfb6e04a29223707da5"))
        ("head" (git-url . "https://github.com/manuel-serrano/bigloo.git")))
      (build-command . "make && make compile-bee")
      (configure-command . "./configure --bee=full --jvm=yes")
      (apt-build-dependencies . "patch zip default-jdk-headless sqlite3 libc-dev libgmp-dev libunistring-dev libpcre2-dev libsqlite3-dev libssl-dev")
      (apt-dependencies . "default-jre-headless sqlite3 gcc libc-dev libgmp-dev libunistring-dev libpcre3-dev libsqlite3-dev libssl-dev")
      (install-command . "make install-sans-docs")
      (scheme-banner . "#!/bin/sh\\nbigloo"))
    (biwascheme
      (versions
        ("0"
         (url . "https://github.com/biwascheme/biwascheme/archive/refs/tags/v0.8.0.tar.gz")
         (checksum . "c956e37c60e6fbf4cd1c93302ba533d6a98e0ce162701d9ff78df1b67ee13dde"))
        ("latest"
         (url . "https://github.com/biwascheme/biwascheme/archive/refs/tags/v0.8.0.tar.gz")
         (checksum . "c956e37c60e6fbf4cd1c93302ba533d6a98e0ce162701d9ff78df1b67ee13dde"))
        ("head" (git-url . "https://github.com/biwascheme/biwascheme.git")))
      (apt-build-dependencies . "nodejs npm")
      (apt-dependencies . "nodejs")
      (configure-command . "npm install")
      (build-command . "npm run build")
      (install-command . "npm install -g"))
    (chezscheme
      (versions
        ("10"
         (url . "https://github.com/cisco/ChezScheme/releases/download/v10.0.0/csv10.0.0.tar.gz")
         (checksum . "d37199012b5ed1985c4069d6a87ff18e5e1f5a2df27e402991faf45dc4f2232c"))
        (apt-build-dependencies . "libc6-dev libx11-dev uuid-dev ncurses-dev")
         ; We need this script because argv[0] needs to be "scheme".
        (scheme-banner . "#!/bin/sh\\nexec scheme \"$@\"\\n")))
    (chibi
      (versions
        ("0"
         (url . "https://github.com/ashinn/chibi-scheme/archive/refs/tags/0.11.tar.gz")
         (checksum . "b4404d5304b51b243684702fa7b5f2d82f77cb7ef470bcfca1d94f8ed7660342"))
        ("latest"
         (url . "https://github.com/ashinn/chibi-scheme/archive/refs/tags/0.11.tar.gz")
         (checksum . "b4404d5304b51b243684702fa7b5f2d82f77cb7ef470bcfca1d94f8ed7660342"))
        ("head" (git-url . "https://github.com/ashinn/chibi-scheme.git")))
      (scheme-banner . "#!/bin/sh\\nset -eu\\nchibi-scheme -V\\nexec chibi-scheme \"$@\"\\n")
      (scheme-r7rs . "#!/bin/sh\\nexec chibi-scheme -r \"$@\"\\n"))
    (sagittarius
      (versions
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

    ))

