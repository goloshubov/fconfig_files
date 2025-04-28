LOCAL_VARS="${HOME}/.bashrc.d/00_local_vars.sh"

toggle() {
  env=$1
  cur_value="$(printenv $env)"
  if [ "$cur_value" == "" ]; then
    return
  fi
  if [ "$cur_value" == "1" ]; then
    new_value="0"
  else
    new_value="1"
  fi

  # save to local vars
  if [ -z "$(grep $env $LOCAL_VARS 2>/dev/null)" ]; then 
    echo "${env}=${new_value}" > $LOCAL_VARS
  else
    sed -i "s/^${env}=.*$/${env}=${new_value}/" $LOCAL_VARS 2>/dev/null
  fi

  #source $LOCAL_VARS
  export $env=$new_value
}
