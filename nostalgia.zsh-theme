setopt promptsubst

function __Nostalgia__Get_Directory_Abbreviated()
{
    typeset -a directory_splits=("${(s./.)PWD/${HOME}/~}")
    [[ ${#directory_splits} -gt 1 ]] &&
        for directory_split_index in {1..$((${#directory_splits} - 1))}; do
            [[ "${directory_splits[directory_split_index]}" == .* ]] &&
                directory_splits[directory_split_index]=${directory_splits[directory_split_index][1,2]} ||
                directory_splits[directory_split_index]=${directory_splits[directory_split_index][1]}
        done
    echo ${(j./.)directory_splits}
}

function __Nostalgia__Get_Git_Branch()
{
    typeset -r branch=$(git branch --show-current 2>/dev/null)
    [[ ${branch} ]] && echo " %F{3}git:(%F{6}${branch}%F{3})"
}

PROMPT='%(?..[%F{1}%?%f] )%F{6}%n%F{1}@%F{3}%m %F{1}$(__Nostalgia__Get_Directory_Abbreviated)$(__Nostalgia__Get_Git_Branch)%F{4}%%%%%F{2}>%f '
