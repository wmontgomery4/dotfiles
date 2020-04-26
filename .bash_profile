alias bzr='bazel run -c opt --config remotecache --config build'
alias bzt='bazel test -c opt --config remotecache --config build'
alias bzb='bazel build -c opt --config remotecache --config build'
alias gcna='git commit --no-verify -am'
alias gpoc='git push origin `git rev-parse --abbrev-ref HEAD`'
if [ -e ~/.bashrc ]; then
  source ~/.bashrc
fi

# Git credential helper
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# script bin
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
	SOURCE="$(readlink "$SOURCE")"
	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
export PATH=$PATH:$DIR/scripts

# Status bar
PS1="\[\033[32m\]\u\[\033[0m\]@\[\033[33m\]\h\[\033[0m\]:\[\033[1;32m\]\w\[\033[1;37m\]>\[\033[0m\]"
