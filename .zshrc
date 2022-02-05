# pywal
(cat ~/.cache/wal/sequences &)

# oh-my-zsh
ZSH=/usr/share/oh-my-zsh
ZSH_THEME="spaceship"
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
plugins=(git)
export EDITOR='vim'
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh
PATH=$PATH:$HOME/Scripts

# spaceship zsh theme
SPACESHIP_DIR_TRUNC=0
SPACESHIP_TIME_SHOW=true
SPACESHIP_USER_SHOW=always

# Misc
export LC_ALL=$LANG
alias ll="ls -hlt"
alias l="ls -halt"
neofetch

# kubectl
source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k

# kustomize
source <(kustomize completion zsh)

# kubectx kubens
alias kns=kubens
alias kctx=kubectx

# cilium
source <(cilium completion zsh)

# argocd vault
export AVP_TYPE="vault"
export AVP_AUTH_TYPE="token"
if [[ -f "/home/$USER/.vault-token" ]]; then
  export VAULT_TOKEN=$(cat ~/.vault-token)
fi
export VAULT_ADDR="https://vault.home.lan"

# okteto
source <(okteto completion zsh)

# nvidia as primary
gpuset()
{
  if [[ $1 == "nvidia" ]]; then
    sudo mv /etc/X11/xorg.conf.d/20-intel.conf /etc/X11/xorg.conf.d/disabled/ && sudo mv /etc/X11/xorg.conf.d/disabled/40-nvidia-drm-outputclass.conf /etc/X11/xorg.conf.d/
  elif [[ $1 == "intel" ]]; then
    sudo mv /etc/X11/xorg.conf.d/40-nvidia-drm-outputclass.conf /etc/X11/xorg.conf.d/disabled/ && sudo mv /etc/X11/xorg.conf.d/disabled/20-intel.conf /etc/X11/xorg.conf.d/
  else
    echo "Please use 'gpuset intel' or 'gpuset nvidia' !"
  fi
}

# Wg VPN to Home
vpn()
{
  if [[ $1 == "on" ]]; then
    sudo wg-quick up wg0
  elif [[ $1 == "off" ]]; then
    sudo wg-quick down wg0
  else
    echo "Please use 'vpn on' or 'vpn off' !"
  fi
}

# argocd kustomize build
kgen()
{
  kustomize build $1 | argocd-vault-plugin generate -
}
