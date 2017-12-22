# Rbenv
From https://github.com/sstephenson/rbenv:

> Use rbenv to pick a Ruby version for your application and guarantee that your development environment matches production. Put rbenv to work with Bundler for painless Ruby upgrades and bulletproof deployments.

### Pre-installation
Remove Apt package:
```bash
sudo apt-get remove rbenv ruby-bundler ruby-rvm
```

Install dependencies:
```bash
sudo apt-get install zlib1g-dev openssl libopenssl-ruby1.9.1 libssl-dev \
            libruby1.9.1 libreadline-dev git-core libnotify-dev \
            libc6-dev libssl-dev libmysql++-dev libsqlite3-dev \
            make build-essential libssl-dev libreadline6-dev \
            libyaml-dev curl
```

### Installation
**Rbenv Installer**
```bash
curl -L https://raw.github.com/K-and-R/rbenv-installer/master/bin/rbenv-installer | bash
```

**Set up shell environment**
```bash
echo 'export RBENV_ROOT="$HOME/.rbenv"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bashrc
exec $SHELL
```

**Define default-gems**
```bash
cat > ~/.rbenv/default-gems <<"EOF"
bundler 1.16.1
rails 5.1.4
EOF
```

**Installing Ruby version**
```bash
rbenv install 2.4.3
```

**Setting default Ruby version**
[OPTIONAL] If you'd like to use this ruby version outside this project, you can make id the global default:
```bash
rbenv global 2.4.3
```
