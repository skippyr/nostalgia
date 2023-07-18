setopt promptsubst

__Nostalgia()
{
	Get_Directory()
	{
		typeset -a d=("${(s./.)PWD/${HOME}/~}")
		[[ ${#d} > 1 ]] && for i in {1..$((${#d} - 1))}; do
			[[ "${d[i]}" == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
		done
		echo ${(j./.)d}
	}

	Get_Branch()
	{
		typeset -r b=$(git branch --show-current 2>/dev/null)
		[[ -n $b ]] && echo " %F{3}git:(%F{6}$b%F{3})"
	}

	echo "%(?..[%F{1}%?%f] )%F{6}%n%F{1}@%F{3}%m %F{1}$(Get_Directory)$(Get_Branch)%F{4}%%%%%F{2}>%f "
}

PROMPT='$(__Nostalgia)'
