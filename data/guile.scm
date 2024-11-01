((versions
   ("2"
    (url . "https://ftp.gnu.org/gnu/guile/guile-2.2.7.tar.xz")
    (checksum . "cdf776ea5f29430b1258209630555beea6d2be5481f9da4d64986b077ff37504"))
   ("3"
    (url . "https://ftp.gnu.org/gnu/guile/guile-3.0.10.tar.gz")
    (checksum . "2dbdbc97598b2faf31013564efb48e4fed44131d28e996c26abe8a5b23b56c2a"))
   ("latest"
    (url . "https://ftp.gnu.org/gnu/guile/guile-3.0.10.tar.gz")
    (checksum . "2dbdbc97598b2faf31013564efb48e4fed44131d28e996c26abe8a5b23b56c2a"))
   ("head" (git-url . "https://git.sv.gnu.org/git/guile.git")))
 (apt-build-dependencies . "file libncurses5-dev libreadline-dev libltdl-dev libgmp-dev texinfo flex libunistring-dev libgc-dev libffi-dev gettext pkg-config")
 (apt-dependencies . "libgc1 libltdl7")
 (scheme-banner . "guile \"$@\"")
 (scheme-r7rs . "guile --r7rs \"$@\""))
