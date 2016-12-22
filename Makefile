
GPG_KEYID := 0DE76DFC
REPO := repo/
BUILD_DIR := ./build
BUILD_CMD = flatpak-builder --ccache --force-clean --require-changes --gpg-sign=$(GPG_KEYID) --repo=$(REPO) $(BUILD_DIR) $<

all: pithos gnome-mpv transmission hexchat gnome-twitch

pithos: io.github.Pithos.json
	$(BUILD_CMD)

gnome-mpv: io.github.GnomeMpv.json
	$(BUILD_CMD)

hexchat: io.github.Hexchat.json
	$(BUILD_CMD)

transmission: io.github.TransmissionRemoteGtk.json
	$(BUILD_CMD)

gnome-twitch: com.vinszent.GnomeTwitch.json
	$(BUILD_CMD)

sync: $(REPO)
	flatpak build-update-repo --gpg-sign=$(GPG_KEYID) --generate-static-deltas $(REPO)
	python2 ./ostree-releng-scripts/rsync-repos --src=$(REPO) --dest=tingping.se:/srv/http/tingping/flatpak

.PHONY: all sync pithos gnome-mpv hexchat transmission gnome-twitch sync
