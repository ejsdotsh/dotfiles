#!/bin/bash
#
# - ~/.path       is used to extend `$PATH`
# - ~/.exports    centralize all `export`s
# - ~/.aliases    centralize all aliases
# - ~/.functions  should probably go into ~/bin
# - ~/.bash_prompt  make the command-line look nicer

# exit if not an interactive shell
[[ -z "$PS1" ]] && return

shopt -s checkwinsize

for bf in ~/.{path,exports,aliases,functions,bash_prompt}; do
  [[ -r "${bf}" ]] && [[ -f "${bf}" ]] && source "${bf}";
done
# cleanup
unset bf;


# load ssh keys
ssh-add -A 2> /dev/null

