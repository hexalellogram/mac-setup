set autoindent " Allow indentation to occur automatically
set colorcolumn=80 " Put a red line at column 80 to give a visual for 80 chars
set number " Line numbers on the left side of the screen
set ruler " Numbers at the bottom of the screen for column and line
set guioptions=Te " Keep the copy, cut, save GUI buttons visible
set lbr " Automatically break when the total width is hit
"set tw=80 " Set the total width to 80
set smartcase " Override ignorecase when search contains capital letters
set ignorecase " Make default search not case sensitive
set tabpagemax=100 "Allow for 100 tabs to be opened simultaneously instead of 10
set list " Turn on visual spaces/tabs
set listchars=tab:>- " Make tabs look like >--------
set backspace=indent,eol,start

" Enable filetype detection. Used in the myFileSettings augroup below
filetype on

" Function for determining the remap setting for { Gets current file type
function GetFileType()

  " Declare a list of filetypes that we want the spaced out curly braces
  let fts = ['c', 'cpp', 'java', 'objc', 'haskell', 'javascript', 'r']


  " Grab filetype of current file
  let curr = &filetype

  " See if our current filetype is in our list
  if index(fts, curr) == -1

    " Not found, return 0 (false)
    return 0
  else

    " Found it, return 1 (true)
    return 1
  endif
endfunction

" Remap settings
" insert mode remap the { to {}. specifics depend on filetype
" insert mode remap the ( to print () and place the cursor in between
" normal mode remap Left and Right arrow keys to type :tabp and :tabn keys,
"   respectively. Makes navigating tabs easier.
inoremap <expr> { (GetFileType() == 1 ? '{<CR>}<Esc>O' : '{}<Esc>i')
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
nnoremap <Left> :tabp<CR>
nnoremap <Right> :tabn<CR>

" Set the colorscheme and enable syntax highlighting
syntax on
"colorscheme custom_colorscheme
"colorscheme macvim
colorscheme molokai

" Group all file tab/spaces settings together.
"augroup myFileSettings
"    autocmd!

    " Tab settings for C files
    au FileType c set expandtab " turn tabs into spaces visually
    au FileType c set shiftwidth=4 " set width of < and > cmd to 4 spaces
    au FileType c set softtabstop=4 " pressing tab inserts four spaces
    au FileType c set tabstop=4 " pressing tab inserts four spaces

    " Tab settings for C++ files, C/C++ header files
    au FileType cpp set expandtab " turn tabs into spaces visually
    au FileType cpp set shiftwidth=4 " set width of < and > cmd to 4 spaces
    au FileType cpp set softtabstop=4 " pressing tab inserts four spaces
    au FileType cpp set tabstop=4 " pressing tab inserts four spaces

    " Tab settings for Java files
    au FileType java set expandtab " turn tabs into spaces visually
    au FileType java set shiftwidth=4 " set width of < and > cmd to 4 spaces
    au FileType java set softtabstop=4 " pressing tab inserts four spaces
    au FileType java set tabstop=4 " pressing tab inserts four spaces

    " Tab settings for shell script files
    au FileType sh set expandtab " turn tabs into spaces visually
    au FileType sh set shiftwidth=4 " set width of < and > cmd to 4 spaces
    au FileType sh set softtabstop=4 " pressing tab inserts four spaces
    au FileType sh set tabstop=4 " pressing tab inserts four spaces

    " No expansion at all for Makefiles
"    au FileType make set noexpandtab " keep tabs as tabs
"    au FileType make set shiftwidth=8 " set width of < and > cmd to 8 spaces
"    au FileType make set softtabstop=8 " pressing tab inserts 8 spaces
"    au FileType make set tabstop=8
"augroup END

" Highlight columns over 80 as red
"highlight OverLength      ctermbg=red   guibg=red

" Create group so that highlighting extends to multiple vim tabs simultaneously
"augroup myMatches
"    autocmd!
"    au WinEnter,BufEnter *
"                \ call clearmatches() |
"                \ call matchadd('OverLength', '\%81v.\+', -1)
"augroup END

" Custom command for replacing 8 space tabs with 4 spaces
:command Tab824 :%s/        /    /g
