# betty-ale-vim
> An extention for Ale which integrate Betty's linter of holberton school
with vim

## How to install

### Prerequisites
To run this script you need to   have install 
   1 Betty linter
   2 vim-plug		[folow this process to do so] 
##### 1.Installation of Vim-plug

###### Unix

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

You can automate the process by putting the command in your Vim configuration
file as suggested [here][auto].

[auto]: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
[ALE]: https://github.com/dense-analysis/ale
[betty]
###### Windows (PowerShell)

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```




### edit the file to instal
######	1.Copy this and paste to terminal
```vim
vim  ~/.vimrc
```
######	2.Enter the insert mode, paste the following to the file, save and exit
```edits
map <F8> :setlocal spell! spelllang=en_gb<CR>
set tabstop=8 shiftwidth=8
set autoindent
set smartindent
set cindent
syntax enable
set number
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
syntax on
set undofile
set undodir=/tmp
inoremap <C-H> <C-W>
"you can delete above commands but make sure to include this one here are mandatory
let g:ale_linters = {'c':['betty-style', 'betty-doc', 'gcc']} "add betty to ale linters
"Call Vim-plug
call plug#begin('~/.vim/plugged')
	Plug 'dense-analysis/ale'|          "to install ALE
	Plug 'bstevary/betty-in-vim'|       "to install the script
call plug#end()
```
######	3.After you have exited the file paste the folowing to terminal
```test
vim  ~/v_test.c
```
######	In command mode type

```install
:PlugInstall
```
exit and have fun with vim



## Author
[Stevary](https://github.com/bstevary)

## Support us
This is single project that will save you time, and If your like it please give us an star ⭐ and share it with your peers #happycodding



