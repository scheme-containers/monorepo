((versions
   ("head" (git-url . "https://gitlab.com/weinholt/conscheme.git")))
 (configure-command . "go get -d -v ./...")
 (build-command . "go build -v ./... && go test -v ./... && ./rebuild.sh ")
 (install-command . "./conscheme tests.scm && cp conscheme compiler/conscheme.image /usr/local/conscheme/")
 (apt-build-dependencies . "golang")
 (apk-build-dependencies . "go")
 (scheme-banner . "")
 (scheme-r7rs . ""))
