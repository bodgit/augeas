module Test_getcap =

  (* Example from getcap(3) *)
  let getcap = "example|an example of binding multiple values to names:\
     :foo%bar:foo^blah:foo@:\
     :abc%xyz:abc^frap:abc$@:\
     :tc=more:
"
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
default:\
        :path=/usr/bin /bin /usr/sbin /sbin /usr/X11R6/bin /usr/local/bin /usr/local/sbin:\
        :umask=022:\
        :datasize-max=512M:\
        :datasize-cur=512M:\
        :maxproc-max=256:\
        :maxproc-cur=128:\
        :openfiles-cur=512:\
        :stacksize-cur=4M:\
        :localcipher=blowfish,8:\
        :ypcipher=old:\
        :tc=auth-defaults:\
        :tc=auth-ftp-defaults:
"

  (* Example from rtadvd.conf(5) *)
  let rtadvd_conf = "default:\
        :chlim#64:raflags#0:rltime#1800:rtime#0:retrans#0:\
        :pinfoflags=\"la\":vltime#2592000:pltime#604800:mtu#0:
ef0:\
        :addr=\"2001:db8:ffff:1000::\":prefixlen#64:tc=default:
"

  (* Sample /etc/printcap *)
  let printcap = "#       $OpenBSD: printcap,v 1.1 2014/07/12 03:52:39 deraadt Exp $

lp|local line printer:\
        :lp=/dev/lp:sd=/var/spool/output:lf=/var/log/lpd-errs:

rp|remote line printer:\
        :lp=:rm=printhost:rp=lp:sd=/var/spool/output:lf=/var/log/lpd-errs:
