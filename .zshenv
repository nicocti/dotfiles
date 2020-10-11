export VISUAL=micro
export EDITOR=micro
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export GREP_COLOR=31

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_DESCRIBE_STYLE=branch

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export JDK_HOME=$JAVA_HOME
export PYSPARK_SUBMIT_ARGS=" --packages org.elasticsearch:elasticsearch-spark-20_2.11:6.4.3,org.apache.hadoop:hadoop-aws:2.7.6,org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.2 --driver-memory 15G pyspark-shell"

export PYENV_ROOT="$HOME/.pyenv"
export VENV_HOME="$HOME/.envs"
export PIP_CONFIG_FILE="$HOME/.pypirc"

export PATH=$HOME/go/bin:$HOME/.cargo/bin:$HOME/.yarn/bin:$JAVA_HOME/bin:$PATH:$PYENV_ROOT/bin

# SECRETS ARE HERE:
source $HOME/.env