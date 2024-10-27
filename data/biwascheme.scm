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
 (configure-command . "npm install")
 (build-command . "npm run build")
 (install-command . "npm install -g"))
