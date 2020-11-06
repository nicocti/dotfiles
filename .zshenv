export VISUAL=micro
export EDITOR=micro
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export REQUESTS_CA_BUNDLE=$CURL_CA_BUNDLE
export GREP_COLOR=31

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_DESCRIBE_STYLE=branch

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export JDK_HOME=$JAVA_HOME

export PYENV_ROOT="$HOME/.pyenv"
export VENV_HOME="$HOME/.envs"
export PIP_CONFIG_FILE="$HOME/.pypirc"

export PATH=$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.yarn/bin:$JAVA_HOME/bin:$PYENV_ROOT/bin

alias keepassxc-decode='echo "Type local keepass password:"; $(keepassxc-cli show --quiet -a Notes $HOME/Passwords.kdbx keys/.env) && echo "Secret env loaded !"'
