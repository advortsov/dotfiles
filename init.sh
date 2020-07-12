sudo apt-get -y update &&
sudo apt-get -y install ranger tmux git chromium-browser &&
git config --global user.email "alxdvcv@gmail.com" &&
git config --global user.name "advortsov" &&
cd ~ &&
git clone https://github.com/advortsov/dotfiles.git &&
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
vim +PlugInstall +qall &&
VIMINIT='source ~/dotfiles/.vimrc' &&
echo Success
