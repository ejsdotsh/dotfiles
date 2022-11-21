#!/usr/bin/env bash
#
# script to stop copying dotfiles, and make keeping them in sync between hosts
# that much easier.
# - create soft links between /home/${user}/${dotfile} and the versioned files
# - report what has/has not been done
#
# usage: ./setup_environment.sh


function dotfiles()  {
	# get list of files
	for db in $(ls $(pwd)/dotbash/dot.*); do
		if [[ ! -f ~/${db/*dot/} ]]; then

			echo "ln -brs ${db} ~/${db/*dot/}"
			# ln -brs ${dotbash} ~/${dotbash/*dot/}
		fi
	done
}

function dotconfig() {
	for dc in $(ls $(pwd)/dotconfig); do
		if [[ ! -L ~/.config/${dc} ]]; then
			echo "ln -brs $(pwd)/dotconfig/${dc} ~/.config/${dc}"
		# ln -brs $(pwd)/${dc} ~/.config/${dc}
		fi
	done
}

function dotssh() {
	for ds in $(ls $(pwd)/dotssh); do
		if [[ ! -f ~/.ssh/${ds} ]]; then
			echo "ln -brs $(pwd)/dotssh/${ds} ~/.ssh/${ds}"
			# ln -brs $(pwd)/dotssh/${ds} ~/.ssh/${ds}
		fi
	done
}

dotfiles
dotconfig
dotssh
