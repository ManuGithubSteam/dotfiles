show_host() {
  local index=$1 
  local icon="$(get_tmux_option "@catppuccin_host_icon" "󰒋")"
  local color="$(get_tmux_option "@catppuccin_host_color" "$thm_magenta")"
  HOT=$(ip addr | grep -e 'state UP' -A 5 | awk '/inet /{printf $2}')
  local text="$(get_tmux_option "@catppuccin_host_text" "#H $HOT")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo $module 
}
