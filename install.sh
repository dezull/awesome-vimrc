cd ~/.vim_runtime

curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'set runtimepath+=~/.vim_runtime
source ~/.vim_runtime/vimrcs/plug.vim
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Open vim and run :PlugInstall"
