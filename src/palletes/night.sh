#!/usr/bin/env bash

#Tokyo Night Pallet
declare -A PALLETE=(
    [none]="NONE"
    [bg]="#1a1b26"
    [bg_dark]="#16161e"
    [terminal_black]="#414868"
    [fg]="#c0caf5"
    [fg_dark]="#a9b1d6"
    [fg_gutter]="#3b4261"
    [dark3]="#545c7e"
    [comment]="#565f89"
    [dark5]="#737aa2"
    [blue0]="#3d59a1"
    [blue]="#7aa2f7"
    [cyan]="#7dcfff"
    [blue1]="#2ac3de"
    [blue2]="#0db9d7"
    [blue5]="#89ddff"
    [blue6]="#b4f9f8"
    [blue7]="#394b70"
    [magenta]="#bb9af7"
    [magenta2]="#ff007c"
    [purple]="#9d7cd8"
    [orange]="#ff9e64"
    [green]="#9ece6a"
    [green1]="#73daca"
    [green2]="#41a6b5"
    [teal]="#1abc9c"
    [red]="#f7768e"
    [red1]="#db4b4b"
    [white]="#ffffff"

    [green]="#292e42"           # Hintergrundfarbe First Element
    [bg_highlight]="#292e42"    # Status Bar Background

    [fg_gutter]="#c0caf5"       # Font Color First Element

    [blue0]="#3b4261"           # Hauptfarbe für das aktive Paneel
    [purple]="#3b4261"          # Aktives Pane Hintergrund
    [magenta]="#3b4261"         # Aktives Pane Hintergrund Number
    [dark3]="#292e42"           # Inaktives Pane Hintergrund
    [dark5]="#292e42"           # Inactives Pane Hintergrund Number
    [blue7]="#292e42"           # Datum und Zeit
    [white]="#c0caf5"           # Schriftfarbe aktive und inaktive Panes

    [red]="#000000"             # Tmux Command - Hintergrund
    [bg_dark]="#c0caf5"         # Tmux Command - Schriftfarbe

    [yellow]="#000000"          # Command Mode Background
    [green2]="#41a6b5"          # Farbe für aktive Befehle

)

export PALLETE
