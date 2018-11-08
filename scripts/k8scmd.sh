# load commands
source /scripts/k8scmd/which-cluster.sh
source /scripts/k8scmd/test-connect.sh
source /scripts/k8scmd/portal.sh
source /scripts/k8scmd/cmd-helpers.sh

# check to make sure `helpers.sh` is sourced
if [ ! -n "$(type showDoc)" ]; then
    source /scripts/helpers.sh
fi

k8scmd() {
    if [ -n "$(type $1)" ]; then
        $1
    else
        showDoc "/documents/k8s/index.md" "show-error"
    fi
}