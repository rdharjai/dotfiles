# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="rd-passion"

# Plugins
plugins=(
	git 
	zsh-syntax-highlighting 
	zsh-autosuggestions
)

# source
source $ZSH/oh-my-zsh.sh

# alias - general
alias mv='mv -i'
alias sl='ls'
alias ll='ls -alh'
alias d='dirs -v | head -10'

# alias - git
alias gs='git status'
alias ga='git add .'

# alias - config files
alias aconf='vim ~/.alacritty.yaml'
alias aload='source ~/.alacritty.yaml'
alias zconf='vim ~/.zshrc'
alias zload='source ~/.zshrc'
alias vconf='vim ~/.vimrc'
alias vload='source ~/.vimrc'
alias tconf='vim ~/.tmux.conf'
alias tload='source ~/.tmux.conf'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Start tmux by default
if [ "$TMUX" = "" ]; then tmux; fi
