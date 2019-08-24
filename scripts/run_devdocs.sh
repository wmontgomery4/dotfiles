mkdir -p $HOME/dev
cd $HOME/dev/
if [ ! -d $PWD/devdocs ]; then
  git clone https://github.com/freeCodeCamp/devdocs.git && cd devdocs
  sudo gem install bundler
  bundle install
  bundle exec thor docs:download --default
  bundle exec thor docs:download c cpp
else
  cd devdocs
fi
bundle exec rackup -o 0.0.0.0
