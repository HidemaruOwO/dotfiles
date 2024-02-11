#!/usr/bin/env bash

if [ ! $# == 1 ]; then
	echo "⚠ Need 1 argument"
	echo "Usage: setDefaultShell.sh <path to shell>"
	exit 1
fi

echo $(which $1) | sudo tee -a /etc/shells

if type $1 >/dev/null 2>&1; then
	if [ "$(uname)" == "Darwin" ]; then
		sudo chsh -s $(which fish)
	else
		sudo chsh $USER -s $(which fish)
	fi
fi
