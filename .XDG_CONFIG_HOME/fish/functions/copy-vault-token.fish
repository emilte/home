function copy-vault-token
    if set -q VAULT_TOKEN
        printf %s $VAULT_TOKEN | pbcopy
    else
        pbcopy <$HOME/.vault-token
    end
end
