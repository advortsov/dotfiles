sudo apt-get -y update &&
sudo apt-get -y install python3-pip python3-venv nodejs ranger tmux git chromium-browser &&
pip3 install virtualenv virtaulenvwrapper &&
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode Virtual1 "1920x1080_60.00" &&
git config --global user.email "alxdvcv@gmail.com" &&
git config --global user.name "advortsov" &&
cd ~ &&
git clone https://github.com/advortsov/dotfiles.git &&
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
echo "VIMINIT='source ~/dotfiles/.vimrc'" >> ~/.bashrc
vim +PlugInstall +qall &&
echo Success
