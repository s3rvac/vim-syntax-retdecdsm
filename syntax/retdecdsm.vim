" Vim syntax file for retdec.com disassembly.
"
" Language:     retdec.com disassembly
" Maintainer:   Petr Zemek <s3rvac@gmail.com>
" Home Page:    https://github.com/s3rvac/vim-syntax-retdecdsm
" Last Change:  2017-10-21 16:12:37 +0200
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

syntax case match

syntax match retdecdsmComment ";.*"
syntax match retdecdsmASCIIRepr "|.\+|"
" The leading 'L' denotes a wide string (just like in C).
syntax match retdecdsmString "L\?\".*\""
syntax match retdecdsmTarget "<[^>]\+>"
" Other identifier-like words that are not covered by later rules (e.g. db, ia,
" eq on ARM).
syntax match retdecdsmOtherId "\<[a-z]\+\>"
" Hexadecimal numbers.
syntax match retdecdsmNumber "\<0x[0-9a-f]\+\>"
" Decimal numbers.
syntax match retdecdsmNumber "\<[0-9]\+\>"
" Registers on PowerPC.
syntax match retdecdsmRegister "\<r[0-9]\{1,2\}\>"
" Registers on ARM (rX registers are same as for PowerPC).
syntax match retdecdsmRegister "\<sp\>"
syntax match retdecdsmRegister "\<lr\>"
syntax match retdecdsmRegister "\<pc\>"
syntax match retdecdsmRegister "\<[cs]psr\>"
" Registers on MIPS/PIC32.
syntax match retdecdsmRegister "$[a-z0-9]\+\>"
" Registers on x86.
syntax match retdecdsmRegister "\<e[abcd]x\>"
syntax match retdecdsmRegister "\<e\?[bs]p\>"
syntax match retdecdsmRegister "\<e\?[ds]i\>"
syntax match retdecdsmRegister "\<e[adpt]f\>"
syntax match retdecdsmRegister "\<[abcd][hlx]\>"
syntax match retdecdsmRegister "\<[bs]pl\>"
syntax match retdecdsmRegister "\<[ds]il\>"
syntax match retdecdsmRegister "\<[ecdfgs]s\>"
syntax match retdecdsmRegister "\<[acdzsopt]f\>"
syntax match retdecdsmRegister "\<st[0-7]\>"
" Sizes on x86.
syntax match retdecdsmSize "\<byte\>"
syntax match retdecdsmSize "\<d\?word\>"
" Instructions.
" \t\@<= is a positive lookbehind for TAB.
syntax match retdecdsmInstr "\t\@<=[a-z_]\+\>"
" rep instruction on x86.
syntax match retdecdsmInstr "\t\@<=rep [a-z_]\+\>"
" Bytes between address and instruction.
" :\@<= is a positive lookbehind for :.
" \t\@= is a positive lookahead for TAB.
syntax match retdecdsmBytes ":\@<= *\([0-9a-f]\{2\} *\)\+\(\t\@=\)\?"
" Bytes between address and ASCII representation.
syntax match retdecdsmBytes ":\@<= *\([0-9a-f]\{2\} *\)\+|\@="

highlight default link retdecdsmComment Comment
highlight default link retdecdsmASCIIRepr PreProc
highlight default link retdecdsmString String
highlight default link retdecdsmTarget Tag
highlight default link retdecdsmOtherId Identifier
highlight default link retdecdsmRegister Identifier
highlight default link retdecdsmSize Type
highlight default link retdecdsmInstr Keyword
highlight default link retdecdsmNumber Number
highlight default link retdecdsmBytes Number

" Make sure that the file is loaded at most once.
let b:current_syntax = "retdecdsm"
