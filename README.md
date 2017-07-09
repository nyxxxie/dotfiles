# Nyx's dootfiles v2.0

Obligatory dotfiles repo containing the config files I use in most on most of
my machines.  Mostly uploaded them here because github is a convenient site I
am garunteed to be able to access pretty much everywhere at any time, but you
might find them useful as reference material.  Yes, the terminus font is
broken.

Programs these config files relate to or require:

 program    | purpose
----------- | --------
 urxvt      | Preferred terminal emulator
 vim        | Default text editor
 nvim       | Better and preferred version of vim
 emacs      | Trying to replace my usage of vim with this
 tmux       | Terminal multiplexer
 xset       | Used to add our fonts
 xrdb       | Used to load Xresources file
 compton    | Compositor - adds shadows, window animations, and other visual goodies
 gdb        | Debugger (BEST ONE)
 rtorrent   | Tool for downloading linux distros
 radare2    | Reverse engineering framework
 ranger     | Text-based file manager
 bspwm      | Window manager we use
 sxhkd      | Tool that comes with bspwm, sometimes must be installed manually
 yabar      | Neato toolbar
 mpd        | Music player daemon
 ncmpcpp    | Music player client, controls mpd
 git        | required for some install scripts
 python2.7  | ^^^^
 python3.\* | ^^^^

## Installation

Install assumes that dotfiles are located in $HOME/.dotfiles.  Please check
config directories for specific expectations and installation instructions.
I'll probably make a script to automate this at some point (NOTE TO FUTURE
ME: make a bash script per directory that handles install, removal, etc).

# Future plans
* Add install scripts to each directory
    * Make scripts modular.  Can achieve this by creating a commonly-named bash
      function in install scripts and sourcing each.  When each is sourced, it
      will overwrite the previously sourced module's installer function.
    * Scripts should support install, uninstall, and update operations
* Add template engine so that we can change fields dynamically?
    * For instance, we can modify paths based on current install location
      and change color scheme based on a selected theme.
    * Might be nice to use jinja2 or something similar, I think that python in
      general would add something nice to the mix.
* Add ability for the above dependency programs to be installd automatically
  from source.
    * For instance, neovim and radare are commonly unavailable or out of date
      in distro repositories.  Why not install locally to ~/bin?
