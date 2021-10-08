# My R1C3

![](./rice.PNG)

> Race Inspired Cosmetic Enhancements. (R.I.C.E.) Parts put on cars to make them look fast, when they have no internal tuning, and are actually slow as hell. Parts usually consist of excessively angular bodykits, large rear spoilers, neon, sponsor stickers, chrome rims, fake "coffee can" exhaust tips, and loud, annoying paint jobs and/or vynils. Sometimes parts are do-it-yourself installed and are basically duct taped to the car. Most commonly known for being done to Honda Civics, but can also be done to slow domestic vehicles, such as a Chevy Cavalier, etc.

[urban dictionary](https://www.urbandictionary.com/define.php?term=rice) by Dusk Coffee at December 20, 2004

**Long story short**: Personal unique configuration of an operating system

## What's in there?

This is my [Ansible](https://www.ansible.com/) playbook to automatically configure a fresh installation. The following roles are in use:

- [basic](https://github.com/Allaman/ansible-role-basic) installs common/basic packages via package manager
- [packages](https://github.com/Allaman/ansible-role-packages) installs packages via package manager and an AUR helper
- [system](https://github.com/Allaman/ansible-role-system) configure system related settings
- [pip](https://github.com/Allaman/ansible-role-pip) install python packages via pip as current user
- [binaries](https://github.com/Allaman/ansible-role-binaries) "installs" applications by downloading its binary and placing them in PATH
- [dotfiles](https://github.com/Allaman/ansible-role-dotfiles) configure my public [dotfiles](https://github.com/Allaman/dotfiles)
- [shell](https://github.com/Allaman/ansible-role-shell) install shell tools

Please have a look at the role's README for further details. All roles are developed for both Debian based and Arch based systems but only used on the latter one.

## Requirements

The only requirement is a working pip installation (and of course Python3)

## Use

```sh
❯ make
help                           This help.
bootstrap                      Install ansible (pip required)
install                        Install roles via ansible-galaxy
configure                      Run ansible-playbook
aur                            Run AUR helper to install AUR packages
all                            Run all goals (except AUR)
```
