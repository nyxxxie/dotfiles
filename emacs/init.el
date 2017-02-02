
;; Let emacs save my ass without cluttering my directories in the process
(setq backup-directory-alist `(("." . "~/.emacs_saves/")))

;; ----------------------------------------------------------------------------
;; Packages
;; ----------------------------------------------------------------------------

;; Packages to use
(setq package-list '(
    evil
    evil-leader
))

;; Set package repos
(setq package-archives '(
    ("elpa"      . "http://tromey.com/elpa/")
    ("gnu"       . "http://elpa.gnu.org/packages/")
    ("marmalade" . "http://marmalade-repo.org/packages/")
))

;; Activate all packages
(package-initialize)

;; Fetch the list of packages available
(unless package-archive-contents
    (package-refresh-contents))

;; Install the missing packages
(dolist (package package-list)
    (unless (package-installed-p package)
        (package-install package)))

;; ----------------------------------------------------------------------------
;; Evil
;; ----------------------------------------------------------------------------

(require 'evil)
(evil-mode t)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "\\")
(evil-leader/set-key
"b" 'switch-to-buffer
"w" 'save-buffer)

;; ----------------------------------------------------------------------------
;; Misc
;; ----------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil-leader evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
