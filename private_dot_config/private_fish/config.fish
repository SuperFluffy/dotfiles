starship init fish | source

set -gx EDITOR helix
set -gx FZF_DEFAULT_COMMAND 'rg --files'
set -gx VOLTA_HOME "$HOME/.volta"

set -e SSH_AGENT_PID
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

if string match -iq -- darwin (uname) 
	gpgconf --launch gpg-agent
end
set -gx GPG_TTY (tty)

if status is-login
	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
		exec startx -- -keeptty
	end
end
