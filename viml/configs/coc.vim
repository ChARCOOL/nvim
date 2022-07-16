let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-rust-analyzer',
      \ 'coc-snippets',
      \ 'coc-styled-components',
      \ 'coc-sumneko-lua',
      \ 'coc-tsserver',
      \ 'coc-yaml']

let g:coc_enable_locationlist = 0 
let g:coc_disable_transparent_cursor = 1

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <C-Space> coc#refresh()

inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

autocmd CursorHold * silent call CocActionAsync('highlight')

augroup CocGroup
  autocmd!

  autocmd FileType
        \ javascript, javascriptreact, 
        \ typescript, typescriptreact, 
        \ json, 
        \ rust 
        \ setlocal formatexpr=CocAction('formatSelected')

  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  autocmd User CocLocationsChange	CocList --normal location
augroup end

autocmd User CocOpenFloat call setwinvar(g:coc_last_float_win, "&winblend", 20)

xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>cl <Plug>(coc-codelens-action)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 Prettier :call CocActionAsync('runCommand', 'prettier.formatFile')
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

hi CocUnderline ctermbg=0 term=none
