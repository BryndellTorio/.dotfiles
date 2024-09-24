# Setup fzf
# ---------
if [[ ! "$PATH" == */home/d3l/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/d3l/.fzf/bin"
fi

eval "$(fzf --bash)"
