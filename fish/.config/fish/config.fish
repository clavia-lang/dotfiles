set fish_greeting

starship init fish | source

if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
end
