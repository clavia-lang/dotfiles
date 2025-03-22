$env.config.show_banner = false

$env.config.history = {
    file_format: sqlite
}

let fish_completer = {|spans|
    fish --command $'complete --do-complete="($spans | str join " ")"'
    | from tsv --flexible --noheaders --no-infer
    | rename value description
}

let external_completer = {|spans|
    let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion)
    let spans = if $expanded_alias != null {
        $spans | skip 1 | prepend ($expanded_alias | split row " ")
    } else { $spans }

    match $spans.0 {
        _ => $fish_completer
    } | do $in $spans
}

$env.config.completions = {
     external: {
         completer: $external_completer
     }
}

if ($env.ZELLIJ? | is-empty) {
    if ($env.ZELLIJ_AUTO_ATTACH? == "true") {
        zellij attach -c
    } else {
        zellij
    }
    if ($env.ZELLIJ_AUTO_EXIT? == "true") {
        exit
    }
}
