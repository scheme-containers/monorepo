((versions
   ("0"
    (url . "https://scheme.fail/releases/loko-0.12.1.tar.gz")
    (checksum . "404b4cf89002130355a4ac9e39ae6fb07cfca05759fc9b5081f9f62943cfba7b"))
   ("latest"
    (url . "https://scheme.fail/releases/loko-0.12.1.tar.gz")
    (checksum . "404b4cf89002130355a4ac9e39ae6fb07cfca05759fc9b5081f9f62943cfba7b"))
   ("head"
    (git-url . "https://gitlab.com/weinholt/loko.git")
    (build-image-debian . "schemers/loko:latest")
    (build-image-alpine . "schemers/loko:latest-alpine")))
 (configure-command . "sleep 0")
 (scheme-banner . "loko \"$@\"")
 (scheme-r7rs . "loko -std=r7rs \"$@\""))
