function vault-login-na # -a password
    vault login -token-only -method=oidc -path=oidc-admin role=utvikler
    # vault login -token-only -method=ldap password=$password
end
