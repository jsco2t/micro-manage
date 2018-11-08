# check to make sure `helpers.sh` is sourced
if [ ! -n "$(type showInlineDoc)" ]; then
    source /scripts/helpers.sh
fi

if [ ! -n "$(type setupEnv)" ]; then
    source /scripts/environment.sh
fi

setup() {
    # make sure the environment is configured correctly:
    setupEnv
}

setupSaml2Aws(){
    # only do if it doesn't appear to have been done
    if [[ ! -f "/root/.saml2aws" ]]; then
        echo ""
        echo "Please supply your email address:"
        read userEmail

        if [[ -z "$userEmail" ]]; then
            echo "########"
            echo "!!FAIL!! no user email address provided"
            echo "########"
            echo ""
            help
        fi

        echo ""
        echo "Please supply the auth url:"
        read authUrl

        if [[ -z "$authUrl" ]]; then
            echo "########"
            echo "!!FAIL!! no auth url provided"
            echo "########"
            echo ""
            help
        fi

        echo ""
        echo "Please supply the auth provider: (ex: okta)"
        read authProvider

        if [[ -z "$authProvider" ]]; then
            echo "########"
            echo "!!FAIL!! no auth provider supplied"
            echo "########"
            echo ""
            help
        fi

        echo ""
        echo "Please supply the mfa provider: (ex: okta)"
        read authMfa

        if [[ -z "$authMfa" ]]; then
            echo "########"
            echo "!!FAIL!! no auth mfa provided"
            echo "########"
            echo ""
            help
        fi

        cp /resources/.saml2aws-default /root/.saml2aws
        sed -i -e "s#{{url}}#$authUrl#g" /root/.saml2aws
        sed -i -e "s#{{user}}#$userEmail#g" /root/.saml2aws
        sed -i -e "s#{{provider}}#$authProvider#g" /root/.saml2aws
        sed -i -e "s#{{mfa}}#$authMfa#g" /root/.saml2aws
        
        echo ""
        echo "We will now attempt to login to your aws account using saml2aws"
        echo ""
        saml2aws login
    fi
}
