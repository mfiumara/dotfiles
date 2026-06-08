#!/bin/bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
	echo "Homebrew is required: https://brew.sh"
	exit 1
fi

packages=(
	neovim
	node
	ripgrep
	tmux
	code-minimap
	python3
)

missing=()
for package in "${packages[@]}"; do
	if ! brew list --formula "$package" >/dev/null 2>&1; then
		missing+=("$package")
	fi
done

if [ "${#missing[@]}" -eq 0 ]; then
	echo "All Homebrew packages are already installed."
	exit 0
fi

echo "Installing missing Homebrew packages: ${missing[*]}"
brew install "${missing[@]}"
