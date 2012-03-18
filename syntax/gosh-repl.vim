" Vim syntax file
" Language:	gosh-repl
" Last Change:	2012 Mar 18
" Maintainer:	aharisu <foo.yobina@gmail.com>
"
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"syn case ignore
syn case match

" this defines first for nested srfi-62 comment
" ( http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/syntax.html#:syn-priority )
syn region gosh_replSrfi62CommentParen start="(" end=")" contains=gosh_replSrfi62CommentParen transparent
syn region gosh_replSrfi62CommentParen start="\[" end="\]" contains=gosh_replSrfi62CommentParen transparent

" Fascist highlighting: everything that doesn't fit the rules is an error...

syn match	gosh_replError	oneline    ![^ \t()\[\]";]*!
syn match	gosh_replError	oneline    ")"

" Quoted and backquoted stuff

syn region gosh_replQuoted matchgroup=Delimiter start="['`]" end=![ \t()\[\]";]!me=e-1 contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc

syn region gosh_replQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc
syn region gosh_replQuoted matchgroup=Delimiter start="['`]#(" matchgroup=Delimiter end=")" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc

syn region gosh_replStrucRestricted matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc
syn region gosh_replStrucRestricted matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc

" Popular gosh_repl extension:
" using [] as well as ()
syn region gosh_replQuoted matchgroup=Delimiter start="['`]\[" matchgroup=Delimiter end="\]" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc
syn region gosh_replQuoted matchgroup=Delimiter start="['`]#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc
syn region gosh_replStrucRestricted matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc
syn region gosh_replStrucRestricted matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc

syn region gosh_replUnquote matchgroup=Delimiter start="," end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc
syn region gosh_replUnquote matchgroup=Delimiter start=",@" end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc

syn region gosh_replUnquote matchgroup=Delimiter start=",(" end=")" contains=ALL
syn region gosh_replUnquote matchgroup=Delimiter start=",@(" end=")" contains=ALL

syn region gosh_replUnquote matchgroup=Delimiter start=",#(" end=")" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc
syn region gosh_replUnquote matchgroup=Delimiter start=",@#(" end=")" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc

syn region gosh_replUnquote matchgroup=Delimiter start=",\[" end="\]" contains=ALL
syn region gosh_replUnquote matchgroup=Delimiter start=",@\[" end="\]" contains=ALL

syn region gosh_replUnquote matchgroup=Delimiter start=",#\[" end="\]" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc
syn region gosh_replUnquote matchgroup=Delimiter start=",@#\[" end="\]" contains=ALLBUT,gosh_replStruc,gosh_replSyntax,gosh_replFunc

" R5RS gosh_repl Functions and Syntax:

if version < 600
  set iskeyword=33,35-38,42,43,45-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-38,42,43,45-58,60-90,94,95,97-122,126,_
endif

set lispwords=
set lispwords+=lambda,and,or,if,cond,case,define,let,let*,letrec
set lispwords+=begin,do,delay,set!,else,=>
set lispwords+=quote,quasiquote,unquote,unquote-splicing
set lispwords+=define-syntax,let-syntax,letrec-syntax,syntax-rules
syn keyword gosh_replSyntax lambda and or if cond case define let let* letrec
syn keyword gosh_replSyntax begin do delay set! else =>
syn keyword gosh_replSyntax quote quasiquote unquote unquote-splicing
syn keyword gosh_replSyntax define-syntax let-syntax letrec-syntax syntax-rules

syn keyword gosh_replFunc not boolean? eq? eqv? equal? pair? cons car cdr set-car!
syn keyword gosh_replFunc set-cdr! caar cadr cdar cddr caaar caadr cadar caddr
syn keyword gosh_replFunc cdaar cdadr cddar cdddr caaaar caaadr caadar caaddr
syn keyword gosh_replFunc cadaar cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr
syn keyword gosh_replFunc cddaar cddadr cdddar cddddr null? list? list length
syn keyword gosh_replFunc append reverse list-ref memq memv member assq assv assoc
syn keyword gosh_replFunc symbol? symbol->string string->symbol number? complex?
syn keyword gosh_replFunc real? rational? integer? exact? inexact? = < > <= >=
syn keyword gosh_replFunc zero? positive? negative? odd? even? max min + * - / abs
syn keyword gosh_replFunc quotient remainder modulo gcd lcm numerator denominator
syn keyword gosh_replFunc floor ceiling truncate round rationalize exp log sin cos
syn keyword gosh_replFunc tan asin acos atan sqrt expt make-rectangular make-polar
syn keyword gosh_replFunc real-part imag-part magnitude angle exact->inexact
syn keyword gosh_replFunc inexact->exact number->string string->number char=?
syn keyword gosh_replFunc char-ci=? char<? char-ci<? char>? char-ci>? char<=?
syn keyword gosh_replFunc char-ci<=? char>=? char-ci>=? char-alphabetic? char?
syn keyword gosh_replFunc char-numeric? char-whitespace? char-upper-case?
syn keyword gosh_replFunc char-lower-case?
syn keyword gosh_replFunc char->integer integer->char char-upcase char-downcase
syn keyword gosh_replFunc string? make-string string string-length string-ref
syn keyword gosh_replFunc string-set! string=? string-ci=? string<? string-ci<?
syn keyword gosh_replFunc string>? string-ci>? string<=? string-ci<=? string>=?
syn keyword gosh_replFunc string-ci>=? substring string-append vector? make-vector
syn keyword gosh_replFunc vector vector-length vector-ref vector-set! procedure?
syn keyword gosh_replFunc apply map for-each call-with-current-continuation
syn keyword gosh_replFunc call-with-input-file call-with-output-file input-port?
syn keyword gosh_replFunc output-port? current-input-port current-output-port
syn keyword gosh_replFunc open-input-file open-output-file close-input-port
syn keyword gosh_replFunc close-output-port eof-object? read read-char peek-char
syn keyword gosh_replFunc write display newline write-char call/cc
syn keyword gosh_replFunc list-tail string->list list->string string-copy
syn keyword gosh_replFunc string-fill! vector->list list->vector vector-fill!
syn keyword gosh_replFunc force with-input-from-file with-output-to-file
syn keyword gosh_replFunc char-ready? load transcript-on transcript-off eval
syn keyword gosh_replFunc dynamic-wind port? values call-with-values
syn keyword gosh_replFunc gosh_repl-report-environment null-environment
syn keyword gosh_replFunc interaction-environment

" ... so that a single + or -, inside a quoted context, would not be
" interpreted as a number (outside such contexts, it's a gosh_replFunc)

syn match	gosh_replDelimiter	oneline    !\.[ \t\[\]()";]!me=e-1
syn match	gosh_replDelimiter	oneline    !\.$!
" ... and a single dot is not a number but a delimiter

" This keeps all other stuff unhighlighted, except *stuff* and <stuff>:

syn match	gosh_replOther	oneline    ,[a-z!$%&*/:<=>?^_~+@%-][-a-z!$%&*/:<=>?^_~0-9+.@%]*,
syn match	gosh_replError	oneline    ,[a-z!$%&*/:<=>?^_~+@%-][-a-z!$%&*/:<=>?^_~0-9+.@%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	gosh_replOther	oneline    "\.\.\."
syn match	gosh_replError	oneline    !\.\.\.[^ \t\[\]()";]\+!
" ... a special identifier

syn match	gosh_replConstant	oneline    ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[ \t\[\]()";],me=e-1
syn match	gosh_replConstant	oneline    ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*$,
syn match	gosh_replError	oneline    ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	gosh_replConstant	oneline    ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\]()";],me=e-1
syn match	gosh_replConstant	oneline    ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$,
syn match	gosh_replError	oneline    ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

" Non-quoted lists, and strings:

syn region gosh_replStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn region gosh_replStruc matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALL

syn region gosh_replStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALL
syn region gosh_replStruc matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALL

" Simple literals:
syn region gosh_replString start=+\%(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+

" Comments:

syn match	gosh_replSrfi62Comment	oneline    ,#;[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match	gosh_replError		oneline    ,#;[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,
syn match	gosh_replSrfi62Comment	oneline    ,#;['`][a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match	gosh_replError		oneline    ,#;['`][a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,
syn region gosh_replSrfi62Comment matchgroup=Comment start="#;(" matchgroup=Comment end=")" contains=gosh_replSrfi62CommentParen
syn region gosh_replSrfi62Comment matchgroup=Comment start="#;\[" matchgroup=Comment end="\]" contains=gosh_replSrfi62CommentParen
syn region gosh_replSrfi62Comment matchgroup=Comment start="#;['`](" matchgroup=Comment end=")" contains=gosh_replSrfi62CommentParen
syn region gosh_replSrfi62Comment matchgroup=Comment start="#;['`]\[" matchgroup=Comment end="\]" contains=gosh_replSrfi62CommentParen
syn match	gosh_replComment	";.*$"

" Writing out the complete description of gosh_repl numerals without
" using variables is a day's work for a trained secretary...

syn match	gosh_replOther	oneline    ![+-][ \t\[\]()";]!me=e-1
syn match	gosh_replOther	oneline    ![+-]$!
"
" This is a useful lax approximation:
syn match	gosh_replNumber	oneline    "[-+0-9.][-#+/0-9a-f@i.boxesfdl]*"
syn match	gosh_replError	oneline    ![-+0-9.][-#+/0-9a-f@i.boxesfdl]*[^-#+/0-9a-f@i.boxesfdl \t\[\]()";][^ \t\[\]()";]*!
syn match	gosh_replNumber	oneline    "#[-#+/0-9a-f@i.boxesfdl]+"
syn match	gosh_replError	oneline    !#[-#+/0-9a-f@i.boxesfdl]+[^-#+/0-9a-f@i.boxesfdl \t\[\]()";][^ \t\[\]()";]*!
syn match	gosh_replNumber	oneline    "[-+]inf\.0"
syn match	gosh_replError	oneline    "[-+]inf\.0[^-#+/0-9a-f@i.boxesfdl \t\[\]()";][^ \t\[\]()";]*"
syn match	gosh_replNumber	oneline    "+nan\.0"
syn match	gosh_replError	oneline    "+nan\.0[^-#+/0-9a-f@i.boxesfdl \t\[\]()";][^ \t\[\]()";]*"

syn match	gosh_replBoolean	oneline    "#[tf]"
syn match	gosh_replError	oneline    !#[tf][^ \t\[\]()";]\+!

syn match	gosh_replChar	oneline    "#\\"
syn match	gosh_replChar	oneline    "#\\."
syn match	gosh_replError	oneline    !#\\.[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\space"
syn match	gosh_replError	oneline    !#\\space[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\newline"
syn match	gosh_replError	oneline    !#\\newline[^ \t\[\]()";]\+!


" Gauche extensions
" multiline comment
syntax region gosh_replMultilineComment start=/#|/ end=/|#/ contains=gosh_replMultilineComment

" #/xxx/ are the special Gauche identifiers for regexp
syn region gosh_replRegexp start=+\%(\\\)\@<!#/+ skip=+\\[\\/]+ end=+/+

" anything limited by |'s is identifier
syn match gosh_replOther oneline    "|[^|]\+|"

" SharpBang
syn match	gosh_replSharpBang	oneline    "#!.*"

" include (use hoge)
syn match	gosh_replInclude	oneline    "(use .*)"
syn match	gosh_replInclude	oneline    "(require .*)"
syn match	gosh_replInclude	oneline    "(import .*)"

" misc
syn match	gosh_replInterpolation	oneline    "#`"
syn match	gosh_replInterpolation	oneline    "#?="

" char
"syn match	gosh_replChar	oneline    "#\\space"
"syn match	gosh_replError	oneline    !#\\space[^ \t\[\]()";]\+!
"syn match	gosh_replChar	oneline    "#\\newline"
"syn match	gosh_replError	oneline    !#\\newline[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\nl"
syn match	gosh_replError	oneline    !#\\nl[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\lf"
syn match	gosh_replError	oneline    !#\\lf[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\return"
syn match	gosh_replError	oneline    !#\\return[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\cr"
syn match	gosh_replError	oneline    !#\\cr[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\tab"
syn match	gosh_replError	oneline    !#\\tab[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\ht"
syn match	gosh_replError	oneline    !#\\ht[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\page"
syn match	gosh_replError	oneline    !#\\page[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\esc"
syn match	gosh_replError	oneline    !#\\esc[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\escape"
syn match	gosh_replError	oneline    !#\\escape[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\del"
syn match	gosh_replError	oneline    !#\\del[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\delete"
syn match	gosh_replError	oneline    !#\\delete[^ \t\[\]()";]\+!
syn match	gosh_replChar	oneline    "#\\null"
syn match	gosh_replError	oneline    !#\\null[^ \t\[\]()";]\+!

" this part was auto-generated.
" module
syn keyword gosh_replExtFunc binary.io
syn keyword gosh_replExtFunc binary.pack
syn keyword gosh_replExtFunc compat.jfilter
syn keyword gosh_replExtFunc compat.norational
syn keyword gosh_replExtFunc compat.stk
syn keyword gosh_replExtFunc control.job
syn keyword gosh_replExtFunc control.thread-pool
syn keyword gosh_replExtFunc crypt.bcrypt
syn keyword gosh_replExtFunc dbd.null
syn keyword gosh_replExtFunc dbi
syn keyword gosh_replExtFunc dbm
syn keyword gosh_replExtFunc dbm.fsdbm
syn keyword gosh_replExtFunc dbm.gdbm
syn keyword gosh_replExtFunc display-error
syn keyword gosh_replExtFunc file.filter
syn keyword gosh_replExtFunc file.util
syn keyword gosh_replExtFunc gauche.array
syn keyword gosh_replExtFunc gauche.auxsys
syn keyword gosh_replExtFunc gauche.cgen
syn keyword gosh_replExtFunc gauche.cgen.cise
syn keyword gosh_replExtFunc gauche.cgen.literal
syn keyword gosh_replExtFunc gauche.cgen.precomp
syn keyword gosh_replExtFunc gauche.cgen.stub
syn keyword gosh_replExtFunc gauche.cgen.type
syn keyword gosh_replExtFunc gauche.cgen.unit
syn keyword gosh_replExtFunc gauche.charconv
syn keyword gosh_replExtFunc gauche.collection
syn keyword gosh_replExtFunc gauche.condutil
syn keyword gosh_replExtFunc gauche.config
syn keyword gosh_replExtFunc gauche.defvalues
syn keyword gosh_replExtFunc gauche.dictionary
syn keyword gosh_replExtFunc gauche.experimental.app
syn keyword gosh_replExtFunc gauche.experimental.lamb
syn keyword gosh_replExtFunc gauche.experimental.ref
syn keyword gosh_replExtFunc gauche.fcntl
syn keyword gosh_replExtFunc gauche.fileutil
syn keyword gosh_replExtFunc gauche.hashutil
syn keyword gosh_replExtFunc gauche.hook
syn keyword gosh_replExtFunc gauche.interactive
syn keyword gosh_replExtFunc gauche.interactive.info
syn keyword gosh_replExtFunc gauche.interpolate
syn keyword gosh_replExtFunc gauche.libutil
syn keyword gosh_replExtFunc gauche.listener
syn keyword gosh_replExtFunc gauche.logger
syn keyword gosh_replExtFunc gauche.macroutil
syn keyword gosh_replExtFunc gauche.modutil
syn keyword gosh_replExtFunc gauche.mop.instance-pool
syn keyword gosh_replExtFunc gauche.mop.propagate
syn keyword gosh_replExtFunc gauche.mop.singleton
syn keyword gosh_replExtFunc gauche.mop.validator
syn keyword gosh_replExtFunc gauche.net
syn keyword gosh_replExtFunc gauche.package
syn keyword gosh_replExtFunc gauche.package.build
syn keyword gosh_replExtFunc gauche.package.compile
syn keyword gosh_replExtFunc gauche.package.fetch
syn keyword gosh_replExtFunc gauche.package.util
syn keyword gosh_replExtFunc gauche.parameter
syn keyword gosh_replExtFunc gauche.parseopt
syn keyword gosh_replExtFunc gauche.partcont
syn keyword gosh_replExtFunc gauche.portutil
syn keyword gosh_replExtFunc gauche.procedure
syn keyword gosh_replExtFunc gauche.process
syn keyword gosh_replExtFunc gauche.record
syn keyword gosh_replExtFunc gauche.regexp
syn keyword gosh_replExtFunc gauche.reload
syn keyword gosh_replExtFunc gauche.selector
syn keyword gosh_replExtFunc gauche.sequence
syn keyword gosh_replExtFunc gauche.serializer
syn keyword gosh_replExtFunc gauche.sortutil
syn keyword gosh_replExtFunc gauche.stringutil
syn keyword gosh_replExtFunc gauche.syslog
syn keyword gosh_replExtFunc gauche.termios
syn keyword gosh_replExtFunc gauche.test
syn keyword gosh_replExtFunc gauche.threads
syn keyword gosh_replExtFunc gauche.time
syn keyword gosh_replExtFunc gauche.treeutil
syn keyword gosh_replExtFunc gauche.uvector
syn keyword gosh_replExtFunc gauche.version
syn keyword gosh_replExtFunc gauche.vm.debugger
syn keyword gosh_replExtFunc gauche.vm.insn
syn keyword gosh_replExtFunc gauche.vm.insn-core
syn keyword gosh_replExtFunc gauche.vm.profiler
syn keyword gosh_replExtFunc gauche.vport
syn keyword gosh_replExtFunc math.const
syn keyword gosh_replExtFunc math.mt-random
syn keyword gosh_replExtFunc next-method
syn keyword gosh_replExtFunc parser.peg
syn keyword gosh_replExtFunc rfc.822
syn keyword gosh_replExtFunc rfc.base64
syn keyword gosh_replExtFunc rfc.cookie
syn keyword gosh_replExtFunc rfc.ftp
syn keyword gosh_replExtFunc rfc.hmac
syn keyword gosh_replExtFunc rfc.http
syn keyword gosh_replExtFunc rfc.icmp
syn keyword gosh_replExtFunc rfc.ip
syn keyword gosh_replExtFunc rfc.json
syn keyword gosh_replExtFunc rfc.md5
syn keyword gosh_replExtFunc rfc.mime
syn keyword gosh_replExtFunc rfc.quoted-printable
syn keyword gosh_replExtFunc rfc.sha
syn keyword gosh_replExtFunc rfc.sha1
syn keyword gosh_replExtFunc rfc.uri
syn keyword gosh_replExtFunc rfc.zlib
syn keyword gosh_replExtFunc srfi-0
syn keyword gosh_replExtFunc srfi-1
syn keyword gosh_replExtFunc srfi-11
syn keyword gosh_replExtFunc srfi-13
syn keyword gosh_replExtFunc srfi-14
syn keyword gosh_replExtFunc srfi-19
syn keyword gosh_replExtFunc srfi-26
syn keyword gosh_replExtFunc srfi-27
syn keyword gosh_replExtFunc srfi-29
syn keyword gosh_replExtFunc srfi-29.bundle
syn keyword gosh_replExtFunc srfi-29.format
syn keyword gosh_replExtFunc srfi-31
syn keyword gosh_replExtFunc srfi-37
syn keyword gosh_replExtFunc srfi-4
syn keyword gosh_replExtFunc srfi-42
syn keyword gosh_replExtFunc srfi-43
syn keyword gosh_replExtFunc srfi-5
syn keyword gosh_replExtFunc srfi-55
syn keyword gosh_replExtFunc srfi-7
syn keyword gosh_replExtFunc srfi-9
syn keyword gosh_replExtFunc srfi-98
syn keyword gosh_replExtFunc sxml.adaptor
syn keyword gosh_replExtFunc sxml.serializer
syn keyword gosh_replExtFunc sxml.ssax
syn keyword gosh_replExtFunc sxml.sxpath
syn keyword gosh_replExtFunc sxml.to-html
syn keyword gosh_replExtFunc sxml.tools
syn keyword gosh_replExtFunc sxml.tree-trans
syn keyword gosh_replExtFunc text.csv
syn keyword gosh_replExtFunc text.diff
syn keyword gosh_replExtFunc text.gettext
syn keyword gosh_replExtFunc text.html-lite
syn keyword gosh_replExtFunc text.info
syn keyword gosh_replExtFunc text.parse
syn keyword gosh_replExtFunc text.progress
syn keyword gosh_replExtFunc text.sql
syn keyword gosh_replExtFunc text.tr
syn keyword gosh_replExtFunc text.tree
syn keyword gosh_replExtFunc util.combinations
syn keyword gosh_replExtFunc util.digest
syn keyword gosh_replExtFunc util.isomorph
syn keyword gosh_replExtFunc util.lcs
syn keyword gosh_replExtFunc util.list
syn keyword gosh_replExtFunc util.match
syn keyword gosh_replExtFunc util.queue
syn keyword gosh_replExtFunc util.rbtree
syn keyword gosh_replExtFunc util.record
syn keyword gosh_replExtFunc util.relation
syn keyword gosh_replExtFunc util.sparse
syn keyword gosh_replExtFunc util.stream
syn keyword gosh_replExtFunc util.toposort
syn keyword gosh_replExtFunc util.tree
syn keyword gosh_replExtFunc util.trie
syn keyword gosh_replExtFunc www.cgi
syn keyword gosh_replExtFunc www.cgi-test
syn keyword gosh_replExtFunc www.cgi.test


" syntax
syn keyword gosh_replExtSyntax %macroexpand
set lispwords+=%macroexpand
syn keyword gosh_replExtSyntax %macroexpand-1
set lispwords+=%macroexpand-1
syn keyword gosh_replExtSyntax and-let*
set lispwords+=and-let*
syn keyword gosh_replExtSyntax current-module
set lispwords+=current-module
syn keyword gosh_replExtSyntax define-class
set lispwords+=define-class
syn keyword gosh_replExtSyntax define-constant
set lispwords+=define-constant
syn keyword gosh_replExtSyntax define-generic
set lispwords+=define-generic
syn keyword gosh_replExtSyntax define-in-module
set lispwords+=define-in-module
syn keyword gosh_replExtSyntax define-inline
set lispwords+=define-inline
syn keyword gosh_replExtSyntax define-macro
set lispwords+=define-macro
syn keyword gosh_replExtSyntax define-method
set lispwords+=define-method
syn keyword gosh_replExtSyntax define-module
set lispwords+=define-module
syn keyword gosh_replExtSyntax eval-when
set lispwords+=eval-when
syn keyword gosh_replExtSyntax export
set lispwords+=export
syn keyword gosh_replExtSyntax export-all
set lispwords+=export-all
syn keyword gosh_replExtSyntax extend
set lispwords+=extend
syn keyword gosh_replExtSyntax import
set lispwords+=import
syn keyword gosh_replExtSyntax include
set lispwords+=include
syn keyword gosh_replExtSyntax lazy
set lispwords+=lazy
syn keyword gosh_replExtSyntax receive
set lispwords+=receive
syn keyword gosh_replExtSyntax require
set lispwords+=require
syn keyword gosh_replExtSyntax select-module
set lispwords+=select-module
syn keyword gosh_replExtSyntax unless
set lispwords+=unless
syn keyword gosh_replExtSyntax when
set lispwords+=when
syn keyword gosh_replExtSyntax with-module
set lispwords+=with-module


" macro
syn keyword gosh_replExtSyntax $
set lispwords+=$
syn keyword gosh_replExtSyntax $*
set lispwords+=$*
syn keyword gosh_replExtSyntax $<<
set lispwords+=$<<
syn keyword gosh_replExtSyntax $do
set lispwords+=$do
syn keyword gosh_replExtSyntax $do*
set lispwords+=$do*
syn keyword gosh_replExtSyntax $lazy
set lispwords+=$lazy
syn keyword gosh_replExtSyntax $many-chars
set lispwords+=$many-chars
syn keyword gosh_replExtSyntax $or
set lispwords+=$or
syn keyword gosh_replExtSyntax $satisfy
set lispwords+=$satisfy
syn keyword gosh_replExtSyntax %do-ec
set lispwords+=%do-ec
syn keyword gosh_replExtSyntax %ec-guarded-do-ec
set lispwords+=%ec-guarded-do-ec
syn keyword gosh_replExtSyntax %first-ec
set lispwords+=%first-ec
syn keyword gosh_replExtSyntax %guard-rec
set lispwords+=%guard-rec
syn keyword gosh_replExtSyntax %replace-keywords
set lispwords+=%replace-keywords
syn keyword gosh_replExtSyntax --
set lispwords+=--
syn keyword gosh_replExtSyntax ^
set lispwords+=^
syn keyword gosh_replExtSyntax ^*
set lispwords+=^*
syn keyword gosh_replExtSyntax ^-generator
set lispwords+=^-generator
syn keyword gosh_replExtSyntax ^.
set lispwords+=^.
syn keyword gosh_replExtSyntax ^_
set lispwords+=^_
syn keyword gosh_replExtSyntax ^a
set lispwords+=^a
syn keyword gosh_replExtSyntax ^b
set lispwords+=^b
syn keyword gosh_replExtSyntax ^c
set lispwords+=^c
syn keyword gosh_replExtSyntax ^d
set lispwords+=^d
syn keyword gosh_replExtSyntax ^e
set lispwords+=^e
syn keyword gosh_replExtSyntax ^f
set lispwords+=^f
syn keyword gosh_replExtSyntax ^g
set lispwords+=^g
syn keyword gosh_replExtSyntax ^h
set lispwords+=^h
syn keyword gosh_replExtSyntax ^i
set lispwords+=^i
syn keyword gosh_replExtSyntax ^j
set lispwords+=^j
syn keyword gosh_replExtSyntax ^k
set lispwords+=^k
syn keyword gosh_replExtSyntax ^l
set lispwords+=^l
syn keyword gosh_replExtSyntax ^m
set lispwords+=^m
syn keyword gosh_replExtSyntax ^n
set lispwords+=^n
syn keyword gosh_replExtSyntax ^o
set lispwords+=^o
syn keyword gosh_replExtSyntax ^p
set lispwords+=^p
syn keyword gosh_replExtSyntax ^q
set lispwords+=^q
syn keyword gosh_replExtSyntax ^r
set lispwords+=^r
syn keyword gosh_replExtSyntax ^s
set lispwords+=^s
syn keyword gosh_replExtSyntax ^t
set lispwords+=^t
syn keyword gosh_replExtSyntax ^u
set lispwords+=^u
syn keyword gosh_replExtSyntax ^v
set lispwords+=^v
syn keyword gosh_replExtSyntax ^w
set lispwords+=^w
syn keyword gosh_replExtSyntax ^x
set lispwords+=^x
syn keyword gosh_replExtSyntax ^y
set lispwords+=^y
syn keyword gosh_replExtSyntax ^z
set lispwords+=^z
syn keyword gosh_replExtSyntax add-load-path
set lispwords+=add-load-path
syn keyword gosh_replExtSyntax any?-ec
set lispwords+=any?-ec
syn keyword gosh_replExtSyntax append-ec
set lispwords+=append-ec
syn keyword gosh_replExtSyntax apropos
set lispwords+=apropos
syn keyword gosh_replExtSyntax assert
set lispwords+=assert
syn keyword gosh_replExtSyntax autoload
set lispwords+=autoload
syn keyword gosh_replExtSyntax begin0
set lispwords+=begin0
syn keyword gosh_replExtSyntax case-lambda
set lispwords+=case-lambda
syn keyword gosh_replExtSyntax check-arg
set lispwords+=check-arg
syn keyword gosh_replExtSyntax cond-expand
set lispwords+=cond-expand
syn keyword gosh_replExtSyntax cond-list
set lispwords+=cond-list
syn keyword gosh_replExtSyntax condition
set lispwords+=condition
syn keyword gosh_replExtSyntax cut
set lispwords+=cut
syn keyword gosh_replExtSyntax cute
set lispwords+=cute
syn keyword gosh_replExtSyntax debug-print
set lispwords+=debug-print
syn keyword gosh_replExtSyntax dec!
set lispwords+=dec!
syn keyword gosh_replExtSyntax declare
set lispwords+=declare
syn keyword gosh_replExtSyntax define-^x
set lispwords+=define-^x
syn keyword gosh_replExtSyntax define-cgen-literal
set lispwords+=define-cgen-literal
syn keyword gosh_replExtSyntax define-cise-expr
set lispwords+=define-cise-expr
syn keyword gosh_replExtSyntax define-cise-macro
set lispwords+=define-cise-macro
syn keyword gosh_replExtSyntax define-cise-stmt
set lispwords+=define-cise-stmt
syn keyword gosh_replExtSyntax define-cise-toplevel
set lispwords+=define-cise-toplevel
syn keyword gosh_replExtSyntax define-compiler-macro
set lispwords+=define-compiler-macro
syn keyword gosh_replExtSyntax define-condition-type
set lispwords+=define-condition-type
syn keyword gosh_replExtSyntax define-record-type
set lispwords+=define-record-type
syn keyword gosh_replExtSyntax define-values
set lispwords+=define-values
syn keyword gosh_replExtSyntax do-ec
set lispwords+=do-ec
syn keyword gosh_replExtSyntax do-ec:do
set lispwords+=do-ec:do
syn keyword gosh_replExtSyntax dolist
set lispwords+=dolist
syn keyword gosh_replExtSyntax dotimes
set lispwords+=dotimes
syn keyword gosh_replExtSyntax ec-guarded-do-ec
set lispwords+=ec-guarded-do-ec
syn keyword gosh_replExtSyntax ec-simplify
set lispwords+=ec-simplify
syn keyword gosh_replExtSyntax every?-ec
set lispwords+=every?-ec
syn keyword gosh_replExtSyntax export-if-defined
set lispwords+=export-if-defined
syn keyword gosh_replExtSyntax first-ec
set lispwords+=first-ec
syn keyword gosh_replExtSyntax fluid-let
set lispwords+=fluid-let
syn keyword gosh_replExtSyntax fold-ec
set lispwords+=fold-ec
syn keyword gosh_replExtSyntax fold3-ec
set lispwords+=fold3-ec
syn keyword gosh_replExtSyntax get-keyword*
set lispwords+=get-keyword*
syn keyword gosh_replExtSyntax get-optional
set lispwords+=get-optional
syn keyword gosh_replExtSyntax guard
set lispwords+=guard
syn keyword gosh_replExtSyntax http-cond-receiver
set lispwords+=http-cond-receiver
syn keyword gosh_replExtSyntax if-let1
set lispwords+=if-let1
syn keyword gosh_replExtSyntax inc!
set lispwords+=inc!
syn keyword gosh_replExtSyntax inline-stub
set lispwords+=inline-stub
syn keyword gosh_replExtSyntax last-ec
set lispwords+=last-ec
syn keyword gosh_replExtSyntax let*-values
set lispwords+=let*-values
syn keyword gosh_replExtSyntax let-args
set lispwords+=let-args
syn keyword gosh_replExtSyntax let-keywords
set lispwords+=let-keywords
syn keyword gosh_replExtSyntax let-keywords*
set lispwords+=let-keywords*
syn keyword gosh_replExtSyntax let-optionals*
set lispwords+=let-optionals*
syn keyword gosh_replExtSyntax let-string-start+end
set lispwords+=let-string-start+end
syn keyword gosh_replExtSyntax let-values
set lispwords+=let-values
syn keyword gosh_replExtSyntax let/cc
set lispwords+=let/cc
syn keyword gosh_replExtSyntax let1
set lispwords+=let1
syn keyword gosh_replExtSyntax list-ec
set lispwords+=list-ec
syn keyword gosh_replExtSyntax make-option-parser
set lispwords+=make-option-parser
syn keyword gosh_replExtSyntax match
set lispwords+=match
syn keyword gosh_replExtSyntax match-define
set lispwords+=match-define
syn keyword gosh_replExtSyntax match-lambda
set lispwords+=match-lambda
syn keyword gosh_replExtSyntax match-lambda*
set lispwords+=match-lambda*
syn keyword gosh_replExtSyntax match-let
set lispwords+=match-let
syn keyword gosh_replExtSyntax match-let*
set lispwords+=match-let*
syn keyword gosh_replExtSyntax match-let1
set lispwords+=match-let1
syn keyword gosh_replExtSyntax match-letrec
set lispwords+=match-letrec
syn keyword gosh_replExtSyntax max-ec
set lispwords+=max-ec
syn keyword gosh_replExtSyntax min-ec
set lispwords+=min-ec
syn keyword gosh_replExtSyntax parameterize
set lispwords+=parameterize
syn keyword gosh_replExtSyntax parse-options
set lispwords+=parse-options
syn keyword gosh_replExtSyntax pop!
set lispwords+=pop!
syn keyword gosh_replExtSyntax product-ec
set lispwords+=product-ec
syn keyword gosh_replExtSyntax program
set lispwords+=program
syn keyword gosh_replExtSyntax push!
set lispwords+=push!
syn keyword gosh_replExtSyntax rec
set lispwords+=rec
syn keyword gosh_replExtSyntax require-extension
set lispwords+=require-extension
syn keyword gosh_replExtSyntax reset
set lispwords+=reset
syn keyword gosh_replExtSyntax rlet1
set lispwords+=rlet1
syn keyword gosh_replExtSyntax rxmatch-case
set lispwords+=rxmatch-case
syn keyword gosh_replExtSyntax rxmatch-cond
set lispwords+=rxmatch-cond
syn keyword gosh_replExtSyntax rxmatch-if
set lispwords+=rxmatch-if
syn keyword gosh_replExtSyntax rxmatch-let
set lispwords+=rxmatch-let
syn keyword gosh_replExtSyntax set!-values
set lispwords+=set!-values
syn keyword gosh_replExtSyntax shift
set lispwords+=shift
syn keyword gosh_replExtSyntax srfi-42-
set lispwords+=srfi-42-
syn keyword gosh_replExtSyntax srfi-42-char-range
set lispwords+=srfi-42-char-range
syn keyword gosh_replExtSyntax srfi-42-dispatched
set lispwords+=srfi-42-dispatched
syn keyword gosh_replExtSyntax srfi-42-do
set lispwords+=srfi-42-do
syn keyword gosh_replExtSyntax srfi-42-generator-proc
set lispwords+=srfi-42-generator-proc
syn keyword gosh_replExtSyntax srfi-42-integers
set lispwords+=srfi-42-integers
syn keyword gosh_replExtSyntax srfi-42-let
set lispwords+=srfi-42-let
syn keyword gosh_replExtSyntax srfi-42-list
set lispwords+=srfi-42-list
syn keyword gosh_replExtSyntax srfi-42-parallel
set lispwords+=srfi-42-parallel
syn keyword gosh_replExtSyntax srfi-42-parallel-1
set lispwords+=srfi-42-parallel-1
syn keyword gosh_replExtSyntax srfi-42-port
set lispwords+=srfi-42-port
syn keyword gosh_replExtSyntax srfi-42-range
set lispwords+=srfi-42-range
syn keyword gosh_replExtSyntax srfi-42-real-range
set lispwords+=srfi-42-real-range
syn keyword gosh_replExtSyntax srfi-42-string
set lispwords+=srfi-42-string
syn keyword gosh_replExtSyntax srfi-42-until
set lispwords+=srfi-42-until
syn keyword gosh_replExtSyntax srfi-42-until-1
set lispwords+=srfi-42-until-1
syn keyword gosh_replExtSyntax srfi-42-vector
set lispwords+=srfi-42-vector
syn keyword gosh_replExtSyntax srfi-42-while
set lispwords+=srfi-42-while
syn keyword gosh_replExtSyntax srfi-42-while-1
set lispwords+=srfi-42-while-1
syn keyword gosh_replExtSyntax srfi-42-while-2
set lispwords+=srfi-42-while-2
syn keyword gosh_replExtSyntax ssax:make-elem-parser
set lispwords+=ssax:make-elem-parser
syn keyword gosh_replExtSyntax ssax:make-parser
set lispwords+=ssax:make-parser
syn keyword gosh_replExtSyntax ssax:make-pi-parser
set lispwords+=ssax:make-pi-parser
syn keyword gosh_replExtSyntax stream-cons
set lispwords+=stream-cons
syn keyword gosh_replExtSyntax stream-delay
set lispwords+=stream-delay
syn keyword gosh_replExtSyntax string-append-ec
set lispwords+=string-append-ec
syn keyword gosh_replExtSyntax string-ec
set lispwords+=string-ec
syn keyword gosh_replExtSyntax sum-ec
set lispwords+=sum-ec
syn keyword gosh_replExtSyntax sxml:find-name-separator
set lispwords+=sxml:find-name-separator
syn keyword gosh_replExtSyntax syntax-error
set lispwords+=syntax-error
syn keyword gosh_replExtSyntax syntax-errorf
set lispwords+=syntax-errorf
syn keyword gosh_replExtSyntax test*
set lispwords+=test*
syn keyword gosh_replExtSyntax time
set lispwords+=time
syn keyword gosh_replExtSyntax until
set lispwords+=until
syn keyword gosh_replExtSyntax unwind-protect
set lispwords+=unwind-protect
syn keyword gosh_replExtSyntax update!
set lispwords+=update!
syn keyword gosh_replExtSyntax use
set lispwords+=use
syn keyword gosh_replExtSyntax use-version
set lispwords+=use-version
syn keyword gosh_replExtSyntax values-ref
set lispwords+=values-ref
syn keyword gosh_replExtSyntax vector-ec
set lispwords+=vector-ec
syn keyword gosh_replExtSyntax vector-of-length-ec
set lispwords+=vector-of-length-ec
syn keyword gosh_replExtSyntax while
set lispwords+=while
syn keyword gosh_replExtSyntax with-builder
set lispwords+=with-builder
syn keyword gosh_replExtSyntax with-iterator
set lispwords+=with-iterator
syn keyword gosh_replExtSyntax with-signal-handlers
set lispwords+=with-signal-handlers
syn keyword gosh_replExtSyntax with-time-counter
set lispwords+=with-time-counter
syn keyword gosh_replExtSyntax xmac
set lispwords+=xmac
syn keyword gosh_replExtSyntax xmac1
set lispwords+=xmac1


" procedure
syn keyword gosh_replExtFunc $->rope
syn keyword gosh_replExtFunc $alternate
syn keyword gosh_replExtFunc $between
syn keyword gosh_replExtFunc $c
syn keyword gosh_replExtFunc $chain-left
syn keyword gosh_replExtFunc $chain-right
syn keyword gosh_replExtFunc $char
syn keyword gosh_replExtFunc $count
syn keyword gosh_replExtFunc $end-by
syn keyword gosh_replExtFunc $expect
syn keyword gosh_replExtFunc $fail
syn keyword gosh_replExtFunc $fold-parsers
syn keyword gosh_replExtFunc $fold-parsers-right
syn keyword gosh_replExtFunc $many
syn keyword gosh_replExtFunc $many-till
syn keyword gosh_replExtFunc $many1
syn keyword gosh_replExtFunc $none-of
syn keyword gosh_replExtFunc $not
syn keyword gosh_replExtFunc $one-of
syn keyword gosh_replExtFunc $optional
syn keyword gosh_replExtFunc $repeat
syn keyword gosh_replExtFunc $return
syn keyword gosh_replExtFunc $s
syn keyword gosh_replExtFunc $sep-by
syn keyword gosh_replExtFunc $sep-end-by
syn keyword gosh_replExtFunc $seq
syn keyword gosh_replExtFunc $skip-many
syn keyword gosh_replExtFunc $string
syn keyword gosh_replExtFunc $string-ci
syn keyword gosh_replExtFunc $try
syn keyword gosh_replExtFunc $y
syn keyword gosh_replExtFunc %add-load-path
syn keyword gosh_replExtFunc %alist-delete
syn keyword gosh_replExtFunc %alist-delete!
syn keyword gosh_replExtFunc %autoload
syn keyword gosh_replExtFunc %bignum-dump
syn keyword gosh_replExtFunc %char-set-add!
syn keyword gosh_replExtFunc %char-set-add-chars!
syn keyword gosh_replExtFunc %char-set-add-range!
syn keyword gosh_replExtFunc %char-set-complement!
syn keyword gosh_replExtFunc %char-set-dump
syn keyword gosh_replExtFunc %char-set-equal?
syn keyword gosh_replExtFunc %char-set-predefined
syn keyword gosh_replExtFunc %char-set-ranges
syn keyword gosh_replExtFunc %char-set<=?
syn keyword gosh_replExtFunc %check-class-binding
syn keyword gosh_replExtFunc %default-signal-handler
syn keyword gosh_replExtFunc %delete
syn keyword gosh_replExtFunc %delete!
syn keyword gosh_replExtFunc %delete-duplicates
syn keyword gosh_replExtFunc %delete-duplicates!
syn keyword gosh_replExtFunc %div&mod
syn keyword gosh_replExtFunc %ensure-generic-function
syn keyword gosh_replExtFunc %exact-integer-sqrt
syn keyword gosh_replExtFunc %exit
syn keyword gosh_replExtFunc %export-all
syn keyword gosh_replExtFunc %extend-module
syn keyword gosh_replExtFunc %format
syn keyword gosh_replExtFunc %gauche-runtime-directory
syn keyword gosh_replExtFunc %get-reader-ctor
syn keyword gosh_replExtFunc %hash-string
syn keyword gosh_replExtFunc %hash-table-iter
syn keyword gosh_replExtFunc %let-keywords-rec
syn keyword gosh_replExtFunc %make-sigset
syn keyword gosh_replExtFunc %make-tree-map
syn keyword gosh_replExtFunc %maybe-substring
syn keyword gosh_replExtFunc %open-input-file
syn keyword gosh_replExtFunc %open-input-file/conv
syn keyword gosh_replExtFunc %open-output-file
syn keyword gosh_replExtFunc %open-output-file/conv
syn keyword gosh_replExtFunc %regexp-dump
syn keyword gosh_replExtFunc %regexp-pattern
syn keyword gosh_replExtFunc %regmatch-dump
syn keyword gosh_replExtFunc %require
syn keyword gosh_replExtFunc %sort
syn keyword gosh_replExtFunc %sort!
syn keyword gosh_replExtFunc %sparse-table-check
syn keyword gosh_replExtFunc %sparse-table-dump
syn keyword gosh_replExtFunc %sparse-vector-dump
syn keyword gosh_replExtFunc %string-pointer-dump
syn keyword gosh_replExtFunc %string-replace-body!
syn keyword gosh_replExtFunc %string-split-by-char
syn keyword gosh_replExtFunc %sys-escape-windows-command-line
syn keyword gosh_replExtFunc %tree-map-bound
syn keyword gosh_replExtFunc %tree-map-check-consistency
syn keyword gosh_replExtFunc %tree-map-dump
syn keyword gosh_replExtFunc %tree-map-iter
syn keyword gosh_replExtFunc %uvector-ref
syn keyword gosh_replExtFunc %vm-make-parameter-slot
syn keyword gosh_replExtFunc %vm-parameter-ref
syn keyword gosh_replExtFunc %vm-parameter-set!
syn keyword gosh_replExtFunc %vm-show-stack-trace
syn keyword gosh_replExtFunc %with-signal-handlers
syn keyword gosh_replExtFunc *.
syn keyword gosh_replExtFunc +.
syn keyword gosh_replExtFunc -.
syn keyword gosh_replExtFunc ->char-set
syn keyword gosh_replExtFunc ->stream-char
syn keyword gosh_replExtFunc .$
syn keyword gosh_replExtFunc /.
syn keyword gosh_replExtFunc SRV:send-reply
syn keyword gosh_replExtFunc SSAX:XML->SXML
syn keyword gosh_replExtFunc SXML->HTML
syn keyword gosh_replExtFunc abandoned-mutex-exception?
syn keyword gosh_replExtFunc absolute-path?
syn keyword gosh_replExtFunc acons
syn keyword gosh_replExtFunc acosh
syn keyword gosh_replExtFunc add-duration
syn keyword gosh_replExtFunc add-duration!
syn keyword gosh_replExtFunc add-job!
syn keyword gosh_replExtFunc adler32
syn keyword gosh_replExtFunc alist->hash-table
syn keyword gosh_replExtFunc alist->rbtree
syn keyword gosh_replExtFunc alist->tree-map
syn keyword gosh_replExtFunc alist-cons
syn keyword gosh_replExtFunc alist-copy
syn keyword gosh_replExtFunc alist-delete
syn keyword gosh_replExtFunc alist-delete!
syn keyword gosh_replExtFunc all-modules
syn keyword gosh_replExtFunc alphanum
syn keyword gosh_replExtFunc any
syn keyword gosh_replExtFunc any$
syn keyword gosh_replExtFunc any-in-queue
syn keyword gosh_replExtFunc any-pred
syn keyword gosh_replExtFunc anychar
syn keyword gosh_replExtFunc append!
syn keyword gosh_replExtFunc append-map
syn keyword gosh_replExtFunc append-map!
syn keyword gosh_replExtFunc append-reverse
syn keyword gosh_replExtFunc append-reverse!
syn keyword gosh_replExtFunc apply$
syn keyword gosh_replExtFunc args-fold
syn keyword gosh_replExtFunc arity
syn keyword gosh_replExtFunc arity-at-least-value
syn keyword gosh_replExtFunc arity-at-least?
syn keyword gosh_replExtFunc array
syn keyword gosh_replExtFunc array->list
syn keyword gosh_replExtFunc array->vector
syn keyword gosh_replExtFunc array-add-elements
syn keyword gosh_replExtFunc array-any
syn keyword gosh_replExtFunc array-concatenate
syn keyword gosh_replExtFunc array-div-elements
syn keyword gosh_replExtFunc array-div-left
syn keyword gosh_replExtFunc array-div-right
syn keyword gosh_replExtFunc array-end
syn keyword gosh_replExtFunc array-equal?
syn keyword gosh_replExtFunc array-every
syn keyword gosh_replExtFunc array-expt
syn keyword gosh_replExtFunc array-flip
syn keyword gosh_replExtFunc array-flip!
syn keyword gosh_replExtFunc array-for-each
syn keyword gosh_replExtFunc array-for-each-index
syn keyword gosh_replExtFunc array-for-each-index-by-dimension
syn keyword gosh_replExtFunc array-inverse
syn keyword gosh_replExtFunc array-length
syn keyword gosh_replExtFunc array-mul
syn keyword gosh_replExtFunc array-mul-elements
syn keyword gosh_replExtFunc array-rank
syn keyword gosh_replExtFunc array-rotate-90
syn keyword gosh_replExtFunc array-shape
syn keyword gosh_replExtFunc array-size
syn keyword gosh_replExtFunc array-start
syn keyword gosh_replExtFunc array-sub-elements
syn keyword gosh_replExtFunc array-transpose
syn keyword gosh_replExtFunc array-valid-index?
syn keyword gosh_replExtFunc array?
syn keyword gosh_replExtFunc as-nodeset
syn keyword gosh_replExtFunc ascii->char
syn keyword gosh_replExtFunc ash
syn keyword gosh_replExtFunc asinh
syn keyword gosh_replExtFunc assert-curr-char
syn keyword gosh_replExtFunc assoc$
syn keyword gosh_replExtFunc assoc-ref
syn keyword gosh_replExtFunc assoc-set!
syn keyword gosh_replExtFunc assq-ref
syn keyword gosh_replExtFunc assq-set!
syn keyword gosh_replExtFunc assq-values
syn keyword gosh_replExtFunc assv-ref
syn keyword gosh_replExtFunc assv-set!
syn keyword gosh_replExtFunc atanh
syn keyword gosh_replExtFunc atom
syn keyword gosh_replExtFunc atom-ref
syn keyword gosh_replExtFunc atom-swap!
syn keyword gosh_replExtFunc attlist->alist
syn keyword gosh_replExtFunc attlist-add
syn keyword gosh_replExtFunc attlist-fold
syn keyword gosh_replExtFunc attlist-null?
syn keyword gosh_replExtFunc attlist-remove-top
syn keyword gosh_replExtFunc base64-decode
syn keyword gosh_replExtFunc base64-decode-string
syn keyword gosh_replExtFunc base64-encode
syn keyword gosh_replExtFunc base64-encode-string
syn keyword gosh_replExtFunc bcrypt-gensalt
syn keyword gosh_replExtFunc bcrypt-hashpw
syn keyword gosh_replExtFunc bignum?
syn keyword gosh_replExtFunc bimap-left
syn keyword gosh_replExtFunc bimap-left-delete!
syn keyword gosh_replExtFunc bimap-left-exists?
syn keyword gosh_replExtFunc bimap-left-get
syn keyword gosh_replExtFunc bimap-put!
syn keyword gosh_replExtFunc bimap-right
syn keyword gosh_replExtFunc bimap-right-delete!
syn keyword gosh_replExtFunc bimap-right-exists?
syn keyword gosh_replExtFunc bimap-right-get
syn keyword gosh_replExtFunc bindtextdomain
syn keyword gosh_replExtFunc bit-field
syn keyword gosh_replExtFunc boolean
syn keyword gosh_replExtFunc break
syn keyword gosh_replExtFunc break!
syn keyword gosh_replExtFunc build-path
syn keyword gosh_replExtFunc build-transliterator
syn keyword gosh_replExtFunc byte-ready?
syn keyword gosh_replExtFunc byte-substring
syn keyword gosh_replExtFunc call-with-cgi-script
syn keyword gosh_replExtFunc call-with-client-socket
syn keyword gosh_replExtFunc call-with-ftp-connection
syn keyword gosh_replExtFunc call-with-input-conversion
syn keyword gosh_replExtFunc call-with-input-process
syn keyword gosh_replExtFunc call-with-input-string
syn keyword gosh_replExtFunc call-with-iterators
syn keyword gosh_replExtFunc call-with-output-conversion
syn keyword gosh_replExtFunc call-with-output-process
syn keyword gosh_replExtFunc call-with-output-string
syn keyword gosh_replExtFunc call-with-process-io
syn keyword gosh_replExtFunc call-with-string-io
syn keyword gosh_replExtFunc call/pc
syn keyword gosh_replExtFunc canonical-path
syn keyword gosh_replExtFunc car+cdr
syn keyword gosh_replExtFunc car-sxpath
syn keyword gosh_replExtFunc cartesian-product
syn keyword gosh_replExtFunc cartesian-product-for-each
syn keyword gosh_replExtFunc cartesian-product-right
syn keyword gosh_replExtFunc cartesian-product-right-for-each
syn keyword gosh_replExtFunc ceiling->exact
syn keyword gosh_replExtFunc cerr
syn keyword gosh_replExtFunc ces-conversion-supported?
syn keyword gosh_replExtFunc ces-convert
syn keyword gosh_replExtFunc ces-equivalent?
syn keyword gosh_replExtFunc ces-guess-from-string
syn keyword gosh_replExtFunc ces-upper-compatible?
syn keyword gosh_replExtFunc cgen-add!
syn keyword gosh_replExtFunc cgen-allocate-static-datum
syn keyword gosh_replExtFunc cgen-body
syn keyword gosh_replExtFunc cgen-box-expr
syn keyword gosh_replExtFunc cgen-decl
syn keyword gosh_replExtFunc cgen-define
syn keyword gosh_replExtFunc cgen-extern
syn keyword gosh_replExtFunc cgen-genstub
syn keyword gosh_replExtFunc cgen-include
syn keyword gosh_replExtFunc cgen-init
syn keyword gosh_replExtFunc cgen-literal
syn keyword gosh_replExtFunc cgen-precompile
syn keyword gosh_replExtFunc cgen-precompile-multi
syn keyword gosh_replExtFunc cgen-pred-expr
syn keyword gosh_replExtFunc cgen-return-stmt
syn keyword gosh_replExtFunc cgen-safe-comment
syn keyword gosh_replExtFunc cgen-safe-name
syn keyword gosh_replExtFunc cgen-safe-name-friendly
syn keyword gosh_replExtFunc cgen-stub-parse-form
syn keyword gosh_replExtFunc cgen-stub-parser
syn keyword gosh_replExtFunc cgen-type-from-name
syn keyword gosh_replExtFunc cgen-unbox-expr
syn keyword gosh_replExtFunc cgi-add-temporary-file
syn keyword gosh_replExtFunc cgi-get-metavariable
syn keyword gosh_replExtFunc cgi-get-parameter
syn keyword gosh_replExtFunc cgi-header
syn keyword gosh_replExtFunc cgi-main
syn keyword gosh_replExtFunc cgi-parse-parameters
syn keyword gosh_replExtFunc cgi-test-environment-ref
syn keyword gosh_replExtFunc change-object-class
syn keyword gosh_replExtFunc char->ucs
syn keyword gosh_replExtFunc char-set
syn keyword gosh_replExtFunc char-set->list
syn keyword gosh_replExtFunc char-set->string
syn keyword gosh_replExtFunc char-set-adjoin
syn keyword gosh_replExtFunc char-set-adjoin!
syn keyword gosh_replExtFunc char-set-any
syn keyword gosh_replExtFunc char-set-complement
syn keyword gosh_replExtFunc char-set-complement!
syn keyword gosh_replExtFunc char-set-contains?
syn keyword gosh_replExtFunc char-set-copy
syn keyword gosh_replExtFunc char-set-count
syn keyword gosh_replExtFunc char-set-cursor
syn keyword gosh_replExtFunc char-set-cursor-next
syn keyword gosh_replExtFunc char-set-delete
syn keyword gosh_replExtFunc char-set-delete!
syn keyword gosh_replExtFunc char-set-diff+intersection
syn keyword gosh_replExtFunc char-set-diff+intersection!
syn keyword gosh_replExtFunc char-set-difference
syn keyword gosh_replExtFunc char-set-difference!
syn keyword gosh_replExtFunc char-set-every
syn keyword gosh_replExtFunc char-set-filter
syn keyword gosh_replExtFunc char-set-filter!
syn keyword gosh_replExtFunc char-set-fold
syn keyword gosh_replExtFunc char-set-for-each
syn keyword gosh_replExtFunc char-set-hash
syn keyword gosh_replExtFunc char-set-intersection
syn keyword gosh_replExtFunc char-set-intersection!
syn keyword gosh_replExtFunc char-set-map
syn keyword gosh_replExtFunc char-set-ref
syn keyword gosh_replExtFunc char-set-size
syn keyword gosh_replExtFunc char-set-unfold
syn keyword gosh_replExtFunc char-set-unfold!
syn keyword gosh_replExtFunc char-set-union
syn keyword gosh_replExtFunc char-set-union!
syn keyword gosh_replExtFunc char-set-xor
syn keyword gosh_replExtFunc char-set-xor!
syn keyword gosh_replExtFunc char-set<=
syn keyword gosh_replExtFunc char-set=
syn keyword gosh_replExtFunc char-set?
syn keyword gosh_replExtFunc chdir
syn keyword gosh_replExtFunc check-directory-tree
syn keyword gosh_replExtFunc check-substring-spec
syn keyword gosh_replExtFunc circular-list
syn keyword gosh_replExtFunc circular-list?
syn keyword gosh_replExtFunc cise-context-copy
syn keyword gosh_replExtFunc cise-lookup-macro
syn keyword gosh_replExtFunc cise-register-macro!
syn keyword gosh_replExtFunc cise-render
syn keyword gosh_replExtFunc cise-render-rec
syn keyword gosh_replExtFunc cise-render-to-string
syn keyword gosh_replExtFunc cise-translate
syn keyword gosh_replExtFunc clamp
syn keyword gosh_replExtFunc class-direct-methods
syn keyword gosh_replExtFunc class-direct-slots
syn keyword gosh_replExtFunc class-direct-subclasses
syn keyword gosh_replExtFunc class-direct-supers
syn keyword gosh_replExtFunc class-name
syn keyword gosh_replExtFunc class-of
syn keyword gosh_replExtFunc class-precedence-list
syn keyword gosh_replExtFunc class-slot-accessor
syn keyword gosh_replExtFunc class-slot-bound?
syn keyword gosh_replExtFunc class-slot-definition
syn keyword gosh_replExtFunc class-slot-ref
syn keyword gosh_replExtFunc class-slot-set!
syn keyword gosh_replExtFunc class-slots
syn keyword gosh_replExtFunc closure-code
syn keyword gosh_replExtFunc closure?
syn keyword gosh_replExtFunc combinations
syn keyword gosh_replExtFunc combinations*
syn keyword gosh_replExtFunc combinations*-for-each
syn keyword gosh_replExtFunc combinations-for-each
syn keyword gosh_replExtFunc compare
syn keyword gosh_replExtFunc complement
syn keyword gosh_replExtFunc complete-sexp?
syn keyword gosh_replExtFunc compose
syn keyword gosh_replExtFunc concatenate
syn keyword gosh_replExtFunc concatenate!
syn keyword gosh_replExtFunc condition-has-type?
syn keyword gosh_replExtFunc condition-ref
syn keyword gosh_replExtFunc condition-type?
syn keyword gosh_replExtFunc condition-variable-broadcast!
syn keyword gosh_replExtFunc condition-variable-name
syn keyword gosh_replExtFunc condition-variable-signal!
syn keyword gosh_replExtFunc condition-variable-specific
syn keyword gosh_replExtFunc condition-variable-specific-set!
syn keyword gosh_replExtFunc condition-variable?
syn keyword gosh_replExtFunc condition?
syn keyword gosh_replExtFunc cons*
syn keyword gosh_replExtFunc console-device
syn keyword gosh_replExtFunc construct-cookie-string
syn keyword gosh_replExtFunc construct-json
syn keyword gosh_replExtFunc construct-json-string
syn keyword gosh_replExtFunc copy-bit
syn keyword gosh_replExtFunc copy-bit-field
syn keyword gosh_replExtFunc copy-directory*
syn keyword gosh_replExtFunc copy-file
syn keyword gosh_replExtFunc copy-port
syn keyword gosh_replExtFunc copy-time
syn keyword gosh_replExtFunc cosh
syn keyword gosh_replExtFunc count
syn keyword gosh_replExtFunc count$
syn keyword gosh_replExtFunc cout
syn keyword gosh_replExtFunc crc32
syn keyword gosh_replExtFunc create-directory*
syn keyword gosh_replExtFunc create-directory-tree
syn keyword gosh_replExtFunc current-class-of
syn keyword gosh_replExtFunc current-date
syn keyword gosh_replExtFunc current-directory
syn keyword gosh_replExtFunc current-error-port
syn keyword gosh_replExtFunc current-exception-handler
syn keyword gosh_replExtFunc current-julian-day
syn keyword gosh_replExtFunc current-load-history
syn keyword gosh_replExtFunc current-load-next
syn keyword gosh_replExtFunc current-load-path
syn keyword gosh_replExtFunc current-load-port
syn keyword gosh_replExtFunc current-microseconds
syn keyword gosh_replExtFunc current-modified-julian-day
syn keyword gosh_replExtFunc current-thread
syn keyword gosh_replExtFunc current-time
syn keyword gosh_replExtFunc cv-file
syn keyword gosh_replExtFunc cv-string
syn keyword gosh_replExtFunc date->julian-day
syn keyword gosh_replExtFunc date->modified-julian-day
syn keyword gosh_replExtFunc date->rfc822-date
syn keyword gosh_replExtFunc date->string
syn keyword gosh_replExtFunc date->time-monotonic
syn keyword gosh_replExtFunc date->time-tai
syn keyword gosh_replExtFunc date->time-utc
syn keyword gosh_replExtFunc date-week-day
syn keyword gosh_replExtFunc date-week-number
syn keyword gosh_replExtFunc date-year-day
syn keyword gosh_replExtFunc date?
syn keyword gosh_replExtFunc dbi-connect
syn keyword gosh_replExtFunc dbi-list-drivers
syn keyword gosh_replExtFunc dbi-make-driver
syn keyword gosh_replExtFunc dbi-parse-dsn
syn keyword gosh_replExtFunc dbi-prepare-sql
syn keyword gosh_replExtFunc dbm-type->class
syn keyword gosh_replExtFunc dcgettext
syn keyword gosh_replExtFunc debug-source-info
syn keyword gosh_replExtFunc declare-bundle!
syn keyword gosh_replExtFunc decode-float
syn keyword gosh_replExtFunc decompose-path
syn keyword gosh_replExtFunc default-endian
syn keyword gosh_replExtFunc define-reader-ctor
syn keyword gosh_replExtFunc define-reader-directive
syn keyword gosh_replExtFunc deflate-string
syn keyword gosh_replExtFunc deflating-port-full-flush
syn keyword gosh_replExtFunc delete
syn keyword gosh_replExtFunc delete!
syn keyword gosh_replExtFunc delete$
syn keyword gosh_replExtFunc delete-directory*
syn keyword gosh_replExtFunc delete-duplicates
syn keyword gosh_replExtFunc delete-duplicates!
syn keyword gosh_replExtFunc delete-files
syn keyword gosh_replExtFunc delete-keyword
syn keyword gosh_replExtFunc delete-keyword!
syn keyword gosh_replExtFunc delete-keywords
syn keyword gosh_replExtFunc delete-keywords!
syn keyword gosh_replExtFunc dequeue!
syn keyword gosh_replExtFunc dequeue-all!
syn keyword gosh_replExtFunc dequeue/wait!
syn keyword gosh_replExtFunc determinant
syn keyword gosh_replExtFunc determinant!
syn keyword gosh_replExtFunc dgettext
syn keyword gosh_replExtFunc diff
syn keyword gosh_replExtFunc diff-report
syn keyword gosh_replExtFunc digest-hexify
syn keyword gosh_replExtFunc digit
syn keyword gosh_replExtFunc digit->integer
syn keyword gosh_replExtFunc directory-fold
syn keyword gosh_replExtFunc directory-list
syn keyword gosh_replExtFunc directory-list2
syn keyword gosh_replExtFunc disasm
syn keyword gosh_replExtFunc dispatch-union
syn keyword gosh_replExtFunc dotted-list?
syn keyword gosh_replExtFunc drop
syn keyword gosh_replExtFunc drop*
syn keyword gosh_replExtFunc drop-right
syn keyword gosh_replExtFunc drop-right!
syn keyword gosh_replExtFunc drop-right*
syn keyword gosh_replExtFunc drop-while
syn keyword gosh_replExtFunc dynamic-load
syn keyword gosh_replExtFunc eager
syn keyword gosh_replExtFunc ec-:vector-filter
syn keyword gosh_replExtFunc eighth
syn keyword gosh_replExtFunc end-of-char-set?
syn keyword gosh_replExtFunc enqueue!
syn keyword gosh_replExtFunc enqueue-unique!
syn keyword gosh_replExtFunc enqueue/wait!
syn keyword gosh_replExtFunc eof
syn keyword gosh_replExtFunc eof-object
syn keyword gosh_replExtFunc eq-hash
syn keyword gosh_replExtFunc eqv-hash
syn keyword gosh_replExtFunc error
syn keyword gosh_replExtFunc errorf
syn keyword gosh_replExtFunc every
syn keyword gosh_replExtFunc every$
syn keyword gosh_replExtFunc every-in-queue
syn keyword gosh_replExtFunc every-pred
syn keyword gosh_replExtFunc exit
syn keyword gosh_replExtFunc exit-handler
syn keyword gosh_replExtFunc expand-file-name
syn keyword gosh_replExtFunc expand-path
syn keyword gosh_replExtFunc extract-condition
syn keyword gosh_replExtFunc f16vector
syn keyword gosh_replExtFunc f16vector->list
syn keyword gosh_replExtFunc f16vector->vector
syn keyword gosh_replExtFunc f16vector-add
syn keyword gosh_replExtFunc f16vector-add!
syn keyword gosh_replExtFunc f16vector-clamp
syn keyword gosh_replExtFunc f16vector-clamp!
syn keyword gosh_replExtFunc f16vector-copy
syn keyword gosh_replExtFunc f16vector-copy!
syn keyword gosh_replExtFunc f16vector-div
syn keyword gosh_replExtFunc f16vector-div!
syn keyword gosh_replExtFunc f16vector-dot
syn keyword gosh_replExtFunc f16vector-fill!
syn keyword gosh_replExtFunc f16vector-length
syn keyword gosh_replExtFunc f16vector-mul
syn keyword gosh_replExtFunc f16vector-mul!
syn keyword gosh_replExtFunc f16vector-range-check
syn keyword gosh_replExtFunc f16vector-ref
syn keyword gosh_replExtFunc f16vector-set!
syn keyword gosh_replExtFunc f16vector-sub
syn keyword gosh_replExtFunc f16vector-sub!
syn keyword gosh_replExtFunc f16vector-swap-bytes
syn keyword gosh_replExtFunc f16vector-swap-bytes!
syn keyword gosh_replExtFunc f16vector?
syn keyword gosh_replExtFunc f32vector
syn keyword gosh_replExtFunc f32vector->list
syn keyword gosh_replExtFunc f32vector->vector
syn keyword gosh_replExtFunc f32vector-add
syn keyword gosh_replExtFunc f32vector-add!
syn keyword gosh_replExtFunc f32vector-clamp
syn keyword gosh_replExtFunc f32vector-clamp!
syn keyword gosh_replExtFunc f32vector-copy
syn keyword gosh_replExtFunc f32vector-copy!
syn keyword gosh_replExtFunc f32vector-div
syn keyword gosh_replExtFunc f32vector-div!
syn keyword gosh_replExtFunc f32vector-dot
syn keyword gosh_replExtFunc f32vector-fill!
syn keyword gosh_replExtFunc f32vector-length
syn keyword gosh_replExtFunc f32vector-mul
syn keyword gosh_replExtFunc f32vector-mul!
syn keyword gosh_replExtFunc f32vector-range-check
syn keyword gosh_replExtFunc f32vector-ref
syn keyword gosh_replExtFunc f32vector-set!
syn keyword gosh_replExtFunc f32vector-sub
syn keyword gosh_replExtFunc f32vector-sub!
syn keyword gosh_replExtFunc f32vector-swap-bytes
syn keyword gosh_replExtFunc f32vector-swap-bytes!
syn keyword gosh_replExtFunc f32vector?
syn keyword gosh_replExtFunc f64vector
syn keyword gosh_replExtFunc f64vector->list
syn keyword gosh_replExtFunc f64vector->vector
syn keyword gosh_replExtFunc f64vector-add
syn keyword gosh_replExtFunc f64vector-add!
syn keyword gosh_replExtFunc f64vector-clamp
syn keyword gosh_replExtFunc f64vector-clamp!
syn keyword gosh_replExtFunc f64vector-copy
syn keyword gosh_replExtFunc f64vector-copy!
syn keyword gosh_replExtFunc f64vector-div
syn keyword gosh_replExtFunc f64vector-div!
syn keyword gosh_replExtFunc f64vector-dot
syn keyword gosh_replExtFunc f64vector-fill!
syn keyword gosh_replExtFunc f64vector-length
syn keyword gosh_replExtFunc f64vector-mul
syn keyword gosh_replExtFunc f64vector-mul!
syn keyword gosh_replExtFunc f64vector-range-check
syn keyword gosh_replExtFunc f64vector-ref
syn keyword gosh_replExtFunc f64vector-set!
syn keyword gosh_replExtFunc f64vector-sub
syn keyword gosh_replExtFunc f64vector-sub!
syn keyword gosh_replExtFunc f64vector-swap-bytes
syn keyword gosh_replExtFunc f64vector-swap-bytes!
syn keyword gosh_replExtFunc f64vector?
syn keyword gosh_replExtFunc fifth
syn keyword gosh_replExtFunc file->list
syn keyword gosh_replExtFunc file->sexp-list
syn keyword gosh_replExtFunc file->string
syn keyword gosh_replExtFunc file->string-list
syn keyword gosh_replExtFunc file-atime
syn keyword gosh_replExtFunc file-ctime
syn keyword gosh_replExtFunc file-dev
syn keyword gosh_replExtFunc file-device=?
syn keyword gosh_replExtFunc file-eq?
syn keyword gosh_replExtFunc file-equal?
syn keyword gosh_replExtFunc file-eqv?
syn keyword gosh_replExtFunc file-exists?
syn keyword gosh_replExtFunc file-filter
syn keyword gosh_replExtFunc file-gid
syn keyword gosh_replExtFunc file-ino
syn keyword gosh_replExtFunc file-is-directory?
syn keyword gosh_replExtFunc file-is-executable?
syn keyword gosh_replExtFunc file-is-readable?
syn keyword gosh_replExtFunc file-is-regular?
syn keyword gosh_replExtFunc file-is-symlink?
syn keyword gosh_replExtFunc file-is-writable?
syn keyword gosh_replExtFunc file-mode
syn keyword gosh_replExtFunc file-mtime
syn keyword gosh_replExtFunc file-nlink
syn keyword gosh_replExtFunc file-perm
syn keyword gosh_replExtFunc file-rdev
syn keyword gosh_replExtFunc file-size
syn keyword gosh_replExtFunc file-type
syn keyword gosh_replExtFunc file-uid
syn keyword gosh_replExtFunc filter
syn keyword gosh_replExtFunc filter!
syn keyword gosh_replExtFunc filter$
syn keyword gosh_replExtFunc filter-map
syn keyword gosh_replExtFunc find$
syn keyword gosh_replExtFunc find-file-in-paths
syn keyword gosh_replExtFunc find-gauche-package-description
syn keyword gosh_replExtFunc find-in-queue
syn keyword gosh_replExtFunc find-module
syn keyword gosh_replExtFunc find-string-from-port?
syn keyword gosh_replExtFunc find-tail
syn keyword gosh_replExtFunc find-tail$
syn keyword gosh_replExtFunc finite?
syn keyword gosh_replExtFunc first
syn keyword gosh_replExtFunc fixnum-width
syn keyword gosh_replExtFunc fixnum?
syn keyword gosh_replExtFunc flonum?
syn keyword gosh_replExtFunc floor->exact
syn keyword gosh_replExtFunc flush
syn keyword gosh_replExtFunc flush-all-ports
syn keyword gosh_replExtFunc fmod
syn keyword gosh_replExtFunc fold-right$
syn keyword gosh_replExtFunc foldts
syn keyword gosh_replExtFunc for-each$
syn keyword gosh_replExtFunc foreign-pointer-attribute-get
syn keyword gosh_replExtFunc foreign-pointer-attribute-set
syn keyword gosh_replExtFunc foreign-pointer-attributes
syn keyword gosh_replExtFunc format
syn keyword gosh_replExtFunc format/ss
syn keyword gosh_replExtFunc fourth
syn keyword gosh_replExtFunc frexp
syn keyword gosh_replExtFunc ftp-chdir
syn keyword gosh_replExtFunc ftp-current-directory
syn keyword gosh_replExtFunc ftp-get
syn keyword gosh_replExtFunc ftp-help
syn keyword gosh_replExtFunc ftp-list
syn keyword gosh_replExtFunc ftp-login
syn keyword gosh_replExtFunc ftp-ls
syn keyword gosh_replExtFunc ftp-mdtm
syn keyword gosh_replExtFunc ftp-mkdir
syn keyword gosh_replExtFunc ftp-mtime
syn keyword gosh_replExtFunc ftp-name-list
syn keyword gosh_replExtFunc ftp-noop
syn keyword gosh_replExtFunc ftp-put
syn keyword gosh_replExtFunc ftp-put-unique
syn keyword gosh_replExtFunc ftp-quit
syn keyword gosh_replExtFunc ftp-remove
syn keyword gosh_replExtFunc ftp-rename
syn keyword gosh_replExtFunc ftp-rmdir
syn keyword gosh_replExtFunc ftp-site
syn keyword gosh_replExtFunc ftp-size
syn keyword gosh_replExtFunc ftp-stat
syn keyword gosh_replExtFunc ftp-system
syn keyword gosh_replExtFunc gauche-architecture
syn keyword gosh_replExtFunc gauche-architecture-directory
syn keyword gosh_replExtFunc gauche-character-encoding
syn keyword gosh_replExtFunc gauche-config
syn keyword gosh_replExtFunc gauche-dso-suffix
syn keyword gosh_replExtFunc gauche-library-directory
syn keyword gosh_replExtFunc gauche-package-build
syn keyword gosh_replExtFunc gauche-package-clean
syn keyword gosh_replExtFunc gauche-package-compile
syn keyword gosh_replExtFunc gauche-package-compile-and-link
syn keyword gosh_replExtFunc gauche-package-description-paths
syn keyword gosh_replExtFunc gauche-package-ensure
syn keyword gosh_replExtFunc gauche-package-link
syn keyword gosh_replExtFunc gauche-site-architecture-directory
syn keyword gosh_replExtFunc gauche-site-library-directory
syn keyword gosh_replExtFunc gauche-thread-type
syn keyword gosh_replExtFunc gauche-version
syn keyword gosh_replExtFunc gc
syn keyword gosh_replExtFunc gc-stat
syn keyword gosh_replExtFunc gdbm-close
syn keyword gosh_replExtFunc gdbm-closed?
syn keyword gosh_replExtFunc gdbm-delete
syn keyword gosh_replExtFunc gdbm-errno
syn keyword gosh_replExtFunc gdbm-exists?
syn keyword gosh_replExtFunc gdbm-fetch
syn keyword gosh_replExtFunc gdbm-firstkey
syn keyword gosh_replExtFunc gdbm-nextkey
syn keyword gosh_replExtFunc gdbm-open
syn keyword gosh_replExtFunc gdbm-reorganize
syn keyword gosh_replExtFunc gdbm-setopt
syn keyword gosh_replExtFunc gdbm-store
syn keyword gosh_replExtFunc gdbm-strerror
syn keyword gosh_replExtFunc gdbm-sync
syn keyword gosh_replExtFunc gdbm-version
syn keyword gosh_replExtFunc gensym
syn keyword gosh_replExtFunc get-environment-variable
syn keyword gosh_replExtFunc get-environment-variables
syn keyword gosh_replExtFunc get-f16
syn keyword gosh_replExtFunc get-f16be
syn keyword gosh_replExtFunc get-f16le
syn keyword gosh_replExtFunc get-f32
syn keyword gosh_replExtFunc get-f32be
syn keyword gosh_replExtFunc get-f32le
syn keyword gosh_replExtFunc get-f64
syn keyword gosh_replExtFunc get-f64be
syn keyword gosh_replExtFunc get-f64le
syn keyword gosh_replExtFunc get-keyword
syn keyword gosh_replExtFunc get-output-byte-string
syn keyword gosh_replExtFunc get-output-string
syn keyword gosh_replExtFunc get-password
syn keyword gosh_replExtFunc get-remaining-input-string
syn keyword gosh_replExtFunc get-s16
syn keyword gosh_replExtFunc get-s16be
syn keyword gosh_replExtFunc get-s16le
syn keyword gosh_replExtFunc get-s32
syn keyword gosh_replExtFunc get-s32be
syn keyword gosh_replExtFunc get-s32le
syn keyword gosh_replExtFunc get-s64
syn keyword gosh_replExtFunc get-s64be
syn keyword gosh_replExtFunc get-s64le
syn keyword gosh_replExtFunc get-s8
syn keyword gosh_replExtFunc get-signal-handler
syn keyword gosh_replExtFunc get-signal-handler-mask
syn keyword gosh_replExtFunc get-signal-handlers
syn keyword gosh_replExtFunc get-signal-pending-limit
syn keyword gosh_replExtFunc get-u16
syn keyword gosh_replExtFunc get-u16be
syn keyword gosh_replExtFunc get-u16le
syn keyword gosh_replExtFunc get-u32
syn keyword gosh_replExtFunc get-u32be
syn keyword gosh_replExtFunc get-u32le
syn keyword gosh_replExtFunc get-u64
syn keyword gosh_replExtFunc get-u64be
syn keyword gosh_replExtFunc get-u64le
syn keyword gosh_replExtFunc get-u8
syn keyword gosh_replExtFunc getcwd
syn keyword gosh_replExtFunc getenv
syn keyword gosh_replExtFunc getpid
syn keyword gosh_replExtFunc getter-with-setter
syn keyword gosh_replExtFunc gettext
syn keyword gosh_replExtFunc glob
syn keyword gosh_replExtFunc glob-component->regexp
syn keyword gosh_replExtFunc glob-fold
syn keyword gosh_replExtFunc global-variable-bound?
syn keyword gosh_replExtFunc global-variable-ref
syn keyword gosh_replExtFunc greatest-fixnum
syn keyword gosh_replExtFunc gzip-decode-string
syn keyword gosh_replExtFunc gzip-encode-string
syn keyword gosh_replExtFunc has-setter?
syn keyword gosh_replExtFunc hash
syn keyword gosh_replExtFunc hash-table
syn keyword gosh_replExtFunc hash-table->alist
syn keyword gosh_replExtFunc hash-table-clear!
syn keyword gosh_replExtFunc hash-table-copy
syn keyword gosh_replExtFunc hash-table-delete!
syn keyword gosh_replExtFunc hash-table-exists?
syn keyword gosh_replExtFunc hash-table-fold
syn keyword gosh_replExtFunc hash-table-for-each
syn keyword gosh_replExtFunc hash-table-get
syn keyword gosh_replExtFunc hash-table-keys
syn keyword gosh_replExtFunc hash-table-map
syn keyword gosh_replExtFunc hash-table-num-entries
syn keyword gosh_replExtFunc hash-table-pop!
syn keyword gosh_replExtFunc hash-table-push!
syn keyword gosh_replExtFunc hash-table-put!
syn keyword gosh_replExtFunc hash-table-stat
syn keyword gosh_replExtFunc hash-table-type
syn keyword gosh_replExtFunc hash-table-update!
syn keyword gosh_replExtFunc hash-table-values
syn keyword gosh_replExtFunc hash-table?
syn keyword gosh_replExtFunc hexdigit
syn keyword gosh_replExtFunc hmac-digest
syn keyword gosh_replExtFunc hmac-digest-string
syn keyword gosh_replExtFunc home-directory
syn keyword gosh_replExtFunc hook?
syn keyword gosh_replExtFunc html-doctype
syn keyword gosh_replExtFunc html-escape
syn keyword gosh_replExtFunc html-escape-string
syn keyword gosh_replExtFunc html:a
syn keyword gosh_replExtFunc html:abbr
syn keyword gosh_replExtFunc html:acronym
syn keyword gosh_replExtFunc html:address
syn keyword gosh_replExtFunc html:area
syn keyword gosh_replExtFunc html:b
syn keyword gosh_replExtFunc html:base
syn keyword gosh_replExtFunc html:bdo
syn keyword gosh_replExtFunc html:big
syn keyword gosh_replExtFunc html:blockquote
syn keyword gosh_replExtFunc html:body
syn keyword gosh_replExtFunc html:br
syn keyword gosh_replExtFunc html:button
syn keyword gosh_replExtFunc html:caption
syn keyword gosh_replExtFunc html:cite
syn keyword gosh_replExtFunc html:code
syn keyword gosh_replExtFunc html:col
syn keyword gosh_replExtFunc html:colgroup
syn keyword gosh_replExtFunc html:dd
syn keyword gosh_replExtFunc html:del
syn keyword gosh_replExtFunc html:dfn
syn keyword gosh_replExtFunc html:div
syn keyword gosh_replExtFunc html:dl
syn keyword gosh_replExtFunc html:dt
syn keyword gosh_replExtFunc html:em
syn keyword gosh_replExtFunc html:fieldset
syn keyword gosh_replExtFunc html:form
syn keyword gosh_replExtFunc html:frame
syn keyword gosh_replExtFunc html:frameset
syn keyword gosh_replExtFunc html:h1
syn keyword gosh_replExtFunc html:h2
syn keyword gosh_replExtFunc html:h3
syn keyword gosh_replExtFunc html:h4
syn keyword gosh_replExtFunc html:h5
syn keyword gosh_replExtFunc html:h6
syn keyword gosh_replExtFunc html:head
syn keyword gosh_replExtFunc html:hr
syn keyword gosh_replExtFunc html:html
syn keyword gosh_replExtFunc html:i
syn keyword gosh_replExtFunc html:iframe
syn keyword gosh_replExtFunc html:img
syn keyword gosh_replExtFunc html:input
syn keyword gosh_replExtFunc html:ins
syn keyword gosh_replExtFunc html:kbd
syn keyword gosh_replExtFunc html:label
syn keyword gosh_replExtFunc html:legend
syn keyword gosh_replExtFunc html:li
syn keyword gosh_replExtFunc html:link
syn keyword gosh_replExtFunc html:map
syn keyword gosh_replExtFunc html:meta
syn keyword gosh_replExtFunc html:noframes
syn keyword gosh_replExtFunc html:noscript
syn keyword gosh_replExtFunc html:object
syn keyword gosh_replExtFunc html:ol
syn keyword gosh_replExtFunc html:optgroup
syn keyword gosh_replExtFunc html:option
syn keyword gosh_replExtFunc html:p
syn keyword gosh_replExtFunc html:param
syn keyword gosh_replExtFunc html:pre
syn keyword gosh_replExtFunc html:q
syn keyword gosh_replExtFunc html:samp
syn keyword gosh_replExtFunc html:script
syn keyword gosh_replExtFunc html:select
syn keyword gosh_replExtFunc html:small
syn keyword gosh_replExtFunc html:span
syn keyword gosh_replExtFunc html:strong
syn keyword gosh_replExtFunc html:style
syn keyword gosh_replExtFunc html:sub
syn keyword gosh_replExtFunc html:sup
syn keyword gosh_replExtFunc html:table
syn keyword gosh_replExtFunc html:tbody
syn keyword gosh_replExtFunc html:td
syn keyword gosh_replExtFunc html:textarea
syn keyword gosh_replExtFunc html:tfoot
syn keyword gosh_replExtFunc html:th
syn keyword gosh_replExtFunc html:thead
syn keyword gosh_replExtFunc html:title
syn keyword gosh_replExtFunc html:tr
syn keyword gosh_replExtFunc html:tt
syn keyword gosh_replExtFunc html:ul
syn keyword gosh_replExtFunc html:var
syn keyword gosh_replExtFunc http-blob-sender
syn keyword gosh_replExtFunc http-compose-form-data
syn keyword gosh_replExtFunc http-compose-query
syn keyword gosh_replExtFunc http-default-auth-handler
syn keyword gosh_replExtFunc http-delete
syn keyword gosh_replExtFunc http-file-receiver
syn keyword gosh_replExtFunc http-file-sender
syn keyword gosh_replExtFunc http-get
syn keyword gosh_replExtFunc http-head
syn keyword gosh_replExtFunc http-multipart-sender
syn keyword gosh_replExtFunc http-null-receiver
syn keyword gosh_replExtFunc http-null-sender
syn keyword gosh_replExtFunc http-oport-receiver
syn keyword gosh_replExtFunc http-post
syn keyword gosh_replExtFunc http-put
syn keyword gosh_replExtFunc http-request
syn keyword gosh_replExtFunc http-secure-connection-available?
syn keyword gosh_replExtFunc http-string-receiver
syn keyword gosh_replExtFunc http-string-sender
syn keyword gosh_replExtFunc icmp-echo-ident
syn keyword gosh_replExtFunc icmp-echo-sequence
syn keyword gosh_replExtFunc icmp-fill-header!
syn keyword gosh_replExtFunc icmp-packet-code
syn keyword gosh_replExtFunc icmp-packet-type
syn keyword gosh_replExtFunc icmp4-describe-packet
syn keyword gosh_replExtFunc icmp4-exceeded-code->string
syn keyword gosh_replExtFunc icmp4-fill-checksum!
syn keyword gosh_replExtFunc icmp4-fill-echo!
syn keyword gosh_replExtFunc icmp4-message-type->string
syn keyword gosh_replExtFunc icmp4-parameter-code->string
syn keyword gosh_replExtFunc icmp4-redirect-code->string
syn keyword gosh_replExtFunc icmp4-router-code->string
syn keyword gosh_replExtFunc icmp4-security-code->string
syn keyword gosh_replExtFunc icmp4-unreach-code->string
syn keyword gosh_replExtFunc icmp6-describe-packet
syn keyword gosh_replExtFunc icmp6-exceeded-code->string
syn keyword gosh_replExtFunc icmp6-fill-echo!
syn keyword gosh_replExtFunc icmp6-message-type->string
syn keyword gosh_replExtFunc icmp6-parameter-code->string
syn keyword gosh_replExtFunc icmp6-unreach-code->string
syn keyword gosh_replExtFunc identifier->symbol
syn keyword gosh_replExtFunc identifier?
syn keyword gosh_replExtFunc identity
syn keyword gosh_replExtFunc identity-array
syn keyword gosh_replExtFunc if-car-sxpath
syn keyword gosh_replExtFunc if-sxpath
syn keyword gosh_replExtFunc inet-address->string
syn keyword gosh_replExtFunc inet-checksum
syn keyword gosh_replExtFunc inet-string->address
syn keyword gosh_replExtFunc inet-string->address!
syn keyword gosh_replExtFunc inexact-/
syn keyword gosh_replExtFunc infinite?
syn keyword gosh_replExtFunc inflate-string
syn keyword gosh_replExtFunc inflate-sync
syn keyword gosh_replExtFunc info
syn keyword gosh_replExtFunc input-serializer?
syn keyword gosh_replExtFunc instance-slot-ref
syn keyword gosh_replExtFunc instance-slot-set
syn keyword gosh_replExtFunc integer->digit
syn keyword gosh_replExtFunc integer-length
syn keyword gosh_replExtFunc integer-range->char-set
syn keyword gosh_replExtFunc integer-range->char-set!
syn keyword gosh_replExtFunc intersperse
syn keyword gosh_replExtFunc iota
syn keyword gosh_replExtFunc ip-destination-address
syn keyword gosh_replExtFunc ip-header-length
syn keyword gosh_replExtFunc ip-protocol
syn keyword gosh_replExtFunc ip-source-address
syn keyword gosh_replExtFunc ip-version
syn keyword gosh_replExtFunc ipv4-global-address?
syn keyword gosh_replExtFunc is-a?
syn keyword gosh_replExtFunc isomorphic?
syn keyword gosh_replExtFunc iterator->stream
syn keyword gosh_replExtFunc job-acknowledge!
syn keyword gosh_replExtFunc job-acknowledge-time
syn keyword gosh_replExtFunc job-finish-time
syn keyword gosh_replExtFunc job-mark-killed!
syn keyword gosh_replExtFunc job-result
syn keyword gosh_replExtFunc job-run!
syn keyword gosh_replExtFunc job-start-time
syn keyword gosh_replExtFunc job-status
syn keyword gosh_replExtFunc job-touch!
syn keyword gosh_replExtFunc job-wait
syn keyword gosh_replExtFunc job?
syn keyword gosh_replExtFunc join-timeout-exception?
syn keyword gosh_replExtFunc judge-file
syn keyword gosh_replExtFunc julian-day->date
syn keyword gosh_replExtFunc julian-day->time-monotonic
syn keyword gosh_replExtFunc julian-day->time-tai
syn keyword gosh_replExtFunc julian-day->time-utc
syn keyword gosh_replExtFunc keyword->string
syn keyword gosh_replExtFunc keyword?
syn keyword gosh_replExtFunc kmp-step
syn keyword gosh_replExtFunc last
syn keyword gosh_replExtFunc last-pair
syn keyword gosh_replExtFunc lcs
syn keyword gosh_replExtFunc lcs-edit-list
syn keyword gosh_replExtFunc lcs-fold
syn keyword gosh_replExtFunc lcs-with-positions
syn keyword gosh_replExtFunc ldexp
syn keyword gosh_replExtFunc least-fixnum
syn keyword gosh_replExtFunc letter
syn keyword gosh_replExtFunc library-exists?
syn keyword gosh_replExtFunc library-fold
syn keyword gosh_replExtFunc library-for-each
syn keyword gosh_replExtFunc library-has-module?
syn keyword gosh_replExtFunc library-map
syn keyword gosh_replExtFunc list*
syn keyword gosh_replExtFunc list->char-set
syn keyword gosh_replExtFunc list->char-set!
syn keyword gosh_replExtFunc list->f16vector
syn keyword gosh_replExtFunc list->f32vector
syn keyword gosh_replExtFunc list->f64vector
syn keyword gosh_replExtFunc list->peg-stream
syn keyword gosh_replExtFunc list->queue
syn keyword gosh_replExtFunc list->s16vector
syn keyword gosh_replExtFunc list->s32vector
syn keyword gosh_replExtFunc list->s64vector
syn keyword gosh_replExtFunc list->s8vector
syn keyword gosh_replExtFunc list->stream
syn keyword gosh_replExtFunc list->sys-fdset
syn keyword gosh_replExtFunc list->u16vector
syn keyword gosh_replExtFunc list->u32vector
syn keyword gosh_replExtFunc list->u64vector
syn keyword gosh_replExtFunc list->u8vector
syn keyword gosh_replExtFunc list-copy
syn keyword gosh_replExtFunc list-index
syn keyword gosh_replExtFunc list-tabulate
syn keyword gosh_replExtFunc list=
syn keyword gosh_replExtFunc load-bundle!
syn keyword gosh_replExtFunc load-from-port
syn keyword gosh_replExtFunc localized-template
syn keyword gosh_replExtFunc log-open
syn keyword gosh_replExtFunc logand
syn keyword gosh_replExtFunc logbit?
syn keyword gosh_replExtFunc logcount
syn keyword gosh_replExtFunc logior
syn keyword gosh_replExtFunc lognot
syn keyword gosh_replExtFunc logtest
syn keyword gosh_replExtFunc logxor
syn keyword gosh_replExtFunc lower
syn keyword gosh_replExtFunc lset-adjoin
syn keyword gosh_replExtFunc lset-diff+intersection
syn keyword gosh_replExtFunc lset-diff+intersection!
syn keyword gosh_replExtFunc lset-difference
syn keyword gosh_replExtFunc lset-difference!
syn keyword gosh_replExtFunc lset-intersection
syn keyword gosh_replExtFunc lset-intersection!
syn keyword gosh_replExtFunc lset-union
syn keyword gosh_replExtFunc lset-union!
syn keyword gosh_replExtFunc lset-xor
syn keyword gosh_replExtFunc lset-xor!
syn keyword gosh_replExtFunc lset<=
syn keyword gosh_replExtFunc lset=
syn keyword gosh_replExtFunc macroexpand
syn keyword gosh_replExtFunc macroexpand-1
syn keyword gosh_replExtFunc make-array
syn keyword gosh_replExtFunc make-bimap
syn keyword gosh_replExtFunc make-byte-string
syn keyword gosh_replExtFunc make-cgen-type
syn keyword gosh_replExtFunc make-char-quotator
syn keyword gosh_replExtFunc make-client-socket
syn keyword gosh_replExtFunc make-compound-condition
syn keyword gosh_replExtFunc make-condition
syn keyword gosh_replExtFunc make-condition-type
syn keyword gosh_replExtFunc make-condition-variable
syn keyword gosh_replExtFunc make-csv-reader
syn keyword gosh_replExtFunc make-csv-writer
syn keyword gosh_replExtFunc make-date
syn keyword gosh_replExtFunc make-directory*
syn keyword gosh_replExtFunc make-empty-attlist
syn keyword gosh_replExtFunc make-f16array
syn keyword gosh_replExtFunc make-f16vector
syn keyword gosh_replExtFunc make-f32array
syn keyword gosh_replExtFunc make-f32vector
syn keyword gosh_replExtFunc make-f64array
syn keyword gosh_replExtFunc make-f64vector
syn keyword gosh_replExtFunc make-gettext
syn keyword gosh_replExtFunc make-glob-fs-fold
syn keyword gosh_replExtFunc make-hash-table
syn keyword gosh_replExtFunc make-hook
syn keyword gosh_replExtFunc make-http-connection
syn keyword gosh_replExtFunc make-initial-:-dispatch
syn keyword gosh_replExtFunc make-job
syn keyword gosh_replExtFunc make-keyword
syn keyword gosh_replExtFunc make-kmp-restart-vector
syn keyword gosh_replExtFunc make-list
syn keyword gosh_replExtFunc make-module
syn keyword gosh_replExtFunc make-mtqueue
syn keyword gosh_replExtFunc make-mutex
syn keyword gosh_replExtFunc make-packer
syn keyword gosh_replExtFunc make-parameter
syn keyword gosh_replExtFunc make-peg-parse-error
syn keyword gosh_replExtFunc make-peg-stream
syn keyword gosh_replExtFunc make-queue
syn keyword gosh_replExtFunc make-random-source
syn keyword gosh_replExtFunc make-rbtree
syn keyword gosh_replExtFunc make-record-type
syn keyword gosh_replExtFunc make-rtd
syn keyword gosh_replExtFunc make-s16array
syn keyword gosh_replExtFunc make-s16vector
syn keyword gosh_replExtFunc make-s32array
syn keyword gosh_replExtFunc make-s32vector
syn keyword gosh_replExtFunc make-s64array
syn keyword gosh_replExtFunc make-s64vector
syn keyword gosh_replExtFunc make-s8array
syn keyword gosh_replExtFunc make-s8vector
syn keyword gosh_replExtFunc make-server-socket
syn keyword gosh_replExtFunc make-server-sockets
syn keyword gosh_replExtFunc make-sockaddrs
syn keyword gosh_replExtFunc make-socket
syn keyword gosh_replExtFunc make-sparse-table
syn keyword gosh_replExtFunc make-sparse-vector
syn keyword gosh_replExtFunc make-stream
syn keyword gosh_replExtFunc make-string-pointer
syn keyword gosh_replExtFunc make-sys-addrinfo
syn keyword gosh_replExtFunc make-text-progress-bar
syn keyword gosh_replExtFunc make-thread
syn keyword gosh_replExtFunc make-thread-pool
syn keyword gosh_replExtFunc make-time
syn keyword gosh_replExtFunc make-tree-map
syn keyword gosh_replExtFunc make-trie
syn keyword gosh_replExtFunc make-u16array
syn keyword gosh_replExtFunc make-u16vector
syn keyword gosh_replExtFunc make-u32array
syn keyword gosh_replExtFunc make-u32vector
syn keyword gosh_replExtFunc make-u64array
syn keyword gosh_replExtFunc make-u64vector
syn keyword gosh_replExtFunc make-u8array
syn keyword gosh_replExtFunc make-u8vector
syn keyword gosh_replExtFunc make-weak-vector
syn keyword gosh_replExtFunc make-xml-token
syn keyword gosh_replExtFunc map!
syn keyword gosh_replExtFunc map$
syn keyword gosh_replExtFunc map-in-order
syn keyword gosh_replExtFunc map-union
syn keyword gosh_replExtFunc match:$-ref
syn keyword gosh_replExtFunc match:error
syn keyword gosh_replExtFunc match:every
syn keyword gosh_replExtFunc md5-digest
syn keyword gosh_replExtFunc md5-digest-string
syn keyword gosh_replExtFunc member$
syn keyword gosh_replExtFunc merge
syn keyword gosh_replExtFunc merge!
syn keyword gosh_replExtFunc mime-body->file
syn keyword gosh_replExtFunc mime-body->string
syn keyword gosh_replExtFunc mime-compose-message
syn keyword gosh_replExtFunc mime-compose-message-string
syn keyword gosh_replExtFunc mime-compose-parameters
syn keyword gosh_replExtFunc mime-decode-text
syn keyword gosh_replExtFunc mime-decode-word
syn keyword gosh_replExtFunc mime-encode-text
syn keyword gosh_replExtFunc mime-encode-word
syn keyword gosh_replExtFunc mime-make-boundary
syn keyword gosh_replExtFunc mime-parse-content-disposition
syn keyword gosh_replExtFunc mime-parse-content-type
syn keyword gosh_replExtFunc mime-parse-message
syn keyword gosh_replExtFunc mime-parse-parameters
syn keyword gosh_replExtFunc mime-parse-version
syn keyword gosh_replExtFunc mime-retrieve-body
syn keyword gosh_replExtFunc min&max
syn keyword gosh_replExtFunc modf
syn keyword gosh_replExtFunc modified-julian-day->date
syn keyword gosh_replExtFunc modified-julian-day->time-monotonic
syn keyword gosh_replExtFunc modified-julian-day->time-tai
syn keyword gosh_replExtFunc modified-julian-day->time-utc
syn keyword gosh_replExtFunc module-exports
syn keyword gosh_replExtFunc module-imports
syn keyword gosh_replExtFunc module-name
syn keyword gosh_replExtFunc module-name->path
syn keyword gosh_replExtFunc module-parents
syn keyword gosh_replExtFunc module-precedence-list
syn keyword gosh_replExtFunc module-table
syn keyword gosh_replExtFunc module?
syn keyword gosh_replExtFunc monotonic-merge
syn keyword gosh_replExtFunc move-file
syn keyword gosh_replExtFunc mt-random-fill-f32vector!
syn keyword gosh_replExtFunc mt-random-fill-f64vector!
syn keyword gosh_replExtFunc mt-random-fill-u32vector!
syn keyword gosh_replExtFunc mt-random-get-state
syn keyword gosh_replExtFunc mt-random-integer
syn keyword gosh_replExtFunc mt-random-real
syn keyword gosh_replExtFunc mt-random-real0
syn keyword gosh_replExtFunc mt-random-set-seed!
syn keyword gosh_replExtFunc mt-random-set-state!
syn keyword gosh_replExtFunc mtqueue-max-length
syn keyword gosh_replExtFunc mtqueue-room
syn keyword gosh_replExtFunc mtqueue?
syn keyword gosh_replExtFunc mutex-lock!
syn keyword gosh_replExtFunc mutex-name
syn keyword gosh_replExtFunc mutex-specific
syn keyword gosh_replExtFunc mutex-specific-set!
syn keyword gosh_replExtFunc mutex-state
syn keyword gosh_replExtFunc mutex-unlock!
syn keyword gosh_replExtFunc mutex?
syn keyword gosh_replExtFunc name-compare
syn keyword gosh_replExtFunc nan?
syn keyword gosh_replExtFunc native-endian
syn keyword gosh_replExtFunc next-token
syn keyword gosh_replExtFunc next-token-of
syn keyword gosh_replExtFunc ngettext
syn keyword gosh_replExtFunc ninth
syn keyword gosh_replExtFunc node-closure
syn keyword gosh_replExtFunc node-eq?
syn keyword gosh_replExtFunc node-equal?
syn keyword gosh_replExtFunc node-join
syn keyword gosh_replExtFunc node-or
syn keyword gosh_replExtFunc node-pos
syn keyword gosh_replExtFunc node-reduce
syn keyword gosh_replExtFunc node-reverse
syn keyword gosh_replExtFunc node-self
syn keyword gosh_replExtFunc node-trace
syn keyword gosh_replExtFunc nodeset?
syn keyword gosh_replExtFunc not-pair?
syn keyword gosh_replExtFunc ntype-names??
syn keyword gosh_replExtFunc ntype-namespace-id??
syn keyword gosh_replExtFunc ntype??
syn keyword gosh_replExtFunc null-device
syn keyword gosh_replExtFunc null-list?
syn keyword gosh_replExtFunc number->stream
syn keyword gosh_replExtFunc open-coding-aware-port
syn keyword gosh_replExtFunc open-deflating-port
syn keyword gosh_replExtFunc open-inflating-port
syn keyword gosh_replExtFunc open-info-file
syn keyword gosh_replExtFunc open-input-buffered-port
syn keyword gosh_replExtFunc open-input-conversion-port
syn keyword gosh_replExtFunc open-input-fd-port
syn keyword gosh_replExtFunc open-input-limited-length-port
syn keyword gosh_replExtFunc open-input-process-port
syn keyword gosh_replExtFunc open-input-string
syn keyword gosh_replExtFunc open-input-uvector
syn keyword gosh_replExtFunc open-output-buffered-port
syn keyword gosh_replExtFunc open-output-conversion-port
syn keyword gosh_replExtFunc open-output-fd-port
syn keyword gosh_replExtFunc open-output-process-port
syn keyword gosh_replExtFunc open-output-string
syn keyword gosh_replExtFunc open-output-uvector
syn keyword gosh_replExtFunc option
syn keyword gosh_replExtFunc option?
syn keyword gosh_replExtFunc output-serializer?
syn keyword gosh_replExtFunc pa$
syn keyword gosh_replExtFunc pack
syn keyword gosh_replExtFunc pair-fold
syn keyword gosh_replExtFunc pair-fold-right
syn keyword gosh_replExtFunc pair-for-each
syn keyword gosh_replExtFunc parse-cookie-string
syn keyword gosh_replExtFunc parse-json
syn keyword gosh_replExtFunc parse-json-string
syn keyword gosh_replExtFunc parser-error
syn keyword gosh_replExtFunc partition
syn keyword gosh_replExtFunc partition!
syn keyword gosh_replExtFunc partition$
syn keyword gosh_replExtFunc path->gauche-package-description
syn keyword gosh_replExtFunc path->module-name
syn keyword gosh_replExtFunc path-extension
syn keyword gosh_replExtFunc path-sans-extension
syn keyword gosh_replExtFunc path-separator
syn keyword gosh_replExtFunc path-swap-extension
syn keyword gosh_replExtFunc peek-byte
syn keyword gosh_replExtFunc peek-next-char
syn keyword gosh_replExtFunc peg-parse-port
syn keyword gosh_replExtFunc peg-parse-string
syn keyword gosh_replExtFunc peg-run-parser
syn keyword gosh_replExtFunc peg-stream-peek!
syn keyword gosh_replExtFunc peg-stream-position
syn keyword gosh_replExtFunc permutations
syn keyword gosh_replExtFunc permutations*
syn keyword gosh_replExtFunc permutations*-for-each
syn keyword gosh_replExtFunc permutations-for-each
syn keyword gosh_replExtFunc port->byte-string
syn keyword gosh_replExtFunc port->list
syn keyword gosh_replExtFunc port->peg-stream
syn keyword gosh_replExtFunc port->sexp-list
syn keyword gosh_replExtFunc port->stream
syn keyword gosh_replExtFunc port->string
syn keyword gosh_replExtFunc port->string-list
syn keyword gosh_replExtFunc port-buffering
syn keyword gosh_replExtFunc port-case-fold-set!
syn keyword gosh_replExtFunc port-closed?
syn keyword gosh_replExtFunc port-current-line
syn keyword gosh_replExtFunc port-fd-dup!
syn keyword gosh_replExtFunc port-file-number
syn keyword gosh_replExtFunc port-fold
syn keyword gosh_replExtFunc port-fold-right
syn keyword gosh_replExtFunc port-for-each
syn keyword gosh_replExtFunc port-map
syn keyword gosh_replExtFunc port-name
syn keyword gosh_replExtFunc port-position-prefix
syn keyword gosh_replExtFunc port-seek
syn keyword gosh_replExtFunc port-tell
syn keyword gosh_replExtFunc port-type
syn keyword gosh_replExtFunc posix-access
syn keyword gosh_replExtFunc posix-chmod
syn keyword gosh_replExtFunc posix-ctime
syn keyword gosh_replExtFunc posix-domain-name
syn keyword gosh_replExtFunc posix-fork
syn keyword gosh_replExtFunc posix-getlogin
syn keyword gosh_replExtFunc posix-gmtime
syn keyword gosh_replExtFunc posix-host-name
syn keyword gosh_replExtFunc posix-localtime
syn keyword gosh_replExtFunc posix-mktime
syn keyword gosh_replExtFunc posix-pipe
syn keyword gosh_replExtFunc posix-rename
syn keyword gosh_replExtFunc posix-rmdir
syn keyword gosh_replExtFunc posix-stat
syn keyword gosh_replExtFunc posix-stat->vector
syn keyword gosh_replExtFunc posix-strftime
syn keyword gosh_replExtFunc posix-symlink
syn keyword gosh_replExtFunc posix-time
syn keyword gosh_replExtFunc posix-tm->vector
syn keyword gosh_replExtFunc posix-uname
syn keyword gosh_replExtFunc posix-unlink
syn keyword gosh_replExtFunc posix-wait
syn keyword gosh_replExtFunc post-order
syn keyword gosh_replExtFunc power-set
syn keyword gosh_replExtFunc power-set*
syn keyword gosh_replExtFunc power-set*-for-each
syn keyword gosh_replExtFunc power-set-binary
syn keyword gosh_replExtFunc power-set-for-each
syn keyword gosh_replExtFunc pp
syn keyword gosh_replExtFunc pre-post-order
syn keyword gosh_replExtFunc pretty-print-array
syn keyword gosh_replExtFunc prim-test
syn keyword gosh_replExtFunc print
syn keyword gosh_replExtFunc procedure-arity-includes?
syn keyword gosh_replExtFunc procedure-info
syn keyword gosh_replExtFunc process-alive?
syn keyword gosh_replExtFunc process-continue
syn keyword gosh_replExtFunc process-error
syn keyword gosh_replExtFunc process-input
syn keyword gosh_replExtFunc process-kill
syn keyword gosh_replExtFunc process-list
syn keyword gosh_replExtFunc process-output
syn keyword gosh_replExtFunc process-output->string
syn keyword gosh_replExtFunc process-output->string-list
syn keyword gosh_replExtFunc process-send-signal
syn keyword gosh_replExtFunc process-stop
syn keyword gosh_replExtFunc process-wait
syn keyword gosh_replExtFunc process-wait-any
syn keyword gosh_replExtFunc process?
syn keyword gosh_replExtFunc profiler-get-result
syn keyword gosh_replExtFunc profiler-reset
syn keyword gosh_replExtFunc profiler-show
syn keyword gosh_replExtFunc profiler-show-load-stats
syn keyword gosh_replExtFunc profiler-start
syn keyword gosh_replExtFunc profiler-stop
syn keyword gosh_replExtFunc promise-kind
syn keyword gosh_replExtFunc promise?
syn keyword gosh_replExtFunc proper-list?
syn keyword gosh_replExtFunc provide
syn keyword gosh_replExtFunc provided?
syn keyword gosh_replExtFunc put-f16!
syn keyword gosh_replExtFunc put-f16be!
syn keyword gosh_replExtFunc put-f16le!
syn keyword gosh_replExtFunc put-f32!
syn keyword gosh_replExtFunc put-f32be!
syn keyword gosh_replExtFunc put-f32le!
syn keyword gosh_replExtFunc put-f64!
syn keyword gosh_replExtFunc put-f64be!
syn keyword gosh_replExtFunc put-f64le!
syn keyword gosh_replExtFunc put-s16!
syn keyword gosh_replExtFunc put-s16be!
syn keyword gosh_replExtFunc put-s16le!
syn keyword gosh_replExtFunc put-s32!
syn keyword gosh_replExtFunc put-s32be!
syn keyword gosh_replExtFunc put-s32le!
syn keyword gosh_replExtFunc put-s64!
syn keyword gosh_replExtFunc put-s64be!
syn keyword gosh_replExtFunc put-s64le!
syn keyword gosh_replExtFunc put-s8!
syn keyword gosh_replExtFunc put-u16!
syn keyword gosh_replExtFunc put-u16be!
syn keyword gosh_replExtFunc put-u16le!
syn keyword gosh_replExtFunc put-u32!
syn keyword gosh_replExtFunc put-u32be!
syn keyword gosh_replExtFunc put-u32le!
syn keyword gosh_replExtFunc put-u64!
syn keyword gosh_replExtFunc put-u64be!
syn keyword gosh_replExtFunc put-u64le!
syn keyword gosh_replExtFunc put-u8!
syn keyword gosh_replExtFunc queue->list
syn keyword gosh_replExtFunc queue-empty?
syn keyword gosh_replExtFunc queue-front
syn keyword gosh_replExtFunc queue-length
syn keyword gosh_replExtFunc queue-pop!
syn keyword gosh_replExtFunc queue-pop/wait!
syn keyword gosh_replExtFunc queue-push!
syn keyword gosh_replExtFunc queue-push-unique!
syn keyword gosh_replExtFunc queue-push/wait!
syn keyword gosh_replExtFunc queue-rear
syn keyword gosh_replExtFunc queue?
syn keyword gosh_replExtFunc quoted-printable-decode
syn keyword gosh_replExtFunc quoted-printable-decode-string
syn keyword gosh_replExtFunc quoted-printable-encode
syn keyword gosh_replExtFunc quoted-printable-encode-string
syn keyword gosh_replExtFunc quotient&remainder
syn keyword gosh_replExtFunc raise
syn keyword gosh_replExtFunc random
syn keyword gosh_replExtFunc random-integer
syn keyword gosh_replExtFunc random-real
syn keyword gosh_replExtFunc random-source-make-integers
syn keyword gosh_replExtFunc random-source-make-reals
syn keyword gosh_replExtFunc random-source-pseudo-randomize!
syn keyword gosh_replExtFunc random-source-randomize!
syn keyword gosh_replExtFunc random-source-state-ref
syn keyword gosh_replExtFunc random-source-state-set!
syn keyword gosh_replExtFunc random-source?
syn keyword gosh_replExtFunc rassoc
syn keyword gosh_replExtFunc rassoc-ref
syn keyword gosh_replExtFunc rassq
syn keyword gosh_replExtFunc rassq-ref
syn keyword gosh_replExtFunc rassv
syn keyword gosh_replExtFunc rassv-ref
syn keyword gosh_replExtFunc rbtree->alist
syn keyword gosh_replExtFunc rbtree-copy
syn keyword gosh_replExtFunc rbtree-delete!
syn keyword gosh_replExtFunc rbtree-empty?
syn keyword gosh_replExtFunc rbtree-exists?
syn keyword gosh_replExtFunc rbtree-extract-max!
syn keyword gosh_replExtFunc rbtree-extract-min!
syn keyword gosh_replExtFunc rbtree-fold
syn keyword gosh_replExtFunc rbtree-fold-right
syn keyword gosh_replExtFunc rbtree-get
syn keyword gosh_replExtFunc rbtree-keys
syn keyword gosh_replExtFunc rbtree-max
syn keyword gosh_replExtFunc rbtree-min
syn keyword gosh_replExtFunc rbtree-num-entries
syn keyword gosh_replExtFunc rbtree-pop!
syn keyword gosh_replExtFunc rbtree-push!
syn keyword gosh_replExtFunc rbtree-put!
syn keyword gosh_replExtFunc rbtree-update!
syn keyword gosh_replExtFunc rbtree-values
syn keyword gosh_replExtFunc rbtree?
syn keyword gosh_replExtFunc read-ber-integer
syn keyword gosh_replExtFunc read-binary-double
syn keyword gosh_replExtFunc read-binary-float
syn keyword gosh_replExtFunc read-binary-long
syn keyword gosh_replExtFunc read-binary-short
syn keyword gosh_replExtFunc read-binary-sint
syn keyword gosh_replExtFunc read-binary-sint16
syn keyword gosh_replExtFunc read-binary-sint32
syn keyword gosh_replExtFunc read-binary-sint64
syn keyword gosh_replExtFunc read-binary-sint8
syn keyword gosh_replExtFunc read-binary-uint
syn keyword gosh_replExtFunc read-binary-uint16
syn keyword gosh_replExtFunc read-binary-uint32
syn keyword gosh_replExtFunc read-binary-uint64
syn keyword gosh_replExtFunc read-binary-uint8
syn keyword gosh_replExtFunc read-binary-ulong
syn keyword gosh_replExtFunc read-binary-ushort
syn keyword gosh_replExtFunc read-block
syn keyword gosh_replExtFunc read-block!
syn keyword gosh_replExtFunc read-byte
syn keyword gosh_replExtFunc read-char-set
syn keyword gosh_replExtFunc read-eval-print-loop
syn keyword gosh_replExtFunc read-f16
syn keyword gosh_replExtFunc read-f32
syn keyword gosh_replExtFunc read-f64
syn keyword gosh_replExtFunc read-from-string
syn keyword gosh_replExtFunc read-line
syn keyword gosh_replExtFunc read-list
syn keyword gosh_replExtFunc read-reference-has-value?
syn keyword gosh_replExtFunc read-reference-value
syn keyword gosh_replExtFunc read-reference?
syn keyword gosh_replExtFunc read-s16
syn keyword gosh_replExtFunc read-s32
syn keyword gosh_replExtFunc read-s64
syn keyword gosh_replExtFunc read-s8
syn keyword gosh_replExtFunc read-sint
syn keyword gosh_replExtFunc read-string
syn keyword gosh_replExtFunc read-u16
syn keyword gosh_replExtFunc read-u32
syn keyword gosh_replExtFunc read-u64
syn keyword gosh_replExtFunc read-u8
syn keyword gosh_replExtFunc read-uint
syn keyword gosh_replExtFunc read-with-shared-structure
syn keyword gosh_replExtFunc read/ss
syn keyword gosh_replExtFunc record-accessor
syn keyword gosh_replExtFunc record-constructor
syn keyword gosh_replExtFunc record-modifier
syn keyword gosh_replExtFunc record-predicate
syn keyword gosh_replExtFunc record-rtd
syn keyword gosh_replExtFunc record-type-descriptor
syn keyword gosh_replExtFunc record-type-fields
syn keyword gosh_replExtFunc record-type-name
syn keyword gosh_replExtFunc record?
syn keyword gosh_replExtFunc redefine-class!
syn keyword gosh_replExtFunc reduce
syn keyword gosh_replExtFunc reduce$
syn keyword gosh_replExtFunc reduce-right
syn keyword gosh_replExtFunc reduce-right$
syn keyword gosh_replExtFunc ref*
syn keyword gosh_replExtFunc regexp->string
syn keyword gosh_replExtFunc regexp-ast
syn keyword gosh_replExtFunc regexp-case-fold?
syn keyword gosh_replExtFunc regexp-compile
syn keyword gosh_replExtFunc regexp-optimize
syn keyword gosh_replExtFunc regexp-parse
syn keyword gosh_replExtFunc regexp-quote
syn keyword gosh_replExtFunc regexp-replace
syn keyword gosh_replExtFunc regexp-replace*
syn keyword gosh_replExtFunc regexp-replace-all
syn keyword gosh_replExtFunc regexp-replace-all*
syn keyword gosh_replExtFunc regexp-unparse
syn keyword gosh_replExtFunc regexp?
syn keyword gosh_replExtFunc regmatch?
syn keyword gosh_replExtFunc relative-path?
syn keyword gosh_replExtFunc relnum-compare
syn keyword gosh_replExtFunc reload
syn keyword gosh_replExtFunc reload-modified-modules
syn keyword gosh_replExtFunc remove
syn keyword gosh_replExtFunc remove!
syn keyword gosh_replExtFunc remove$
syn keyword gosh_replExtFunc remove-directory*
syn keyword gosh_replExtFunc remove-file
syn keyword gosh_replExtFunc remove-files
syn keyword gosh_replExtFunc remove-from-queue!
syn keyword gosh_replExtFunc remq
syn keyword gosh_replExtFunc remv
syn keyword gosh_replExtFunc rename-file
syn keyword gosh_replExtFunc replace-range
syn keyword gosh_replExtFunc report-error
syn keyword gosh_replExtFunc resolve-path
syn keyword gosh_replExtFunc reverse!
syn keyword gosh_replExtFunc reverse-list->string
syn keyword gosh_replExtFunc reverse-list->vector
syn keyword gosh_replExtFunc reverse-vector->list
syn keyword gosh_replExtFunc rfc822-atom
syn keyword gosh_replExtFunc rfc822-date->date
syn keyword gosh_replExtFunc rfc822-dot-atom
syn keyword gosh_replExtFunc rfc822-field->tokens
syn keyword gosh_replExtFunc rfc822-header->list
syn keyword gosh_replExtFunc rfc822-header-ref
syn keyword gosh_replExtFunc rfc822-invalid-header-field
syn keyword gosh_replExtFunc rfc822-next-token
syn keyword gosh_replExtFunc rfc822-parse-date
syn keyword gosh_replExtFunc rfc822-parse-errorf
syn keyword gosh_replExtFunc rfc822-quoted-string
syn keyword gosh_replExtFunc rfc822-read-headers
syn keyword gosh_replExtFunc rfc822-skip-cfws
syn keyword gosh_replExtFunc rfc822-write-headers
syn keyword gosh_replExtFunc rope->string
syn keyword gosh_replExtFunc rope-finalize
syn keyword gosh_replExtFunc round->exact
syn keyword gosh_replExtFunc rtd-all-field-names
syn keyword gosh_replExtFunc rtd-field-mutable?
syn keyword gosh_replExtFunc rtd-field-names
syn keyword gosh_replExtFunc rtd-name
syn keyword gosh_replExtFunc rtd-parent
syn keyword gosh_replExtFunc rtd?
syn keyword gosh_replExtFunc run
syn keyword gosh_replExtFunc run-cgi-script->header&body
syn keyword gosh_replExtFunc run-cgi-script->string
syn keyword gosh_replExtFunc run-cgi-script->string-list
syn keyword gosh_replExtFunc run-cgi-script->sxml
syn keyword gosh_replExtFunc run-process
syn keyword gosh_replExtFunc rxmatch
syn keyword gosh_replExtFunc rxmatch->string
syn keyword gosh_replExtFunc rxmatch-after
syn keyword gosh_replExtFunc rxmatch-before
syn keyword gosh_replExtFunc rxmatch-end
syn keyword gosh_replExtFunc rxmatch-num-matches
syn keyword gosh_replExtFunc rxmatch-start
syn keyword gosh_replExtFunc rxmatch-substring
syn keyword gosh_replExtFunc s16vector
syn keyword gosh_replExtFunc s16vector->list
syn keyword gosh_replExtFunc s16vector->vector
syn keyword gosh_replExtFunc s16vector-add
syn keyword gosh_replExtFunc s16vector-add!
syn keyword gosh_replExtFunc s16vector-and
syn keyword gosh_replExtFunc s16vector-and!
syn keyword gosh_replExtFunc s16vector-clamp
syn keyword gosh_replExtFunc s16vector-clamp!
syn keyword gosh_replExtFunc s16vector-copy
syn keyword gosh_replExtFunc s16vector-copy!
syn keyword gosh_replExtFunc s16vector-dot
syn keyword gosh_replExtFunc s16vector-fill!
syn keyword gosh_replExtFunc s16vector-ior
syn keyword gosh_replExtFunc s16vector-ior!
syn keyword gosh_replExtFunc s16vector-length
syn keyword gosh_replExtFunc s16vector-mul
syn keyword gosh_replExtFunc s16vector-mul!
syn keyword gosh_replExtFunc s16vector-range-check
syn keyword gosh_replExtFunc s16vector-ref
syn keyword gosh_replExtFunc s16vector-set!
syn keyword gosh_replExtFunc s16vector-sub
syn keyword gosh_replExtFunc s16vector-sub!
syn keyword gosh_replExtFunc s16vector-swap-bytes
syn keyword gosh_replExtFunc s16vector-swap-bytes!
syn keyword gosh_replExtFunc s16vector-xor
syn keyword gosh_replExtFunc s16vector-xor!
syn keyword gosh_replExtFunc s16vector?
syn keyword gosh_replExtFunc s32vector
syn keyword gosh_replExtFunc s32vector->list
syn keyword gosh_replExtFunc s32vector->string
syn keyword gosh_replExtFunc s32vector->vector
syn keyword gosh_replExtFunc s32vector-add
syn keyword gosh_replExtFunc s32vector-add!
syn keyword gosh_replExtFunc s32vector-and
syn keyword gosh_replExtFunc s32vector-and!
syn keyword gosh_replExtFunc s32vector-clamp
syn keyword gosh_replExtFunc s32vector-clamp!
syn keyword gosh_replExtFunc s32vector-copy
syn keyword gosh_replExtFunc s32vector-copy!
syn keyword gosh_replExtFunc s32vector-dot
syn keyword gosh_replExtFunc s32vector-fill!
syn keyword gosh_replExtFunc s32vector-ior
syn keyword gosh_replExtFunc s32vector-ior!
syn keyword gosh_replExtFunc s32vector-length
syn keyword gosh_replExtFunc s32vector-mul
syn keyword gosh_replExtFunc s32vector-mul!
syn keyword gosh_replExtFunc s32vector-range-check
syn keyword gosh_replExtFunc s32vector-ref
syn keyword gosh_replExtFunc s32vector-set!
syn keyword gosh_replExtFunc s32vector-sub
syn keyword gosh_replExtFunc s32vector-sub!
syn keyword gosh_replExtFunc s32vector-swap-bytes
syn keyword gosh_replExtFunc s32vector-swap-bytes!
syn keyword gosh_replExtFunc s32vector-xor
syn keyword gosh_replExtFunc s32vector-xor!
syn keyword gosh_replExtFunc s32vector?
syn keyword gosh_replExtFunc s64vector
syn keyword gosh_replExtFunc s64vector->list
syn keyword gosh_replExtFunc s64vector->vector
syn keyword gosh_replExtFunc s64vector-add
syn keyword gosh_replExtFunc s64vector-add!
syn keyword gosh_replExtFunc s64vector-and
syn keyword gosh_replExtFunc s64vector-and!
syn keyword gosh_replExtFunc s64vector-clamp
syn keyword gosh_replExtFunc s64vector-clamp!
syn keyword gosh_replExtFunc s64vector-copy
syn keyword gosh_replExtFunc s64vector-copy!
syn keyword gosh_replExtFunc s64vector-dot
syn keyword gosh_replExtFunc s64vector-fill!
syn keyword gosh_replExtFunc s64vector-ior
syn keyword gosh_replExtFunc s64vector-ior!
syn keyword gosh_replExtFunc s64vector-length
syn keyword gosh_replExtFunc s64vector-mul
syn keyword gosh_replExtFunc s64vector-mul!
syn keyword gosh_replExtFunc s64vector-range-check
syn keyword gosh_replExtFunc s64vector-ref
syn keyword gosh_replExtFunc s64vector-set!
syn keyword gosh_replExtFunc s64vector-sub
syn keyword gosh_replExtFunc s64vector-sub!
syn keyword gosh_replExtFunc s64vector-swap-bytes
syn keyword gosh_replExtFunc s64vector-swap-bytes!
syn keyword gosh_replExtFunc s64vector-xor
syn keyword gosh_replExtFunc s64vector-xor!
syn keyword gosh_replExtFunc s64vector?
syn keyword gosh_replExtFunc s8vector
syn keyword gosh_replExtFunc s8vector->list
syn keyword gosh_replExtFunc s8vector->string
syn keyword gosh_replExtFunc s8vector->vector
syn keyword gosh_replExtFunc s8vector-add
syn keyword gosh_replExtFunc s8vector-add!
syn keyword gosh_replExtFunc s8vector-and
syn keyword gosh_replExtFunc s8vector-and!
syn keyword gosh_replExtFunc s8vector-clamp
syn keyword gosh_replExtFunc s8vector-clamp!
syn keyword gosh_replExtFunc s8vector-copy
syn keyword gosh_replExtFunc s8vector-copy!
syn keyword gosh_replExtFunc s8vector-dot
syn keyword gosh_replExtFunc s8vector-fill!
syn keyword gosh_replExtFunc s8vector-ior
syn keyword gosh_replExtFunc s8vector-ior!
syn keyword gosh_replExtFunc s8vector-length
syn keyword gosh_replExtFunc s8vector-mul
syn keyword gosh_replExtFunc s8vector-mul!
syn keyword gosh_replExtFunc s8vector-range-check
syn keyword gosh_replExtFunc s8vector-ref
syn keyword gosh_replExtFunc s8vector-set!
syn keyword gosh_replExtFunc s8vector-sub
syn keyword gosh_replExtFunc s8vector-sub!
syn keyword gosh_replExtFunc s8vector-xor
syn keyword gosh_replExtFunc s8vector-xor!
syn keyword gosh_replExtFunc s8vector?
syn keyword gosh_replExtFunc second
syn keyword gosh_replExtFunc seconds->time
syn keyword gosh_replExtFunc select-first-kid
syn keyword gosh_replExtFunc select-kids
syn keyword gosh_replExtFunc serializer?
syn keyword gosh_replExtFunc set-random-seed!
syn keyword gosh_replExtFunc set-signal-handler!
syn keyword gosh_replExtFunc set-signal-pending-limit
syn keyword gosh_replExtFunc setenv!
syn keyword gosh_replExtFunc setter
syn keyword gosh_replExtFunc seventh
syn keyword gosh_replExtFunc sha1-digest
syn keyword gosh_replExtFunc sha1-digest-string
syn keyword gosh_replExtFunc sha224-digest
syn keyword gosh_replExtFunc sha224-digest-string
syn keyword gosh_replExtFunc sha256-digest
syn keyword gosh_replExtFunc sha256-digest-string
syn keyword gosh_replExtFunc sha384-digest
syn keyword gosh_replExtFunc sha384-digest-string
syn keyword gosh_replExtFunc sha512-digest
syn keyword gosh_replExtFunc sha512-digest-string
syn keyword gosh_replExtFunc shape
syn keyword gosh_replExtFunc shape-for-each
syn keyword gosh_replExtFunc share-array
syn keyword gosh_replExtFunc shell-escape-string
syn keyword gosh_replExtFunc simplify-path
syn keyword gosh_replExtFunc sinh
syn keyword gosh_replExtFunc sixth
syn keyword gosh_replExtFunc skip-until
syn keyword gosh_replExtFunc skip-while
syn keyword gosh_replExtFunc slices
syn keyword gosh_replExtFunc slot-bound-using-accessor?
syn keyword gosh_replExtFunc slot-bound?
syn keyword gosh_replExtFunc slot-definition-accessor
syn keyword gosh_replExtFunc slot-definition-allocation
syn keyword gosh_replExtFunc slot-definition-getter
syn keyword gosh_replExtFunc slot-definition-name
syn keyword gosh_replExtFunc slot-definition-option
syn keyword gosh_replExtFunc slot-definition-options
syn keyword gosh_replExtFunc slot-definition-setter
syn keyword gosh_replExtFunc slot-exists?
syn keyword gosh_replExtFunc slot-initialize-using-accessor!
syn keyword gosh_replExtFunc slot-pop!
syn keyword gosh_replExtFunc slot-push!
syn keyword gosh_replExtFunc slot-ref
syn keyword gosh_replExtFunc slot-ref-using-accessor
syn keyword gosh_replExtFunc slot-set!
syn keyword gosh_replExtFunc slot-set-using-accessor!
syn keyword gosh_replExtFunc socket-accept
syn keyword gosh_replExtFunc socket-address
syn keyword gosh_replExtFunc socket-bind
syn keyword gosh_replExtFunc socket-buildmsg
syn keyword gosh_replExtFunc socket-close
syn keyword gosh_replExtFunc socket-connect
syn keyword gosh_replExtFunc socket-fd
syn keyword gosh_replExtFunc socket-getpeername
syn keyword gosh_replExtFunc socket-getsockname
syn keyword gosh_replExtFunc socket-getsockopt
syn keyword gosh_replExtFunc socket-input-port
syn keyword gosh_replExtFunc socket-ioctl
syn keyword gosh_replExtFunc socket-listen
syn keyword gosh_replExtFunc socket-output-port
syn keyword gosh_replExtFunc socket-recv
syn keyword gosh_replExtFunc socket-recv!
syn keyword gosh_replExtFunc socket-recvfrom
syn keyword gosh_replExtFunc socket-recvfrom!
syn keyword gosh_replExtFunc socket-send
syn keyword gosh_replExtFunc socket-sendmsg
syn keyword gosh_replExtFunc socket-sendto
syn keyword gosh_replExtFunc socket-setsockopt
syn keyword gosh_replExtFunc socket-shutdown
syn keyword gosh_replExtFunc socket-status
syn keyword gosh_replExtFunc sort
syn keyword gosh_replExtFunc sort!
syn keyword gosh_replExtFunc sort-by
syn keyword gosh_replExtFunc sort-by!
syn keyword gosh_replExtFunc sorted?
syn keyword gosh_replExtFunc space
syn keyword gosh_replExtFunc spaces
syn keyword gosh_replExtFunc span
syn keyword gosh_replExtFunc span!
syn keyword gosh_replExtFunc sparse-table-clear!
syn keyword gosh_replExtFunc sparse-table-copy
syn keyword gosh_replExtFunc sparse-table-delete!
syn keyword gosh_replExtFunc sparse-table-exists?
syn keyword gosh_replExtFunc sparse-table-fold
syn keyword gosh_replExtFunc sparse-table-for-each
syn keyword gosh_replExtFunc sparse-table-keys
syn keyword gosh_replExtFunc sparse-table-map
syn keyword gosh_replExtFunc sparse-table-num-entries
syn keyword gosh_replExtFunc sparse-table-pop!
syn keyword gosh_replExtFunc sparse-table-push!
syn keyword gosh_replExtFunc sparse-table-ref
syn keyword gosh_replExtFunc sparse-table-set!
syn keyword gosh_replExtFunc sparse-table-update!
syn keyword gosh_replExtFunc sparse-table-values
syn keyword gosh_replExtFunc sparse-vector-clear!
syn keyword gosh_replExtFunc sparse-vector-copy
syn keyword gosh_replExtFunc sparse-vector-delete!
syn keyword gosh_replExtFunc sparse-vector-exists?
syn keyword gosh_replExtFunc sparse-vector-fold
syn keyword gosh_replExtFunc sparse-vector-for-each
syn keyword gosh_replExtFunc sparse-vector-inc!
syn keyword gosh_replExtFunc sparse-vector-keys
syn keyword gosh_replExtFunc sparse-vector-map
syn keyword gosh_replExtFunc sparse-vector-max-index-bits
syn keyword gosh_replExtFunc sparse-vector-num-entries
syn keyword gosh_replExtFunc sparse-vector-pop!
syn keyword gosh_replExtFunc sparse-vector-push!
syn keyword gosh_replExtFunc sparse-vector-ref
syn keyword gosh_replExtFunc sparse-vector-set!
syn keyword gosh_replExtFunc sparse-vector-update!
syn keyword gosh_replExtFunc sparse-vector-values
syn keyword gosh_replExtFunc split-at
syn keyword gosh_replExtFunc split-at!
syn keyword gosh_replExtFunc split-at*
syn keyword gosh_replExtFunc split-string
syn keyword gosh_replExtFunc sql-tokenize
syn keyword gosh_replExtFunc srfi-42--dispatch
syn keyword gosh_replExtFunc srfi-42--dispatch-ref
syn keyword gosh_replExtFunc srfi-42--dispatch-set!
syn keyword gosh_replExtFunc srl:display-sxml
syn keyword gosh_replExtFunc srl:parameterizable
syn keyword gosh_replExtFunc srl:sxml->html
syn keyword gosh_replExtFunc srl:sxml->html-noindent
syn keyword gosh_replExtFunc srl:sxml->string
syn keyword gosh_replExtFunc srl:sxml->xml
syn keyword gosh_replExtFunc srl:sxml->xml-noindent
syn keyword gosh_replExtFunc ssax:assert-token
syn keyword gosh_replExtFunc ssax:complete-start-tag
syn keyword gosh_replExtFunc ssax:handle-parsed-entity
syn keyword gosh_replExtFunc ssax:ncname-starting-char?
syn keyword gosh_replExtFunc ssax:read-NCName
syn keyword gosh_replExtFunc ssax:read-QName
syn keyword gosh_replExtFunc ssax:read-attributes
syn keyword gosh_replExtFunc ssax:read-cdata-body
syn keyword gosh_replExtFunc ssax:read-char-data
syn keyword gosh_replExtFunc ssax:read-char-ref
syn keyword gosh_replExtFunc ssax:read-external-id
syn keyword gosh_replExtFunc ssax:read-markup-token
syn keyword gosh_replExtFunc ssax:read-pi-body-as-string
syn keyword gosh_replExtFunc ssax:resolve-name
syn keyword gosh_replExtFunc ssax:reverse-collect-str
syn keyword gosh_replExtFunc ssax:reverse-collect-str-drop-ws
syn keyword gosh_replExtFunc ssax:scan-Misc
syn keyword gosh_replExtFunc ssax:skip-S
syn keyword gosh_replExtFunc ssax:skip-internal-dtd
syn keyword gosh_replExtFunc ssax:skip-pi
syn keyword gosh_replExtFunc ssax:uri-string->symbol
syn keyword gosh_replExtFunc ssax:warn
syn keyword gosh_replExtFunc ssax:xml->sxml
syn keyword gosh_replExtFunc stable-sort
syn keyword gosh_replExtFunc stable-sort!
syn keyword gosh_replExtFunc stable-sort-by
syn keyword gosh_replExtFunc stable-sort-by!
syn keyword gosh_replExtFunc standard-error-port
syn keyword gosh_replExtFunc standard-input-port
syn keyword gosh_replExtFunc standard-output-port
syn keyword gosh_replExtFunc store-bundle!
syn keyword gosh_replExtFunc stream
syn keyword gosh_replExtFunc stream->list
syn keyword gosh_replExtFunc stream->number
syn keyword gosh_replExtFunc stream->string
syn keyword gosh_replExtFunc stream->symbol
syn keyword gosh_replExtFunc stream-any
syn keyword gosh_replExtFunc stream-append
syn keyword gosh_replExtFunc stream-break
syn keyword gosh_replExtFunc stream-butlast
syn keyword gosh_replExtFunc stream-butlast-n
syn keyword gosh_replExtFunc stream-caaaar
syn keyword gosh_replExtFunc stream-caaadr
syn keyword gosh_replExtFunc stream-caaar
syn keyword gosh_replExtFunc stream-caadar
syn keyword gosh_replExtFunc stream-caaddr
syn keyword gosh_replExtFunc stream-caadr
syn keyword gosh_replExtFunc stream-caar
syn keyword gosh_replExtFunc stream-cadaar
syn keyword gosh_replExtFunc stream-cadadr
syn keyword gosh_replExtFunc stream-cadar
syn keyword gosh_replExtFunc stream-caddar
syn keyword gosh_replExtFunc stream-cadddr
syn keyword gosh_replExtFunc stream-caddr
syn keyword gosh_replExtFunc stream-cadr
syn keyword gosh_replExtFunc stream-car
syn keyword gosh_replExtFunc stream-cdaaar
syn keyword gosh_replExtFunc stream-cdaadr
syn keyword gosh_replExtFunc stream-cdaar
syn keyword gosh_replExtFunc stream-cdadar
syn keyword gosh_replExtFunc stream-cdaddr
syn keyword gosh_replExtFunc stream-cdadr
syn keyword gosh_replExtFunc stream-cdar
syn keyword gosh_replExtFunc stream-cddaar
syn keyword gosh_replExtFunc stream-cddadr
syn keyword gosh_replExtFunc stream-cddar
syn keyword gosh_replExtFunc stream-cdddar
syn keyword gosh_replExtFunc stream-cddddr
syn keyword gosh_replExtFunc stream-cdddr
syn keyword gosh_replExtFunc stream-cddr
syn keyword gosh_replExtFunc stream-cdr
syn keyword gosh_replExtFunc stream-concatenate
syn keyword gosh_replExtFunc stream-cons*
syn keyword gosh_replExtFunc stream-count
syn keyword gosh_replExtFunc stream-delete
syn keyword gosh_replExtFunc stream-delete-duplicates
syn keyword gosh_replExtFunc stream-drop
syn keyword gosh_replExtFunc stream-drop-safe
syn keyword gosh_replExtFunc stream-drop-while
syn keyword gosh_replExtFunc stream-eighth
syn keyword gosh_replExtFunc stream-every
syn keyword gosh_replExtFunc stream-fifth
syn keyword gosh_replExtFunc stream-filter
syn keyword gosh_replExtFunc stream-find
syn keyword gosh_replExtFunc stream-find-tail
syn keyword gosh_replExtFunc stream-first
syn keyword gosh_replExtFunc stream-for-each
syn keyword gosh_replExtFunc stream-format
syn keyword gosh_replExtFunc stream-fourth
syn keyword gosh_replExtFunc stream-grep
syn keyword gosh_replExtFunc stream-index
syn keyword gosh_replExtFunc stream-intersperse
syn keyword gosh_replExtFunc stream-iota
syn keyword gosh_replExtFunc stream-last
syn keyword gosh_replExtFunc stream-last-n
syn keyword gosh_replExtFunc stream-length
syn keyword gosh_replExtFunc stream-length>=
syn keyword gosh_replExtFunc stream-lines
syn keyword gosh_replExtFunc stream-map
syn keyword gosh_replExtFunc stream-member
syn keyword gosh_replExtFunc stream-memq
syn keyword gosh_replExtFunc stream-memv
syn keyword gosh_replExtFunc stream-ninth
syn keyword gosh_replExtFunc stream-null?
syn keyword gosh_replExtFunc stream-pair?
syn keyword gosh_replExtFunc stream-partition
syn keyword gosh_replExtFunc stream-prefix=
syn keyword gosh_replExtFunc stream-ref
syn keyword gosh_replExtFunc stream-remove
syn keyword gosh_replExtFunc stream-replace
syn keyword gosh_replExtFunc stream-reverse
syn keyword gosh_replExtFunc stream-second
syn keyword gosh_replExtFunc stream-seventh
syn keyword gosh_replExtFunc stream-sixth
syn keyword gosh_replExtFunc stream-span
syn keyword gosh_replExtFunc stream-split
syn keyword gosh_replExtFunc stream-tabulate
syn keyword gosh_replExtFunc stream-take
syn keyword gosh_replExtFunc stream-take-safe
syn keyword gosh_replExtFunc stream-take-while
syn keyword gosh_replExtFunc stream-tenth
syn keyword gosh_replExtFunc stream-third
syn keyword gosh_replExtFunc stream-translate
syn keyword gosh_replExtFunc stream-unfoldn
syn keyword gosh_replExtFunc stream-xcons
syn keyword gosh_replExtFunc stream=
syn keyword gosh_replExtFunc stream?
syn keyword gosh_replExtFunc string->char-set
syn keyword gosh_replExtFunc string->char-set!
syn keyword gosh_replExtFunc string->date
syn keyword gosh_replExtFunc string->peg-stream
syn keyword gosh_replExtFunc string->regexp
syn keyword gosh_replExtFunc string->s32vector
syn keyword gosh_replExtFunc string->s8vector
syn keyword gosh_replExtFunc string->s8vector!
syn keyword gosh_replExtFunc string->stream
syn keyword gosh_replExtFunc string->u32vector
syn keyword gosh_replExtFunc string->u8vector
syn keyword gosh_replExtFunc string->u8vector!
syn keyword gosh_replExtFunc string->uninterned-symbol
syn keyword gosh_replExtFunc string-any
syn keyword gosh_replExtFunc string-append/shared
syn keyword gosh_replExtFunc string-byte-ref
syn keyword gosh_replExtFunc string-byte-set!
syn keyword gosh_replExtFunc string-ci<
syn keyword gosh_replExtFunc string-ci<=
syn keyword gosh_replExtFunc string-ci<>
syn keyword gosh_replExtFunc string-ci=
syn keyword gosh_replExtFunc string-ci>
syn keyword gosh_replExtFunc string-ci>=
syn keyword gosh_replExtFunc string-compare
syn keyword gosh_replExtFunc string-compare-ci
syn keyword gosh_replExtFunc string-complete->incomplete
syn keyword gosh_replExtFunc string-concatenate
syn keyword gosh_replExtFunc string-concatenate-reverse
syn keyword gosh_replExtFunc string-concatenate-reverse/shared
syn keyword gosh_replExtFunc string-concatenate/shared
syn keyword gosh_replExtFunc string-contains
syn keyword gosh_replExtFunc string-contains-ci
syn keyword gosh_replExtFunc string-copy!
syn keyword gosh_replExtFunc string-count
syn keyword gosh_replExtFunc string-delete
syn keyword gosh_replExtFunc string-downcase
syn keyword gosh_replExtFunc string-downcase!
syn keyword gosh_replExtFunc string-drop
syn keyword gosh_replExtFunc string-drop-right
syn keyword gosh_replExtFunc string-every
syn keyword gosh_replExtFunc string-fill!
syn keyword gosh_replExtFunc string-filter
syn keyword gosh_replExtFunc string-find
syn keyword gosh_replExtFunc string-fold
syn keyword gosh_replExtFunc string-fold-right
syn keyword gosh_replExtFunc string-for-each
syn keyword gosh_replExtFunc string-for-each-index
syn keyword gosh_replExtFunc string-hash
syn keyword gosh_replExtFunc string-hash-ci
syn keyword gosh_replExtFunc string-immutable?
syn keyword gosh_replExtFunc string-incomplete->complete
syn keyword gosh_replExtFunc string-incomplete->complete!
syn keyword gosh_replExtFunc string-incomplete?
syn keyword gosh_replExtFunc string-index
syn keyword gosh_replExtFunc string-index-right
syn keyword gosh_replExtFunc string-interpolate
syn keyword gosh_replExtFunc string-join
syn keyword gosh_replExtFunc string-kmp-partial-search
syn keyword gosh_replExtFunc string-lower
syn keyword gosh_replExtFunc string-map
syn keyword gosh_replExtFunc string-map!
syn keyword gosh_replExtFunc string-null?
syn keyword gosh_replExtFunc string-pad
syn keyword gosh_replExtFunc string-pad-right
syn keyword gosh_replExtFunc string-parse-final-start+end
syn keyword gosh_replExtFunc string-parse-start+end
syn keyword gosh_replExtFunc string-pointer-byte-index
syn keyword gosh_replExtFunc string-pointer-copy
syn keyword gosh_replExtFunc string-pointer-index
syn keyword gosh_replExtFunc string-pointer-next!
syn keyword gosh_replExtFunc string-pointer-prev!
syn keyword gosh_replExtFunc string-pointer-ref
syn keyword gosh_replExtFunc string-pointer-set!
syn keyword gosh_replExtFunc string-pointer-substring
syn keyword gosh_replExtFunc string-pointer?
syn keyword gosh_replExtFunc string-prefix-ci?
syn keyword gosh_replExtFunc string-prefix-length
syn keyword gosh_replExtFunc string-prefix-length-ci
syn keyword gosh_replExtFunc string-prefix?
syn keyword gosh_replExtFunc string-replace
syn keyword gosh_replExtFunc string-reverse
syn keyword gosh_replExtFunc string-reverse!
syn keyword gosh_replExtFunc string-rindex
syn keyword gosh_replExtFunc string-scan
syn keyword gosh_replExtFunc string-size
syn keyword gosh_replExtFunc string-skip
syn keyword gosh_replExtFunc string-skip-right
syn keyword gosh_replExtFunc string-split
syn keyword gosh_replExtFunc string-suffix-ci?
syn keyword gosh_replExtFunc string-suffix-length
syn keyword gosh_replExtFunc string-suffix-length-ci
syn keyword gosh_replExtFunc string-suffix?
syn keyword gosh_replExtFunc string-tabulate
syn keyword gosh_replExtFunc string-take
syn keyword gosh_replExtFunc string-take-right
syn keyword gosh_replExtFunc string-titlecase
syn keyword gosh_replExtFunc string-titlecase!
syn keyword gosh_replExtFunc string-tokenize
syn keyword gosh_replExtFunc string-tr
syn keyword gosh_replExtFunc string-transliterate
syn keyword gosh_replExtFunc string-trim
syn keyword gosh_replExtFunc string-trim-both
syn keyword gosh_replExtFunc string-trim-right
syn keyword gosh_replExtFunc string-unfold
syn keyword gosh_replExtFunc string-unfold-right
syn keyword gosh_replExtFunc string-upcase
syn keyword gosh_replExtFunc string-upcase!
syn keyword gosh_replExtFunc string-upper
syn keyword gosh_replExtFunc string-whitespace?
syn keyword gosh_replExtFunc string-xcopy!
syn keyword gosh_replExtFunc string<
syn keyword gosh_replExtFunc string<=
syn keyword gosh_replExtFunc string<>
syn keyword gosh_replExtFunc string=
syn keyword gosh_replExtFunc string>
syn keyword gosh_replExtFunc string>=
syn keyword gosh_replExtFunc subarray
syn keyword gosh_replExtFunc subr?
syn keyword gosh_replExtFunc substring-spec-ok?
syn keyword gosh_replExtFunc substring/shared
syn keyword gosh_replExtFunc substring?
syn keyword gosh_replExtFunc subtract-duration
syn keyword gosh_replExtFunc subtract-duration!
syn keyword gosh_replExtFunc supported-character-encoding?
syn keyword gosh_replExtFunc supported-character-encodings
syn keyword gosh_replExtFunc sxml:add-attr
syn keyword gosh_replExtFunc sxml:add-attr!
syn keyword gosh_replExtFunc sxml:add-aux
syn keyword gosh_replExtFunc sxml:add-aux!
syn keyword gosh_replExtFunc sxml:add-parents
syn keyword gosh_replExtFunc sxml:ancestor
syn keyword gosh_replExtFunc sxml:ancestor-or-self
syn keyword gosh_replExtFunc sxml:attr
syn keyword gosh_replExtFunc sxml:attr->html
syn keyword gosh_replExtFunc sxml:attr->xml
syn keyword gosh_replExtFunc sxml:attr-as-list
syn keyword gosh_replExtFunc sxml:attr-list
syn keyword gosh_replExtFunc sxml:attr-list-node
syn keyword gosh_replExtFunc sxml:attr-list-u
syn keyword gosh_replExtFunc sxml:attr-u
syn keyword gosh_replExtFunc sxml:attribute
syn keyword gosh_replExtFunc sxml:aux-as-list
syn keyword gosh_replExtFunc sxml:aux-list
syn keyword gosh_replExtFunc sxml:aux-list-node
syn keyword gosh_replExtFunc sxml:aux-list-u
syn keyword gosh_replExtFunc sxml:aux-node
syn keyword gosh_replExtFunc sxml:aux-nodes
syn keyword gosh_replExtFunc sxml:boolean
syn keyword gosh_replExtFunc sxml:change-attr
syn keyword gosh_replExtFunc sxml:change-attr!
syn keyword gosh_replExtFunc sxml:change-attrlist
syn keyword gosh_replExtFunc sxml:change-attrlist!
syn keyword gosh_replExtFunc sxml:change-content
syn keyword gosh_replExtFunc sxml:change-content!
syn keyword gosh_replExtFunc sxml:change-name
syn keyword gosh_replExtFunc sxml:change-name!
syn keyword gosh_replExtFunc sxml:child
syn keyword gosh_replExtFunc sxml:child-elements
syn keyword gosh_replExtFunc sxml:child-nodes
syn keyword gosh_replExtFunc sxml:clean
syn keyword gosh_replExtFunc sxml:clean-feed
syn keyword gosh_replExtFunc sxml:content
syn keyword gosh_replExtFunc sxml:content-raw
syn keyword gosh_replExtFunc sxml:descendant
syn keyword gosh_replExtFunc sxml:descendant-or-self
syn keyword gosh_replExtFunc sxml:element-name
syn keyword gosh_replExtFunc sxml:element?
syn keyword gosh_replExtFunc sxml:empty-element?
syn keyword gosh_replExtFunc sxml:equal?
syn keyword gosh_replExtFunc sxml:equality-cmp
syn keyword gosh_replExtFunc sxml:error
syn keyword gosh_replExtFunc sxml:filter
syn keyword gosh_replExtFunc sxml:following
syn keyword gosh_replExtFunc sxml:following-sibling
syn keyword gosh_replExtFunc sxml:id
syn keyword gosh_replExtFunc sxml:id-alist
syn keyword gosh_replExtFunc sxml:invert
syn keyword gosh_replExtFunc sxml:lookup
syn keyword gosh_replExtFunc sxml:minimized?
syn keyword gosh_replExtFunc sxml:name
syn keyword gosh_replExtFunc sxml:name->ns-id
syn keyword gosh_replExtFunc sxml:namespace
syn keyword gosh_replExtFunc sxml:ncname
syn keyword gosh_replExtFunc sxml:node-name
syn keyword gosh_replExtFunc sxml:node-parent
syn keyword gosh_replExtFunc sxml:node?
syn keyword gosh_replExtFunc sxml:non-terminated-html-tag?
syn keyword gosh_replExtFunc sxml:normalized?
syn keyword gosh_replExtFunc sxml:not-equal?
syn keyword gosh_replExtFunc sxml:ns-id
syn keyword gosh_replExtFunc sxml:ns-id->nodes
syn keyword gosh_replExtFunc sxml:ns-id->uri
syn keyword gosh_replExtFunc sxml:ns-list
syn keyword gosh_replExtFunc sxml:ns-prefix
syn keyword gosh_replExtFunc sxml:ns-uri
syn keyword gosh_replExtFunc sxml:ns-uri->id
syn keyword gosh_replExtFunc sxml:ns-uri->nodes
syn keyword gosh_replExtFunc sxml:num-attr
syn keyword gosh_replExtFunc sxml:number
syn keyword gosh_replExtFunc sxml:parent
syn keyword gosh_replExtFunc sxml:preceding
syn keyword gosh_replExtFunc sxml:preceding-sibling
syn keyword gosh_replExtFunc sxml:relational-cmp
syn keyword gosh_replExtFunc sxml:set-attr
syn keyword gosh_replExtFunc sxml:set-attr!
syn keyword gosh_replExtFunc sxml:shallow-minimized?
syn keyword gosh_replExtFunc sxml:shallow-normalized?
syn keyword gosh_replExtFunc sxml:squeeze
syn keyword gosh_replExtFunc sxml:squeeze!
syn keyword gosh_replExtFunc sxml:string
syn keyword gosh_replExtFunc sxml:string->html
syn keyword gosh_replExtFunc sxml:string->xml
syn keyword gosh_replExtFunc sxml:string-value
syn keyword gosh_replExtFunc sxml:sxml->html
syn keyword gosh_replExtFunc sxml:sxml->xml
syn keyword gosh_replExtFunc sxpath
syn keyword gosh_replExtFunc symbol->stream
syn keyword gosh_replExtFunc symbol-bound?
syn keyword gosh_replExtFunc symbol-interned?
syn keyword gosh_replExtFunc symbol-sans-prefix
syn keyword gosh_replExtFunc sys-abort
syn keyword gosh_replExtFunc sys-access
syn keyword gosh_replExtFunc sys-alarm
syn keyword gosh_replExtFunc sys-asctime
syn keyword gosh_replExtFunc sys-basename
syn keyword gosh_replExtFunc sys-cfgetispeed
syn keyword gosh_replExtFunc sys-cfgetospeed
syn keyword gosh_replExtFunc sys-cfsetispeed
syn keyword gosh_replExtFunc sys-cfsetospeed
syn keyword gosh_replExtFunc sys-chdir
syn keyword gosh_replExtFunc sys-chmod
syn keyword gosh_replExtFunc sys-chown
syn keyword gosh_replExtFunc sys-close
syn keyword gosh_replExtFunc sys-closelog
syn keyword gosh_replExtFunc sys-crypt
syn keyword gosh_replExtFunc sys-ctermid
syn keyword gosh_replExtFunc sys-ctime
syn keyword gosh_replExtFunc sys-difftime
syn keyword gosh_replExtFunc sys-dirname
syn keyword gosh_replExtFunc sys-environ
syn keyword gosh_replExtFunc sys-environ->alist
syn keyword gosh_replExtFunc sys-exec
syn keyword gosh_replExtFunc sys-exit
syn keyword gosh_replExtFunc sys-fchmod
syn keyword gosh_replExtFunc sys-fcntl
syn keyword gosh_replExtFunc sys-fdset
syn keyword gosh_replExtFunc sys-fdset->list
syn keyword gosh_replExtFunc sys-fdset-clear!
syn keyword gosh_replExtFunc sys-fdset-copy!
syn keyword gosh_replExtFunc sys-fdset-max-fd
syn keyword gosh_replExtFunc sys-fdset-ref
syn keyword gosh_replExtFunc sys-fdset-set!
syn keyword gosh_replExtFunc sys-fork
syn keyword gosh_replExtFunc sys-fork-and-exec
syn keyword gosh_replExtFunc sys-forkpty
syn keyword gosh_replExtFunc sys-forkpty-and-exec
syn keyword gosh_replExtFunc sys-fstat
syn keyword gosh_replExtFunc sys-ftruncate
syn keyword gosh_replExtFunc sys-getcwd
syn keyword gosh_replExtFunc sys-getdomainname
syn keyword gosh_replExtFunc sys-getegid
syn keyword gosh_replExtFunc sys-getenv
syn keyword gosh_replExtFunc sys-geteuid
syn keyword gosh_replExtFunc sys-getgid
syn keyword gosh_replExtFunc sys-getgrgid
syn keyword gosh_replExtFunc sys-getgrnam
syn keyword gosh_replExtFunc sys-getgroups
syn keyword gosh_replExtFunc sys-gethostbyaddr
syn keyword gosh_replExtFunc sys-gethostbyname
syn keyword gosh_replExtFunc sys-gethostname
syn keyword gosh_replExtFunc sys-getloadavg
syn keyword gosh_replExtFunc sys-getlogin
syn keyword gosh_replExtFunc sys-getpgid
syn keyword gosh_replExtFunc sys-getpgrp
syn keyword gosh_replExtFunc sys-getpid
syn keyword gosh_replExtFunc sys-getppid
syn keyword gosh_replExtFunc sys-getprotobyname
syn keyword gosh_replExtFunc sys-getprotobynumber
syn keyword gosh_replExtFunc sys-getpwnam
syn keyword gosh_replExtFunc sys-getpwuid
syn keyword gosh_replExtFunc sys-getrlimit
syn keyword gosh_replExtFunc sys-getservbyname
syn keyword gosh_replExtFunc sys-getservbyport
syn keyword gosh_replExtFunc sys-gettimeofday
syn keyword gosh_replExtFunc sys-getuid
syn keyword gosh_replExtFunc sys-gid->group-name
syn keyword gosh_replExtFunc sys-glob
syn keyword gosh_replExtFunc sys-gmtime
syn keyword gosh_replExtFunc sys-group-name->gid
syn keyword gosh_replExtFunc sys-htonl
syn keyword gosh_replExtFunc sys-htons
syn keyword gosh_replExtFunc sys-isatty
syn keyword gosh_replExtFunc sys-kill
syn keyword gosh_replExtFunc sys-lchown
syn keyword gosh_replExtFunc sys-link
syn keyword gosh_replExtFunc sys-localeconv
syn keyword gosh_replExtFunc sys-localtime
syn keyword gosh_replExtFunc sys-logmask
syn keyword gosh_replExtFunc sys-lstat
syn keyword gosh_replExtFunc sys-mkdir
syn keyword gosh_replExtFunc sys-mkfifo
syn keyword gosh_replExtFunc sys-mkstemp
syn keyword gosh_replExtFunc sys-mktime
syn keyword gosh_replExtFunc sys-nanosleep
syn keyword gosh_replExtFunc sys-normalize-pathname
syn keyword gosh_replExtFunc sys-ntohl
syn keyword gosh_replExtFunc sys-ntohs
syn keyword gosh_replExtFunc sys-openlog
syn keyword gosh_replExtFunc sys-openpty
syn keyword gosh_replExtFunc sys-pause
syn keyword gosh_replExtFunc sys-pipe
syn keyword gosh_replExtFunc sys-putenv
syn keyword gosh_replExtFunc sys-random
syn keyword gosh_replExtFunc sys-readdir
syn keyword gosh_replExtFunc sys-readlink
syn keyword gosh_replExtFunc sys-realpath
syn keyword gosh_replExtFunc sys-remove
syn keyword gosh_replExtFunc sys-rename
syn keyword gosh_replExtFunc sys-rmdir
syn keyword gosh_replExtFunc sys-select
syn keyword gosh_replExtFunc sys-select!
syn keyword gosh_replExtFunc sys-setenv
syn keyword gosh_replExtFunc sys-setgid
syn keyword gosh_replExtFunc sys-setlocale
syn keyword gosh_replExtFunc sys-setlogmask
syn keyword gosh_replExtFunc sys-setpgid
syn keyword gosh_replExtFunc sys-setrlimit
syn keyword gosh_replExtFunc sys-setsid
syn keyword gosh_replExtFunc sys-setuid
syn keyword gosh_replExtFunc sys-sigmask
syn keyword gosh_replExtFunc sys-signal-name
syn keyword gosh_replExtFunc sys-sigset
syn keyword gosh_replExtFunc sys-sigset-add!
syn keyword gosh_replExtFunc sys-sigset-delete!
syn keyword gosh_replExtFunc sys-sigset-empty!
syn keyword gosh_replExtFunc sys-sigset-fill!
syn keyword gosh_replExtFunc sys-sigsuspend
syn keyword gosh_replExtFunc sys-sigwait
syn keyword gosh_replExtFunc sys-sleep
syn keyword gosh_replExtFunc sys-srandom
syn keyword gosh_replExtFunc sys-stat
syn keyword gosh_replExtFunc sys-stat->atime
syn keyword gosh_replExtFunc sys-stat->ctime
syn keyword gosh_replExtFunc sys-stat->dev
syn keyword gosh_replExtFunc sys-stat->file-type
syn keyword gosh_replExtFunc sys-stat->gid
syn keyword gosh_replExtFunc sys-stat->ino
syn keyword gosh_replExtFunc sys-stat->mode
syn keyword gosh_replExtFunc sys-stat->mtime
syn keyword gosh_replExtFunc sys-stat->nlink
syn keyword gosh_replExtFunc sys-stat->rdev
syn keyword gosh_replExtFunc sys-stat->size
syn keyword gosh_replExtFunc sys-stat->type
syn keyword gosh_replExtFunc sys-stat->uid
syn keyword gosh_replExtFunc sys-strerror
syn keyword gosh_replExtFunc sys-strftime
syn keyword gosh_replExtFunc sys-symlink
syn keyword gosh_replExtFunc sys-syslog
syn keyword gosh_replExtFunc sys-system
syn keyword gosh_replExtFunc sys-tcdrain
syn keyword gosh_replExtFunc sys-tcflow
syn keyword gosh_replExtFunc sys-tcflush
syn keyword gosh_replExtFunc sys-tcgetattr
syn keyword gosh_replExtFunc sys-tcgetpgrp
syn keyword gosh_replExtFunc sys-tcsendbreak
syn keyword gosh_replExtFunc sys-tcsetattr
syn keyword gosh_replExtFunc sys-tcsetpgrp
syn keyword gosh_replExtFunc sys-time
syn keyword gosh_replExtFunc sys-times
syn keyword gosh_replExtFunc sys-tm->alist
syn keyword gosh_replExtFunc sys-tmpdir
syn keyword gosh_replExtFunc sys-tmpnam
syn keyword gosh_replExtFunc sys-truncate
syn keyword gosh_replExtFunc sys-ttyname
syn keyword gosh_replExtFunc sys-uid->user-name
syn keyword gosh_replExtFunc sys-umask
syn keyword gosh_replExtFunc sys-uname
syn keyword gosh_replExtFunc sys-unlink
syn keyword gosh_replExtFunc sys-unsetenv
syn keyword gosh_replExtFunc sys-user-name->uid
syn keyword gosh_replExtFunc sys-utime
syn keyword gosh_replExtFunc sys-wait
syn keyword gosh_replExtFunc sys-wait-exit-status
syn keyword gosh_replExtFunc sys-wait-exited?
syn keyword gosh_replExtFunc sys-wait-signaled?
syn keyword gosh_replExtFunc sys-wait-stopped?
syn keyword gosh_replExtFunc sys-wait-stopsig
syn keyword gosh_replExtFunc sys-wait-termsig
syn keyword gosh_replExtFunc sys-waitpid
syn keyword gosh_replExtFunc system
syn keyword gosh_replExtFunc tab
syn keyword gosh_replExtFunc tabulate-array
syn keyword gosh_replExtFunc take
syn keyword gosh_replExtFunc take!
syn keyword gosh_replExtFunc take*
syn keyword gosh_replExtFunc take-after
syn keyword gosh_replExtFunc take-right
syn keyword gosh_replExtFunc take-right*
syn keyword gosh_replExtFunc take-until
syn keyword gosh_replExtFunc take-while
syn keyword gosh_replExtFunc take-while!
syn keyword gosh_replExtFunc tanh
syn keyword gosh_replExtFunc temporary-file-name
syn keyword gosh_replExtFunc tenth
syn keyword gosh_replExtFunc terminate-all!
syn keyword gosh_replExtFunc terminated-thread-exception?
syn keyword gosh_replExtFunc test
syn keyword gosh_replExtFunc test-check
syn keyword gosh_replExtFunc test-end
syn keyword gosh_replExtFunc test-error
syn keyword gosh_replExtFunc test-error?
syn keyword gosh_replExtFunc test-module
syn keyword gosh_replExtFunc test-record-file
syn keyword gosh_replExtFunc test-section
syn keyword gosh_replExtFunc test-start
syn keyword gosh_replExtFunc textdomain
syn keyword gosh_replExtFunc third
syn keyword gosh_replExtFunc thread-cont!
syn keyword gosh_replExtFunc thread-join!
syn keyword gosh_replExtFunc thread-name
syn keyword gosh_replExtFunc thread-sleep!
syn keyword gosh_replExtFunc thread-specific
syn keyword gosh_replExtFunc thread-specific-set!
syn keyword gosh_replExtFunc thread-start!
syn keyword gosh_replExtFunc thread-state
syn keyword gosh_replExtFunc thread-stop!
syn keyword gosh_replExtFunc thread-terminate!
syn keyword gosh_replExtFunc thread-yield!
syn keyword gosh_replExtFunc thread?
syn keyword gosh_replExtFunc time->seconds
syn keyword gosh_replExtFunc time-difference
syn keyword gosh_replExtFunc time-difference!
syn keyword gosh_replExtFunc time-monotonic->date
syn keyword gosh_replExtFunc time-monotonic->julian-day
syn keyword gosh_replExtFunc time-monotonic->modified-julian-day
syn keyword gosh_replExtFunc time-monotonic->time-tai
syn keyword gosh_replExtFunc time-monotonic->time-tai!
syn keyword gosh_replExtFunc time-monotonic->time-utc
syn keyword gosh_replExtFunc time-monotonic->time-utc!
syn keyword gosh_replExtFunc time-resolution
syn keyword gosh_replExtFunc time-tai->date
syn keyword gosh_replExtFunc time-tai->julian-day
syn keyword gosh_replExtFunc time-tai->modified-julian-day
syn keyword gosh_replExtFunc time-tai->time-monotonic
syn keyword gosh_replExtFunc time-tai->time-monotonic!
syn keyword gosh_replExtFunc time-tai->time-utc
syn keyword gosh_replExtFunc time-tai->time-utc!
syn keyword gosh_replExtFunc time-utc->date
syn keyword gosh_replExtFunc time-utc->julian-day
syn keyword gosh_replExtFunc time-utc->modified-julian-day
syn keyword gosh_replExtFunc time-utc->time-monotonic
syn keyword gosh_replExtFunc time-utc->time-monotonic!
syn keyword gosh_replExtFunc time-utc->time-tai
syn keyword gosh_replExtFunc time-utc->time-tai!
syn keyword gosh_replExtFunc time<=?
syn keyword gosh_replExtFunc time<?
syn keyword gosh_replExtFunc time=?
syn keyword gosh_replExtFunc time>=?
syn keyword gosh_replExtFunc time>?
syn keyword gosh_replExtFunc time?
syn keyword gosh_replExtFunc toplevel-closure?
syn keyword gosh_replExtFunc topological-sort
syn keyword gosh_replExtFunc touch-file
syn keyword gosh_replExtFunc touch-instance!
syn keyword gosh_replExtFunc tr
syn keyword gosh_replExtFunc transliterate
syn keyword gosh_replExtFunc tree->string
syn keyword gosh_replExtFunc tree-fold
syn keyword gosh_replExtFunc tree-fold-bf
syn keyword gosh_replExtFunc tree-map->alist
syn keyword gosh_replExtFunc tree-map-ceiling
syn keyword gosh_replExtFunc tree-map-ceiling-key
syn keyword gosh_replExtFunc tree-map-ceiling-value
syn keyword gosh_replExtFunc tree-map-clear!
syn keyword gosh_replExtFunc tree-map-copy
syn keyword gosh_replExtFunc tree-map-delete!
syn keyword gosh_replExtFunc tree-map-empty?
syn keyword gosh_replExtFunc tree-map-exists?
syn keyword gosh_replExtFunc tree-map-floor
syn keyword gosh_replExtFunc tree-map-floor-key
syn keyword gosh_replExtFunc tree-map-floor-value
syn keyword gosh_replExtFunc tree-map-fold
syn keyword gosh_replExtFunc tree-map-fold-right
syn keyword gosh_replExtFunc tree-map-for-each
syn keyword gosh_replExtFunc tree-map-get
syn keyword gosh_replExtFunc tree-map-keys
syn keyword gosh_replExtFunc tree-map-map
syn keyword gosh_replExtFunc tree-map-max
syn keyword gosh_replExtFunc tree-map-min
syn keyword gosh_replExtFunc tree-map-num-entries
syn keyword gosh_replExtFunc tree-map-pop!
syn keyword gosh_replExtFunc tree-map-pop-max!
syn keyword gosh_replExtFunc tree-map-pop-min!
syn keyword gosh_replExtFunc tree-map-predecessor
syn keyword gosh_replExtFunc tree-map-predecessor-key
syn keyword gosh_replExtFunc tree-map-predecessor-value
syn keyword gosh_replExtFunc tree-map-push!
syn keyword gosh_replExtFunc tree-map-put!
syn keyword gosh_replExtFunc tree-map-successor
syn keyword gosh_replExtFunc tree-map-successor-key
syn keyword gosh_replExtFunc tree-map-successor-value
syn keyword gosh_replExtFunc tree-map-update!
syn keyword gosh_replExtFunc tree-map-values
syn keyword gosh_replExtFunc tree-map?
syn keyword gosh_replExtFunc tree-walk
syn keyword gosh_replExtFunc tree-walk-bf
syn keyword gosh_replExtFunc trie
syn keyword gosh_replExtFunc trie->hash-table
syn keyword gosh_replExtFunc trie->list
syn keyword gosh_replExtFunc trie-common-prefix
syn keyword gosh_replExtFunc trie-common-prefix-fold
syn keyword gosh_replExtFunc trie-common-prefix-for-each
syn keyword gosh_replExtFunc trie-common-prefix-keys
syn keyword gosh_replExtFunc trie-common-prefix-map
syn keyword gosh_replExtFunc trie-common-prefix-values
syn keyword gosh_replExtFunc trie-delete!
syn keyword gosh_replExtFunc trie-exists?
syn keyword gosh_replExtFunc trie-fold
syn keyword gosh_replExtFunc trie-for-each
syn keyword gosh_replExtFunc trie-get
syn keyword gosh_replExtFunc trie-keys
syn keyword gosh_replExtFunc trie-map
syn keyword gosh_replExtFunc trie-num-entries
syn keyword gosh_replExtFunc trie-put!
syn keyword gosh_replExtFunc trie-update!
syn keyword gosh_replExtFunc trie-values
syn keyword gosh_replExtFunc trie-with-keys
syn keyword gosh_replExtFunc trie?
syn keyword gosh_replExtFunc truncate->exact
syn keyword gosh_replExtFunc u16vector
syn keyword gosh_replExtFunc u16vector->list
syn keyword gosh_replExtFunc u16vector->vector
syn keyword gosh_replExtFunc u16vector-add
syn keyword gosh_replExtFunc u16vector-add!
syn keyword gosh_replExtFunc u16vector-and
syn keyword gosh_replExtFunc u16vector-and!
syn keyword gosh_replExtFunc u16vector-clamp
syn keyword gosh_replExtFunc u16vector-clamp!
syn keyword gosh_replExtFunc u16vector-copy
syn keyword gosh_replExtFunc u16vector-copy!
syn keyword gosh_replExtFunc u16vector-dot
syn keyword gosh_replExtFunc u16vector-fill!
syn keyword gosh_replExtFunc u16vector-ior
syn keyword gosh_replExtFunc u16vector-ior!
syn keyword gosh_replExtFunc u16vector-length
syn keyword gosh_replExtFunc u16vector-mul
syn keyword gosh_replExtFunc u16vector-mul!
syn keyword gosh_replExtFunc u16vector-range-check
syn keyword gosh_replExtFunc u16vector-ref
syn keyword gosh_replExtFunc u16vector-set!
syn keyword gosh_replExtFunc u16vector-sub
syn keyword gosh_replExtFunc u16vector-sub!
syn keyword gosh_replExtFunc u16vector-swap-bytes
syn keyword gosh_replExtFunc u16vector-swap-bytes!
syn keyword gosh_replExtFunc u16vector-xor
syn keyword gosh_replExtFunc u16vector-xor!
syn keyword gosh_replExtFunc u16vector?
syn keyword gosh_replExtFunc u32vector
syn keyword gosh_replExtFunc u32vector->list
syn keyword gosh_replExtFunc u32vector->string
syn keyword gosh_replExtFunc u32vector->vector
syn keyword gosh_replExtFunc u32vector-add
syn keyword gosh_replExtFunc u32vector-add!
syn keyword gosh_replExtFunc u32vector-and
syn keyword gosh_replExtFunc u32vector-and!
syn keyword gosh_replExtFunc u32vector-clamp
syn keyword gosh_replExtFunc u32vector-clamp!
syn keyword gosh_replExtFunc u32vector-copy
syn keyword gosh_replExtFunc u32vector-copy!
syn keyword gosh_replExtFunc u32vector-dot
syn keyword gosh_replExtFunc u32vector-fill!
syn keyword gosh_replExtFunc u32vector-ior
syn keyword gosh_replExtFunc u32vector-ior!
syn keyword gosh_replExtFunc u32vector-length
syn keyword gosh_replExtFunc u32vector-mul
syn keyword gosh_replExtFunc u32vector-mul!
syn keyword gosh_replExtFunc u32vector-range-check
syn keyword gosh_replExtFunc u32vector-ref
syn keyword gosh_replExtFunc u32vector-set!
syn keyword gosh_replExtFunc u32vector-sub
syn keyword gosh_replExtFunc u32vector-sub!
syn keyword gosh_replExtFunc u32vector-swap-bytes
syn keyword gosh_replExtFunc u32vector-swap-bytes!
syn keyword gosh_replExtFunc u32vector-xor
syn keyword gosh_replExtFunc u32vector-xor!
syn keyword gosh_replExtFunc u32vector?
syn keyword gosh_replExtFunc u64vector
syn keyword gosh_replExtFunc u64vector->list
syn keyword gosh_replExtFunc u64vector->vector
syn keyword gosh_replExtFunc u64vector-add
syn keyword gosh_replExtFunc u64vector-add!
syn keyword gosh_replExtFunc u64vector-and
syn keyword gosh_replExtFunc u64vector-and!
syn keyword gosh_replExtFunc u64vector-clamp
syn keyword gosh_replExtFunc u64vector-clamp!
syn keyword gosh_replExtFunc u64vector-copy
syn keyword gosh_replExtFunc u64vector-copy!
syn keyword gosh_replExtFunc u64vector-dot
syn keyword gosh_replExtFunc u64vector-fill!
syn keyword gosh_replExtFunc u64vector-ior
syn keyword gosh_replExtFunc u64vector-ior!
syn keyword gosh_replExtFunc u64vector-length
syn keyword gosh_replExtFunc u64vector-mul
syn keyword gosh_replExtFunc u64vector-mul!
syn keyword gosh_replExtFunc u64vector-range-check
syn keyword gosh_replExtFunc u64vector-ref
syn keyword gosh_replExtFunc u64vector-set!
syn keyword gosh_replExtFunc u64vector-sub
syn keyword gosh_replExtFunc u64vector-sub!
syn keyword gosh_replExtFunc u64vector-swap-bytes
syn keyword gosh_replExtFunc u64vector-swap-bytes!
syn keyword gosh_replExtFunc u64vector-xor
syn keyword gosh_replExtFunc u64vector-xor!
syn keyword gosh_replExtFunc u64vector?
syn keyword gosh_replExtFunc u8vector
syn keyword gosh_replExtFunc u8vector->list
syn keyword gosh_replExtFunc u8vector->string
syn keyword gosh_replExtFunc u8vector->vector
syn keyword gosh_replExtFunc u8vector-add
syn keyword gosh_replExtFunc u8vector-add!
syn keyword gosh_replExtFunc u8vector-and
syn keyword gosh_replExtFunc u8vector-and!
syn keyword gosh_replExtFunc u8vector-clamp
syn keyword gosh_replExtFunc u8vector-clamp!
syn keyword gosh_replExtFunc u8vector-copy
syn keyword gosh_replExtFunc u8vector-copy!
syn keyword gosh_replExtFunc u8vector-dot
syn keyword gosh_replExtFunc u8vector-fill!
syn keyword gosh_replExtFunc u8vector-ior
syn keyword gosh_replExtFunc u8vector-ior!
syn keyword gosh_replExtFunc u8vector-length
syn keyword gosh_replExtFunc u8vector-mul
syn keyword gosh_replExtFunc u8vector-mul!
syn keyword gosh_replExtFunc u8vector-range-check
syn keyword gosh_replExtFunc u8vector-ref
syn keyword gosh_replExtFunc u8vector-set!
syn keyword gosh_replExtFunc u8vector-sub
syn keyword gosh_replExtFunc u8vector-sub!
syn keyword gosh_replExtFunc u8vector-xor
syn keyword gosh_replExtFunc u8vector-xor!
syn keyword gosh_replExtFunc u8vector?
syn keyword gosh_replExtFunc ucs->char
syn keyword gosh_replExtFunc ucs-range->char-set
syn keyword gosh_replExtFunc ucs-range->char-set!
syn keyword gosh_replExtFunc ucscode->char
syn keyword gosh_replExtFunc uncaught-exception-reason
syn keyword gosh_replExtFunc uncaught-exception?
syn keyword gosh_replExtFunc undefined
syn keyword gosh_replExtFunc undefined?
syn keyword gosh_replExtFunc unfold
syn keyword gosh_replExtFunc unfold-right
syn keyword gosh_replExtFunc unpack
syn keyword gosh_replExtFunc unpack-skip
syn keyword gosh_replExtFunc unwrap-syntax
syn keyword gosh_replExtFunc unzip1
syn keyword gosh_replExtFunc unzip2
syn keyword gosh_replExtFunc unzip3
syn keyword gosh_replExtFunc unzip4
syn keyword gosh_replExtFunc unzip5
syn keyword gosh_replExtFunc upper
syn keyword gosh_replExtFunc uri-compose
syn keyword gosh_replExtFunc uri-decode
syn keyword gosh_replExtFunc uri-decode-string
syn keyword gosh_replExtFunc uri-decompose-authority
syn keyword gosh_replExtFunc uri-decompose-hierarchical
syn keyword gosh_replExtFunc uri-encode
syn keyword gosh_replExtFunc uri-encode-string
syn keyword gosh_replExtFunc uri-parse
syn keyword gosh_replExtFunc uri-gosh_repl&specific
syn keyword gosh_replExtFunc uvector-alias
syn keyword gosh_replExtFunc uvector-immutable?
syn keyword gosh_replExtFunc uvector-length
syn keyword gosh_replExtFunc uvector-size
syn keyword gosh_replExtFunc uvector-swap-bytes
syn keyword gosh_replExtFunc uvector-swap-bytes!
syn keyword gosh_replExtFunc vector->f16vector
syn keyword gosh_replExtFunc vector->f32vector
syn keyword gosh_replExtFunc vector->f64vector
syn keyword gosh_replExtFunc vector->posix-tm
syn keyword gosh_replExtFunc vector->s16vector
syn keyword gosh_replExtFunc vector->s32vector
syn keyword gosh_replExtFunc vector->s64vector
syn keyword gosh_replExtFunc vector->s8vector
syn keyword gosh_replExtFunc vector->u16vector
syn keyword gosh_replExtFunc vector->u32vector
syn keyword gosh_replExtFunc vector->u64vector
syn keyword gosh_replExtFunc vector->u8vector
syn keyword gosh_replExtFunc vector-any
syn keyword gosh_replExtFunc vector-append
syn keyword gosh_replExtFunc vector-binary-search
syn keyword gosh_replExtFunc vector-concatenate
syn keyword gosh_replExtFunc vector-copy
syn keyword gosh_replExtFunc vector-copy!
syn keyword gosh_replExtFunc vector-count
syn keyword gosh_replExtFunc vector-empty?
syn keyword gosh_replExtFunc vector-every
syn keyword gosh_replExtFunc vector-fold
syn keyword gosh_replExtFunc vector-fold-right
syn keyword gosh_replExtFunc vector-for-each
syn keyword gosh_replExtFunc vector-index
syn keyword gosh_replExtFunc vector-index-right
syn keyword gosh_replExtFunc vector-map
syn keyword gosh_replExtFunc vector-map!
syn keyword gosh_replExtFunc vector-reverse!
syn keyword gosh_replExtFunc vector-reverse-copy
syn keyword gosh_replExtFunc vector-reverse-copy!
syn keyword gosh_replExtFunc vector-skip
syn keyword gosh_replExtFunc vector-skip-right
syn keyword gosh_replExtFunc vector-swap!
syn keyword gosh_replExtFunc vector-unfold
syn keyword gosh_replExtFunc vector-unfold-right
syn keyword gosh_replExtFunc vector=
syn keyword gosh_replExtFunc version
syn keyword gosh_replExtFunc version-compare
syn keyword gosh_replExtFunc version<=?
syn keyword gosh_replExtFunc version<?
syn keyword gosh_replExtFunc version=?
syn keyword gosh_replExtFunc version>=?
syn keyword gosh_replExtFunc version>?
syn keyword gosh_replExtFunc vm-build-insn
syn keyword gosh_replExtFunc vm-dump
syn keyword gosh_replExtFunc vm-find-insn-info
syn keyword gosh_replExtFunc vm-get-stack-trace
syn keyword gosh_replExtFunc vm-get-stack-trace-lite
syn keyword gosh_replExtFunc vm-set-default-exception-handler
syn keyword gosh_replExtFunc wait-all
syn keyword gosh_replExtFunc warn
syn keyword gosh_replExtFunc weak-vector-length
syn keyword gosh_replExtFunc weak-vector-ref
syn keyword gosh_replExtFunc weak-vector-set!
syn keyword gosh_replExtFunc with-error-handler
syn keyword gosh_replExtFunc with-error-to-port
syn keyword gosh_replExtFunc with-exception-handler
syn keyword gosh_replExtFunc with-input-conversion
syn keyword gosh_replExtFunc with-input-from-port
syn keyword gosh_replExtFunc with-input-from-process
syn keyword gosh_replExtFunc with-input-from-string
syn keyword gosh_replExtFunc with-locking-mutex
syn keyword gosh_replExtFunc with-output-conversion
syn keyword gosh_replExtFunc with-output-to-port
syn keyword gosh_replExtFunc with-output-to-process
syn keyword gosh_replExtFunc with-output-to-string
syn keyword gosh_replExtFunc with-port-locking
syn keyword gosh_replExtFunc with-ports
syn keyword gosh_replExtFunc with-string-io
syn keyword gosh_replExtFunc without-echoing
syn keyword gosh_replExtFunc wrap-with-input-conversion
syn keyword gosh_replExtFunc wrap-with-output-conversion
syn keyword gosh_replExtFunc write*
syn keyword gosh_replExtFunc write-ber-integer
syn keyword gosh_replExtFunc write-binary-double
syn keyword gosh_replExtFunc write-binary-float
syn keyword gosh_replExtFunc write-binary-long
syn keyword gosh_replExtFunc write-binary-short
syn keyword gosh_replExtFunc write-binary-sint
syn keyword gosh_replExtFunc write-binary-sint16
syn keyword gosh_replExtFunc write-binary-sint32
syn keyword gosh_replExtFunc write-binary-sint64
syn keyword gosh_replExtFunc write-binary-sint8
syn keyword gosh_replExtFunc write-binary-uint
syn keyword gosh_replExtFunc write-binary-uint16
syn keyword gosh_replExtFunc write-binary-uint32
syn keyword gosh_replExtFunc write-binary-uint64
syn keyword gosh_replExtFunc write-binary-uint8
syn keyword gosh_replExtFunc write-binary-ulong
syn keyword gosh_replExtFunc write-binary-ushort
syn keyword gosh_replExtFunc write-block
syn keyword gosh_replExtFunc write-byte
syn keyword gosh_replExtFunc write-f16
syn keyword gosh_replExtFunc write-f32
syn keyword gosh_replExtFunc write-f64
syn keyword gosh_replExtFunc write-limited
syn keyword gosh_replExtFunc write-s16
syn keyword gosh_replExtFunc write-s32
syn keyword gosh_replExtFunc write-s64
syn keyword gosh_replExtFunc write-s8
syn keyword gosh_replExtFunc write-sint
syn keyword gosh_replExtFunc write-stream
syn keyword gosh_replExtFunc write-to-string
syn keyword gosh_replExtFunc write-u16
syn keyword gosh_replExtFunc write-u32
syn keyword gosh_replExtFunc write-u64
syn keyword gosh_replExtFunc write-u8
syn keyword gosh_replExtFunc write-uint
syn keyword gosh_replExtFunc write-with-shared-structure
syn keyword gosh_replExtFunc write/ss
syn keyword gosh_replExtFunc xcons
syn keyword gosh_replExtFunc xml-token-head
syn keyword gosh_replExtFunc xml-token-kind
syn keyword gosh_replExtFunc xml-token?
syn keyword gosh_replExtFunc xsubstring
syn keyword gosh_replExtFunc zip
syn keyword gosh_replExtFunc zlib-version
syn keyword gosh_replExtFunc zstream-adler32
syn keyword gosh_replExtFunc zstream-data-type
syn keyword gosh_replExtFunc zstream-dictionary-adler32
syn keyword gosh_replExtFunc zstream-params-set!
syn keyword gosh_replExtFunc zstream-total-in
syn keyword gosh_replExtFunc zstream-total-out
syn keyword gosh_replExtFunc ~


" method
syn keyword gosh_replExtFunc add-hook!
syn keyword gosh_replExtFunc add-method!
syn keyword gosh_replExtFunc allocate-instance
syn keyword gosh_replExtFunc apply-generic
syn keyword gosh_replExtFunc apply-method
syn keyword gosh_replExtFunc apply-methods
syn keyword gosh_replExtFunc array-add-elements!
syn keyword gosh_replExtFunc array-div-elements!
syn keyword gosh_replExtFunc array-map
syn keyword gosh_replExtFunc array-map!
syn keyword gosh_replExtFunc array-mul-elements!
syn keyword gosh_replExtFunc array-ref
syn keyword gosh_replExtFunc array-retabulate!
syn keyword gosh_replExtFunc array-set!
syn keyword gosh_replExtFunc array-sub-elements!
syn keyword gosh_replExtFunc call-with-builder
syn keyword gosh_replExtFunc call-with-iterator
syn keyword gosh_replExtFunc cgen-c-name
syn keyword gosh_replExtFunc cgen-cexpr
syn keyword gosh_replExtFunc cgen-emit
syn keyword gosh_replExtFunc cgen-emit-body
syn keyword gosh_replExtFunc cgen-emit-c
syn keyword gosh_replExtFunc cgen-emit-decl
syn keyword gosh_replExtFunc cgen-emit-h
syn keyword gosh_replExtFunc cgen-emit-init
syn keyword gosh_replExtFunc cgen-emit-static-data
syn keyword gosh_replExtFunc cgen-emit-xtrn
syn keyword gosh_replExtFunc cgen-literal-static?
syn keyword gosh_replExtFunc cgen-make-literal
syn keyword gosh_replExtFunc cgen-unit-c-file
syn keyword gosh_replExtFunc cgen-unit-h-file
syn keyword gosh_replExtFunc cgen-unit-init-name
syn keyword gosh_replExtFunc cgen-unit-toplevel-nodes
syn keyword gosh_replExtFunc change-class
syn keyword gosh_replExtFunc class-redefinition
syn keyword gosh_replExtFunc coerce-to
syn keyword gosh_replExtFunc compute-applicable-methods
syn keyword gosh_replExtFunc compute-cpl
syn keyword gosh_replExtFunc compute-get-n-set
syn keyword gosh_replExtFunc compute-slot-accessor
syn keyword gosh_replExtFunc compute-slots
syn keyword gosh_replExtFunc copy-queue
syn keyword gosh_replExtFunc d
syn keyword gosh_replExtFunc date-day
syn keyword gosh_replExtFunc date-hour
syn keyword gosh_replExtFunc date-minute
syn keyword gosh_replExtFunc date-month
syn keyword gosh_replExtFunc date-nanosecond
syn keyword gosh_replExtFunc date-second
syn keyword gosh_replExtFunc date-year
syn keyword gosh_replExtFunc date-zone-offset
syn keyword gosh_replExtFunc dbi-close
syn keyword gosh_replExtFunc dbi-do
syn keyword gosh_replExtFunc dbi-escape-sql
syn keyword gosh_replExtFunc dbi-execute
syn keyword gosh_replExtFunc dbi-execute-query
syn keyword gosh_replExtFunc dbi-execute-using-connection
syn keyword gosh_replExtFunc dbi-get-value
syn keyword gosh_replExtFunc dbi-make-connection
syn keyword gosh_replExtFunc dbi-make-query
syn keyword gosh_replExtFunc dbi-open?
syn keyword gosh_replExtFunc dbi-prepare
syn keyword gosh_replExtFunc dbm-close
syn keyword gosh_replExtFunc dbm-closed?
syn keyword gosh_replExtFunc dbm-db-copy
syn keyword gosh_replExtFunc dbm-db-exists?
syn keyword gosh_replExtFunc dbm-db-move
syn keyword gosh_replExtFunc dbm-db-remove
syn keyword gosh_replExtFunc dbm-db-rename
syn keyword gosh_replExtFunc dbm-delete!
syn keyword gosh_replExtFunc dbm-exists?
syn keyword gosh_replExtFunc dbm-fold
syn keyword gosh_replExtFunc dbm-for-each
syn keyword gosh_replExtFunc dbm-get
syn keyword gosh_replExtFunc dbm-map
syn keyword gosh_replExtFunc dbm-open
syn keyword gosh_replExtFunc dbm-put!
syn keyword gosh_replExtFunc delete-hook!
syn keyword gosh_replExtFunc delete-method!
syn keyword gosh_replExtFunc describe
syn keyword gosh_replExtFunc dict-delete!
syn keyword gosh_replExtFunc dict-exists?
syn keyword gosh_replExtFunc dict-fold
syn keyword gosh_replExtFunc dict-fold-right
syn keyword gosh_replExtFunc dict-for-each
syn keyword gosh_replExtFunc dict-get
syn keyword gosh_replExtFunc dict-keys
syn keyword gosh_replExtFunc dict-map
syn keyword gosh_replExtFunc dict-put!
syn keyword gosh_replExtFunc dict-values
syn keyword gosh_replExtFunc digest
syn keyword gosh_replExtFunc digest-final!
syn keyword gosh_replExtFunc digest-string
syn keyword gosh_replExtFunc digest-update!
syn keyword gosh_replExtFunc direction-of
syn keyword gosh_replExtFunc file-atime<=?
syn keyword gosh_replExtFunc file-atime<?
syn keyword gosh_replExtFunc file-atime=?
syn keyword gosh_replExtFunc file-atime>=?
syn keyword gosh_replExtFunc file-atime>?
syn keyword gosh_replExtFunc file-ctime<=?
syn keyword gosh_replExtFunc file-ctime<?
syn keyword gosh_replExtFunc file-ctime=?
syn keyword gosh_replExtFunc file-ctime>=?
syn keyword gosh_replExtFunc file-ctime>?
syn keyword gosh_replExtFunc file-mtime<=?
syn keyword gosh_replExtFunc file-mtime<?
syn keyword gosh_replExtFunc file-mtime=?
syn keyword gosh_replExtFunc file-mtime>=?
syn keyword gosh_replExtFunc file-mtime>?
syn keyword gosh_replExtFunc filter-to
syn keyword gosh_replExtFunc find
syn keyword gosh_replExtFunc find-index
syn keyword gosh_replExtFunc find-max
syn keyword gosh_replExtFunc find-min
syn keyword gosh_replExtFunc find-min&max
syn keyword gosh_replExtFunc find-with-index
syn keyword gosh_replExtFunc fold
syn keyword gosh_replExtFunc fold$
syn keyword gosh_replExtFunc fold-right
syn keyword gosh_replExtFunc fold-with-index
syn keyword gosh_replExtFunc fold2
syn keyword gosh_replExtFunc fold2$
syn keyword gosh_replExtFunc fold3
syn keyword gosh_replExtFunc fold3$
syn keyword gosh_replExtFunc for-each-with-index
syn keyword gosh_replExtFunc ftp-passive?
syn keyword gosh_replExtFunc ftp-transfer-type
syn keyword gosh_replExtFunc gdbm-file-of
syn keyword gosh_replExtFunc get-serializable-slots
syn keyword gosh_replExtFunc group-collection
syn keyword gosh_replExtFunc group-sequence
syn keyword gosh_replExtFunc hmac-final!
syn keyword gosh_replExtFunc hmac-update!
syn keyword gosh_replExtFunc hook->list
syn keyword gosh_replExtFunc hook-empty?
syn keyword gosh_replExtFunc info-get-node
syn keyword gosh_replExtFunc info-parse-menu
syn keyword gosh_replExtFunc initialize
syn keyword gosh_replExtFunc instance-of
syn keyword gosh_replExtFunc instance-pool->list
syn keyword gosh_replExtFunc instance-pool-find
syn keyword gosh_replExtFunc instance-pool-fold
syn keyword gosh_replExtFunc instance-pool-for-each
syn keyword gosh_replExtFunc instance-pool-map
syn keyword gosh_replExtFunc instance-pool-of
syn keyword gosh_replExtFunc instance-pool-remove!
syn keyword gosh_replExtFunc instance-pool:->list
syn keyword gosh_replExtFunc instance-pool:add
syn keyword gosh_replExtFunc instance-pool:compute-pools
syn keyword gosh_replExtFunc instance-pool:create-pool
syn keyword gosh_replExtFunc instance-pool:find
syn keyword gosh_replExtFunc instance-pool:fold
syn keyword gosh_replExtFunc instance-pool:for-each
syn keyword gosh_replExtFunc instance-pool:map
syn keyword gosh_replExtFunc instance-pool:remove!
syn keyword gosh_replExtFunc instance-pools-of
syn keyword gosh_replExtFunc lazy-size-of
syn keyword gosh_replExtFunc listener-read-handler
syn keyword gosh_replExtFunc listener-show-prompt
syn keyword gosh_replExtFunc log-format
syn keyword gosh_replExtFunc make
syn keyword gosh_replExtFunc map-accum
syn keyword gosh_replExtFunc map-to
syn keyword gosh_replExtFunc map-to-with-index
syn keyword gosh_replExtFunc map-with-index
syn keyword gosh_replExtFunc method-more-specific?
syn keyword gosh_replExtFunc modifier
syn keyword gosh_replExtFunc object-*
syn keyword gosh_replExtFunc object-+
syn keyword gosh_replExtFunc object--
syn keyword gosh_replExtFunc object-/
syn keyword gosh_replExtFunc object-apply
syn keyword gosh_replExtFunc object-compare
syn keyword gosh_replExtFunc object-equal?
syn keyword gosh_replExtFunc object-hash
syn keyword gosh_replExtFunc object-isomorphic?
syn keyword gosh_replExtFunc option-names
syn keyword gosh_replExtFunc option-optional-arg?
syn keyword gosh_replExtFunc option-processor
syn keyword gosh_replExtFunc option-required-arg?
syn keyword gosh_replExtFunc parameter-observer-add!
syn keyword gosh_replExtFunc parameter-observer-delete!
syn keyword gosh_replExtFunc parameter-post-observers
syn keyword gosh_replExtFunc parameter-pre-observers
syn keyword gosh_replExtFunc partition-to
syn keyword gosh_replExtFunc permute
syn keyword gosh_replExtFunc permute!
syn keyword gosh_replExtFunc permute-to
syn keyword gosh_replExtFunc port-of
syn keyword gosh_replExtFunc process-command
syn keyword gosh_replExtFunc process-exit-status
syn keyword gosh_replExtFunc process-pid
syn keyword gosh_replExtFunc pseudo-rtd
syn keyword gosh_replExtFunc read-from-file-with-serializer
syn keyword gosh_replExtFunc read-from-serializer
syn keyword gosh_replExtFunc read-from-string-with-serializer
syn keyword gosh_replExtFunc ref
syn keyword gosh_replExtFunc referencer
syn keyword gosh_replExtFunc relation-accessor
syn keyword gosh_replExtFunc relation-coercer
syn keyword gosh_replExtFunc relation-column-getter
syn keyword gosh_replExtFunc relation-column-getters
syn keyword gosh_replExtFunc relation-column-name?
syn keyword gosh_replExtFunc relation-column-names
syn keyword gosh_replExtFunc relation-column-setter
syn keyword gosh_replExtFunc relation-column-setters
syn keyword gosh_replExtFunc relation-deletable?
syn keyword gosh_replExtFunc relation-delete!
syn keyword gosh_replExtFunc relation-fold
syn keyword gosh_replExtFunc relation-insert!
syn keyword gosh_replExtFunc relation-insertable?
syn keyword gosh_replExtFunc relation-modifier
syn keyword gosh_replExtFunc relation-ref
syn keyword gosh_replExtFunc relation-rows
syn keyword gosh_replExtFunc relation-set!
syn keyword gosh_replExtFunc remove-hook!
syn keyword gosh_replExtFunc remove-to
syn keyword gosh_replExtFunc reset-hook!
syn keyword gosh_replExtFunc rtd-accessor
syn keyword gosh_replExtFunc rtd-constructor
syn keyword gosh_replExtFunc rtd-mutator
syn keyword gosh_replExtFunc rtd-predicate
syn keyword gosh_replExtFunc run-hook
syn keyword gosh_replExtFunc selector-add!
syn keyword gosh_replExtFunc selector-delete!
syn keyword gosh_replExtFunc selector-select
syn keyword gosh_replExtFunc set-time-nanosecond!
syn keyword gosh_replExtFunc set-time-second!
syn keyword gosh_replExtFunc set-time-type!
syn keyword gosh_replExtFunc shape-valid-index?
syn keyword gosh_replExtFunc shuffle
syn keyword gosh_replExtFunc shuffle!
syn keyword gosh_replExtFunc shuffle-to
syn keyword gosh_replExtFunc size-of
syn keyword gosh_replExtFunc slot-bound-using-class?
syn keyword gosh_replExtFunc slot-exists-using-class?
syn keyword gosh_replExtFunc slot-missing
syn keyword gosh_replExtFunc slot-ref-using-class
syn keyword gosh_replExtFunc slot-set-using-class!
syn keyword gosh_replExtFunc slot-unbound
syn keyword gosh_replExtFunc sockaddr-addr
syn keyword gosh_replExtFunc sockaddr-family
syn keyword gosh_replExtFunc sockaddr-name
syn keyword gosh_replExtFunc sockaddr-port
syn keyword gosh_replExtFunc sort-applicable-methods
syn keyword gosh_replExtFunc subseq
syn keyword gosh_replExtFunc time-counter-get-current-time
syn keyword gosh_replExtFunc time-counter-get-delta
syn keyword gosh_replExtFunc time-counter-reset!
syn keyword gosh_replExtFunc time-counter-start!
syn keyword gosh_replExtFunc time-counter-stop!
syn keyword gosh_replExtFunc time-counter-value
syn keyword gosh_replExtFunc time-nanosecond
syn keyword gosh_replExtFunc time-second
syn keyword gosh_replExtFunc time-type
syn keyword gosh_replExtFunc update-direct-method!
syn keyword gosh_replExtFunc update-direct-subclass!
syn keyword gosh_replExtFunc write-gauche-package-description
syn keyword gosh_replExtFunc write-object
syn keyword gosh_replExtFunc write-to-file-with-serializer
syn keyword gosh_replExtFunc write-to-serializer
syn keyword gosh_replExtFunc write-to-string-with-serializer
syn keyword gosh_replExtFunc write-tree
syn keyword gosh_replExtFunc x->integer
syn keyword gosh_replExtFunc x->number
syn keyword gosh_replExtFunc x->string


" class
syn keyword gosh_replExtFunc &condition
syn keyword gosh_replExtFunc &error
syn keyword gosh_replExtFunc &i/o-closed-error
syn keyword gosh_replExtFunc &i/o-error
syn keyword gosh_replExtFunc &i/o-port-error
syn keyword gosh_replExtFunc &i/o-read-error
syn keyword gosh_replExtFunc &i/o-write-error
syn keyword gosh_replExtFunc &message
syn keyword gosh_replExtFunc &read-error
syn keyword gosh_replExtFunc &serious
syn keyword gosh_replExtFunc <abandoned-mutex-exception-meta>
syn keyword gosh_replExtFunc <abandoned-mutex-exception>
syn keyword gosh_replExtFunc <accessor-method>
syn keyword gosh_replExtFunc <arity-at-least>
syn keyword gosh_replExtFunc <array-meta>
syn keyword gosh_replExtFunc <array>
syn keyword gosh_replExtFunc <autoload-meta>
syn keyword gosh_replExtFunc <autoload>
syn keyword gosh_replExtFunc <bimap>
syn keyword gosh_replExtFunc <boolean-meta>
syn keyword gosh_replExtFunc <boolean>
syn keyword gosh_replExtFunc <buffered-input-port>
syn keyword gosh_replExtFunc <buffered-output-port>
syn keyword gosh_replExtFunc <cgen-literal>
syn keyword gosh_replExtFunc <cgen-node>
syn keyword gosh_replExtFunc <cgen-stub-error>
syn keyword gosh_replExtFunc <cgen-stub-unit>
syn keyword gosh_replExtFunc <cgen-type>
syn keyword gosh_replExtFunc <cgen-unit>
syn keyword gosh_replExtFunc <cgi-content-type-error>
syn keyword gosh_replExtFunc <cgi-error>
syn keyword gosh_replExtFunc <cgi-request-method-error>
syn keyword gosh_replExtFunc <cgi-request-size-error>
syn keyword gosh_replExtFunc <char-meta>
syn keyword gosh_replExtFunc <char-set-meta>
syn keyword gosh_replExtFunc <char-set>
syn keyword gosh_replExtFunc <char>
syn keyword gosh_replExtFunc <class>
syn keyword gosh_replExtFunc <coding-aware-port>
syn keyword gosh_replExtFunc <collection>
syn keyword gosh_replExtFunc <compiled-code>
syn keyword gosh_replExtFunc <complex-meta>
syn keyword gosh_replExtFunc <complex>
syn keyword gosh_replExtFunc <compound-condition>
syn keyword gosh_replExtFunc <condition-meta>
syn keyword gosh_replExtFunc <condition>
syn keyword gosh_replExtFunc <csv>
syn keyword gosh_replExtFunc <date>
syn keyword gosh_replExtFunc <dbi-connection>
syn keyword gosh_replExtFunc <dbi-driver>
syn keyword gosh_replExtFunc <dbi-error>
syn keyword gosh_replExtFunc <dbi-exception>
syn keyword gosh_replExtFunc <dbi-nonexistent-driver-error>
syn keyword gosh_replExtFunc <dbi-parameter-error>
syn keyword gosh_replExtFunc <dbi-query>
syn keyword gosh_replExtFunc <dbi-result-set>
syn keyword gosh_replExtFunc <dbi-unsupported-error>
syn keyword gosh_replExtFunc <dbm-meta>
syn keyword gosh_replExtFunc <dbm>
syn keyword gosh_replExtFunc <deflating-port>
syn keyword gosh_replExtFunc <dictionary>
syn keyword gosh_replExtFunc <eof-object>
syn keyword gosh_replExtFunc <error>
syn keyword gosh_replExtFunc <exception>
syn keyword gosh_replExtFunc <f16array>
syn keyword gosh_replExtFunc <f16vector-meta>
syn keyword gosh_replExtFunc <f16vector>
syn keyword gosh_replExtFunc <f32array>
syn keyword gosh_replExtFunc <f32vector-meta>
syn keyword gosh_replExtFunc <f32vector>
syn keyword gosh_replExtFunc <f64array>
syn keyword gosh_replExtFunc <f64vector-meta>
syn keyword gosh_replExtFunc <f64vector>
syn keyword gosh_replExtFunc <foreign-pointer>
syn keyword gosh_replExtFunc <fsdbm>
syn keyword gosh_replExtFunc <ftp-connection>
syn keyword gosh_replExtFunc <ftp-error>
syn keyword gosh_replExtFunc <gauche-package-description>
syn keyword gosh_replExtFunc <gdbm>
syn keyword gosh_replExtFunc <generic>
syn keyword gosh_replExtFunc <gloc-meta>
syn keyword gosh_replExtFunc <gloc>
syn keyword gosh_replExtFunc <hash-table-meta>
syn keyword gosh_replExtFunc <hash-table>
syn keyword gosh_replExtFunc <hmac>
syn keyword gosh_replExtFunc <hook>
syn keyword gosh_replExtFunc <http-error>
syn keyword gosh_replExtFunc <identifier>
syn keyword gosh_replExtFunc <inflating-port>
syn keyword gosh_replExtFunc <info-file>
syn keyword gosh_replExtFunc <info-node>
syn keyword gosh_replExtFunc <instance-pool-meta>
syn keyword gosh_replExtFunc <instance-pool-mixin>
syn keyword gosh_replExtFunc <integer-meta>
syn keyword gosh_replExtFunc <integer>
syn keyword gosh_replExtFunc <io-closed-error>
syn keyword gosh_replExtFunc <io-error>
syn keyword gosh_replExtFunc <io-read-error>
syn keyword gosh_replExtFunc <io-unit-error>
syn keyword gosh_replExtFunc <io-write-error>
syn keyword gosh_replExtFunc <join-timeout-exception-meta>
syn keyword gosh_replExtFunc <join-timeout-exception>
syn keyword gosh_replExtFunc <json-construct-error>
syn keyword gosh_replExtFunc <json-parse-error>
syn keyword gosh_replExtFunc <keyword-meta>
syn keyword gosh_replExtFunc <keyword>
syn keyword gosh_replExtFunc <list-meta>
syn keyword gosh_replExtFunc <list>
syn keyword gosh_replExtFunc <listener>
syn keyword gosh_replExtFunc <log-drain>
syn keyword gosh_replExtFunc <macro-meta>
syn keyword gosh_replExtFunc <macro>
syn keyword gosh_replExtFunc <md5>
syn keyword gosh_replExtFunc <mersenne-twister>
syn keyword gosh_replExtFunc <message-condition>
syn keyword gosh_replExtFunc <message-digest-algorithm-meta>
syn keyword gosh_replExtFunc <message-digest-algorithm>
syn keyword gosh_replExtFunc <method>
syn keyword gosh_replExtFunc <mime-part>
syn keyword gosh_replExtFunc <module-meta>
syn keyword gosh_replExtFunc <module>
syn keyword gosh_replExtFunc <mtqueue>
syn keyword gosh_replExtFunc <next-method>
syn keyword gosh_replExtFunc <null-meta>
syn keyword gosh_replExtFunc <null>
syn keyword gosh_replExtFunc <number-meta>
syn keyword gosh_replExtFunc <number>
syn keyword gosh_replExtFunc <object-set-relation>
syn keyword gosh_replExtFunc <object>
syn keyword gosh_replExtFunc <ordered-dictionary>
syn keyword gosh_replExtFunc <pair-meta>
syn keyword gosh_replExtFunc <pair>
syn keyword gosh_replExtFunc <parameter>
syn keyword gosh_replExtFunc <parse-error>
syn keyword gosh_replExtFunc <parseopt-error>
syn keyword gosh_replExtFunc <port-error>
syn keyword gosh_replExtFunc <port>
syn keyword gosh_replExtFunc <procedure>
syn keyword gosh_replExtFunc <process-abnormal-exit>
syn keyword gosh_replExtFunc <process-time-counter>
syn keyword gosh_replExtFunc <process>
syn keyword gosh_replExtFunc <promise-meta>
syn keyword gosh_replExtFunc <promise>
syn keyword gosh_replExtFunc <propagate-meta>
syn keyword gosh_replExtFunc <propagate-mixin>
syn keyword gosh_replExtFunc <pseudo-record-meta>
syn keyword gosh_replExtFunc <queue>
syn keyword gosh_replExtFunc <rational-meta>
syn keyword gosh_replExtFunc <rational>
syn keyword gosh_replExtFunc <rbtree>
syn keyword gosh_replExtFunc <read-context>
syn keyword gosh_replExtFunc <read-error>
syn keyword gosh_replExtFunc <read-reference>
syn keyword gosh_replExtFunc <real-meta>
syn keyword gosh_replExtFunc <real-time-counter>
syn keyword gosh_replExtFunc <real>
syn keyword gosh_replExtFunc <record-meta>
syn keyword gosh_replExtFunc <record>
syn keyword gosh_replExtFunc <regexp-invalid-ast>
syn keyword gosh_replExtFunc <regexp-meta>
syn keyword gosh_replExtFunc <regexp>
syn keyword gosh_replExtFunc <regmatch-meta>
syn keyword gosh_replExtFunc <regmatch>
syn keyword gosh_replExtFunc <relation>
syn keyword gosh_replExtFunc <rfc822-parse-error>
syn keyword gosh_replExtFunc <s16array>
syn keyword gosh_replExtFunc <s16vector-meta>
syn keyword gosh_replExtFunc <s16vector>
syn keyword gosh_replExtFunc <s32array>
syn keyword gosh_replExtFunc <s32vector-meta>
syn keyword gosh_replExtFunc <s32vector>
syn keyword gosh_replExtFunc <s64array>
syn keyword gosh_replExtFunc <s64vector-meta>
syn keyword gosh_replExtFunc <s64vector>
syn keyword gosh_replExtFunc <s8array>
syn keyword gosh_replExtFunc <s8vector-meta>
syn keyword gosh_replExtFunc <s8vector>
syn keyword gosh_replExtFunc <selector>
syn keyword gosh_replExtFunc <sequence>
syn keyword gosh_replExtFunc <serializer>
syn keyword gosh_replExtFunc <serious-compound-condition>
syn keyword gosh_replExtFunc <serious-condition>
syn keyword gosh_replExtFunc <sha1>
syn keyword gosh_replExtFunc <sha224>
syn keyword gosh_replExtFunc <sha256>
syn keyword gosh_replExtFunc <sha384>
syn keyword gosh_replExtFunc <sha512>
syn keyword gosh_replExtFunc <simple-relation>
syn keyword gosh_replExtFunc <singleton-meta>
syn keyword gosh_replExtFunc <singleton-mixin>
syn keyword gosh_replExtFunc <slot-accessor>
syn keyword gosh_replExtFunc <sockaddr-in>
syn keyword gosh_replExtFunc <sockaddr-un>
syn keyword gosh_replExtFunc <sockaddr>
syn keyword gosh_replExtFunc <socket>
syn keyword gosh_replExtFunc <sparse-f16vector>
syn keyword gosh_replExtFunc <sparse-f32vector>
syn keyword gosh_replExtFunc <sparse-f64vector>
syn keyword gosh_replExtFunc <sparse-s16vector>
syn keyword gosh_replExtFunc <sparse-s32vector>
syn keyword gosh_replExtFunc <sparse-s64vector>
syn keyword gosh_replExtFunc <sparse-s8vector>
syn keyword gosh_replExtFunc <sparse-table>
syn keyword gosh_replExtFunc <sparse-u16vector>
syn keyword gosh_replExtFunc <sparse-u32vector>
syn keyword gosh_replExtFunc <sparse-u64vector>
syn keyword gosh_replExtFunc <sparse-u8vector>
syn keyword gosh_replExtFunc <sparse-vector-base>
syn keyword gosh_replExtFunc <sparse-vector>
syn keyword gosh_replExtFunc <sql-parse-error>
syn keyword gosh_replExtFunc <string-meta>
syn keyword gosh_replExtFunc <string-pointer-meta>
syn keyword gosh_replExtFunc <string-pointer>
syn keyword gosh_replExtFunc <string>
syn keyword gosh_replExtFunc <symbol-meta>
syn keyword gosh_replExtFunc <symbol>
syn keyword gosh_replExtFunc <syntactic-closure>
syn keyword gosh_replExtFunc <syntax-meta>
syn keyword gosh_replExtFunc <syntax-pattern-meta>
syn keyword gosh_replExtFunc <syntax-pattern>
syn keyword gosh_replExtFunc <syntax-rules-meta>
syn keyword gosh_replExtFunc <syntax-rules>
syn keyword gosh_replExtFunc <syntax>
syn keyword gosh_replExtFunc <sys-fdset>
syn keyword gosh_replExtFunc <sys-flock>
syn keyword gosh_replExtFunc <sys-group>
syn keyword gosh_replExtFunc <sys-hostent>
syn keyword gosh_replExtFunc <sys-passwd>
syn keyword gosh_replExtFunc <sys-protoent>
syn keyword gosh_replExtFunc <sys-servent>
syn keyword gosh_replExtFunc <sys-sigset>
syn keyword gosh_replExtFunc <sys-stat>
syn keyword gosh_replExtFunc <sys-termios>
syn keyword gosh_replExtFunc <sys-tm>
syn keyword gosh_replExtFunc <system-error>
syn keyword gosh_replExtFunc <system-time-counter>
syn keyword gosh_replExtFunc <terminated-thread-exception-meta>
syn keyword gosh_replExtFunc <terminated-thread-exception>
syn keyword gosh_replExtFunc <thread-exception-meta>
syn keyword gosh_replExtFunc <thread-exception>
syn keyword gosh_replExtFunc <thread-meta>
syn keyword gosh_replExtFunc <thread-pool>
syn keyword gosh_replExtFunc <thread>
syn keyword gosh_replExtFunc <time-counter>
syn keyword gosh_replExtFunc <time>
syn keyword gosh_replExtFunc <top>
syn keyword gosh_replExtFunc <tree-map-meta>
syn keyword gosh_replExtFunc <tree-map>
syn keyword gosh_replExtFunc <trie>
syn keyword gosh_replExtFunc <u16array>
syn keyword gosh_replExtFunc <u16vector-meta>
syn keyword gosh_replExtFunc <u16vector>
syn keyword gosh_replExtFunc <u32array>
syn keyword gosh_replExtFunc <u32vector-meta>
syn keyword gosh_replExtFunc <u32vector>
syn keyword gosh_replExtFunc <u64array>
syn keyword gosh_replExtFunc <u64vector-meta>
syn keyword gosh_replExtFunc <u64vector>
syn keyword gosh_replExtFunc <u8array>
syn keyword gosh_replExtFunc <u8vector-meta>
syn keyword gosh_replExtFunc <u8vector>
syn keyword gosh_replExtFunc <uncaught-exception-meta>
syn keyword gosh_replExtFunc <uncaught-exception>
syn keyword gosh_replExtFunc <undefined-object>
syn keyword gosh_replExtFunc <unhandled-signal-error>
syn keyword gosh_replExtFunc <unknown>
syn keyword gosh_replExtFunc <user-time-counter>
syn keyword gosh_replExtFunc <uvector-meta>
syn keyword gosh_replExtFunc <uvector>
syn keyword gosh_replExtFunc <validator-meta>
syn keyword gosh_replExtFunc <validator-mixin>
syn keyword gosh_replExtFunc <vector-meta>
syn keyword gosh_replExtFunc <vector>
syn keyword gosh_replExtFunc <virtual-input-port>
syn keyword gosh_replExtFunc <virtual-output-port>
syn keyword gosh_replExtFunc <vm-insn-info>
syn keyword gosh_replExtFunc <weak-hash-table-meta>
syn keyword gosh_replExtFunc <weak-hash-table>
syn keyword gosh_replExtFunc <weak-vector-meta>
syn keyword gosh_replExtFunc <weak-vector>
syn keyword gosh_replExtFunc <zlib-data-error>
syn keyword gosh_replExtFunc <zlib-error>
syn keyword gosh_replExtFunc <zlib-memory-error>
syn keyword gosh_replExtFunc <zlib-need-dict-error>
syn keyword gosh_replExtFunc <zlib-stream-error>
syn keyword gosh_replExtFunc <zlib-version-error>
syn keyword gosh_replExtFunc job


" char-set
syn keyword gosh_replExtFunc *rfc2396-unreserved-char-set*
syn keyword gosh_replExtFunc *rfc3986-unreserved-char-set*
syn keyword gosh_replExtFunc *rfc822-atext-chars*
syn keyword gosh_replExtFunc char-set:ascii
syn keyword gosh_replExtFunc char-set:blank
syn keyword gosh_replExtFunc char-set:digit
syn keyword gosh_replExtFunc char-set:empty
syn keyword gosh_replExtFunc char-set:full
syn keyword gosh_replExtFunc char-set:graphic
syn keyword gosh_replExtFunc char-set:hex-digit
syn keyword gosh_replExtFunc char-set:iso-control
syn keyword gosh_replExtFunc char-set:letter
syn keyword gosh_replExtFunc char-set:letter+digit
syn keyword gosh_replExtFunc char-set:lower-case
syn keyword gosh_replExtFunc char-set:printing
syn keyword gosh_replExtFunc char-set:punctuation
syn keyword gosh_replExtFunc char-set:symbol
syn keyword gosh_replExtFunc char-set:title-case
syn keyword gosh_replExtFunc char-set:upper-case
syn keyword gosh_replExtFunc char-set:whitespace


" parameter
syn keyword gosh_replExtFunc cgen-cpp-condition
syn keyword gosh_replExtFunc cgen-current-unit
syn keyword gosh_replExtFunc cgi-metavariables
syn keyword gosh_replExtFunc cgi-output-character-encoding
syn keyword gosh_replExtFunc cgi-temporary-files
syn keyword gosh_replExtFunc cise-context
syn keyword gosh_replExtFunc cise-emit-source-line
syn keyword gosh_replExtFunc current-country
syn keyword gosh_replExtFunc current-language
syn keyword gosh_replExtFunc current-locale-details
syn keyword gosh_replExtFunc debug-print-width
syn keyword gosh_replExtFunc dry-run
syn keyword gosh_replExtFunc http-user-agent
syn keyword gosh_replExtFunc log-default-drain
syn keyword gosh_replExtFunc module-reload-rules
syn keyword gosh_replExtFunc reload-verbose
syn keyword gosh_replExtFunc ssax:warn-handler
syn keyword gosh_replExtFunc temporary-directory
syn keyword gosh_replExtFunc verbose-run



" meddlesome
set ts=8 sts=2 sw=2 et nocindent lisp


" Synchronization and the wrapping up...

syn sync match matchPlace grouphere NONE "^[^ \t]"
" ... i.e. synchronize on a line that starts at the left margin

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gosh_repl_syntax_inits")
  if version < 508
    let did_gosh_repl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink gosh_replSyntax		Statement
  HiLink gosh_replFunc		Function

  HiLink gosh_replString		String
  HiLink gosh_replChar		Character
  HiLink gosh_replNumber		Number
  HiLink gosh_replBoolean		Boolean

  HiLink gosh_replDelimiter	Delimiter
  HiLink gosh_replConstant		Constant

  HiLink gosh_replComment		Comment
  HiLink gosh_replMultilineComment	Comment
  HiLink gosh_replError		Error

  HiLink gosh_replExtSyntax	Type
  HiLink gosh_replExtFunc		PreProc

  HiLink gosh_replRegexp		gosh_replString
  HiLink gosh_replSrfi62Comment	gosh_replComment
  HiLink gosh_replSharpBang	Special
  HiLink gosh_replInclude		Include
  HiLink gosh_replInterpolation	Debug

  delcommand HiLink
endif

let b:current_syntax = "gosh-repl"
