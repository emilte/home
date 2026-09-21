function vault-login-na # -a password

    set -gx VAULT_TOKEN (vault login -token-only -method=oidc -path=oidc-admin role=utvikler)
    printf $VAULT_TOKEN
    printf $VAULT_TOKEN | pbcopy

    # vault login -token-only -method=ldap password=$password
end
