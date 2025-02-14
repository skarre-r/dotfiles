#!/usr/bin/env bash

# get icon file name
# defaults read /Applications/<name>.app/Contents/Info CFBundleIconFile

# TODO: backup default icon file name

# copy icon
# cp <icns> /Applications/<name>.app/Contents/Resources/<icns>

# change icon
# defaults write /Applications/<name>.app/Contents/Info CFBundleIconFile <icns>

fileicon set /Applications/Obsidian.app ./icns/obsidian.icns
fileicon set /Applications/Spotify.app ./icns/spotify.icns
