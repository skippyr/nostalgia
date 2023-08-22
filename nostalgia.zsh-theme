setopt promptsubst

function _nostalgia_get_dir_abbr() {
  local d=("${(s./.)PWD/${HOME}/~}")
  [[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
    [[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
  done
  echo ${(j./.)d}
}

function _nostalgia_get_branch() {
  local b=$(git branch --show-current 2>/dev/null)
  [[ ${b} ]] && echo " %F{3}git:(%F{6}${b}%F{3})"
}

PROMPT='%(?..[%F{1}%?%f] )%F{6}%n%F{1}@%F{3}%m %F{1}$(_nostalgia_get_dir_abbr)\
$(_nostalgia_get_branch)%F{4}%%%%%F{2}>%f '
