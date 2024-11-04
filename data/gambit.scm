(release
  (version ."4.9.5")
  (sources
    (archive
      (url . "https://gambitscheme.org/latest/gambit-v4_9_5.tgz")
      (hash . "e28ef8db5f0e7b1159720c150053dcab8f7c4cae1f0e5c838944797073f8c1dc")))
  (build-deps (apt ("build-essential" "netbase" "openssh-client" "libmbedtls-dev zlib1g-dev")))
  (run-deps (apt ("build-essential" "libmdebtls14" "ca-certificates"))))

;(release ("head" (git-url . "https://github.com/gambit/gambit.git")))
 ;(apt-build-dependencies . "netbase openssh-client libmbedtls-dev zlib1g-dev ")
 ;(apt-dependencies . "libmbedtls14 ca-certificates")

(scheme-banner . "gsi \"$@\"")
(scheme-r7rs . "gsi \"$@\""))
