(*
Module: Getcap
  Parses termcap-style capability databases

Author: Matt Dainty <matt@bodgit-n-scarper.com>

About: Reference
       - man 3 getcap
       - man 5 login.conf
       - man 5 printcap
       - man 5 rtadvd.conf
       - man 5 termcap

Each line represents a record consisting of a number of ':'-separated fields
the first of which is the name or identifier for the record. Records can be
split across multiple lines with '\'.

*)

module Getcap =
  autoload xfm

  let eol        = Util.eol

  let comment    = Util.comment
  let empty      = Util.empty

  (* field must not contain ':' unless quoted or '\'-escaped  *)
  let field      = /([^:\\\n]|\\\\.)+|[^:\n]*(\"[^\n]+\"[^:\n]*)+/

  let sep        = del /:([ \t]*\\\\\n[ \t]*:)?/ ":\\\n\t:"
  let name       = [ label "name" . store field ]
  let capability = [ label "capability" . store field ]
  let record     = [ label "record" . name . sep . capability . ( sep . capability )* . Sep.colon . eol ]

  let lns = ( empty | comment | record )*

  let filter = incl "/etc/login.conf"
             . incl "/etc/printcap"
             . incl "/etc/rtadvd.conf"
             . incl "/usr/share/misc/termcap"
             . Util.stdexcl

  let xfm = transform lns filter

(* Local Variables: *)
(* mode: caml       *)
(* End:             *)
