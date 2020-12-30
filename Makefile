# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

galaxy=~/.local/bin/ansible-galaxy
playbook=~/.local/bin/ansible-playbook

bootstrap: ## Install python and ansible
	@echo 'Bootstraping your system for ansible (pip must be available)'
	pip install ansible --user

install: ## Install roles via ansible-galaxy
	@echo 'Installing roles via ansible-galaxy'
	$(galaxy) install -r requirements.yml -f

configure: ## Run ansible
	@echo 'Run ansible-playbook'
	$(playbook) play.ym -K

aur: ## Run yay to install aur packages
	@echo 'Install AUR packages'
	yay -S masterpdfeditor urlview telepresence visual-studio-code-insiders rofi-emoji vidir glow


all: bootstrap install configure ## Run all goals
	@echo 'Applying R1c3'
	docker build $(BUILDARGS) -t $(NAME) .
