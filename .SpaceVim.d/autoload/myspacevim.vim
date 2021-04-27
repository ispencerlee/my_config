function! myspacevim#before() abort

  
  "neovim需要添加的
  let g:vimtex_compiler_progname = 'nvr'

  let g:tex_flavor='latex'
  "中文支持
  let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 --interaction=nonstopmode $*'
  let g:vimtex_compiler_latexmk_engines = {'_':'-xelatex'}
  let g:vimtex_compiler_latexrun_engines ={'_':'xelatex'}
  "使用zathura预览
  let g:vimtex_view_method='zathura'
  let g:vimtex_quickfix_mode=0
  set conceallevel=1
  let g:tex_conceal='abdmg'

  
  

  
endfunction


function! myspacevim#after() abort

  
  set wrap 
  
endfunction
