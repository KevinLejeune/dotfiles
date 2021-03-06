COMPUTER_NAME := 'MBA'

usage:
	@echo brew - Install brew and brew-cask
	@echo vagrant - Install vagrant, packer and plugins

brew: /usr/local/bin/brew
/usr/local/bin/brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > /tmp/brew-installer.sh
	chmod +x /tmp/brew-installer.sh
	/tmp/brew-installer.sh
	brew install caskroom/cask/brew-cask
	brew tap gapple/services
	brew tap caskroom/fonts

cmake: brew /usr/local/bin/cmake
/usr/local/bin/cmake:
	brew install cmake

iterm2: font-sourcecode /Applications/iTerm.app
/Applications/iTerm.app:
#	git clone https://github.com/tornad/iterm2-borderless.git /tmp/iterm2
#	mv /tmp/iterm2/iTerm.app /Applications/
#	rm -rf /tmp/iterm2

font-sourcecode: ~/Library/Fonts/Sauce\ Code\ Powerline\ Light.otf
~/Library/Fonts/Sauce\ Code\ Powerline\ Light.otf:
	brew cask install font-source-code-pro-for-powerline

font-anonymous: ~/Library/Fonts/Anonymice\ Powerline.ttf
~/Library/Fonts/Anonymice\ Powerline.ttf:
	brew cask install font-anonymous-pro-for-powerline

mancy: ~/Applications/Mancy.app
~/Applications/Mancy.app:
	brew cask install mancy

soulseek: ~/Applications/SoulseekQt.app
~/Applications/SoulseekQt.app:
	brew cask install soulseek

imagemagick: brew /usr/local/bin/jpegtran
/usr/local/bin/jpegtran:
	brew install imagemagick

gpg: brew /usr/local/bin/gpg-agent /usr/local/bin/gpg /usr/local/bin/pinentry-mac
/usr/local/bin/gpg:
	brew install gpg
/usr/local/bin/gpg-agent:
	brew install gpg-agent
/usr/local/bin/pinentry-mac:
	brew install pinentry-mac

gpg-config:
	sed -i .bck 's/^# use-agent/use-agent/' ~/.gnupg/gpg.conf
	echo 'use-standard-socket' > ~/.gnupg/gpg-agent.conf
	echo 'pinentry-program /usr/local/bin/pinentry-mac' > ~/.gnupg/gpg-agent.conf

ghi: brew /usr/local/bin/ghi
/usr/local/bin/ghi:
	brew install ghi

ranger: brew /usr/local/bin/ranger
/usr/local/bin/ranger:
	brew install ranger

youtube-dl: brew /usr/local/bin/youtube-dl
/usr/local/bin/youtube-dl:
	brew install youtube-dl

prezto: ~/.zprezto ~/.zpreztorc ~/.zlogin ~/.zlogout ~/.zprofile ~/.zshenv ~/.zshrc
~/.zprezto:
	git clone --recursive https://github.com/sorin-ionescu/prezto.git $@
~/.zlogin ~/.zlogout ~/.zprofile ~/.zshenv:
	ln -s ~/.zprezto/runcoms/$(subst .,,$(notdir $@)) $@
~/.zshrc:
	ln -s ~/.dotfiles/zsh/zshrc $@
~/.zpreztorc:
	ln -s ~/.dotfiles/zsh/zpreztorc $@

watch: brew /usr/local/bin/watch
/usr/local/bin/watch:
	brew install watch

mtr: brew /usr/local/bin/mtr
/usr/local/bin/mtr:
	brew install mtr

travis:
	gem install travis

lftp: brew /usr/local/bin/lftp
/usr/local/bin/lftp:
	brew install lftp

shiftit: brew /usr/local/bin/shiftit
/usr/local/bin/shiftit:
	brew install Caskroom/cask/shiftit

siege: brew /usr/local/bin/siege
/usr/local/bin/siege:
	brew install siege

fzf: ~/.fzf
~/.fzf:
	git clone https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --no-update-rc

slate: brew ~/Applications/Slate.app
~/Applications/Slate.app:
	brew cask install mattr-slate

