#!/usr/bin/env bash
echo "start"
echo "welcome to lab"

command_exists() {
	type "$1" &> /dev/null;
}

install_package_nix() {
	nix-env -f '<nixpkgs>' -iA $1
}

if ! command_exists vim;
then
	echo "installing vim..."
	install_package_nix vim
else
	echo "vim installed"
fi

if ! command_exists git;
then
	echo "installing git..."
	install_package_nix git
else
	echo "git installed"
fi
