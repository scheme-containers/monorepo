((versions
   ("head" (git-url . "https://github.com/jazzscheme/jazz")))
 (build-image-debian . "schemers/jazz-gambit:head")
 (build-image-alpine . "schemers/jazz-gambit:head-alpine")
 (apt-build-dependencies . "ghostscript texinfo libcairo-dev libglu1-mesa libglu1-mesa-dev")
 (apk-build-dependencies . "ghostscript texinfo libcairo-dev libglu1-mesa libglu1-mesa-dev")
 (configure-command . "GAMBITDIR=/usr/local ./jaz configure l")
 (build-command . "./jaz make jazz@l")
 (install-command . "./jaz make @l")
 (scheme-banner . "jazz \"$@\""))