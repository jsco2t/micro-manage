get-podname-by-label(){
    if [[ -z "$1" ]]; then
        echo "########"
        echo "!!FAIL!! first function parameter must be pod namespace"
        echo "########"
        echo ""
    fi

    if [[ -z "$2" ]]; then
        echo "########"
        echo "!!FAIL!! second function parameter must be pod label. Ex: 'app=foo'"
        echo "########"
        echo ""
    fi

    podName="$(kubectl -n $1 get po -l '$2' -o jsonpath='{.items[0].metadata.name}')"
    echo "$podName"
}