flux: brew ~/Applications/Flux.app
~/Applications/Flux.app:
	brew cask install flux

keycastr: brew /opt/homebrew-cask/Caskroom/keycastr/0.0.2-bezel/KeyCastr.app
/opt/homebrew-cask/Caskroom/keycastr/0.0.2-bezel/KeyCastr.app:
	brew cask install keycastr

slate-config: slate ~/.slate.js
~/.slate.js:
	ln -s ~/.dotfiles/slate/.slate.js ~/.slate.js

skype: brew /opt/homebrew-cask/Caskroom/skype/latest/Skype.app
/opt/homebrew-cask/Caskroom/skype/latest/Skype.app:
	brew cask install skype

vlc: brew ~/Applications/VLC.app
~/Applications/VLC.app:
	brew cask install vlc

google-chrome: brew ~/Applications/Google Chrome.app
~/Applications/Google Chrome.app:
	brew cask install google-chrome

postman: brew ~/Applications/Postman.app
~/Applications/Postman.app:
	brew install Caskroom/cask/postman

telephone: brew /opt/homebrew-cask/Caskroom/telephone/latest/telephone.app
/opt/homebrew-cask/Caskroom/telephone/latest/telephone.app:
	brew cask install telephone

sequel-pro: brew /opt/homebrew-cask/Caskroom/sequel-pro/latest/sequel-pro.app
/opt/homebrew-cask/Caskroom/sequel-pro/latest/sequel-pro.app:
	brew cask install sequel-pro

keepassx: brew /opt/homebrew-cask/Caskroom/keepassx/latest/keepassx.app
/opt/homebrew-cask/Caskroom/keepassx/latest/keepassx.app:
	brew cask install keepassx

dropbox: brew /opt/homebrew-cask/Caskroom/dropbox/latest/dropbox.app
/opt/homebrew-cask/Caskroom/dropbox/latest/dropbox.app:
	brew cask install dropbox

virtualbox: brew /usr/local/bin/VBoxHeadless
/usr/local/bin/VBoxHeadless:
	brew cask install virtualbox

packer: brew /usr/local/bin/packer
/usr/local/bin/packer:
	brew cask install homebrew/completions/packer-completion 

java: brew
	brew cask install java

slack: brew $(HOME)/Applications/Slack.app
$(HOME)/Applications/Slack.app:
	brew cask install slack

cloc: brew
	brew install cloc

jq: brew /usr/local/bin/jq
/usr/local/bin/jq:
	brew install jq

vagrant: brew virtualbox ansible /usr/local/bin/vagrant
/usr/local/bin/vagrant:
	brew cask install vagrant

ansible: brew /usr/local/bin/ansible
/usr/local/bin/ansible:
	brew install ansible

docker: brew virtualbox /usr/local/bin/docker
/usr/local/bin/docker:
	brew install docker
	brew install docker-machine
	docker-machine create --driver virtualbox dev

highlight: brew /usr/local/bin/highlight
/usr/local/bin/highlight:
	brew install highlight

ncdu: brew /usr/local/bin/ncdu
/usr/local/bin/ncdu:
	brew install ncdu

tig: brew /usr/local/bin/tig
/usr/local/bin/tig:
	brew install tig

vim: brew /usr/local/bin/vim
/usr/local/bin/vim:
	brew install vim

neovim: brew /usr/local/bin/nvim
/usr/local/bin/nvim:
	brew install neovim/neovim/neovim

~/.config:
	mkdir $@

vim-config: ~/.vimrc ~/.config vim neovim
~/.vimrc:
	ln -s ~/.dotfiles/vim ~/.vim
	ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
	ln -s ~/.vim ~/.config/nvim
	ln -s ~/.vimrc ~/.config/nvim/init.vim

instant-markdown: /usr/local/bin/instant-markdown-d
/usr/local/bin/instant-markdown-d:
	npm -g install instant-markdown-d

cli-tools: how2

how2: node /usr/local/bin/how2
/usr/local/bin/how2:
	@npm -g install how2

devtool: node /usr/local/bin/devtool
/usr/local/bin/devtool:
	@npm -g install devtool

