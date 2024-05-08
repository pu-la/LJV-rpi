#!/usr/bin/env sh

# Clear Firefox cookies & Cache
rm ~/.mozilla/firefox/*.default-release/cookies.sqlite
rm ~/.mozilla/firefox/*.default-release/*.sqlite
rm -r ~/.mozilla/firefox/*default-release/sessionstore*
rm -r ~/.cache/mozilla/firefox/*.default-release/*

# rm -rf ~/Documents/*
rm -rf ~/Downloads/*
rm -rf ~/Desktop/*
# rm -rf
