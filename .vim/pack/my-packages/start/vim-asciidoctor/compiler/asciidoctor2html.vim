" Vim compiler file
" Compiler: Asciidoctor2HTML
" Maintainer: Maxim Kim (habamax@gmail.com)
" vim: et sw=4

if exists("current_compiler")
  finish
endif
let current_compiler = "Asciidoctor2HTML"
let s:keepcpo= &cpo
set cpo&vim

if get(g:, 'asciidoctor_extensions', []) == []
    let s:extensions = ""
else
    let s:extensions = "-r ".join(g:asciidoctor_extensions, ' -r ')
endif

if get(g:, 'asciidoctor_css_path', '') == ''
    let s:css_path = ""
else
    let s:css_path = '-a stylesdir='.shellescape(fnamemodify(g:asciidoctor_css_path, ":p:h"))
endif

if get(g:, 'asciidoctor_css', '') == ''
    let s:css_name = ""
else
    let s:css_name = '-a stylesheet='.shellescape(g:asciidoctor_css)
endif

let s:asciidoctor_executable = get(g:, 'asciidoctor_executable', 'asciidoctor')

let s:filename = shellescape(get(g:, 'asciidoctor_use_fullpath', v:true) ? expand("%:p") : expand("%:t"))

let &l:makeprg = s:asciidoctor_executable . " " . s:extensions
            \. " -a docdate=".strftime("%Y-%m-%d")
            \. " -a doctime=".strftime("%T") . " "
            \. s:css_path . " "
            \. s:css_name . " "
            \. s:filename

let &cpo = s:keepcpo
unlet s:keepcpo
