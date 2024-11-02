((versions
   ("head" (git-url . "https://github.com/jazzscheme/gambit.git")))
 (apt-build-dependencies . "netbase openssh-client libmbedtls-dev zlib1g-dev ")
 (apt-dependencies . "libmbedtls14 ca-certificates")
 (scheme-banner . "gsi \"$@\"")
 (scheme-r7rs . "gsi \"$@\""))
