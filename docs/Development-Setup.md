# Development Environment Setup
We use exclusively Ubuntu 16.04 for our development environments.

## Base Configuration
Start by following the [Ubuntu Setup instructions](./Ubuntu-Setup.md).

## Additional Configuration

### Sublime Text

From http://www.sublimetext.com/:

> Sublime Text is a sophisticated text editor for code, markup and prose. You'll love the slick user interface, extraordinary features and amazing performance.

#### Installation

**Sublime Text 3**

Visit [http://www.sublimetext.com/3](http://www.sublimetext.com/3) and download the appropriate package to your `~/packages/` directory; install it using gdebi; then to symlink `sublime` to the `subl` command with the following:
```bash
mkdir -p  ~/packages && \
cd  ~/packages/ && \
wget https://download.sublimetext.com/sublime_text_3_build_3143_x64.tar.bz2 && \
sudo gdebi ~/packages/sublime-text_build-*.deb && \
sudo ln -s `which subl` $(dirname `which subl`)/sublime;
```

**Sublime URL Handler**
Create the Sublime URL Parser file '/usr/local/bin/subl-url-parser':
```bash
sudo tee /usr/local/bin/subl-url-parser > /dev/null <<"EOF"
#!/usr/bin/env bash

request=${1:23}               # Delete the first 23 characters "subl://open?url=file://"
request=${request//%2F//}     # Replace %2F with /
request=${request/&line=/:}   # Replace &line= with :
request=${request/&column=/:} # Replace &column= with :
sublime $request              # Launch Sublime
EOF
```
Make it executable, and symlink it to "subl-url-handler":
```bash
sudo chmod +x /usr/local/bin/subl-url-parser
sudo ln -s subl-url-parser /usr/local/bin/subl-url-handler
```
Create (or update) the desktop file ' /usr/share/applications/sublime-handler.desktop' to use your new URL parser via 'subl-url-handler':
```bash
sudo tee /usr/share/applications/sublime-handler.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Sublime Text URL Handler
GenericName=Text Editor
Comment=Handle URL Scheme subl://
Exec=subl-url-handler %u
Terminal=false
Type=Application
MimeType=x-scheme-handler/subl;
Icon=sublime-text
Categories=TextEditor;Development;Utility;
Name[en_US]=Sublime Text URL Handler
EOF
```
Update the database:
```bash
sudo update-desktop-database
```

**Package Control**
Open Sublime Text 3.
Go to [https://packagecontrol.io/installation](https://packagecontrol.io/installation) and follow the instructions for "Sublime Text 3".

### Rbenv

Install Rbenv by following the [Rbenv Installation instructions](./Rbenv-Installation.md).

### Development Database

#### PostgreSQL

Install PostgreSQL by following the [PostgreSQL Installation instructions](./PostgreSQL-Installation.md).

Use the script at `bin/create-pg-app-db` once for each database you need to make. IE:
```
bin/create-pg-app-db rails5example_dev
```
and
```
bin/create-pg-app-db rails5example_test
```
Use the database name (eg: 'rails5example_dev') for the password.

### GitHub SSH Key
While Github's current recommendation is to use HTTPS for repo access (they have gone back and forth on this over the years), their reasoning does not aligh with our needs. Thus it is our strong recomendation that SSH be used for repo access.

From https://help.github.com/articles/generating-ssh-keys/:

> SSH keys are a way to identify trusted computers, without involving passwords.

Go to [https://help.github.com/articles/generating-ssh-keys/](https://help.github.com/articles/generating-ssh-keys/) and follow the instructions on that page.