tmux: brew /usr/local/bin/tmux
/usr/local/bin/tmux:
	brew install reattach-to-user-namespace
	brew install tmux

tmux-config: tmux ~/.tmux.conf
~/.tmux.conf:
	ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

tmuxinator: /usr/local/bin/tmuxinator
/usr/local/bin/tmuxinator:
	sudo gem install tmuxinator
	ln -s ~/.dotfiles/tmuxinator ~/.tmuxinator

the_silver_searcher: brew /usr/local/bin/ag
/usr/local/bin/ag:
	brew install the_silver_searcher

pgcli: brew /usr/local/bin/pgcli
/usr/local/bin/pgcli:
	brew install pgcli

memcached: brew /usr/local/bin/memcached
/usr/local/bin/memcached:
	brew install memcached

redis: brew /usr/local/bin/redis-server
/usr/local/bin/redis-server:
	brew install redis

mongodb: brew /usr/local/bin/mongo
/usr/local/bin/mongo:
	brew install mongodb

mongohacker: node /usr/local/lib/node_modules/mongo-hacker
/usr/local/lib/node_modules/mongo-hacker:
	@npm install -g mongo-hacker

rabbitmq: brew /usr/local/bin/rabbitmq
/usr/local/bin/rabbitmq:
	brew install rabbitmq

mariadb: brew /usr/local/bin/mysql
/usr/local/bin/mysql:
	brew install mariadb

mycli: brew /usr/local/bin/mycli
/usr/local/bin/mycli:
	brew install mycli

mutt: brew /usr/local/bin/mutt
/usr/local/bin/mutt:
	brew install mutt

mutt-config: ~/.muttrc
~/.muttrc:
	ln -s ~/.dotfiles/muttrc ~/.muttrc
	ln -s ~/.dotfiles/mutt ~/.mutt

fetchmail: brew /usr/local/bin/fetchmail
/usr/local/bin/fetchmail:
	brew install fetchmail

offlineimap: brew /usr/local/bin/offlineimap
/usr/local/bin/offlineimap:
	brew install offlineimap

php56:
	brew install homebrew/php/php56
	brew install homebrew/php/php56-memcache

phpcs: ~/.composer/vendor/bin/phpcs
~/.composer/vendor/bin/phpcs:
	@composer global require "squizlabs/php_codesniffer=*"

phpcs-rules: phpcs
	ln -s $(shell pwd)/.phpcs.xml ~/.phpcs.xml
	phpcs --config-set default_standard ~/.phpcs.xml

php-cs-fixer: brew
	brew install php-cs-fixer

phpmd: ~/.composer/vendor/bin/phpmd
~/.composer/vendor/bin/phpmd:
	@composer global require "phpmd/phpmd=*"

node: /usr/local/bin/node
/usr/local/bin/node:
	brew install node

jscs: node ~/.jscs.json
~/.jscs.json:
	@npm install -g jscs
	ln -s ~/.dotfiles/.jscs.json ~/.jscs.json

pomo: node /usr/local/bin/pomojs
/usr/local/bin/pomojs:
	@npm install -g pomo

bower: node /usr/local/bin/bower
/usr/local/bin/bower:
	@npm install -g bower

gulp: node /usr/local/bin/gulp
/usr/local/bin/gulp:
	@npm install -g gulp

cordova: node /usr/local/bin/cordova
/usr/local/bin/cordova:
	@npm install -g cordova

ionic: node /usr/local/bin/ionic
/usr/local/bin/ionic:
	@npm install -g ionic

clif: /usr/local/bin/clif
/usr/local/bin/clif:
	@npm install -g clif

jshint: node ~/.jshintrc
~/.jshintrc:
	@npm install -g jshint
	ln -s $(shell pwd)/.jshintrc ~/.jshintrc

eslint: node ~/.eslintrc
~/.eslintrc:
	@npm install -g eslint
	ln -s $(shell pwd)/.eslintrc ~/.eslintrc

jsonlint: node /usr/local/bin/jsonlint
/usr/local/bin/jsonlint:
	@npm install -g jsonlint

