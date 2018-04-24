# Dotfiles

I'm working on a new concept for storing my dotfiles.  Every config file in
/apps is treated like a jinja2 template and has variables inserted by a python
installer.  This allows us to define a common set of themes and generate config
files that use the colors and properties from each of those themes.  We can
also define variables and etc to sync common values across each of our configs
(for example, adding certain lines to a config depending on hostname).  Every
folder in /apps must have an app.json file that describes what targets install
it and what commands to run to install it.
