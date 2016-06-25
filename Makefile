
GPG_KEYID := 0DE76DFC

all: pithos gnome-mpv

pithos: io.github.Pithos.json
	flatpak-builder --force-clean --gpg-sign=$(GPG_KEYID) --repo=./repo ./build $<

gnome-mpv: io.github.GnomeMpv.json
	flatpak-builder --force-clean --gpg-sign=$(GPG_KEYID) --repo=./repo ./build $<

.PHONY: all pithos gnome-mpv
