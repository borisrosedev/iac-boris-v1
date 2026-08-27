source "$(dirname ${BASH_SOURCE[0]})/../constants/colors.sh"


display_msg() {
    local msg="$1"
    local type=${2:-info}

    if [ "$type" = "info" ]; then
        echo -e "${INFO_COLOR}$msg${NO_COLOR}"
    elif [ "$type" = "warn" ]; then
        echo -e "${WARNING_COLOR}$msg${NO_COLOR}"
    elif [ "$type" = "error" ]; then
        echo -e "${ERROR_COLOR}$msg${NO_COLOR}"
    elif [ "$type" = "success" ]; then
        echo -e "${SUCCESS_COLOR}$msg${NO_COLOR}"
    else
        echo -e "\033[35;2m$msg${NO_COLOR}"
    fi
}
