if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

eval ssh-agent -s > /dev/null
fish_add_path /home/nymk/.spicetify

alias ls="exa -la"
alias dot="git --git-dir=$HOME/.dot --work-tree=$HOME"
