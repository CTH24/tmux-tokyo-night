#!/usr/bin/env bash

function get_tmux_option() {
    local option=$1
    local default_value=$2
    local -r option_value=$(tmux show-option -gqv "$option")

    if [ -z "$option_value" ]; then
        echo "$default_value"
    else
        echo "$option_value"
    fi
}

function generate_left_side_string() {

    session_icon=$(get_tmux_option "@theme_session_icon" "⋅")
    if [ "$transparent" = "true" ]; then
        local separator_end="#[bg=default]#{?client_prefix,#[fg=${PALLETE[yellow]}],#[fg=${PALLETE[green]}]}${left_separator:?}#[none]"
    else
        local separator_end="#[bg=${PALLETE[bg_highlight]}]#{?client_prefix,#[fg=${PALLETE[yellow]}],#[fg=${PALLETE[green]}]}${left_separator:?}#[none]"
    fi

    echo "#[fg=${PALLETE[fg_gutter]},bold]#{?client_prefix,#[bg=${PALLETE[yellow]}],#[bg=${PALLETE[green]}]} ${session_icon} #S ${separator_end}"
}

function generate_inactive_window_string() {

    active_window_icon=$(get_tmux_option "@theme_plugin_active_window_icon" " ")
    zoomed_window_icon=$(get_tmux_option "@theme_plugin_zoomed_window_icon" " ")
    pane_synchronized_icon=$(get_tmux_option "@theme_plugin_pane_synchronized_icon" "✵")

    if [ "$transparent" = "true" ]; then
        local separator_start="#[bg=default,fg=${PALLETE['dark5']}]${left_separator_inverse}#[bg=${PALLETE['dark5']},fg=${PALLETE['bg_highlight']}]"
        local separator_internal="#[bg=${PALLETE['dark3']},fg=${PALLETE['dark5']}]${left_separator:?}#[none]"
        local separator_end="#[bg=default,fg=${PALLETE['dark3']}]${left_separator:?}#[none]"
    else
        local separator_start="#[bg=${PALLETE['dark5']},fg=${PALLETE['bg_highlight']}]${left_separator:?}#[none]"
        local separator_internal="#[bg=${PALLETE['dark3']},fg=${PALLETE['dark5']}]${left_separator:?}#[none]"
        local separator_end="#[bg=${PALLETE[bg_highlight]},fg=${PALLETE['dark3']}]${left_separator:?}#[none]"
    fi

    window_index="#[fg=${PALLETE[white]}] #I"
    window_status="#[fg=${PALLETE[white]}] #{?window_zoomed_flag,$zoomed_window_icon,$active_window_icon}"
    window_name="#[fg=${PALLETE['white']},bold]#(basename #{pane_current_path})"
    current_command="#[fg=#56B6C2]#{pane_current_command}"
    sync_status="#{?pane_synchronized,$pane_synchronized_icon,}"
    assembled_string="${separator_start}${window_index}${separator_internal}${window_status}${window_name} ${current_command} ${sync_status}${separator_end}"

    echo "${assembled_string}"
}
function generate_active_window_string() {
    # Symbole und Optionen laden
    active_window_icon=$(get_tmux_option "@theme_plugin_active_window_icon" " ")
    zoomed_window_icon=$(get_tmux_option "@theme_plugin_zoomed_window_icon" " ")
    pane_synchronized_icon=$(get_tmux_option "@theme_plugin_pane_synchronized_icon" "✵")

    # Separatoren je nach Transparenz einstellen
    if [ "$transparent" = "true" ]; then
        separator_start="#[bg=default,fg=${PALLETE['magenta']}]${left_separator_inverse}#[bg=${PALLETE['magenta']},fg=${PALLETE['bg_highlight']}]"
        separator_start="#[bg=default,fg=${PALLETE['magenta']}]${left_separator_inverse}#[bg=${PALLETE['magenta']},fg=#000000]"
        separator_internal="#[bg=${PALLETE['purple']},fg=${PALLETE['magenta']}]${left_separator:?}#[none]"
        separator_end="#[bg=default,fg=${PALLETE['purple']}]${left_separator:?}#[none]"
    else
        separator_start="#[bg=${PALLETE['magenta']},fg=${PALLETE['bg_highlight']}]${left_separator:?}#[none]"
        separator_internal="#[bg=${PALLETE['purple']},fg=${PALLETE['magenta']}]${left_separator:?}#[none]"
        separator_end="#[bg=${PALLETE[bg_highlight]},fg=${PALLETE['purple']}]${left_separator:?}#[none]"
    fi

    window_index="#[fg=#ffffff] #I"
    window_status="#[fg=${PALLETE[white]}] #{?window_zoomed_flag,$zoomed_window_icon,$active_window_icon}"
    window_name="#[fg=${PALLETE['white']},bold]#(basename #{pane_current_path})"
    current_command="#[fg=#56B6C2]#{pane_current_command}"
    sync_status="#{?pane_synchronized,$pane_synchronized_icon,}"
    # Alle Teile zusammenbauen
    assembled_string="${separator_start}${window_index}${separator_internal}${window_status}${window_name} ${current_command} ${sync_status}${separator_end}"

    echo "${assembled_string}"
}

