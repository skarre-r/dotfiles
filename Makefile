.PHONY: install-nix install-nix-darwin install uninstall update home work stow delete restow

NIX_INSTALLED := $(shell command -v nix 2> /dev/null)
NIX_DARWIN_INSTALLED := $(shell command -v darwin-rebuild 2> /dev/null)

install-nix:
ifndef NIX_INSTALLED
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
endif

install-nix-darwin:
ifdef NIX_INSTALLED
ifndef NIX_DARWIN_INSTALLED
	nix run nix-darwin -- switch --flake ${CURDIR}#default
endif
endif

install: install-nix install-nix-darwin

uninstall:
ifdef NIX_INSTALLED
	/nix/nix-installer uninstall
endif

update:
ifdef NIX_INSTALLED
	nix flake update
endif

home:
ifdef NIX_INSTALLED
ifdef NIX_DARWIN_INSTALLED
	darwin-rebuild switch --flake ${CURDIR}#home
endif
endif

work:
ifdef NIX_INSTALLED
ifdef NIX_DARWIN_INSTALLED
	darwin-rebuild switch --flake ${CURDIR}#work
endif
endif

stow:
	stow --target=${HOME} --stow .

delete:
	stow --target=${HOME} --delete .

restow:
	stow --target=${HOME} --restow .
