# fzf + xdg-open
function fopen
  xdg-open "$(find -type f | fzf)"
end

