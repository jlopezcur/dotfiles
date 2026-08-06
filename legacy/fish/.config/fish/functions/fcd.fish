# fzf + cd
function fcd
  cd "$(find -type d | fzf)"
end

