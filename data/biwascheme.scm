((versions
   ("0"
    (url . "https://github.com/biwascheme/biwascheme/archive/refs/tags/v0.8.0.tar.gz")
    (checksum . "c956e37c60e6fbf4cd1c93302ba533d6a98e0ce162701d9ff78df1b67ee13dde"))
   ("latest"
    (url . "https://github.com/biwascheme/biwascheme/archive/refs/tags/v0.8.0.tar.gz")
    (checksum . "c956e37c60e6fbf4cd1c93302ba533d6a98e0ce162701d9ff78df1b67ee13dde"))
   ("head" (git-url . "https://github.com/biwascheme/biwascheme.git")))
 (apt-build-dependencies . "nodejs npm")
 (apt-dependencies . "nodejs")
 (apk-build-dependencies . "nodejs npm")
 (apk-dependencies . "nodejs")
 (npm-build-dependencies . "rollup")
 (npm-dependencies . "rollup")
 (configure-command . "sleep 0")
 (build-command . "sleep 0")
 (install-command . "npm install -g biwascheme")
 (scheme-banner . "#!/bin/sh\\nbiwas"))
