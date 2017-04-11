;; Add stuff to emacs load path
(add-to-list 'load-path "~/.emacs.d/utils")
(add-to-list 'load-path "~/.emacs.d/core")

;; Load some utils
(require 'load-directory)

;; Set the directory where customize stuff will go
(unless (file-exists-p "~/.emacs.d/custom.el")
    (write-region "" nil "~/.emacs.d/custom.el"))
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)

;; List the repositories containing them
(setq package-archives '(
    ("elpa" . "http://tromey.com/elpa/")
    ("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "http://marmalade-repo.org/packages/")
    ("melpa" . "http://melpa.org/packages/")))

;; Initialize the package... package?
(package-initialize)

;; Fetch the list of packages available
(unless package-archive-contents
    (package-refresh-contents))

;; Set color scheme
(load-directory "~/.emacs.d/core")

;; Load all plugins + configure them
(load-directory "~/.emacs.d/packages")

;; Change backup directory (usually created in the same directory of a file).
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Disk space is cheap.  Lets save lots of stuff.
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)

;; Let emacs save my ass without cluttering my directories in the process
(setq auto-save-file-name-transforms '((".*" "~/.emacs_saves/" t)))
(setq backup-directory-alist `(("." . "~/.emacs_saves/")))

;; Save history
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
    '(kill-ring
      search-ring
      regexp-search-ring))

;; Enable lines
(setq linum-format "%4d ") ; Add padding to line numbers
(global-linum-mode t)

;; All of the gui items that emacs has aren't necessary
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Same with the welcome screen that pops up in the gui
(setq inhibit-startup-screen t)

;; Set some text editor preferences
 (setq c-basic-offset 4)     ; indents 4 chars
 (setq tab-width 4)          ; and 4 char wide for TAB
 (setq indent-tabs-mode nil) ; And force use of spaces
 (turn-on-font-lock)         ; same as syntax on in Vim

;; TODO:
;;  * UI should be as terminal-compatible as possible (user experience should be virtually identical if they are in a terminal or not)
;;      * Plugins should be enabled or disabled gracefully if they are terminal compatible or not
;;  * Make a separate config file for each plugin (downloads it, has settings, activates it, etc)
;;  * This file should, in the future, only contain require statements (like in https://github.com/hlissner/.emacs.d)
