" Vim syntax file for retdec.com disassembly.
"
" Language:     retdec.com disassembly
" Maintainer:   Petr Zemek <s3rvac@gmail.com>
" Home Page:    https://github.com/s3rvac/vim-syntax-retdecdsm
" Last Change:  2016-09-07 17:50:29 +0200
"
" The MIT License (MIT)
"
" Copyright (c) 2016 Petr Zemek <s3rvac@gmail.com> and contributors.
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

" Quit if the syntax file has already been loaded.
if exists("b:current_syntax")
	finish
endif

syn case match

syn match retdecdsmComment ";.*"
syn match retdecdsmASCIIRepr "|.\+|"
" The leading 'L' denotes a wide string (just like in C).
syn match retdecdsmString "L\?\".*\""
syn match retdecdsmTarget "<[^>]\+>"
" Other identifier-like words that are not covered by later rules (e.g. db, ia,
" eq on ARM).
syn match retdecdsmOtherId "\<[a-z]\+\>"
" Hexadecimal numbers.
syn match retdecdsmNumber "\<0x[0-9a-f]\+\>"
" Decimal numbers.
syn match retdecdsmNumber "\<[0-9]\+\>"
" Registers on PowerPC.
syn match retdecdsmRegister "\<r[0-9]\{1,2\}\>"
" Registers on ARM (rX registers are same as for PowerPC).
syn match retdecdsmRegister "\<sp\>"
syn match retdecdsmRegister "\<lr\>"
syn match retdecdsmRegister "\<pc\>"
syn match retdecdsmRegister "\<[cs]psr\>"
" Registers on MIPS/PIC32.
syn match retdecdsmRegister "$[a-z0-9]\+\>"
" Registers on x86.
syn match retdecdsmRegister "\<e[abcd]x\>"
syn match retdecdsmRegister "\<e\?[bs]p\>"
syn match retdecdsmRegister "\<e\?[ds]i\>"
syn match retdecdsmRegister "\<e[adpt]f\>"
syn match retdecdsmRegister "\<[abcd][hlx]\>"
syn match retdecdsmRegister "\<[bs]pl\>"
syn match retdecdsmRegister "\<[ds]il\>"
syn match retdecdsmRegister "\<[ecdfgs]s\>"
syn match retdecdsmRegister "\<[acdzsopt]f\>"
syn match retdecdsmRegister "\<st[0-7]\>"
" Sizes on x86.
syn match retdecdsmSize "\<byte\>"
syn match retdecdsmSize "\<d\?word\>"
" Instructions.
" \t\@<= is a positive lookbehind for TAB.
syn match retdecdsmInstr "\t\@<=[a-z_]\+\>"
" rep instruction on x86.
syn match retdecdsmInstr "\t\@<=rep [a-z_]\+\>"
" Bytes between address and instruction.
" :\@<= is a positive lookbehind for :.
" \t\@= is a positive lookahead for TAB.
syn match retdecdsmBytes ":\@<= *\([0-9a-f]\{2\} *\)\+\(\t\@=\)\?"
" Bytes between address and ASCII representation.
syn match retdecdsmBytes ":\@<= *\([0-9a-f]\{2\} *\)\+|\@="

hi def link retdecdsmComment Comment
hi def link retdecdsmASCIIRepr PreProc
hi def link retdecdsmString String
hi def link retdecdsmTarget Tag
hi def link retdecdsmOtherId Identifier
hi def link retdecdsmRegister Identifier
hi def link retdecdsmSize Type
hi def link retdecdsmInstr Keyword
hi def link retdecdsmNumber Number
hi def link retdecdsmBytes Number

" Make sure that the file is loaded at most once.
let b:current_syntax = "retdecdsm"
