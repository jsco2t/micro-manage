# check to make sure `helpers.sh` is sourced
if [ ! -n "$(type showDoc)" ]; then
    source /scripts/helpers.sh
fi

setupEnv() {
  # only configure aws profile if saml2aws appears to be configurd
  if [[ -f "/root/.saml2aws" ]]; then
      export AWS_PROFILE=saml
  fi
}