js-yaml: /usr/local/bin/js-yaml
/usr/local/bin/js-yaml:
	@npm install -g js-yaml

jsinspect: node /usr/local/bin/jsinspect
/usr/local/bin/jsinspect:
	@npm install -g jsinspect

retire: node /usr/local/bin/retire
/usr/local/bin/retire:
	@npm install -g retire

david: node /usr/local/bin/david
/usr/local/bin/david:
	@npm install -g david

nsp: node /usr/local/bin/nsp
/usr/local/bin/nsp:
	@npm install -g nsp

recess:
	@npm install -g recess

sqlint: /usr/local/bin/sqlint
/usr/local/bin/sqlint:
	@gem install sqlint

pm2: node /usr/local/bin/pm2
/usr/local/bin/pm2:
	@npm install -g pm2

cmus: brew /usr/local/bin/cmus
/usr/local/bin/cmus:
	brew install cmus

osx:
	# See secrets.blacktree.com
	chsh -s /bin/zsh $(USER)
	sudo scutil --set ComputerName $(COMPUTER_NAME)
	sudo scutil --set HostName $(COMPUTER_NAME)
	sudo scutil --set LocalHostName $(COMPUTER_NAME)
	sudo defaults write \
		/Library/Preferences/SystemConfiguration/com.apple.smb.server \
		NetBIOSName -string $(COMPUTER_NAME)
	# Allow apps downloaded from "Anywhere"
	sudo spctl --master-disable
	# Disabled shadow in screenshots
	@defaults write com.apple.screencapture disable-shadow -bool true
	# Enalble Ctrl+Alt+cmd+t for darkmode
	@sudo defaults write /Library/Preferences/.GlobalPreferences.plist \
		_HIEnableThemeSwitchHotKey -bool true 
	# no .DS_Store on network
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	# Disable the “Are you sure you want to open this application?” dialog
	defaults write com.apple.LaunchServices LSQuarantine -bool false
	# Don’t automatically rearrange Spaces based on most recent use
	defaults write com.apple.dock mru-spaces -bool false
	# Trackpad: enable tap to click for this user and for the login screen
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad \
		Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	# Disable "Natural" scroll
	defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
	# Enable move with 3 fingers
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad \
		TrackpadThreeFingerDrag -bool true
	# dock size & autohidden dock
	defaults write com.apple.dock tilesize -int 128
	defaults write com.apple.dock autohide -bool true
	# Enable full keyboard access for all controls
	# (e.g. enable Tab in modal dialogs)
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
	# Set a blazingly fast keyboard repeat rate
	defaults write NSGlobalDomain KeyRepeat -int 0
	# 14 days on ical
	defaults write com.apple.iCal n\ days\ of\ week 14
	# Finder
	defaults write com.apple.finder NewWindowTarget -string "PfLo"
	defaults write com.apple.finder NewWindowTargetPath -string "file://$(HOME)/Downloads/"

wallpaper:
	# Set wallpaper
	osascript -e "tell application \"System Events\" to set picture of every \
		desktop to \"~/.dotfiles/wallpapers/2.png\""

encfs: osxfuse
	brew install homebrew/fuse/encfs

osxfuse:
	brew cask install osxfuse


all: brew \
	vim-config \
	tmux-config \
	node \
	cmake \
	highlight \
	vim \
	shiftit \
	gpg \
	cli-tools \
	js-yaml \
	jq \
	jsonlint \
	eslint \
	sqlint \
	google-chrome \


seball: brew \
	zsh \
	watch \
	osx \
	vim-config \
	slate-config \
	tmux-config \
	node \
	cmake \
	highlight \
	tig \
	vim \
	gpg \
	cli-tools \
	ranger \
	instant-markdown \
	js-yaml \
	the_silver_searcher \
	mutt \
	siege \
	jsinspect \
	david \
	nsp \
	jq \
	jsonlint \
	eslint \
	sqlint \
	retire \
	slack \
	pomo \
	bower \
	gulp \
	cordova \
	ionic \
	mongodb \
	mongohacker \
	vagrant \
	chrome \
	postman
