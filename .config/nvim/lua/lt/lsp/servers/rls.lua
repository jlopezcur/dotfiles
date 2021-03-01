return function(language_server_path)
    local bin_path = language_server_path .. "/rls-language-server/rls-language-server"
    return {
        cmd = {bin_path, "--stdio"},
    }
end
