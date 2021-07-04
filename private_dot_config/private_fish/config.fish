starship init fish | source

set -gx GPG_TTY (tty)
set -gx FZF_DEFAULT_COMMAND 'rg --files'
set -gx VOLTA_HOME "$HOME/.volta"

if string match -iq -- darwin (uname) 
	set -gx SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"
end

if status is-login
	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
		exec startx -- -keeptty
	end
end
