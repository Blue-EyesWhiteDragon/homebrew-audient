# README

This for System Administrators that use Audient software within the studio and wish to track updates via Homebrew. It is useful for updating, resetting, or upgrading hardware on downtime days.

Supports Legacy Versions from El Capitan for the iD, <strike>Sono</strike>, and <strike>Evo</strike> product ranges.

# How to install

```zsh
brew tap blue-eyeswhitedragon/audient
```

### iD

```zsh
brew install --cask audient-id
```

### Sono

```zsh
brew install --cask audient-sono
```

### Evo

```zsh
brew install --cask audient-evo
```

## Note / Caveats

The iD4 MKI was discontinued on Jan 2021 with the launch if the iD4 MKII.
Audient's <a href="https://support.audient.com/hc/en-us/categories/201449766-iD4-MKI">support</a> for the device still points at the iD software in general, so you should be fine. If not, click on the support link provided previously in this paragraph.

The Sono Installer will install both the Sono Application and the Torpedo Remote Application at the same time. Upon `brew uninstall`, these will both be removed. Upon `brew uninstall --zap`, preferences stored in case of reinstall from both applications will be removed.
