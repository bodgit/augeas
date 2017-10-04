(*
Module: Rtadvd
  Parses termcap-style capability databases

Author: Matt Dainty <matt@bodgit-n-scarper.com>

About: Reference
       - man 3 getcap
       - man 5 rtadvd.conf

Each line represents a record consisting of a number of ':'-separated fields
the first of which is the name or identifier for the record. Records can be
split across multiple lines with '\'.

*)

module Rtadvd =
  autoload xfm

  let empty  = Util.empty

  (* field must not contain ':' unless quoted or '\'-escaped  *)
  let cfield = /[a-zA-Z0-9-]+(#?@|#[0-9]+|=("[^"]*"|[^:"]*))?/

  let lns = ( empty | Getcap.comment | Getcap.record cfield )*

  let filter = incl "/etc/rtadvd.conf"
             . Util.stdexcl

  let xfm = transform lns filter

(* Local Variables: *)
(* mode: caml       *)
(* End:             *)
