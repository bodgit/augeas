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

  (* Comments cannot have any leading characters *)
  let comment    = Util.comment_generic /#[ \t]*/ "# "
  let empty      = Util.empty

  (* field must not contain ':' unless quoted or '\'-escaped  *)
  let nfield     = /[^#:\\\\\t\n|][^:\\\\\t\n|]*/
  let cfield     = /[a-zA-Z0-9-]+([%^$#\\]?@|[%^$#\\=]("[^"]*"|[^:"]*))?/

  let csep       = del /:([ \t]*\\\\\n[ \t]*:)?/ ":\\\n\t:"
  let nsep       = Util.del_str "|"
  let name       = [ label "name" . store nfield ]
  let capability = [ label "capability" . store cfield ]
  let record     = [ seq "record" . name . ( nsep . name )* . csep . capability . ( csep . capability )* . Sep.colon . eol ]

  let lns = ( empty | comment | record )*

  let filter = incl "/etc/login.conf"
             . incl "/etc/printcap"
             . incl "/etc/rtadvd.conf"
             . Util.stdexcl

  let xfm = transform lns filter

(* Local Variables: *)
(* mode: caml       *)
(* End:             *)
