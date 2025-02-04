
all: depends symlink_clean symlink bin_folder fonts update

update:
	xrdb -merge ~/.Xresources

symlink:
	ln -s `pwd`/i3status ~/.i3status.conf
	mkdir -p ~/.i3
	ln -s `pwd`/i3config ~/.i3/config
	mkdir -p ~/.config/dunst
	ln -s `pwd`/dunstrc ~/.config/dunst/dunstrc
	ln -s `pwd`/gtkrc-2.0 ~/.gtkrc-2.0
	ln -s `pwd`/Xresources ~/.Xresources

bin_folder:
	mkdir -p ~/bin
	# Don't overwrite anything
	for x in bin/*; do \
		if [ ! -f ~/$$x  ]; then\
		ln -s `pwd`/$$x ~/$$x;\
		fi; \
	done

symlink_clean:
	rm -rf ~/.i3status.conf ~/.i3  ~/.config/dunst ~/.gtkrc-2.0 ~/.Xresources

depends:
	# TODO add desktop dependencies
	sudo apt-get install rxvt-unicode-256color # nice temrinal
	
	# rxvt depends
	sudo apt-get install xclip # copy paste for terminal
	sudo cp rxvt/urxvtclip /usr/lib/urxvt/perl/clipboard

	# rofi depends
	sudo apt-get install rofi

desktop:
	sudo apt-get install \
		xbacklight \
		i3

dropbox:
	./setup_drobox.sh

fonts:
	mkdir ~/.fonts
	./setup_font_monaco.sh
	./setup_font_menlo.sh
	./setup_font_mononoki.sh
	./setup_font_fira_sans.sh
	fc-cache -vf ~/.fonts

