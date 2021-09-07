# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

AUR_HELPER:=$(shell type -p yay || echo paru)
ifneq (,$(findstring yay,$(EDITOR)))
	AUR_HELPER:=yay
else
	AUR_HELPER:=paru
endif


bootstrap: req-pip ## Install ansible (pip required)
	@echo 'Bootstraping your system for ansible'
	pip install ansible --user

install: req-galaxy ## Install roles via ansible-galaxy
	@echo 'Installing roles via ansible-galaxy'
	ansible-galaxy install -r requirements.yml -f

configure: req-playbook ## Run ansible
	@echo 'Run ansible-playbook'
	ansible-playbook play.yml -K

aur: ## Run AUR helper to install AUR packages
	@echo 'Install AUR packages'
	$(AUR_HELPER) -S masterpdfeditor urlview telepresence vscodium-bin rofi-emoji vidir glow google-cloud-sdk aws-session-manager-plugin postman nerd-fonts-fira-code

all: bootstrap install configure ## Run all goals
	@echo 'Applying R1c3'
	bootstrap install configure aur

req-pip:
	@command -v pip >/dev/null 2>&1 || { echo >&2 "require pip"; exit 1; }

req-galaxy:
	@command -v ansible-galaxy >/dev/null 2>&1 || { echo >&2 "require ansible-galaxy"; exit 1; }

req-playbook:
	@command -v ansible-playbook >/dev/null 2>&1 || { echo >&2 "require ansible-playbook"; exit 1; }
