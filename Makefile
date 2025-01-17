
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

.PHONY: update
update:
ifdef NIX_INSTALLED
	nix flake update
endif

# TODO: add reusable "darwin-rebuild switch" command with module arg(s)

.PHONY: home
home:
ifdef NIX_INSTALLED
ifdef NIX_DARWIN_INSTALLED
	darwin-rebuild switch --flake ${CURDIR}#home
endif
endif

.PHONY: work
work:
ifdef NIX_INSTALLED
ifdef NIX_DARWIN_INSTALLED
	darwin-rebuild switch --flake ${CURDIR}#work
endif
endif

.PHONY: check-nix-module
check-nix-module:
	@ if [ "${NIX_MODULE}" == "" ]; then exit 1; fi
	@ if [ "${NIX_MODULE}" != "home" ] && [ "${NIX_MODULE}" != "work" ]; then exit 1; fi
	@ echo "using nix module: ${NIX_MODULE}"

NIX_MODULE_TARGET := $(shell echo "${CURDIR}#${NIX_MODULE}")

.PHONY: nix
nix: check-nix-module
	darwin-rebuild switch --flake ${NIX_MODULE_TARGET}

.PHONY: rebuild
rebuild: nix

.PHONY: upgrade
upgrade: update rebuild

# stow

.PHONY: stow
stow:
	stow --target=${HOME} --stow .

.PHONY: delete
delete:
	stow --target=${HOME} --delete .

.PHONY: unstow
unstow: delete

.PHONY: restow
restow:
	stow --target=${HOME} --restow .
