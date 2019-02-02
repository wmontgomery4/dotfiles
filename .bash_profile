alias bzr='bazel run -c opt --config remotecache'
alias bzt='bazel test -c opt --config remotecache'
alias bzb='bazel build -c opt --config remotecache'
alias gcna='git commit --no-verify -am'
alias gpoc='git push origin `git rev-parse --abbrev-ref HEAD`'
if [ -e ~/.bashrc ]; then
  source ~/.bashrc
fi

# Git credential helper
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
