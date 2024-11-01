((versions
   ("5"
    (url . "https://code.call-cc.org/releases/5.4.0/chicken-5.4.0.tar.gz")
    (checksum . "3c5d4aa61c1167bf6d9bf9eaf891da7630ba9f5f3c15bf09515a7039bfcdec5f"))
   ("latest"
    (url . "https://code.call-cc.org/releases/5.4.0/chicken-5.4.0.tar.gz")
    (checksum . "3c5d4aa61c1167bf6d9bf9eaf891da7630ba9f5f3c15bf09515a7039bfcdec5f"))
   ("head"
    (git-url . "https://code.call-cc.org/git/chicken-core.git")
    (build-image-debian . "schemers/chicken:latest")
    (build-image-alpine . "schemers/chicken:latest-alpine")))
 (run-image-extra-command . "chicken-install r7rs")
 (apt-dependencies . "gcc libgc-dev")
 (apk-dependencies . "gcc musl-dev gc-dev")
 (scheme-banner . "csi \"$@\"")
 (scheme-r7rs . "csi -R r7rs"))
