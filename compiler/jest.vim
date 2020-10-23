if exists("current_compiler")
  finish
endif
let current_compiler = "jest"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

" CompilerSet makeprg=jest
" CompilerSet makeprg=../tools/local/frontend-cmd.sh\ npm\ run\ test:unit\ --\ -u
" CompilerSet makeprg=npm\ run\ test:unit\ --\ -u
" CompilerSet errorformat=%.%#\ at\ %f:%l:%c,%.%#\ at\ %.%#(%f:%l:%c)
"
CompilerSet makeprg=npm\ run\ test:unit\ %
CompilerSet errorformat=%.%#\ at\ %.%#(%f:%l:%c)

let &cpo = s:cpo_save
unlet s:cpo_save

" ||       at Object.it (tests/unit/BillingFree.spec.ts:93:37)
