dir=$(pwd)
ln -sf $dir/.tmux.conf ~/.tmux.conf
ln -sf $dir/.emacs ~/.emacs
mkdir -p ~/.config/yabai ~/.config/skhd
ln -sf $dir/.config/yabai/yabairc ~/.config/yabai/yabairc
ln -sf $dir/.config/skhd/skhdrc ~/.config/skhd/skhdrc
