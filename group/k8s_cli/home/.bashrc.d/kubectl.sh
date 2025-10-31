alias k=kubectl
alias kk=kubecolor
alias kaf="kubectl apply -f"

source <(kubectl completion bash)
complete -F __start_kubectl k kk

alias k_no_res_gpu="kubectl get nodes -o=go-template='{{range .items}}{{.metadata.name}}{{printf \"\t\"}}{{.status.capacity.cpu}}{{printf \"\t\"}}{{.status.capacity.memory}}{{printf \"\t\"}}{{index .status.capacity \"nvidia.com/gpu\"}}{{printf \"\n\"}}{{end}}' | sort -n -k 4 -k 2"
alias k_po_res="kubectl get pod -o jsonpath='{range .items[*]}{\"\nPod: \"}{.metadata.name}{\"\nNamespace: \"}{.metadata.namespace}{range .spec.containers[*]}{\"\n\tContainer: \"}{.name}{\"\n\"}{\"\t\tResources:\"}{.resources}{end}{\"\n\"}{end}'"
alias k_po_img="kubectl get pod -o jsonpath='{range .items[*]}{\"\nPod: \"}{.metadata.name}{\"\nNamespace: \"}{.metadata.namespace}{range .spec.containers[*]}{\"\n\tContainer: \"}{.name}{\"\n\"}{\"\t\tImage:\"}{.image}{end}{\"\n\"}{end}'"
alias k_rs_img="kubectl get rs -o jsonpath='{range .items[*]}{\"\nRS: \"}{.metadata.name}{\"\nNamespace: \"}{.metadata.namespace}{range .spec.template.spec.containers[*]}{\"\n\tContainer: \"}{.name}{\"\n\"}{\"\t\tImage:\"}{.image}{end}{\"\n\"}{end}'"

PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"

# krew ns alternative
function kns() {
  kubectl config set-context --current --namespace=$1
}

alias k1="export STATUSLINE_K8S_SHOW=1"
alias k0="export STATUSLINE_K8S_SHOW=0"
