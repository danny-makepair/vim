set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'a.vim'
"Plugin 'c.vim'
"Plugin 'TagHighlight'
Plugin 'OmniCppComplete'
Plugin 'taglist.vim'
"Plugin 'vim-scripts/winmanager'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
set number
colo busybee
syntax on
set guifont=Monospace\ 11
set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=2                                         "设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=2                                      "换行时自动缩进宽度，可更改（宽度同tabstop）
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度
set mouse=ar
set selectmode+=mouse
"set foldenable                                        "启用折叠
"set foldmethod=indent                                 "indent 折叠方式
"
"
"
"let g:miniBufExplMapWindowNavVim = 1   
"let g:miniBufExplMapWindowNavArrows = 1   
"let g:miniBufExplMapCTabSwitchBufs = 1   
"let g:miniBufExplModSelTarget = 1  
"let g:miniBufExplMoreThanOne=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=25
map <F2> :NERDTreeToggle<CR>

let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|BufExplorer"

function! NERDTree_Start()
  exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
  return 1
endfunction

nmap wm :WMToggle<CR>


set laststatus=2


let g:tagbar_ctags_bin='ctags'      "ctags程序的路径
let g:tagbar_width=30         "窗口宽度的设置
"map <F3> :Tagbar<CR>
map <F3> : 
imap <F3> : 
map <F4> :w<CR>:!

map <F12> :wq<CR>
map <F11> :w<CR>


map <F10> :MBEbp<CR>


"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
""如果是c语言的程序的话，tagbar自动开启

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=40 columns=150
endif


" configure tags - add additional tags here or comment out not-used ones
" " build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"
" " OmniCppComplete
"
set tags+=~/.vim/tags/cpp_std_tags
"set tags+=~/.vim/tags/boost_1_57_tags

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
 " automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
 set completeopt=menuone,menu
"
"

let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Auto_Open=1
"是否一直处理tags.1:处理;0:不处理
"let Tlist_Process_File_Always=1 "实时更新tags
"let Tlist_Inc_Winwidth=0
"
"clang complete"
"let g:clang_auto_select = 0 
"let g:clang_complete_auto = 1
"let g:clang_complete_copen = 1
"let g:clang_hl_erroes = 1
"let g:clang_periodic_quickfix = 1
"let g:clang_snippets = 1
"let g:clang_snippets_engine = 'clang_complete'
"let g:clang_conceall_snippets = 1 
"let g:clang_trailing_placeholder = 1
"let g:clang_close_preview = 0
"let g:clang_user_options = '-std=c++11 -stdlib=libc++'
""let g:clang_auto_user_options = 
"let g:clang_use_library = 1
"let g:clang_library_path = '/usr/lib/llvm-3.8/lib/'

"let g:clang_sort_algo = 'priority'
"let g:clang_complete_macros = 1 
"let g:clang_complete_patterns = 1 
"let g:clang_jumpto_back_key = '<C-O>'
""let g:clang_debug = 1

map<c-k> :ClangFormat<cr> 

let g:clang_format#code_style='google'





