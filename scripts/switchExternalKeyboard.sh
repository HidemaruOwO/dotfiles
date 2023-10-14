#!/bin/bash
hyprctl keyword input:kb_layout us
sudo evtest --grab /dev/input/event5
hyprctl keyword input:kb_layout jp
