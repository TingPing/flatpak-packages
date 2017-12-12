
GPG_KEYID := 0DE76DFC
REPO := repo/
BUILD_DIR := ./build
BUILD_CMD_BASE = flatpak-builder --ccache --force-clean --rebuild-on-sdk-change --require-changes --gpg-sign=$(GPG_KEYID) --repo=$(REPO) $(BUILD_DIR)
BUILD_CMD = $(BUILD_CMD_BASE) $<

all: pithos gnome-mpv transmission-remote-gnome hexchat

pithos: io.github.Pithos.json
	$(BUILD_CMD)

gnome-mpv: io.github.GnomeMpv.json
	$(BUILD_CMD)

hexchat: io.github.Hexchat.json
	$(BUILD_CMD)

transmission-remote-gtk: io.github.TransmissionRemoteGtk.json
	$(BUILD_CMD)

cemu: info.cemu.Cemu.json
	$(BUILD_CMD)

rpcs3: net.rpcs3.RPCS3.json
	$(BUILD_CMD)

citra: org.citra_emu.Citra.json
	$(BUILD_CMD)

lutris: net.lutris.Lutris.json
	$(BUILD_CMD)

transmission-remote-gnome:
	$(BUILD_CMD_BASE) --from-git=https://github.com/TingPing/transmission-remote-gnome.git dist/flatpak/se.tingping.Trg.json

irc-client:
		$(BUILD_CMD_BASE) --from-git=https://github.com/TingPing/irc-client.git dist/flatpak/se.tingping.IrcClient.json

sync: $(REPO)
	flatpak build-update-repo --gpg-sign=$(GPG_KEYID) --generate-static-deltas $(REPO)
	python2 ./ostree-releng-scripts/rsync-repos --src=$(REPO) --dest=tingping.se:/srv/http/tingping/flatpak

.PHONY: all sync pithos gnome-mpv hexchat transmission gnome-twitch sync
