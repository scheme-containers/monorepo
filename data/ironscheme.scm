((versions
   ("1"
    (zip-url . "https://github.com/IronScheme/IronScheme/releases/download/1.0.266/IronScheme-1.0.266-a52b5aa.zip")
    (checksum . "dffbe624717c38277d9de106fb389467df6edf1280d322a497b0346a2b2dd523"))
   ("1-mono"
    (zip-url . "https://github.com/IronScheme/IronScheme/releases/download/1.0.266/IronScheme-1.0.266-a52b5aa.zip")
    (checksum . "dffbe624717c38277d9de106fb389467df6edf1280d322a497b0346a2b2dd523")
    (apt-dependencies . "mono-runtime mono-devel")
    (apk-dependencies . "mono mono-dev")
    (scheme-banner . "mono /usr/local/IronScheme/IronScheme.Console-v4.exe \"$@\""))
   ("latest"
    (zip-url . "https://github.com/IronScheme/IronScheme/releases/download/1.0.266/IronScheme-1.0.266-a52b5aa.zip")
    (checksum . "dffbe624717c38277d9de106fb389467df6edf1280d322a497b0346a2b2dd523"))
   ("latest-mono"
    (zip-url . "https://github.com/IronScheme/IronScheme/releases/download/1.0.266/IronScheme-1.0.266-a52b5aa.zip")
    (checksum . "dffbe624717c38277d9de106fb389467df6edf1280d322a497b0346a2b2dd523")
    (apt-dependencies . "mono-runtime mono-devel")
    (apk-dependencies . "mono mono-dev")
    (scheme-banner . "mono /usr/local/IronScheme/IronScheme.Console-v4.exe \"$@\""))
   ("head" (git-url . "https://github.com/IronScheme/IronScheme.git")))
 (run-image-debian . "ubuntu:24.04") ; Dotnet is in Ubuntu repositories
 (apt-dependencies . "dotnet8 ")
 (apk-dependencies . "dotnet8-runtime")
 (configure-command . "sleep 0")
 (build-command . "sleep 0")
 (install-command . "mv IronScheme /usr/local/IronScheme")
 (scheme-banner . "dotnet /usr/local/IronScheme/IronScheme.ConsoleCore.dll \"$@\""))
