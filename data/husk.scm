((versions
   ("head"))
 (configure-command "cabal update")
 (build-command . "mkdir -p /root/.cabal/bin && cabal install --prefix=$PREFIX husk-scheme husk-scheme-libs")
 (install-command . "sleep 0")
 (apt-build-dependencies . "cabal-install")
 (apt-dependencies . "libatomic1")
 (apk-build-dependencies . "cabal-install")
 (apk-dependencies . "libatomic")
 (scheme-banner . "huski \"$@\""))
