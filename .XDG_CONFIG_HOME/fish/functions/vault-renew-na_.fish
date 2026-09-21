function vault-renew-na_
    vault-login-na
    for i in (seq 10)
        sleep 3000 # 50 min
        vault token renew
    end
end