"

  (* Sample termcap entry with escaped ':''s *)
  let termcap = "vt420pc|DEC VT420 w/PC keyboard:\
        :@7=\E[4~:F1=\E[23~:F2=\E[24~:F3=\E[11;2~:F4=\E[12;2~:\
        :F5=\E[13;2~:F6=\E[14;2~:F7=\E[15;2~:F8=\E[17;2~:\
        :F9=\E[18;2~:FA=\E[19;2~:FB=\E[20;2~:FC=\E[21;2~:\
        :FD=\E[23;2~:FE=\E[24;2~:FF=\E[23~:FG=\E[24~:FH=\E[25~:\
        :FI=\E[26~:FJ=\E[28~:FK=\E[29~:FL=\E[31~:FM=\E[32~:\
        :FN=\E[33~:FO=\E[34~:FP=\E[35~:FQ=\E[36~:FR=\E[23;2~:\
        :FS=\E[24;2~:FT=\E[25;2~:FU=\E[26;2~:FV=\E[28;2~:\
        :FW=\E[29;2~:FX=\E[31;2~:FY=\E[32;2~:FZ=\E[33;2~:\
        :Fa=\E[34;2~:Fb=\E[35;2~:Fc=\E[36;2~:\
        :S6=USR_TERM\:vt420pcdos\::k1=\E[11~:k2=\E[12~:\
        :k3=\E[13~:k4=\E[14~:k5=\E[15~:k6=\E[17~:k7=\E[18~:\
        :k8=\E[19~:k9=\E[20~:k;=\E[21~:kD=\177:kh=\E[H:\
        :..px=\EP1;1|%?%{16}%p1%>%t%{0}%e%{21}%p1%>%t%{1}%e%{25}%p1%>%t%{2}%e%{27}%p1%>%t%{3}%e%{30}%p1%>%t%{4}%e%{5}%;%p1%+%d/%p2%s\E\\:\
        :tc=vt420:
"

  let termcap2 = "tws-generic|dku7102|Bull Questar tws terminals:\
        :am:es:hs:mi:ms:xn:xo:xs@:\
        :co#80:it#8:li#24:ws#80:\
        :AL=\E[%dL:DC=\E[%dP:DL=\E[%dM:DO=\E[%dB:LE=\E[%dD:\
        :RI=\E[%dC:UP=\E[%dA:al=\E[L:bl=^G:bt=\E[Z:cd=\E[J:ce=\E[K:\
        :cl=\E[2J:cm=\E[%i%d;%df:cr=^M:ct=\E[3g:dc=\E[P:dl=\E[M:\
        :do=^J:ds=\EPY99\:98\E\\\E[0;98v\E[2J\E[v:ei=\E[4l:\
        :fs=\E[v:ho=\E[H:i1=\E[?=h\Ec\E`\E[?>h\EPY99\:98\E\\\\:\
        :i2=\Eb\E[?<h:im=\E[4h:\
        :is=\E[5;>;12;18;?<l\E[=h\EP1s\E\\\E[\027p:\
        :k1=\E[1u\027:k2=\E[2u\027:k3=\E[3u\027:k4=\E[4u\027:\
        :k5=\E[5u\027:k6=\E[6u\027:k7=\E[7u\027:k8=\E[8u\027:\
        :kD=\E[P:kb=^H:kd=\E[B:kh=\E[H:kl=\E[D:kr=\E[C:ku=\E[A:\
        :le=^H:ll=\E[H\E[A:mb=\E[0;5m:me=\E[0m\017:mh=\E[0;2m:\
        :mr=\E[0;7m:nd=\E[C:rs=\E[?=h\Ec:se=\E[m:sf=^J:so=\E[0;7m:\
        :st=\EH:ta=\E[I:te=\E[0;98v\E[2J\E[v:\
        :ti=\E[?>h\EPY99\:98\E\\\\:\
        :ts=\EPY99\:98\E\\\E[0;98v\E[2;7m:ue=\E[m:up=\E[A:\
        :us=\E[0;4m:ve=\E[r:vi=\E[1r:
"

test Getcap.lns get termcap2 =
  { "record"
    { "name" = "tws-generic|dku7102|Bull Questar tws terminals" }
    { "capability" = "am" }
    { "capability" = "es" }
    { "capability" = "hs" }
    { "capability" = "mi" }
    { "capability" = "ms" }
    { "capability" = "xn" }
    { "capability" = "xo" }
    { "capability" = "xs@" }
    { "capability" = "co#80" }
    { "capability" = "it#8" }
    { "capability" = "li#24" }
    { "capability" = "ws#80" }
    { "capability" = "AL=\E[%dL" }
    { "capability" = "DC=\E[%dP" }
    { "capability" = "DL=\E[%dM" }
    { "capability" = "DO=\E[%dB" }
    { "capability" = "LE=\E[%dD" }
    { "capability" = "RI=\E[%dC" }
    { "capability" = "UP=\E[%dA" }
    { "capability" = "al=\E[L" }
    { "capability" = "bl=^G" }
    { "capability" = "bt=\E[Z" }
    { "capability" = "cd=\E[J" }
    { "capability" = "ce=\E[K" }
    { "capability" = "cl=\E[2J" }
    { "capability" = "cm=\E[%i%d;%df" }
    { "capability" = "cr=^M" }
    { "capability" = "ct=\E[3g" }
    { "capability" = "dc=\E[P" }
    { "capability" = "dl=\E[M" }
    { "capability" = "do=^J" }
    { "capability" = "ds=\EPY99\:98\E\\E[0;98v\E[2J\E[v" }
    { "capability" = "ei=\E[4l" }
    { "capability" = "fs=\E[v" }
    { "capability" = "ho=\E[H" }
    { "capability" = "i1=\E[?=h\Ec\E`\E[?>h\EPY99\:98\E\\" }
    { "capability" = "i2=\Eb\E[?<h" }
    { "capability" = "im=\E[4h" }
    { "capability" = "is=\E[5;>;12;18;?<l\E[=h\EP1s\E\\E[\027p" }
    { "capability" = "k1=\E[1u\027" }
    { "capability" = "k2=\E[2u\027" }
    { "capability" = "k3=\E[3u\027" }
    { "capability" = "k4=\E[4u\027" }
    { "capability" = "k5=\E[5u\027" }
    { "capability" = "k6=\E[6u\027" }
    { "capability" = "k7=\E[7u\027" }
    { "capability" = "k8=\E[8u\027" }
    { "capability" = "kD=\E[P" }
    { "capability" = "kb=^H" }
    { "capability" = "kd=\E[B" }
    { "capability" = "kh=\E[H" }
    { "capability" = "kl=\E[D" }
    { "capability" = "kr=\E[C" }
    { "capability" = "ku=\E[A" }
    { "capability" = "le=^H" }
    { "capability" = "ll=\E[H\E[A" }
    { "capability" = "mb=\E[0;5m" }
    { "capability" = "me=\E[0m\017" }
    { "capability" = "mh=\E[0;2m" }
    { "capability" = "mr=\E[0;7m" }
    { "capability" = "nd=\E[C" }
    { "capability" = "rs=\E[?=h\Ec" }
    { "capability" = "se=\E[m" }
    { "capability" = "sf=^J" }
    { "capability" = "so=\E[0;7m" }
    { "capability" = "st=\EH" }
    { "capability" = "ta=\E[I" }
    { "capability" = "te=\E[0;98v\E[2J\E[v" }
    { "capability" = "ti=\E[?>h\EPY99\:98\E\\" }
    { "capability" = "ts=\EPY99\:98\E\\E[0;98v\E[2;7m" }
    { "capability" = "ue=\E[m" }
    { "capability" = "up=\E[A" }
    { "capability" = "us=\E[0;4m" }
    { "capability" = "ve=\E[r" }
    { "capability" = "vi=\E[1r" }
  }

test Getcap.lns get getcap =
  { "record"
    { "name" = "example|an example of binding multiple values to names" }
    { "capability" = "foo%bar" }
    { "capability" = "foo^blah" }
    { "capability" = "foo@" }
    { "capability" = "abc%xyz" }
    { "capability" = "abc^frap" }
    { "capability" = "abc$@" }
    { "capability" = "tc=more" }
  }

test Getcap.lns get login_conf =
  { "#comment" = "Default allowed authentication styles" }
  { "record" 
    { "name" = "auth-defaults" }
    { "capability" = "auth=passwd,skey" }
  }
  {  }
  { "#comment" = "Default allowed authentication styles for authentication type ftp" }
  { "record"
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
  { "record" 
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

test Getcap.lns get rtadvd_conf =
  { "record" 
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
  { "record" 
    { "name" = "ef0" }
    { "capability" = "addr=\"2001:db8:ffff:1000::\"" }
    { "capability" = "prefixlen#64" }
    { "capability" = "tc=default" }
  }

test Getcap.lns get printcap =
  { "#comment" = "$OpenBSD: printcap,v 1.1 2014/07/12 03:52:39 deraadt Exp $" }
  {  }
  { "record" 
    { "name" = "lp|local line printer" }
    { "capability" = "lp=/dev/lp" }
    { "capability" = "sd=/var/spool/output" }
    { "capability" = "lf=/var/log/lpd-errs" }
  }
  {  }
  { "record" 
    { "name" = "rp|remote line printer" }
    { "capability" = "lp=" }
    { "capability" = "rm=printhost" }
    { "capability" = "rp=lp" }
    { "capability" = "sd=/var/spool/output" }
    { "capability" = "lf=/var/log/lpd-errs" }
  }

test Getcap.lns get termcap =
  { "record" 
    { "name" = "vt420pc|DEC VT420 w/PC keyboard" }
    { "capability" = "@7=\E[4~" }
    { "capability" = "F1=\E[23~" }
    { "capability" = "F2=\E[24~" }
    { "capability" = "F3=\E[11;2~" }
    { "capability" = "F4=\E[12;2~" }
    { "capability" = "F5=\E[13;2~" }
    { "capability" = "F6=\E[14;2~" }
    { "capability" = "F7=\E[15;2~" }
    { "capability" = "F8=\E[17;2~" }
    { "capability" = "F9=\E[18;2~" }
    { "capability" = "FA=\E[19;2~" }
    { "capability" = "FB=\E[20;2~" }
    { "capability" = "FC=\E[21;2~" }
    { "capability" = "FD=\E[23;2~" }
    { "capability" = "FE=\E[24;2~" }
    { "capability" = "FF=\E[23~" }
    { "capability" = "FG=\E[24~" }
    { "capability" = "FH=\E[25~" }
    { "capability" = "FI=\E[26~" }
    { "capability" = "FJ=\E[28~" }
    { "capability" = "FK=\E[29~" }
    { "capability" = "FL=\E[31~" }
    { "capability" = "FM=\E[32~" }
    { "capability" = "FN=\E[33~" }
    { "capability" = "FO=\E[34~" }
    { "capability" = "FP=\E[35~" }
    { "capability" = "FQ=\E[36~" }
    { "capability" = "FR=\E[23;2~" }
    { "capability" = "FS=\E[24;2~" }
    { "capability" = "FT=\E[25;2~" }
    { "capability" = "FU=\E[26;2~" }
    { "capability" = "FV=\E[28;2~" }
    { "capability" = "FW=\E[29;2~" }
    { "capability" = "FX=\E[31;2~" }
    { "capability" = "FY=\E[32;2~" }
    { "capability" = "FZ=\E[33;2~" }
    { "capability" = "Fa=\E[34;2~" }
    { "capability" = "Fb=\E[35;2~" }
    { "capability" = "Fc=\E[36;2~" }
    { "capability" = "S6=USR_TERM\\:vt420pcdos\\:" }
    { "capability" = "k1=\E[11~" }
    { "capability" = "k2=\E[12~" }
    { "capability" = "k3=\E[13~" }
    { "capability" = "k4=\E[14~" }
    { "capability" = "k5=\E[15~" }
    { "capability" = "k6=\E[17~" }
    { "capability" = "k7=\E[18~" }
    { "capability" = "k8=\E[19~" }
    { "capability" = "k9=\E[20~" }
    { "capability" = "k;=\E[21~" }
    { "capability" = "kD=\177" }
    { "capability" = "kh=\E[H" }
    { "capability" = "..px=\EP1;1|%?%{16}%p1%>%t%{0}%e%{21}%p1%>%t%{1}%e%{25}%p1%>%t%{2}%e%{27}%p1%>%t%{3}%e%{30}%p1%>%t%{4}%e%{5}%;%p1%+%d/%p2%s\E\\" }
    { "capability" = "tc=vt420" }
  }
