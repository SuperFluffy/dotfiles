starship init fish | source

set -gx GPG_TTY (tty)
set -gx FZF_DEFAULT_COMMAND 'rg --files'
set -gx VOLTA_HOME "$HOME/.volta"

if status is-login
	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
		exec startx -- -keeptty
	end
end
