
# turn off welcome banner
$env.config.show_banner = false

if $nu.is-interactive {
    # init starship
    if (which starship | is-not-empty) == true {
        mkdir ($nu.data-dir | path join "vendor/autoload")
        starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
    }

    # init atuin
    if (which atuin | is-not-empty) == true {
        if ("~/.local/share/atuin/" | path exists) == false {
            mkdir "~/.local/share/atuin/"
        }
        if ("~/.local/share/atuin/init.nu" | path exists) == false {
            atuin init nu | save "~/.local/share/atuin/init.nu"
        }
        if ("~/.local/share/atuin/init.nu" | path exists) == true {
            source "~/.local/share/atuin/init.nu"
        }
    }
}
