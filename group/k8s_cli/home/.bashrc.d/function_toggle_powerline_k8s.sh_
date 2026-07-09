toggle_powerline_k8s() {
  case "$1" in
    # pass the '-ns' flag to toggle namespace visibility
    "-ns" | "--namespace")
      if [[ "${POWERLINE_K8S_SHOW_NS:-1}" -eq 1 ]]; then
        export POWERLINE_K8S_SHOW_NS=0
      else
        export POWERLINE_K8S_SHOW_NS=1
      fi
    ;;
    *)
      # toggle segment visibility
      if [[ "${POWERLINE_K8S_SHOW:-1}" -eq 1 ]]; then
        export POWERLINE_K8S_SHOW=0
      else
        export POWERLINE_K8S_SHOW=1
      fi
    ;;
  esac
}
