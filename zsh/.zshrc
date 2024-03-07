[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=(/usr/share/zsh/site-functions /usr/share/zsh/5.9/functions /opt/homebrew/share/zsh/site-functions)
autoload -Uz vcs_info compinit colors && compinit && colors
precmd() {
  vcs_info
}

for file in ~/.zsh/*; do
  source "$file"
done

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/asdf/libexec/asdf.sh
source /opt/homebrew/opt/kube-ps1/share/kube-ps1.sh

# Prompt
zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f
$ '
PS1='$(kube_ps1) $(get_aws_profile) '$PS1

get_aws_profile() {
  if echo $AWS_PROFILE | grep -q "prod"; then
    echo "%{$fg[red]%}$AWS_PROFILE"
  elif echo $AWS_PROFILE | grep -q "stg"; then
    echo "%{$fg[yellow]%}$AWS_PROFILE"
  elif echo $AWS_PROFILE | grep -q "dev"; then
    echo "%{$fg[green]%}$AWS_PROFILE"
  else
    echo $AWS_PROFILE
  fi
}

setopt AUTO_CD

# Alias
## working dirs
alias l="ls -alh --color=auto"

## kubectl
alias k="kubectl"
alias kd="kubectl describe"
alias kgp="kubectl get pods -o wide"

function knr() {
  kgp -A -o wide | rg $1 | rg Running | awk '{print "kubectl top pods -n "$1" "$2}' | bash | rg "Mi" | sort -k3 -nr | column -t
}

## terraform
alias tf="terraform"

## istioctl
alias ic="istioctl"
alias gri="git rebase -i HEAD~10"
