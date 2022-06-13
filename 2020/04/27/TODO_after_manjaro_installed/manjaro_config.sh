#!/bin/bash

manjaroconfdir=~/li/.zbb/source/_posts/TODO_after_manjaro_installed
function cfgvim(){
    [ -d ~/li/.myvim/.git ] || {
        git clone https://github.com.cnpmjs.org/humble-zh/myvim.git ~/li/.myvim && {
        cd ~/li/.myvim/;
            git remote set-url origin https://github.com/humble-zh/myvim.git;
            cd;
        }
    }
    bash -x ~/li/.myvim/install.sh
    exit
}

function cfgohmyzsh(){
    [ -d ~/.oh-my-zsh/.git ] || {
        curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh;
            rm ~/.oh-my-zsh -rf; bash install.sh; rm install.sh;
        }
    echo -e "====== install oh-my-zsh OK\n\n"

    [ -L ~/.zshrc ] || {
        mv ~/.zshrc ~/.zshrc.bak;
            ln -s ${manjaroconfdir}/zshrc ~/.zshrc;
        }
    echo -e "====== .zshrc OK\n\n"

    [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/.git ] || {
        git clone https://github.com.cnpmjs.org/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting;
            cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting;
            git remote set-url origin https://github.com/zsh-users/zsh-syntax-highlighting.git;
            cd ~;
        }
    echo -e "====== zsh-syntax-highlighting OK\n\n"
    [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/.git ] || {
        git clone https://github.com.cnpmjs.org/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions;
            cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions;
            git remote set-url origin https://github.com/zsh-users/zsh-autosuggestions;
            cd ~;
        }
    echo -e "====== zsh-autosuggestions OK\n\n"
    exit
}

[ $# -eq 1 ] && {
   [ $1 == 'vim' ] && cfgvim
   [ $1 == 'ohmyzsh' ] && cfgohmyzsh
}


sudo pacman-mirrors -i -c China -m rank
echo -e "====== pacman-mirrors OK\n\n"

[ -f /etc/pacman.conf.bak ] || sudo cp /etc/pacman.conf /etc/pacman.conf.bak
grep 'http://mirrors\.tuna\.tsinghua\.edu\.cn' /etc/pacman.conf || sudo sh -c 'cat >> /etc/pacman.conf << EOF
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = http://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch
EOF'
echo -e "====== pacman.conf OK\n\n"

sudo pacman -Syyu
sudo pacman -S archlinuxcn-keyring
echo -e "====== pacman -Syyu OK\n\n"

[ -d ~/li ] || mkdir ~/li
[ -d ~/li/.zbb/.git ] || git clone https://gitee.com/humble-zh/zhbox-blog.git ~/li/.zbb


src=${manjaroconfdir}/fonts/zhfonts
dest=/usr/share/fonts
[ -d ${src} ] || { echo "${src} fonts zhfonts not found"; exit 1; }
[ -d ${dest}/zhfonts ] || {
    sudo pacman -Sy wqy-microhei;
    sudo cp -r ${src} ${dest};
    cd ${dest}/zhfonts;
    sudo mkfontscale;
    sudo mkfontdir;
    sudo fc-cache -fv;
    cd;
}
echo -e "====== zhfonts OK\n\n"


[ -L ~/.i3/config ] || { mv ~/.i3/config ~/.i3/config.bak; ln -s ${manjaroconfdir}/i3/config ~/.i3/config; }
[ -L ~/.i3status.conf ] || { ln -s ${manjaroconfdir}/i3status.conf ~/.i3status.conf; }
echo -e "====== i3/config OK\n\n"

sudo pacman -S firefox-i18n-zh-cn
[ -f ~/.config/mimeapps.list.bak ] || cp ~/.config/mimeapps.list ~/.config/mimeapps.list.bak
sed -i 's/userapp-Pale Moon/firefox/g' ~/.config/mimeapps.list
sed -i '/export BROWSER=/ { s/\/usr\/bin\/.*$/\/usr\/bin\/firefox/g; }' ~/.profile
grep '^export BROWSER=' ~/.profile || echo 'export BROWSER=/usr/bin/firefox' >> ~/.profile
grep '^fcitx' ~/.profile || echo 'fcitx' >> ~/.profile
sudo pacman -Rns local/palemoon-bin
echo -e "====== firefox OK\n\n"


sudo sed -i '/^conky.*conky1\.10_shortcuts_maia/ { s/^/# /g; }' /usr/bin/start_conky_maia
echo -e "====== shortcuts_maia OK\n\n"


sudo pacman -S fcitx fcitx-im fcitx-configtool fcitx-ui-light ttf-dejavu adobe-source-han-sans-otc-fonts fcitx-libpinyin fcitx-sunpinyin fcitx-cloudpinyin

sed -i '/^export GTK_IM_MODULE=/ { s/^.*$/export GTK_IM_MODULE=fcitx/g; }' ~/.xprofile
grep '^export GTK_IM_MODULE=' ~/.xprofile || echo 'export GTK_IM_MODULE=fcitx' >> ~/.xprofile
sed -i '/^export QT_IM_MODULE=/ { s/^.*$/export QT_IM_MODULE=fcitx/g; }' ~/.xprofile
grep '^export QT_IM_MODULE=' ~/.xprofile || echo 'export QT_IM_MODULE=fcitx' >> ~/.xprofile
sed -i '/^export XMODIFIERS=/ { s/^.*$/export XMODIFIERS="@im=fcitx"/g; }' ~/.xprofile
grep '^export XMODIFIERS=' ~/.xprofile || echo 'export XMODIFIERS="@im=fcitx"' >> ~/.xprofile
echo -e "====== fcitx OK\n\n"


sed -i '/^export EDITOR=/ { s/^.*$/export EDITOR=\/usr\/bin\/vim/g; }' ~/.profile
grep '^export EDITOR=' ~/.profile || echo 'export EDITOR=/usr/bin/vim' >> ~/.profile
echo -e "====== EDITOR OK\n\n"


sudo pacman -S ntp
#sudo timedatectl set-ntp true
sudo timedatectl set-local-rtc true
echo -e "====== ntp OK\n\n"

[ -f /usr/share/conky/conky_maia.bak ] || sudo cp /usr/share/conky/conky_maia /usr/share/conky/conky_maia.bak
sudo sed -i 's/Bitstream Vera/anti/g' /usr/share/conky/conky_maia
echo -e "====== right top fonts OK\n\n"

sudo pacman -S ctags vim sshpass mosquitto scrot inkscape the_silver_searcher fzf base-devel cmake unrar unzip yay netcat cloc smplayer you-get tcpdump wireshark-qt
echo -e "====== software OK\n\n"

sudo pacman -Rns $(pacman -Qdtq)
echo -e "====== Delete Rns OK\n\n"

sudo grep 'raw\.githubusercontent\.com' /etc/hosts || { sudo sh -c 'echo "199.232.28.133 raw.githubusercontent.com" >> /etc/hosts'; }

pacman -Ql albert || yay -S albert
