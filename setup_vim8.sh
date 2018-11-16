if [[ $# -eq 1 && $1 == "--compile" ]]; then
    cd ~/repo
    # install vim8
    if [ ! -d "./vim" ]; then
        git clone https://github.com/vim/vim.git
        cd vim
        git checkout v8.1.0527
    else
        cd vim
    fi

    ./configure --prefix=$HOME/.local/ \
        --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp=dynamic \
        --enable-pythoninterp=dynamic \
        --enable-python3interp=dynamic \
        --enable-perlinterp=dynamic \
        --enable-luainterp=dynamic \
        --enable-gui=no \
        --enable-cscope \
        --enable-terminal
        # next option may be needed when configure on old gcc machine
        #CFLAGS=-fgnu89-inline
    make
    make install
fi

rm ~/.vimrc
ln -s ~/repo/editor_config/vimrc ~/.vimrc

rm -rf ~/.fonts
cp ~/repo/editor_config/fonts ~/.fonts -r

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
