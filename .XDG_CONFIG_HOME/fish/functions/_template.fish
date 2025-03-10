# Use wraps if it is an actual alias/override of another function.
# https://fishshell.com/docs/current/cmds/function.html

function aliasName --wraps=aliasCommand --description 'alias aliasName aliasCommand'
  aliasCommand $argv
end
