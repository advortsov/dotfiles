sudo apt-get -y update &&
sudo apt-get -y install nodejs ranger tmux git chromium-browser &&
git config --global user.email "alxdvcv@gmail.com" &&
git config --global user.name "advortsov" &&
cd ~ &&
git clone https://github.com/advortsov/dotfiles.git &&
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
export VIMINIT='source ~/dotfiles/.vimrc' &&
vim +PlugInstall +qall &&
echo Success
