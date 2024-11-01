((versions
   ("head" (git-url . "https://github.com/JeffBezanson/femtolisp.git"))
   ("head-lambdaconservatory" (git-url . "https://github.com/lambdaconservatory/femtolisp.git"))
   )
 (configure-command . "mkdir -p /usr/local/share/flisp  && cp -p flisp.boot /usr/local/share/flisp/flisp.boot")
 (build-command .  "make CFLAGS='-D INITFILE=\\\"/usr/local/share/flisp/flisp.boot\\\"' PREFIX=$PREFIX")
 (install-command . "cp -p flisp /usr/local/bin/")
 (scheme-banner . "flisp \"$@\""))
