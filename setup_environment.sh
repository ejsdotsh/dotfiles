#!/usr/bin/env bash
#
# script to stop copying dotfiles, and make keeping them in sync between hosts
# that much easier.
# - create soft links between /home/${user}/${dotfile} and the versioned files
# - report what has/has not been done
#
# usage: ./setup_environment.sh

if [[ "$OSTYPE" =~ ^darwin ]]; then
	echo "darwin"
	# alias ln="ln -s"
# else
	# alias ln="ln -sr"
fi


function dotfiles()  {
	# get list of files
	for db in $(ls $(pwd)/dotbash/dot.*); do
		if [[ -e ~/"${db/*dot/}" ]]; then
			echo "~/${db/*dot} ~/${db/*dot}-bak"
			mv ~/"${db/*dot}" ~/"${db/*dot}"-bak
		elif [[ -L ~/"${db/*dot/}" ]]; then
			echo "unlink ~/${db/*dot}"
			unlink ~/"${db/*dot}"
		fi
		echo "ln -s ${db} ~/${db/*dot/}"
		ln -s "${db}" ~/"${db/*dot/}"
	done
}

function dotconfig() {
	for dc in $(ls $(pwd)/dotconfig); do
		if [[ -d ~/.config/${dc} ]]; then
			echo "mv ~/.config/${dc} ~/.config/${dc}-bak"
			mv ~/.config/"${dc}" ~/.config/"${dc}-bak"
		elif [[ -L ~/.config/${dc} ]]; then
			echo "unlink ~/.config/${dc}"
			unlink ~/.config/"${dc}"
		fi
		echo "ln -s $(pwd)/dotconfig/${dc} ~/.config/${dc}"
		ln -s "$(pwd)"/dotconfig/"${dc}" ~/.config/"${dc}"
	done
}

function dotssh() {
	for ds in $(ls $(pwd)/dotssh); do
		if [[ -f ~/.ssh/"${ds}" ]]; then
			echo "mv ~/.ssh/${ds} ~/.ssh/${ds}-bak"
		elif [[ -L ~/.ssh/"${ds}" ]]; then
			echo "unlink ~/.ssh/${ds}"
		fi
		echo "ln -rs $(pwd)/dotssh/${ds} ~/.ssh/${ds}"
	done
}

dotfiles
dotconfig
# dotssh
