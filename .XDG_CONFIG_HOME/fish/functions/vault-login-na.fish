function vault-login-na -a password
    vault login -token-only -method=ldap password=$password
end
