dir=$(pwd)
ln -s $dir/.tmux.conf ~/.tmux.conf
ln -s $dir/.emacs ~/.emacs
mkdir -p ~/.config/yabai ~/.config/skhd
ln -s $dir/.config/yabai/yabairc ~/.config/yabai/yabairc
ln -s $dir/.config/skhd/skhdrc ~/.config/skhd/skhdrc
