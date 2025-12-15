function try-source --description 'Try source file if exists' -a file
    # 0 if file exists, else 1.
    [ -f $file ] && . $file
end
