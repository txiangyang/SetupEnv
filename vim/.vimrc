set encoding=utf-8 

set nu 
set tabstop=4 
set expandtab 
set so=5 

map <C-v> "+p 
map <C-c> "*y 

" tell vim to keep a backup file
set backup

" tell vim where to put its backup files
set backupdir=$TMP

" tell vim where to put swap files
set dir=$TMP

com! FXml :%!py -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
nnoremap = :FXml<Cr>

" Ali: to indent json files on save
autocmd FileType json autocmd BufWritePre <buffer> %!py -m json.tool

com! FormatJson :%!py -m json.tool
nnoremap + :FormatJson<Cr>

map <C-v> "+p 
map <C-c> "*y 

filetype on 
syntax on 
au BufNewFile, BufRead *.proj set filetype=xml 
au BufNewFile, BufRead *.wsf set filetype=vb 
