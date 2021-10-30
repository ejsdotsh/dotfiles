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

for dotbashfile in `ls ${WD}/dotfiles/.bash*`
do
	if [ -f ~/${dotbashfile} ]
	then
		if [ -L ~/${dotbashfile} ]
		then
			echo "${dotbashfile} already linked"
		else
			mv ~/${dotbashfile} ~/${dotbashfile}.bak
			ln -s ${WD}/dotfiles/${dotbashfile} ~/${dotbashfile}
		fi
	else
		ln -s ${WD}/dotfiles/${dotbashfile} ~/${dotbashfile}
	fi
done

# .config directory
if [ ! -d ~/.config ]
then
	ln -s ${WD}/dotfiles/config/ ~/.config
else
	for configdir in `ls ${WD}/dotfiles/config/`
	do
		if [ -d ~/.config/${configdir} ]
		then
			if [ -L ~/.config/${configdir} ]
			then
				echo "${configdir} is already linked"
			else
				mv ~/.config/${configdir} ~/.config/${configdir}.bak
				ln -s ${working_dir}/config/${configdir}/ ~/.config/${configdir}
			fi
		else
			ln -s ${WORKING_DIR}/config/${configdir}/ ~/.config/${configdir}
		fi
	done
fi
