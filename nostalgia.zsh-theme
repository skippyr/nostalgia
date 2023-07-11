setopt promptsubst

function _nostalgia::branch
{
  typeset -r branch=$(git branch --show-current 2>/dev/null)
  [[ -n ${branch} ]] && echo " %F{2}git:(%F{6}${branch}%F{2})"
}

PROMPT='%(?..%F{2}[%F{1}%?%F{2}] )%F{6}%n%F{1}@%F{3}%m %F{1}%~\
$(_nostalgia::branch)%F{4}%%%%%F{2}>%f '
