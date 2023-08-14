"lua require('remap')
inoremap <F16> <C-o>
noremap <C-q> :q<CR>
noremap <C-w> :w<CR>
noremap <F3> :Black<CR>
"pane movements
noremap <M-l> <C-w>l
noremap <M-Right> <C-w><Right>
noremap <M-k> <C-w>k
noremap <M-Up> <C-w><Up>
noremap <M-j> <C-w>j
noremap <M-Down> <C-w><Down>
noremap <M-h> <C-w>h
noremap <M-Left> <C-w><Left>
noremap <M-h> <C-w>s
noremap <M-v> <C-w>v
noremap <M-z> <C-w>o
noremap <M-C-Up> <C-w>+1
noremap <M-C-k> <C-w>+1
noremap <M-C-Down> <C-w>-1
noremap <M-C-j> <C-w>-1
noremap <M-C-Left> <C-w><1
noremap <M-C-h> <C-w><1
noremap <M-C-Right> <C-w>>1
noremap <M-C-l> <C-w>>1
"indent selection
vnoremap > >gv
vnoremap < <gv
noremap <esc> :noh<CR><esc>
"duplicate line
nnoremap <C-d> yyp
inoremap <C-d> <C-o>yy<C-o>p
vnoremap <C-d> 0Yp
"find and replace
vnoremap / y/<C-r>"<CR>
vnoremap ? y?<C-r>"<CR>
noremap <C-s> :%s///g<Left><Left><Left>
vnoremap <C-s> y:%s/<C-r>"//g<Left><Left>
vnoremap s :%s/\%V//g<Left><Left><Left>
"better selection
nnoremap <C-Down> V<Down>
inoremap <C-Down> <Esc>V<Down>
nnoremap <C-Up> V<Up>
inoremap <C-Up> <Esc>V<Up>:Telescope file_browser path=%:h select_buffer=true
nnoremap <C-S-Left> <C-v><Left>
inoremap <C-S-Left> <Esc><C-v><Left>
nnoremap <C-S-Right> <C-v><Right>
inoremap <C-S-Right> <Esc><C-v><Right>
nnoremap <S-Left> v<Left>
inoremap <S-Left> <Esc>v<Left>
nnoremap <S-Right> v<Right>
inoremap <S-Right> <Esc>v<Right>
nnoremap <S-Down> v<Down>
inoremap <S-Down> <Esc>v<Down>
nnoremap <S-Up> v<Up>
inoremap <S-Up> <Esc>v<Up>
"indent fix
nnoremap <C-S-Down>  :m+<CR>==
inoremap <C-S-Down>  <C-o>:m+<CR><C-o>==
vnoremap <C-S-Down>  :m '>+1<CR>gv=gv
nnoremap <C-S-Up>  :m-2<CR>==
inoremap <C-S-Up>  <C-o>:m-2<CR><C-o>==
vnoremap <C-S-Up> :m '<-2<CR>gv=gv
