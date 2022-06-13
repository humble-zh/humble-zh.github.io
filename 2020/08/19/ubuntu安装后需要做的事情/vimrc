let mapleader=" "

" 基本配置
set nocompatible
syntax enable
syntax on
set showmode
set showcmd
" set mouse=a
set encoding=utf-8
set t_Co=256
filetype indent on

" 缩进
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" 外观
set number
set relativenumber
set cursorline
set textwidth=80
set wrap
" set nowrap
set linebreak
set wrapmargin=2
set scrolloff=8
set laststatus=2
set ruler

" 搜索
set showmatch
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
noremap * *zz
noremap n nzz
noremap # #zz
noremap N Nzz
noremap <LEADER><CR> :nohlsearch<CR>

noremap <LEADER>cr i## C->R 0x
noremap <LEADER>rc i## R->C 0x
noremap <LEADER>2 i&emsp;&emsp;<ESC>
noremap <LEADER>< i ***<ESC>
noremap <LEADER>> i*** <ESC>
noremap <LEADER><TAB> /<++><CR>ca<
noremap <LEADER>p2cmd 0f("byi("add/p2cmd_t;<CR>"aP>>iP2CMD_<++> = , <ESC>F=l"bp/P2DataStruct<CR>"aPItypedef struct{ <ESC>op2head_t head;<ESC>ouint8_t unixtimestamp[P2LEN4UNIXTIMESTAMP];<ESC>"apI}p2<++><ESC>"bpa_t; <ESC>V0%y%o<ESC>pf{%o<CR><ESC>/P2Function<CR>"aPIextern size_t p2rcpack<ESC>"bpa(void *dptr, time_t unixtimestamp, <++>); <ESC>gg/<++><CR>ca<
noremap <LEADER>p2fnct 0df f;xf("ayi(o{<CR>p2r<ESC>"apa_t<ESC>b"byeA *pkt = (<ESC>pa *)dptr;<CR>*(uint32_t *)pkt->unixtimestamp = unixtimestamp;<CR><CR>return sizeof(<ESC>"bpa);<CR>}<CR><ESC>
noremap <LEADER>len mm^w"ayew"bdi[iP2LEN4<ESC>"apgUiw"cyiw/P2MacrosDefine<CR>ko#define <ESC>"cpa (<ESC>"bpa)<ESC>'mj
noremap <LEADER>s8 ^w"ayeo*(uint8_t *)pkt-><ESC>"apa = <ESC>"apa;<CR>prtcl_dbg("<ESC>"apa%u len%u", *(uint8_t *)pkt-><ESC>"apa, P2LEN4<ESC>"apgUiwA);<ESC>
noremap <LEADER>s16 ^w"ayeo*(uint16_t *)pkt-><ESC>"apa = <ESC>"apa;<CR>prtcl_dbg("<ESC>"apa%u len%u", *(uint16_t *)pkt-><ESC>"apa, P2LEN4<ESC>"apgUiwA);<ESC>
noremap <LEADER>s32 ^w"ayeo*(uint32_t *)pkt-><ESC>"apa = <ESC>"apa;<CR>prtcl_dbg("<ESC>"apa%u len%u", *(uint32_t *)pkt-><ESC>"apa, P2LEN4<ESC>"apgUiwA);<ESC>
noremap <LEADER>ss ^w"ayeoif(<ESC>"apa) memcpy(pkt-><ESC>"apa, <ESC>"apa, P2LEN4<ESC>"apgUiwA);<CR>prtcl_dbg("<ESC>"apa'%s' len%u", <ESC>"apa, P2LEN4<ESC>"apgUiwA);<ESC>
noremap <LEADER>pl /return<CR>f("ayi(Oprtcl_dbg("pktlen%u", sizeof(<ESC>"apa));<ESC>

noremap <LEADER>pt :call TitleDet()<CR>
function AddTitle()
    call append(0,"\#!/usr/bin/env python3.5")
    call append(1,"# -*- coding: utf-8 -*-")
    call append(2,"")
    call append(3,"'''\\")
    call append(4,"Filename: ".expand("%:t"))
    call append(5,"Description: <++>")
    call append(6,"Last modified: humble ".strftime("%Y%m%d %H:%M"))
    call append(7,"Usage:")
    call append(8,"  <++>")
    call append(9,"'''")
    call append(10,"")
    call append(11,"# import os")
    call append(12,"import sys")
    call append(13,"")
    call append(14,"__author__ = \"humble\"")
    call append(15,"")
    call append(16,"")
    call append(17,"if __name__ == '__main__':")
    call append(18,"    print(__doc__)")
    echohl WarningMsg | echo "Successful in adding copyright." | echohl None
endf

function UpdateTitle()
     execute '/Filename/s@:.*$@\=": ".expand("%:t")@'
     normal jj0
     execute '/Last modified/s@:.*$@\=strftime(": humble %Y%m%d %H:%M")@'
     echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction

function TitleDet()
    let n=1
    while n < 10
        let line = getline(n)
        if line =~ "^Filename\S*.*$"
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

" 编辑
" set backup
set autoread
set listchars=tab:»■,trail:■
set list
set wildmenu
set wildmode=longest:list,full

" 分屏
map \h :set nosplitright<CR>:vsplit<CR>
map \j :set splitbelow<CR>:split<CR>
map \k :set nosplitbelow<CR>:split<CR>
map \l :set splitright<CR>:vsplit<CR>



" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
" Plug 'fholgado/minibufexpl.vim' " 这种安装方式似乎对config 'fholgado/minibufexpl.vim' 无效
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/winmanager'
Plug 'vim-scripts/ag.vim'
Plug 'brooth/far.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lfv89/vim-interestingwords'
Plug 'dense-analysis/ale'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

Plug 'ycm-core/YouCompleteMe'
" Initialize plugin system
call plug#end()

" config 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" config 'airblade/vim-gitgutter'
set updatetime=100

" config 'vim-scripts/taglist.vim'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" config 'vim-scripts/winmanager'
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" config 'brooth/far.vim'
set lazyredraw
set regexpengine=1

" config 'easymotion/vim-easymotion'
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" Move hjkl
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" config 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" config 'lfv89/vim-interestingwords'
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>
nnoremap <silent> n :call WordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>

" config 'dense-analysis/ale'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

" config markdown
let g:vim_markdown_folding_disabled = 1

" YouCompleteMe
" Python Semantic Completion
let g:ycm_python_binary_path = '/usr/bin/python3'
" C family Completion Path
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" 跳转快捷键
nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
nnoremap <c-h> :YcmCompleter GoToDefinition<CR>|
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
" 停止提示是否载入本地ycm_extra_conf文件
let g:ycm_confirm_extra_conf = 0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" 主动补全, 默认为<C-Space>
"let g:ycm_key_invoke_completion = ['<C-Space>']
" 停止显示补全列表(防止列表影响视野), 可以按<C-Space>重新弹出
"let g:ycm_key_list_stop_completion = ['<C-y>']
