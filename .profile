alias gs="git status"
alias gc="git commit -v"
alias diff="git diff"
alias ga="git add"
alias gp="git push"
alias pull="git pull"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# git autocomplete
source ~/.git-completion.bash

# prompt

function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="\n\t \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# asdf
. "/opt/homebrew/opt/asdf/libexec/asdf.sh"
. "/opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tom.harrold/dev/google-cloud-sdk/path.bash.inc' ]; then . '/Users/tom.harrold/dev/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tom.harrold/dev/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/tom.harrold/dev/google-cloud-sdk/completion.bash.inc'; fi
