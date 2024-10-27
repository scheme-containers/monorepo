((versions
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
