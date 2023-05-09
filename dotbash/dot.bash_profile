if [[ "${OSTYPE}" =~ ^linux ]]; then
	if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
		exec sway --unsupported-gpu
	fi
fi

[ -n "$PS1" ] && source ~/.bashrc

