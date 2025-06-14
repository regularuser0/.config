if status is-interactive
	function fish_greeting
		 fastfetch
	end
end


alias p="sudo pacman"
alias ls="exa --icons"
alias tree="exa --icons -T"


set -gx EDITOR emacs

starship init fish | source
#source ~/.local/share/icons-in-terminal/icons.fish
