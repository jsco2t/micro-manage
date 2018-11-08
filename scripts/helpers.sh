defaultHelpDocument="/documents/readme.md"

help() {
    showDoc $defaultHelpDocument
}

k8s() {
    if [[ -z "$1" ]]; then
        # default
        showDoc "/documents/k8s/index.md"
    else
        helpDoc="/documents/k8s/index.md" # default for safety

        if [[ -z "$2" ]]; then
            helpDoc="/documents/k8s/$1.md"
        else
            helpDoc="/documents/k8s/$1/$2.md"
        fi

        if [ -f $helpDoc ]; then
            showDoc "$helpDoc"
        else
            showDoc "/documents/k8s/index.md" "show-error"
        fi
    fi
}

showDoc() {
    clear
    
    showInlineDoc "$@"
}

showInlineDoc() {
    if [[ -z "$1" ]]; then
        echo "########"
        echo "!!FAIL!! No document requested"
        echo "########"
        echo ""
        msee "$defaultHelpDocument"
    fi

    if [[ ! -f "$1" ]]; then # check if file exists
        echo "########"
        echo "!!WARNING!! The requested command and/or help doc does not exist:"
        echo ""
        echo "For basic help run: help and/or k8s"
        echo "########"
        echo ""
        msee "$defaultHelpDocument"
    else
        if [[ ! -z "$2" ]]; then # check to see if warning boilerplate was requested
            echo "########"
            echo "!!WARNING!! The requested command and/or help doc does not exist - please try these:"
            echo ""
            echo "For basic help run: help and/or k8s"
            echo "########"
            echo ""
        fi

        msee "$1"
    fi
}