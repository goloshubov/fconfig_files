"set t_Co=256
"set background=dark
"colorscheme solarized8_high
colorscheme onedark

set mouse=a
"map <F3> <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>
map <F3> <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=a"<CR>
map <F4> :set number! <CR>
map <F5> :set nohlsearch! <CR>
set et ts=2 ai sw=2 nu
"set et ts=2 ai sw=2 

set laststatus=2 " Always display the statusline in all windows
"set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Change directory to the current buffer when opening files. 
"set autochdir


" ---- powerline -----
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup


" ---- vim-ansible plugin ----
let g:ansible_unindent_after_newline = 1
"let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1
"let g:ansible_normal_keywords_highlight = 'Constant'
"let g:ansible_with_keywords_highlight = 'Constant'
"let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }
"au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile *.yml set filetype=yaml.ansible


" ---- netrw -----
"map <F2> <ESC> :Lexplore<CR>
"map <F2> :Lexplore<CR>
map <S-F2> :Explore <CR>

let g:netrw_banner=0        " disable annoying banner
let g:netrw_winsize = 18    " width in percent
"let g:netrw_browse_split=3  " open in tab
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree dir view
" ret g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


" ---- NERDTree ----
" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

map <F2> :NERDTreeToggle <CR>

" let NERDTreeMapOpenInTab='<ENTER>'
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<2-LeftMouse>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })
function! OpenInTab(node)
    call a:node.activate({'reuse': 'all', 'where': 't'})
endfunction

let NERDTreeShowHidden=1


" ---- wl-copy FIXME -----
" Ctrl @ - copy (after y) to wayland clipboard
nnoremap <C-@> :call system("wl-copy", @")<CR>


" ---- syntax -----
autocmd BufNewFile,BufRead Dockerfile* set syntax=dockerfile
autocmd BufNewFile,BufRead *sonnet set syntax=json
autocmd BufNewFile,BufRead *.j2 set syntax=jinja2


" ---- highlight unwanted spaces -----
map <F6> :set list! <CR>
set list listchars=tab:\|_,trail:·
