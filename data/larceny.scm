((versions
   ("1"
    (url . "http://www.larcenists.org/LarcenyReleases/larceny-1.3-bin-native-ia32-linux86.tar.gz")
    (checksum . "f04a63e69d6aa2dfd633a5583628d41ca545e7327ce801ba3c61bf16b7184821"))
   ("latest"
    (url . "http://www.larcenists.org/LarcenyReleases/larceny-1.3-bin-native-ia32-linux86.tar.gz")
    (checksum . "f04a63e69d6aa2dfd633a5583628d41ca545e7327ce801ba3c61bf16b7184821")))
 (configure-command . "sleep 0")
 (build-command . "sleep 0")
 (install-command . "mkdir -p /usr/local/lib/larceny && cp -r * /usr/local/lib/larceny/")
 (scheme-banner . "/usr/local/lib/larceny/larceny \"$@\""))
