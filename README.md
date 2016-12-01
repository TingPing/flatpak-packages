Packages
--------

- io.github.Pithos
- io.github.GnomeMpv
- io.github.Hexchat
- io.github.TransmissionRemoteGtk
- com.vinszent.GnomeTwitch

Installation
------------

### Flatpak 0.6.13+

```sh
flatpak --user remote-add gnome https://sdk.gnome.org/gnome.flatpakrepo
flatpak --user remote-add tingping https://dl.tingping.se/flatpak/tingping.flatpakrepo
flatpak --user install tingping <package>
```

### Older
```sh
wget https://dl.tingping.se/flatpak/tingping.flatpakrepo
flatpak --user remote-add tingping --from=tingping.flatpakrepo

flatpak --user install tingping <package>
```
