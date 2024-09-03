
.PHONY: brew
brew:
	brew update
	brew bundle install --no-lock --file Brewfile.rb

.PHONY: home
home: brew
	brew bundle install --no-lock --file Brewfile.home.rb

.PHONY: work
work: brew
	brew bundle install --no-lock --file Brewfile.work.rb

.PHONY: update
update:
	brew update
	brew upgrade

.PHONY: symlinks
symlinks:
	@echo "not implemented"

.PHONY: install
install:
	@echo "not implemented"
