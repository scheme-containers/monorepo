((versions
   ("10"
    (url . "https://github.com/cisco/ChezScheme/releases/download/v10.0.0/csv10.0.0.tar.gz")
    (checksum . "d37199012b5ed1985c4069d6a87ff18e5e1f5a2df27e402991faf45dc4f2232c")))
 (apt-build-dependencies . "libc6-dev libx11-dev uuid-dev ncurses-dev")
 ; We need this script because argv[0] needs to be "scheme".
 (scheme-banner . "#!/bin/sh\\nexec scheme \"$@\"\\n"))
