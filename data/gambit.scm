((versions
   ("4"
    (url . "https://gambitscheme.org/latest/gambit-v4_9_5.tgz")
    (checksum . "e28ef8db5f0e7b1159720c150053dcab8f7c4cae1f0e5c838944797073f8c1dc"))
   ("latest"
    (url . "https://gambitscheme.org/latest/gambit-v4_9_5.tgz")
    (checksum . "e28ef8db5f0e7b1159720c150053dcab8f7c4cae1f0e5c838944797073f8c1dc"))
   ("head" (git-url . "https://github.com/gambit/gambit.git")))
 (apt-build-dependencies . "netbase openssh-client libmbedtls-dev zlib1g-dev ")
 (apt-dependencies . "libmbedtls14 ca-certificates")
 (scheme-banner . "gsi \"$@\"")
 (scheme-r7rs . "gsi \"$@\""))
