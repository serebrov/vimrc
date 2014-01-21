"echom "Loading syntax for potion"
if exists("b:current_syntax")
    finish
endif

syntax keyword potionKeyword code assign expr msg
syntax keyword potionKeyword proto list block

highlight link potionKeyword Keyword

syntax match potionComment "\v;.*$"
syntax match potionComment "\v^\*\*.*$"
highlight link potionComment Comment

syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="
syntax match potionOperator "\v:"
syntax match potionOperator "\v\."

highlight link potionOperator Operator

syntax match potionNumber "\v([0-9\.]+e[\+\-])?[0-9\.]+"
syntax match potionNumber "\v0x[0-9abcdef]+"

highlight link potionNumber Number

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link potionString String

let b:current_syntax = "potion"
