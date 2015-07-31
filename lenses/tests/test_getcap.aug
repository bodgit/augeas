module Test_getcap =

(* Example from getcap(3) *)
let getcap = "example|an example of binding multiple values to names:\\
     :foo%bar:foo^blah:foo@:\\
     :abc%xyz:abc^frap:abc$@:\\
     :tc=more:
"

test Getcap.lns get getcap =
  { "1"
    { "name" = "example" }
    { "name" = "an example of binding multiple values to names" }
    { "capability" = "foo%bar" }
    { "capability" = "foo^blah" }
    { "capability" = "foo@" }
    { "capability" = "abc%xyz" }
    { "capability" = "abc^frap" }
    { "capability" = "abc$@" }
    { "capability" = "tc=more" }
  }

(* Taken from the standard /etc/login.conf *)
let login_conf = "# Default allowed authentication styles
auth-defaults:auth=passwd,skey:

# Default allowed authentication styles for authentication type ftp
auth-ftp-defaults:auth-ftp=passwd:

#
# The default values
# To alter the default authentication types change the line:
#       :tc=auth-defaults:\\
# to be read something like: (enables passwd, \"myauth\", and activ)
#       :auth=passwd,myauth,activ:\\
# Any value changed in the daemon class should be reset in default
# class.
#
default:\\
        :path=/usr/bin /bin /usr/sbin /sbin /usr/X11R6/bin /usr/local/bin /usr/local/sbin:\\
        :umask=022:\\
        :datasize-max=512M:\\
        :datasize-cur=512M:\\
        :maxproc-max=256:\\
        :maxproc-cur=128:\\
        :openfiles-cur=512:\\
        :stacksize-cur=4M:\\
        :localcipher=blowfish,8:\\
        :ypcipher=old:\\
        :tc=auth-defaults:\\
        :tc=auth-ftp-defaults:
"

test Getcap.lns get login_conf =
  { "#comment" = "Default allowed authentication styles" }
  { "1"
    { "name" = "auth-defaults" }
    { "capability" = "auth=passwd,skey" }
  }
  {  }
  { "#comment" = "Default allowed authentication styles for authentication type ftp" }
  { "2"
    { "name" = "auth-ftp-defaults" }
    { "capability" = "auth-ftp=passwd" }
  }
  {  }
  {  }
  { "#comment" = "The default values" }
  { "#comment" = "To alter the default authentication types change the line:" }
  { "#comment" = ":tc=auth-defaults:\\" }
  { "#comment" = "to be read something like: (enables passwd, \"myauth\", and activ)" }
  { "#comment" = ":auth=passwd,myauth,activ:\\" }
  { "#comment" = "Any value changed in the daemon class should be reset in default" }
  { "#comment" = "class." }
  {  }
  { "3"
    { "name" = "default" }
    { "capability" = "path=/usr/bin /bin /usr/sbin /sbin /usr/X11R6/bin /usr/local/bin /usr/local/sbin" }
    { "capability" = "umask=022" }
    { "capability" = "datasize-max=512M" }
    { "capability" = "datasize-cur=512M" }
    { "capability" = "maxproc-max=256" }
    { "capability" = "maxproc-cur=128" }
    { "capability" = "openfiles-cur=512" }
    { "capability" = "stacksize-cur=4M" }
    { "capability" = "localcipher=blowfish,8" }
    { "capability" = "ypcipher=old" }
    { "capability" = "tc=auth-defaults" }
    { "capability" = "tc=auth-ftp-defaults" }
  }

(* Example from rtadvd.conf(5) *)
let rtadvd_conf = "default:\\
        :chlim#64:raflags#0:rltime#1800:rtime#0:retrans#0:\\
        :pinfoflags=\"la\":vltime#2592000:pltime#604800:mtu#0:
ef0:\\
        :addr=\"2001:db8:ffff:1000::\":prefixlen#64:tc=default:
"

test Getcap.lns get rtadvd_conf =
  { "1"
    { "name" = "default" }
    { "capability" = "chlim#64" }
    { "capability" = "raflags#0" }
    { "capability" = "rltime#1800" }
    { "capability" = "rtime#0" }
    { "capability" = "retrans#0" }
    { "capability" = "pinfoflags=\"la\"" }
    { "capability" = "vltime#2592000" }
    { "capability" = "pltime#604800" }
    { "capability" = "mtu#0" }
  }
  { "2"
    { "name" = "ef0" }
    { "capability" = "addr=\"2001:db8:ffff:1000::\"" }
    { "capability" = "prefixlen#64" }
    { "capability" = "tc=default" }
  }

(* Sample /etc/printcap *)
let printcap = "#       $OpenBSD: printcap,v 1.1 2014/07/12 03:52:39 deraadt Exp $

lp|local line printer:\\
        :lp=/dev/lp:sd=/var/spool/output:lf=/var/log/lpd-errs:

rp|remote line printer:\\
        :lp=:rm=printhost:rp=lp:sd=/var/spool/output:lf=/var/log/lpd-errs:
"

test Getcap.lns get printcap =
  { "#comment" = "$OpenBSD: printcap,v 1.1 2014/07/12 03:52:39 deraadt Exp $" }
  {  }
  { "1"
    { "name" = "lp" }
    { "name" = "local line printer" }
    { "capability" = "lp=/dev/lp" }
    { "capability" = "sd=/var/spool/output" }
    { "capability" = "lf=/var/log/lpd-errs" }
  }
  {  }
  { "2"
    { "name" = "rp" }
    { "name" = "remote line printer" }
    { "capability" = "lp=" }
    { "capability" = "rm=printhost" }
    { "capability" = "rp=lp" }
    { "capability" = "sd=/var/spool/output" }
    { "capability" = "lf=/var/log/lpd-errs" }
  }

