
GPG_KEYID := 0DE76DFC

all: pithos gnome-mpv

pithos: io.github.Pithos.json
	flatpak-builder --force-clean --gpg-sign=$(GPG_KEYID) --repo=./repo ./build $<

gnome-mpv: io.github.GnomeMpv.json
	flatpak-builder --force-clean --gpg-sign=$(GPG_KEYID) --repo=./repo ./build $<

hexchat: io.github.Hexchat.json
	flatpak-builder --force-clean --gpg-sign=$(GPG_KEYID) --repo=./repo ./build $<

transmission: io.github.TransmissionRemoteGtk.json
	flatpak-builder --force-clean --gpg-sign=$(GPG_KEYID) --repo=./repo ./build $<

sync: ./repo
	rsync -zrhe ssh --info=progress2 $</* tingping.se:/srv/http/tingping/flatpak

.PHONY: all sync pithos gnome-mpv hexchat transmission
