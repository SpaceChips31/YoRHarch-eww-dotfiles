#!/bin/bash

# Mostra il titolo della finestra attiva in Hyprland
hyprctl activewindow -j | jq -r '.title'
