#
# - ~/.path       is used to extend `$PATH`
# - ~/.exports    centralize all `export`s
# - ~/.aliases    centralize all aliases
# - ~/.functions  should probably go into ~/bin
# - ~/.bash_prompt  make the command-line look nicer

for ff in ~/.{path,exports,aliases,functions,bash_prompt}; do
  [[ -r "${ff}" ]] && [[ -f "${ff}" ]] && source "${ff}";
done
# cleanup
unset ff;

# exit if not an interactive shell
[[ -z "$PS1" ]] && return



# load ssh keys
ssh-add -A 2> /dev/null
