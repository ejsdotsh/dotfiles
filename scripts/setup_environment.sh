#!/usr/bin/env bash
#
# script to stop copying dotfiles, and make keeping them in sync between hosts
# that much easier.
# - check to see if files/directories already exist
# - move existing files and directories
# - create soft links between /home/${user}/${dotfile} and ./dotfiles/${dotbashfile}
# - report what has/has not been done

# set some variables
WD=$(dirname $(pwd))

for dotbashfile in $(ls ${WD}/dotfiles/.bash*)
do
	if [ -f ~/$(basename ${dotbashfile}) ]
	then
		if [ -L ~/$(basename ${dotbashfile}) ]
		then
			echo "$(basename ${dotbashfile}) already linked"
		else
			mv ~/$(basename ${dotbashfile}) ~/$(basename ${dotbashfile}).bak
			ln -s ${dotbashfile} ~/$(basename ${dotbashfile})
		fi
	else
		ln -s ${dotbashfile} ~/$(basename ${dotbashfile})
	fi
done

# .config directory
if [ ! -d ~/.config ]
then
	if [ ! -L ~/.config ]
	then
		ln -s ${WD}/dotfiles/config/ ~/.config
	fi
else
	# directory already exists, just add symlinks
	for configdir in $(ls ${WD}/dotfiles/config/)
	do
		if [ -d ~/.config/${configdir} ]
		then
			if [ -L ~/.config/${configdir} ]
			then
				echo "${configdir} is already linked"
			else
				mv ~/.config/${configdir} ~/.config/${configdir}.bak
				ln -s ${WD}/dotfiles/config/${configdir}/ ~/.config/${configdir}
			fi
		else
			ln -s ${WD}/dotfiles/config/${configdir}/ ~/.config/${configdir}
		fi
	done
fi
