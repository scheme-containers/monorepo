((versions
   ("1")
   ("latest"))
 (configure-command . "sleep 0")
 (build-command . "sleep 0")
 (install-command . "npm install -g @jcubic/lips@beta")
 (apt-build-dependencies . "npm nodejs")
 (apt-dependencies . "nodejs")
 (apk-build-dependencies . "npm nodejs")
 (apk-dependencies . "nodejs")
 (scheme-banner . "lips \"$@\"")
 (scheme-r7rs . "lips \"$@\""))