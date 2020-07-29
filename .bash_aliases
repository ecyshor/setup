alias histg="history | grep"
alias docker_clean="docker_clean_containers"
alias prettyjson='python -m json.tool'
docker_clean_containers(){
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}
alias ccat='pygmentize -g'
