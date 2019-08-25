mkdir -p $HOME/dev
cd $HOME/dev/
if [ ! -d $PWD/devdocs ]; then
  git clone https://github.com/freeCodeCamp/devdocs.git && cd devdocs
  gem update --system
  sudo gem uninstall bundler
  sudo gem install bundler
  bundler update --bundler
  bundle install
  bundle exec thor docs:download --default
  bundle exec thor docs:download c cpp cmake
else
  cd devdocs
fi
bundle exec rackup -o 0.0.0.0
