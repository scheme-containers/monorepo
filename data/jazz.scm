((versions
   ("head" (git-url . "https://github.com/jazzscheme/jazz")))
 (build-image-debian . "schemers/gambit:latest")
 (apt-build-dependencies . "ghostscript texinfo libcairo-dev libglu1-mesa libglu1-mesa-dev")
 (configure-command . "./jaz configure l")
 (build-command . "./jaz make jazz@l")
 (install-command . "./jaz make @l")
 (scheme-banner . "jazz \"$@\""))
