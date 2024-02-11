#!/usr/bin/env bash
read -p ":: Type your Git username: " GIT_USERNAME
read -p ":: Type your Git email: " GIT_EMAIL
git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_EMAIL
git config --global core.editor nvim
