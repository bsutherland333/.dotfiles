# zprofile, sourced at login for login shells, after zshenv and before zshrc. 
# Place slow commands or things that don't need to be updated frequently here.

# bitwardencli login convenience function
function bwu() {
    BW_STATUS=$(bw status | jq -r .status)
    case "$BW_STATUS" in
    "unauthenticated")
        echo "Logging into BitWarden"
        export BW_SESSION=$(bw login --raw)
        ;;
    "locked")
        echo "Unlocking Vault"
        export BW_SESSION=$(bw unlock --raw)
        ;;
    "unlocked")
        echo "Vault is unlocked"
        ;;
    *)
        echo "Unknown Login Status: $BW_STATUS"
        return 1
        ;;
    esac
    bw sync
}

# bitwardencli completions
eval "$(bw completion --shell zsh); compdef _bw bw;"
