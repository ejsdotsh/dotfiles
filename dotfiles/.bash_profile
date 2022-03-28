# Add stuff to `$PATH`
export GOPATH="${HOME}/go"
if [ $(uname -s) == "Darwin" ]; then
  export GOROOT="$(brew --prefix golang)/libexec"
else
  export GOROOT="/usr/lib/go"
fi
export PATH="$HOME/bin:${GOPATH}/bin:${GOROOT}/bin:$PATH:/usr/local/protobuf/bin"

# set editor
export editor=nvim

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  alias vi='nvim'
fi

# add colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# load ssh keys
ssh-add -A 2> /dev/null

# add colors to `go test`
function go_test() {
    go test $* | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/SKIP/s//$(printf "\033[34mSKIP\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | GREP_COLOR="01;33" egrep --color=always '\s*[a-zA-Z0-9\-_.]+[:][0-9]+[:]|^'
}

# bash prompt
. ~/.bash_prompt


# aliases
alias ls='ls --color'
alias mkpy='python3 -m venv venv && venv/bin/python3 -m pip install -U pip setuptools wheel black'
alias mkgomod='go mod init github.com/joshuaejs/$(basename $(pwd))'
alias rebash='source ~/.bashrc'
alias pipupall='python3 -m pip freeze | awk -F'\''=='\'' '\''{print $1}'\'' | xargs python3 -m pip install -U'
alias unbrewall='brew uninstall --formula $(brew list)'
alias run_conductor='docker run -it --rm -u annar -w /home/annar -v ~/repo/joshuaejs/annar:/home/annar/annar conductor bash'
#alias ansible='docker run -v "${PWD}":/work:ro --rm conductor:latest'
#alias ansible-playbook='docker run -v "${PWD}":/work:ro -v ~/.ansible/roles:/root/.ansible/roles -v ~/.ssh:/root/.ssh:ro --rm conductor:latest ansible-playbook'
#alias ansible-vault='docker run -v "${PWD}":/work:ro --rm conductor:latest ansible-vault'
