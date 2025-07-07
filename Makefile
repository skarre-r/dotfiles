include .env
export

.PHONY: install
install: install-homebrew install-nix install-nix-darwin

# homebrew

BREW_INSTALLED := $(shell command -v /opt/homebrew/bin/brew 2> /dev/null)

.PHONY: install-homebrew
install-homebrew:
ifndef BREW_INSTALLED
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
endif

# nix

NIX_INSTALLED := $(shell command -v nix 2> /dev/null)
NIX_DARWIN_INSTALLED := $(shell command -v darwin-rebuild 2> /dev/null)

.PHONY: install-nix
install-nix:
ifndef NIX_INSTALLED
	@echo "Installing Nix..."
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
endif

.PHONY: install-nix-darwin
install-nix-darwin:
ifdef NIX_INSTALLED
ifndef NIX_DARWIN_INSTALLED
	@echo "Installing nix-darwin..."
	nix run nix-darwin -- switch --flake ${CURDIR}#default
endif
endif

.PHONY: uninstall
uninstall:
ifdef NIX_INSTALLED
	/nix/nix-installer uninstall
endif
