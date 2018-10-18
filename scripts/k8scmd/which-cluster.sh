
# check to make sure `helpers.sh` is sourced
if [ ! -n "$(type showDoc)" ]; then
    source /scripts/helpers.sh
fi

what-cluster(){
    which-cluster
}

which-cluster() {
    showDoc "/documents/k8scmd/which-cluster.md"
    echo ""
    echo "kubectl config contexts:"
    echo ""
    kubectl config get-contexts
    echo ""
    echo "kubectl version info:"
    echo""
    kubectl version
}