function set-vscode-color -a color -a file --description 'Set the color of the VSCode title bar in the given settings.json file.'
    set -l content ( cat -- "$file" | string collect)
    set content (string replace -a -r '"titleBar\.activeBackground":\s*"[^"]*"' '"titleBar.activeBackground": "#'$color'"' -- "$content" | string collect)
    set content (string replace -a -r '"titleBar\.inactiveBackground":\s*"[^"]*"' '"titleBar.inactiveBackground": "#'$color'"' -- "$content" | string collect)
    printf "%s" "$content" >"$file"
end
