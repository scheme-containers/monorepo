((versions
   ("0"
    (url . "https://raw.githubusercontent.com/lambdaconservatory/scheme-release-archive/master/minischeme/0.85k4/minischeme.tar.gz")
    (checksum . "8f2a9902c544a3f12af9f4f36f1cd03d286510425279f622c413e0a96eeed720"))
   ("latest"
    (url . "https://raw.githubusercontent.com/lambdaconservatory/scheme-release-archive/master/minischeme/0.85k4/minischeme.tar.gz")
    (checksum . "8f2a9902c544a3f12af9f4f36f1cd03d286510425279f622c413e0a96eeed720")))
 (configure-command . "sed -i 's@\"init.scm\"@\"/usr/local/share/miniscm/init.scm\"@' miniscm.c")
 (build-command . "cc -D BSD -o miniscm miniscm.c")
 (install-command . "mkdir /usr/local/share/miniscm && install -m 755 miniscm /usr/local/bin/ && install -m 644 *.scm /usr/local/share/miniscm")
 (scheme-banner . "miniscm \"$@\"")
 (scheme-r7rs . "miniscm \"$@\""))
