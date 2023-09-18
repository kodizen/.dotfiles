.PHONY: all install link unlink

all: link

install:
	@echo "Running install scripts..."
	./install-mac.sh
	./setup-cron.sh

link:
	@echo "Creating symlinks..."
	ln -sfn $(PWD)/.config ~/.config
	ln -sfn $(PWD)/.newsboat ~/.newsboat
	ln -sfn $(PWD)/.zshrc ~/.zshrc

unlink:
	@echo "Removing symlinks..."
	rm -rf ~/.config
	rm -rf ~/newsboat

update:
	@echo "Updating dotfiles from repository..."
	git pull origin master
	make link

ohmyzsh:
	@echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sync:
	@echo "Syncing dotfiles to repository..."
	git add .
	git commit -m "Syncing dotfiles"
	git push origin main

backup:
	@echo "Backing up current configuration..."
	tar czf dotfiles_backup_$(shell date +%Y%m%d%H%M%S).tar.gz ~/.config ~/.newsboat ~/.zshrc

system-check:
	@echo "Checking system type..."
	uname

dependencies:
	@echo "Installing dependencies..."

clean:
	@echo "Cleaning up..."
	
