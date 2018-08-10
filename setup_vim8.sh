# install ncurses
wget ftp.gnu.org/pub/gnu/ncurses/ncurses-6.1.tar.gz
tar -xzf ncurses-6.1.tar.gz
cd ncurses-6.1
./configure --prefix=/home/yetiancai/.local/
make
make install

# install vim8
git clone https://github.com/vim/vim.git
cd vim
git checkout v8.1.0264
./configure --prefix=/home/yetiancai/.local/ \
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
make
make install

echo source ~/repo/editor_config/vimrc >> ~/.vimrc

