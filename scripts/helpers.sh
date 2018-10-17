help() {
    showDoc "/documents/readme.md"
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
            echo "The requested command and/or help doc does not exist - please try these:"
            echo ""
            echo "For basic help run: help"
            echo ""
            showDoc "/documents/k8s/index.md"
        fi
    fi
}

showDoc() {
    clear
    msee "$1"
}