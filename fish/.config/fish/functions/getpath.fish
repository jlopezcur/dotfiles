# fzf + wl-copy
function getpath
  fzf | sed 's/^..//' | tr -d '\n' | wl-copy -o
end
