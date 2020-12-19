" Vim Syntax File
" Language: Elsa
" Author: Nate Browne
" Maintainer: Nate Browne
" Latest Revision: 15 Jan 2019

if exists("b:current_syntax")
  finish
endif

" Keywords
syntax keyword elsaLanguageKeywords let eval
syntax keyword elsaTodo contained TODO FIXME XXX

" Strings
syntax match elsaComment "\v--.*$" contains=elsaTodo
syntax match elsaConstant "\v[A-Z]+\d*_?"

" Operators
syntax match elsaOperator "\v\-\>"
syntax match elsaOperator "\v\=*\>"
syntax match elsaOperator "\v\\"
syntax match elsaOperator "\v\="
syntax match elsaOperator "\v:"

" Highlights
highlight link elsaLanguageKeywords Keyword
highlight link elsaComment Comment
highlight link elsaOperator Operator
highlight link elsaConstant Constant

let b:current_syntax = "elsa"
