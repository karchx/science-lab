#!/usr/bin/env bash

user="stivscience"
fullname="karchx"

echo "start"
echo "welcome to lab"

configure_user() {
	# SET YOUR USER!
	if id $user &> /dev/null; then
		echo "user exists"
	else
		echo "configuring user..."
		useradd -c $fullname -m $user
		passwd $user
	fi
}

command_exists() {
	type "$1" &> /dev/null;
}

install_package_nix() {
	nix-env -f '<nixpkgs>' -iA $1
}

configure_user

sleep 1

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

if ! command_exists home-manager;
then
	echo "installing home-manager..."
else
	echo "home-manager installed"
fi
