i3-msg 'rename workspace "'"$(i3-msg -t get_workspaces | jq '.[] |.name' | grep "10" | sed -e 's/^"//' -e 's/"$//')"'" to "10 '$(/home/max/git/dotfiles/i3blocks-gaps/spotify.sh)'"'
