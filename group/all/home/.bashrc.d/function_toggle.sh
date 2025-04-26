function toggle {
  if [ "$( grep $1 $TOGGLE_ENV_VARS_FILE | cut -d'=' -f2 )" == "1"  ]; then
    sed -i "s/$1=1/$1=0/" "$TOGGLE_ENV_VARS_FILE"
    echo "[OK] toggle $1  1 -> 0"
  else
    sed -i "s/$1=0/$1=1/" "$TOGGLE_ENV_VARS_FILE"
    echo "[OK] toggle $1  0 -> 1"
  fi
  source "$TOGGLE_ENV_VARS_FILE"
}
