
# check to make sure `helpers.sh` is sourced
if [ ! -n "$(type showDoc)" ]; then
    source /scripts/helpers.sh
fi

test-connect() {
    showDoc "/documents/k8scmd/test-connect.md"
    echo ""
    echo "kubectl version info:"
    echo""
    kubectl version
}