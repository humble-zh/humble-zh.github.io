#!/bin/bash

mkdir -p ~/li

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

    [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/.git ] || {
        git clone https://github.com.cnpmjs.org/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting;
        cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting;
        grset origin https://github.com/zsh-users/zsh-syntax-highlighting.git;
        cd ~;
    }
    echo -e "====== zsh-syntax-highlighting OK\n\n"

    [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/.git ] || {
        git clone https://github.com.cnpmjs.org/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions;
        cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions;
        grset origin https://github.com/zsh-users/zsh-autosuggestions;
        cd ~;
    }
    echo -e "====== zsh-autosuggestions OK\n\n"

    [ -f ~/.zshrc.bak ] || {
        mv ~/.zshrc ~/.zshrc.bak;
    }
    echo "please repace your ~/.zshrc"
    exit
}

[ $# -eq 1 ] && {
    [ $1 == 'vim' ] && cfgvim
    [ $1 == 'ohmyzsh' ] && cfgohmyzsh
}


apt-get remove libreoffice-common unity-webapps-common thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku landscape-client-ui-install onboard deja-dup

add-apt-repository -y ppa:neovim-ppa/unstable
apt-get update
apt-get upgrade
apt-get dist-upgrade
apt-get autoremove
apt-get autoclean
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P

apt-get install -y git openssh-server silversearcher-ag ctags exuberant-ctags autojump curl jq net-tools cloc python3-pip neovim zsh

pip3 install neovim
update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
update-alternatives --config vi
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
update-alternatives --config vim
update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
update-alternatives --config editor

grep 'raw\.githubusercontent\.com' /etc/hosts || { echo '199.232.28.133 raw.githubusercontent.com' >> /etc/hosts; }


grep "local\/go\/bin" /etc/environment || {
    apt-get purge golang*  # 卸载旧版1.6
    rm -rf /usr/lib/go-1.6/ /usr/lib/go-1.6/src/ /usr/lib/go-1.6/src/runtime/ /usr/lib/go-1.6/src/runtime/race
    cd /tmp
    curl -O https://dl.google.com/go/go1.17.1.linux-386.tar.gz
    tar -C /usr/local -xzf go1.17.1.linux-386.tar.gz
    sed -i '/PATH="/ { s/"$/:\/usr\/local\/go\/bin"/g; }' /etc/environment
    source /etc/environment
    go env -w GO111MODULE=on
    go env -w GOPROXY=https://goproxy.cn,direct
    rm /tmp/go1.17.1.linux-386.tar.gz
    cd
}


[ -d ~/.fzf/.git ] || {
    git clone --depth 1 https://github.com.cnpmjs.org/junegunn/fzf.git ~/.fzf && {
        cd ~/.fzf/;
        git remote set-url origin https://github.com/junegunn/fzf.git;
        bash -x ~/.fzf/install
        cd;
    }
}
