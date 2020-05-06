export ZSH="/home/delltor/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    bundler
    dotenv
    web-search
    sudo
    zsh-syntax-highlighting
    zsh-autosuggestions
 )

 if [ -f ~/.aliasFile ]; then
     . ~/.aliasFile
 fi

source $ZSH/oh-my-zsh.sh
source /home/delltor/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
