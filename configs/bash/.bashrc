alias ls="ls --color"
alias g++="g++ -std=c++20"
alias l1="ls --color -1"
alias ll="ls --color -la"
alias ldir="la -ad1 */"

alias tg='telegram-desktop'
#. ~/.root/root/bin/thisroot.sh

#source ~/.root/root/bin/thisroot.sh

alias music="firefox https://beta.music.apple.com/us/browse"

alias icat="kitty +kitten icat"

#set to true or false
#alias desktop-icons="gsettings set org.mate.background show-desktop-icons"

#alias random-wallpaper='bash ~/coding/bash/scripts/random_wallpaper.sh'
#alias set-wallpaper='nitrogen --set-zoom-fill'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)


# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences
#cat ~/.config/wpg/sequences
# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

#disable asteriscs when typin passwords in terminal
#sudo mv /etc/sudoers.d/0pwfeedback /etc/sudoers.d/0pwfeedback.disabled 

#change hostname: hostnamectl set-hostname DESIRED-HOSTNAME

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/alessandro/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/alessandro/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
#
#remove duplicates: fdupes -rdN dir/

home_bin=~/bin
export PATH=$home_bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/alessandro/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/alessandro/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/alessandro/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/alessandro/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#. "$HOME/.cargo/env"

alias scivenv="source /home/ale/coding/python/venvs/scivenv/bin/activate"
alias envenv="source /home/ale/coding/python/venvs/envenv/bin/activate"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\[\e[38;5;217m\]$(echo $PWD | sed "s|^$HOME|~|")\[\e[0;36m\]$(parse_git_branch)\[\e[0m\] \[\e[1;32m\]$(if [[ $? == 0 ]]; then echo "\[\e[38;5;190m\]→"; else echo "\[\e[0;31m\]→"; fi)\[\e[0m\] '
