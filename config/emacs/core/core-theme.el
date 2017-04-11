(package-install 'color-theme)
(require 'color-theme)
(color-theme-initialize)

;; Default font
(set-default-font "Terminus-8")

;; color definitions
;; colors with +x are lighter, colors with -x are darker
(defvar nyx-fg        "#c6a57b")

(defvar nyx-bg-1      "#101010")
(defvar nyx-bg        "#151515")
(defvar nyx-bg+1      "#202020")
(defvar nyx-bg+2      "#505050")

(defvar nyx-red+1     "#8d4a4a")
(defvar nyx-red       "#953331")
(defvar nyx-red-1     "#953331")

(defvar nyx-orange    "#ff8939")

(defvar nyx-yellow    "#909737")
(defvar nyx-yellow-1  "#909737")

(defvar nyx-green-1   "#546a29")
(defvar nyx-green     "#546a29")
(defvar nyx-green+1   "#7e9960")

(defvar nyx-cyan      "#34676f")

(defvar nyx-blue+1    "#5c737c")
(defvar nyx-blue      "#385e6b")
(defvar nyx-blue-1    "#385e6b")

(defvar nyx-magenta   "#7f355e")

(eval-after-load 'term
  '(setq ansi-term-color-vector
         (vector 'unspecified nyx-bg
                 nyx-red nyx-green
                 nyx-yellow nyx-blue+1
                 nyx-magenta nyx-cyan
                 ;; dirty fix
                 "white")))

(defun color-theme-nyx ()
  (interactive)
  (color-theme-install
   `(color-theme-nyx
     ;;; color-theme mapping
     ((foreground-color . ,nyx-fg)
      (background-color . ,nyx-bg)
      (background-mode . dark)
      (cursor-color . ,nyx-orange))

     ;;; define some reusable nyx faces that we can inherit from afterwards
     (nyx-strong-1-face ((t (:foreground ,nyx-yellow :weight bold))))
     (nyx-strong-2-face ((t (:foreground ,nyx-orange :weight bold))))
     (nyx-warning-face ((t (:foreground ,nyx-yellow-1 :weight bold :underline t))))
     (nyx-error-face ((t (:foreground ,nyx-red-1 :weight bold :underline t))))

     ;;; custom faces
     (linum ((t (:foreground "#505050" :background ,nyx-bg-1 :weight normal))))
     (tooltip ((t (:foreground ,nyx-bg :background ,nyx-fg))))
     (fixed-pitch ((t (:family "Anka/Coder" :height 75))))
     (variable-pitch ((t (:family "Helvetica Neue LT Std"))))

     ;;; whitespace
     (whitespace-space ((t (:foreground ,nyx-bg+1))))
     (whitespace-tab ((t (:foreground ,nyx-bg+1))))
     (whitespace-trailing ((t (:background ,nyx-yellow :weight bold))))
     (whitespace-newline ((t (:foreground ,nyx-bg+1))))
     (whitespace-empty ((t (:foreground ,nyx-fg :background ,nyx-bg))))

     ;;; basic coloring
     (default ((t (:foreground ,nyx-fg))))
     (cursor
      ((t (:foreground ,nyx-fg))))
     (fringe ((t (:foreground "#303030" :background ,nyx-bg))))
     (escape-glyph-face ((t (:foreground ,nyx-red))))
     (header-line ((t (:foreground ,nyx-yellow :background ,nyx-bg-1
                       :box (:line-width 5 :color ,nyx-bg-1)))))
     (highlight ((t (:background ,nyx-bg+1))))

     ;; faces used by isearch
     (isearch ((t (:foreground ,nyx-yellow :background ,nyx-bg-1))))
     (isearch-fail ((t (:foreground ,nyx-fg :background ,nyx-red-1))))
     (lazy-highlight ((t (:foreground ,nyx-yellow :background ,nyx-bg+2))))

     (menu ((t (:foreground ,nyx-fg :background ,nyx-bg))))
     (minibuffer-prompt ((t (:foreground ,nyx-yellow))))
     (mode-line
      ((t (:foreground ,nyx-fg :background ,nyx-bg+1
           :box (:line-width 5 :color ,nyx-bg+1)))))
     (mode-line-highlight ((t (:inverse-video t))))
     (mode-line-inactive ((t (:inherit mode-line :background ,nyx-bg-1
                              :box (:line-width 5 :color ,nyx-bg-1)))))
     (mode-line-buffer-id ((t (:inherit nyx-strong-1-face))))
     (mode-line-inactive
      ((t (:foreground ,nyx-green-1  :background ,nyx-bg-1))))
     (mode-line-folder-face ((t (:foreground ,nyx-bg+2))))
     (mode-line-modified-face ((t (:foreground ,nyx-red))))
     (mode-line-buffer-name ((t (:foreground ,nyx-yellow :weight bold))))
     (mode-line-mode-name ((t (:foreground ,nyx-blue))))
     (mode-line-mode-string ((t (:foreground ,nyx-yellow))))
     (region ((t (:background ,nyx-magenta))))
     (secondary-selection ((t (:background ,nyx-bg+2))))
     (trailing-whitespace ((t (:background ,nyx-red))))
     (vertical-border ((t (:foreground ,nyx-fg))))

     ;;; font lock
     (font-lock-builtin-face ((t (:foreground ,nyx-blue))))
     (font-lock-comment-face ((t (:foreground ,nyx-bg+2))))
     (font-lock-comment-delimiter-face ((t (:foreground ,nyx-bg+2))))
     (font-lock-constant-face ((t (:foreground ,nyx-fg))))
     (font-lock-doc-face ((t (:foreground ,nyx-green+1))))
     (font-lock-doc-string-face ((t (:foreground ,nyx-blue+1))))
     (font-lock-function-name-face ((t (:foreground ,nyx-blue))))
     (font-lock-keyword-face ((t (:inherit nyx-strong-1-face))))
     (font-lock-negation-char-face ((t (:foreground ,nyx-fg))))
     (font-lock-preprocessor-face ((t (:foreground ,nyx-blue))))
     (font-lock-string-face ((t (:foreground ,nyx-red))))
     (font-lock-type-face ((t (:foreground ,nyx-yellow))))
     (font-lock-variable-name-face ((t (:foreground ,nyx-yellow))))
     (font-lock-warning-face ((t (:inherit nyx-warning-face))))

     ;;; external

     ;; diff
     (diff-added ((t (:foreground ,nyx-green+1))))
     (diff-changed ((t (:foreground ,nyx-yellow))))
     (diff-removed ((t (:foreground ,nyx-red))))
     (diff-header ((t (:background ,nyx-bg+1))))
     (diff-file-header
      ((t (:background ,nyx-bg+2 :foreground ,nyx-fg :bold t))))

     ;; eshell
     (eshell-prompt ((t (:inherit nyx-strong-1-face))))
     (eshell-ls-archive ((t (:foreground ,nyx-red-1 :weight bold))))
     (eshell-ls-backup ((t (:inherit font-lock-comment))))
     (eshell-ls-clutter ((t (:inherit font-lock-comment))))
     (eshell-ls-directory ((t (:foreground ,nyx-blue+1 :weight bold))))
     (eshell-ls-executable ((t (:foreground ,nyx-red+1 :weight bold))))
     (eshell-ls-unreadable ((t (:foreground ,nyx-fg))))
     (eshell-ls-missing ((t (:inherit font-lock-warning))))
     (eshell-ls-product ((t (:inherit font-lock-doc))))
     (eshell-ls-special ((t (:inherit nyx-strong-1-face))))
     (eshell-ls-symlink ((t (:foreground ,nyx-cyan :weight bold))))

     ;; flymake
     (flymake-errline ((t (:inherit nyx-error-face))))
     (flymake-warnline ((t (:inherit nyx-warning-face))))

     ;; flyspell
     (flyspell-duplicate ((t (:inherit nyx-warning-face))))
     (flyspell-incorrect ((t (:inherit nyx-error-face))))

     ;; erc
     (erc-action-face ((t (:inherit erc-default-face))))
     (erc-bold-face ((t (:weight bold))))
     (erc-current-nick-face ((t (:inherit nyx-strong-1-face))))
     (erc-dangerous-host-face ((t (:inherit font-lock-warning))))
     (erc-default-face ((t (:foreground ,nyx-fg))))
     (erc-direct-msg-face ((t (:inherit erc-default))))
     (erc-error-face ((t (:inherit font-lock-warning))))
     (erc-fool-face ((t (:inherit erc-default))))
     (erc-highlight-face ((t (:inherit hover-highlight))))
     (erc-input-face ((t (:foreground ,nyx-yellow))))
     (erc-keyword-face ((t (:inherit nyx-strong-1-face))))
     (erc-nick-default-face ((t (:weigth bold))))
     (erc-nick-msg-face ((t (:inherit erc-default))))
     (erc-notice-face ((t (:foreground ,nyx-green))))
     (erc-pal-face ((t (:foreground ,nyx-orange :weight bold))))
     (erc-prompt-face ((t (:inherit nyx-strong-2-face))))
     (erc-timestamp-face ((t (:foreground ,nyx-green+1))))
     (erc-underline-face ((t (:underline t))))

     ;; gnus
     (gnus-group-mail-1-face ((t (:bold t :inherit gnus-group-mail-1-empty))))
     (gnus-group-mail-1-empty-face ((t (:inherit gnus-group-news-1-empty))))
     (gnus-group-mail-2-face ((t (:bold t :inherit gnus-group-mail-2-empty))))
     (gnus-group-mail-2-empty-face ((t (:inherit gnus-group-news-2-empty))))
     (gnus-group-mail-3-face ((t (:bold t :inherit gnus-group-mail-3-empty))))
     (gnus-group-mail-3-empty-face ((t (:inherit gnus-group-news-3-empty))))
     (gnus-group-mail-4-face ((t (:bold t :inherit gnus-group-mail-4-empty))))
     (gnus-group-mail-4-empty-face ((t (:inherit gnus-group-news-4-empty))))
     (gnus-group-mail-5-face ((t (:bold t :inherit gnus-group-mail-5-empty))))
     (gnus-group-mail-5-empty-face ((t (:inherit gnus-group-news-5-empty))))
     (gnus-group-mail-6-face ((t (:bold t :inherit gnus-group-mail-6-empty))))
     (gnus-group-mail-6-empty-face ((t (:inherit gnus-group-news-6-empty))))
     (gnus-group-mail-low-face ((t (:bold t :inherit gnus-group-mail-low-empty))))
     (gnus-group-mail-low-empty-face ((t (:inherit gnus-group-news-low-empty))))
     (gnus-group-news-1-face ((t (:bold t :inherit gnus-group-news-1-empty))))
     (gnus-group-news-2-face ((t (:bold t :inherit gnus-group-news-2-empty))))
     (gnus-group-news-3-face ((t (:bold t :inherit gnus-group-news-3-empty))))
     (gnus-group-news-4-face ((t (:bold t :inherit gnus-group-news-4-empty))))
     (gnus-group-news-5-face ((t (:bold t :inherit gnus-group-news-5-empty))))
     (gnus-group-news-6-face ((t (:bold t :inherit gnus-group-news-6-empty))))
     (gnus-group-news-low-face ((t (:bold t :inherit gnus-group-news-low-empty))))
     (gnus-header-content-face ((t (:inherit message-header-other))))
     (gnus-header-from-face ((t (:inherit message-header-from))))
     (gnus-header-name-face ((t (:inherit message-header-name))))
     (gnus-header-newsgroups-face ((t (:inherit message-header-other))))
     (gnus-header-subject-face ((t (:inherit message-header-subject))))
     (gnus-summary-cancelled-face ((t (:foreground ,nyx-orange))))
     (gnus-summary-high-ancient-face ((t (:foreground ,nyx-blue))))
     (gnus-summary-high-read-face ((t (:foreground ,nyx-green :weight bold))))
     (gnus-summary-high-ticked-face ((t (:inherit nyx-strong-2-face))))
     (gnus-summary-high-unread-face ((t (:foreground ,nyx-fg :weight bold))))
     (gnus-summary-low-ancient-face ((t (:foreground ,nyx-blue))))
     (gnus-summary-low-read-face ((t (:foreground ,nyx-green))))
     (gnus-summary-low-ticked-face ((t (:inherit nyx-strong-2-face))))
     (gnus-summary-low-unread-face ((t (:foreground ,nyx-fg))))
     (gnus-summary-normal-ancient-face ((t (:foreground ,nyx-blue))))
     (gnus-summary-normal-read-face ((t (:foreground ,nyx-green))))
     (gnus-summary-normal-ticked-face ((t (:inherit nyx-strong-2-face))))
     (gnus-summary-normal-unread-face ((t (:foreground ,nyx-fg))))
     (gnus-summary-selected-face ((t (:inherit nyx-strong-1-face))))
     (gnus-cite-1-face ((t (:foreground ,nyx-blue))))
     (gnus-cite-10-face ((t (:foreground ,nyx-yellow-1))))
     (gnus-cite-11-face ((t (:foreground ,nyx-yellow))))
     (gnus-cite-2-face ((t (:foreground ,nyx-blue-1))))
     (gnus-cite-3-face ((t (:foreground ,nyx-blue-1))))
     (gnus-cite-4-face ((t (:foreground ,nyx-green+1))))
     (gnus-cite-5-face ((t (:foreground ,nyx-green+1))))
     (gnus-cite-6-face ((t (:foreground ,nyx-green))))
     (gnus-cite-7-face ((t (:foreground ,nyx-red))))
     (gnus-cite-8-face ((t (:foreground ,nyx-red-1))))
     (gnus-cite-9-face ((t (:foreground ,nyx-red-1))))
     (gnus-group-news-1-empty-face ((t (:foreground ,nyx-yellow))))
     (gnus-group-news-2-empty-face ((t (:foreground ,nyx-green+1))))
     (gnus-group-news-3-empty-face ((t (:foreground ,nyx-green+1))))
     (gnus-group-news-4-empty-face ((t (:foreground ,nyx-blue-1))))
     (gnus-group-news-5-empty-face ((t (:foreground ,nyx-blue-1))))
     (gnus-group-news-6-empty-face ((t (:foreground ,nyx-bg+2))))
     (gnus-group-news-low-empty-face ((t (:foreground ,nyx-bg+2))))
     (gnus-signature-face ((t (:foreground ,nyx-yellow))))
     (gnus-x-face ((t (:background ,nyx-fg :foreground ,nyx-bg))))

     ;; hl-line-mode
     (hl-line-face ((t (:background ,nyx-bg-1))))

     ;; ido-mode
     (ido-first-match ((t (:inherit nyx-strong-1-face))))
     (ido-only-match ((t (:inherit nyx-strong-2-face))))
     (ido-subdir ((t (:foreground ,nyx-yellow))))

     ;; magit
     (magit-section-title ((t (:inherit nyx-strong-1-face))))
     (magit-branch ((t (:inherit nyx-strong-2-face))))

     ;; markdown
     (markdown-header-face ((t (:inherit variable-pitch))))
     (markdown-header-face-1 ((t (:height 200 :inherit markdown-header-face))))
     (markdown-header-face-2 ((t (:height 150 :inherit markdown-header-face))))
     (markdown-header-face-3 ((t (:height 100 :inherit markdown-header-face))))
     (markdown-header-face-4 ((t (:height 90 :inherit markdown-header-face))))

     ;; message-mode
     (message-cited-text-face ((t (:inherit font-lock-comment))))
     (message-header-name-face ((t (:foreground ,nyx-green+1))))
     (message-header-other-face ((t (:foreground ,nyx-green))))
     (message-header-to-face ((t (:inherit nyx-strong-1-face))))
     (message-header-from-face ((t (:inherit nyx-strong-1-face))))
     (message-header-cc-face ((t (:inherit nyx-strong-1-face))))
     (message-header-newsgroups-face ((t (:inherit nyx-strong-1-face))))
     (message-header-subject-face ((t (:inherit nyx-strong-2-face))))
     (message-header-xheader-face ((t (:foreground ,nyx-green))))
     (message-mml-face ((t (:inherit nyx-strong-1-face))))
     (message-separator-face ((t (:inherit font-lock-comment))))

     ;; mew
     (mew-face-header-subject ((t (:foreground ,nyx-orange))))
     (mew-face-header-from ((t (:foreground ,nyx-yellow))))
     (mew-face-header-date ((t (:foreground ,nyx-green))))
     (mew-face-header-to ((t (:foreground ,nyx-red))))
     (mew-face-header-key ((t (:foreground ,nyx-green))))
     (mew-face-header-private ((t (:foreground ,nyx-green))))
     (mew-face-header-important ((t (:foreground ,nyx-blue))))
     (mew-face-header-marginal ((t (:foreground ,nyx-fg :weight bold))))
     (mew-face-header-warning ((t (:foreground ,nyx-red))))
     (mew-face-header-xmew ((t (:foreground ,nyx-green))))
     (mew-face-header-xmew-bad ((t (:foreground ,nyx-red))))
     (mew-face-body-url ((t (:foreground ,nyx-orange))))
     (mew-face-body-comment ((t (:foreground ,nyx-fg :slant italic))))
     (mew-face-body-cite1 ((t (:foreground ,nyx-green))))
     (mew-face-body-cite2 ((t (:foreground ,nyx-blue))))
     (mew-face-body-cite3 ((t (:foreground ,nyx-orange))))
     (mew-face-body-cite4 ((t (:foreground ,nyx-yellow))))
     (mew-face-body-cite5 ((t (:foreground ,nyx-red))))
     (mew-face-mark-review ((t (:foreground ,nyx-blue))))
     (mew-face-mark-escape ((t (:foreground ,nyx-green))))
     (mew-face-mark-delete ((t (:foreground ,nyx-red))))
     (mew-face-mark-unlink ((t (:foreground ,nyx-yellow))))
     (mew-face-mark-refile ((t (:foreground ,nyx-green))))
     (mew-face-mark-unread ((t (:foreground ,nyx-red-1))))
     (mew-face-eof-message ((t (:foreground ,nyx-green))))
     (mew-face-eof-part ((t (:foreground ,nyx-yellow))))

     ;; minimap
     (minimap-font-face ((default (:height 30 :family "Anka/Coder")) (nil nil)))
     (minimap-semantic-function-face ((((background dark)) (:inherit (font-lock-function-name-face minimap-font-face) :background "gray10"))))
     (minimap-semantic-type-face ((t (:inherit (font-lock-type-face minimap-font-face) :background "gray10"))))
     (minimap-semantic-variable-face ((t (:inherit (font-lock-variable-name-face minimap-font-face) :background "gray10"))))

     ;; nav
     (nav-face-heading ((t (:foreground ,nyx-yellow))))
     (nav-face-button-num ((t (:foreground ,nyx-cyan))))
     (nav-face-dir ((t (:foreground ,nyx-green))))
     (nav-face-hdir ((t (:foreground ,nyx-red))))
     (nav-face-file ((t (:foreground ,nyx-fg))))
     (nav-face-hfile ((t (:foreground ,nyx-red-1))))

     ;; org-mode
     (org-agenda-date-today
      ((t (:foreground "white" :slant italic :weight bold))) t)
     (org-agenda-structure
      ((t (:inherit font-lock-comment-face))))
     (org-archived ((t (:foreground ,nyx-fg :weight bold))))
     (org-checkbox ((t (:background ,nyx-bg+2 :foreground "white"
                                    :box (:line-width 1 :style released-button)))))
     (org-date ((t (:foreground ,nyx-blue :underline t))))
     (org-deadline-announce ((t (:foreground ,nyx-red-1))))
     (org-done ((t (:bold t :weight bold :foreground ,nyx-green+1))))
     (org-formula ((t (:foreground ,nyx-yellow-1))))
     (org-headline-done ((t (:foreground ,nyx-green+1))))
     (org-hide ((t (:foreground ,nyx-bg-1))))
     (org-level-1 ((t (:foreground ,nyx-orange))))
     (org-level-2 ((t (:foreground ,nyx-green+1))))
     (org-level-3 ((t (:foreground ,nyx-blue-1))))
     (org-level-4 ((t (:foreground ,nyx-yellow-1))))
     (org-level-5 ((t (:foreground ,nyx-cyan))))
     (org-level-6 ((t (:foreground ,nyx-green-1))))
     (org-level-7 ((t (:foreground ,nyx-red-1))))
     (org-level-8 ((t (:foreground ,nyx-blue-1))))
     (org-link ((t (:foreground ,nyx-yellow-1 :underline t))))
     (org-scheduled ((t (:foreground ,nyx-green+1))))
     (org-scheduled-previously ((t (:foreground ,nyx-red-1))))
     (org-scheduled-today ((t (:foreground ,nyx-blue+1))))
     (org-special-keyword ((t (:foreground ,nyx-yellow-1))))
     (org-table ((t (:foreground ,nyx-green+1))))
     (org-tag ((t (:bold t :weight bold))))
     (org-time-grid ((t (:foreground ,nyx-orange))))
     (org-todo ((t (:bold t :foreground ,nyx-red :weight bold))))
     (org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
     (org-warning ((t (:bold t :foreground ,nyx-red :weight bold))))

     ;; outline
     (outline-8 ((t (:inherit default))))
     (outline-7 ((t (:inherit outline-8 :height 1.0))))
     (outline-6 ((t (:inherit outline-7 :height 1.0))))
     (outline-5 ((t (:inherit outline-6 :height 1.0))))
     (outline-4 ((t (:inherit outline-5 :height 1.0))))
     (outline-3 ((t (:inherit outline-4 :height 1.0))))
     (outline-2 ((t (:inherit outline-3 :height 1.0))))
     (outline-1 ((t (:inherit outline-2 :height 1.0))))

     ;; rainbow-delimiters
     (rainbow-delimiters-depth-1-face ((t (:foreground ,nyx-cyan))))
     (rainbow-delimiters-depth-2-face ((t (:foreground ,nyx-yellow))))
     (rainbow-delimiters-depth-3-face ((t (:foreground ,nyx-blue+1))))
     (rainbow-delimiters-depth-4-face ((t (:foreground ,nyx-red+1))))
     (rainbow-delimiters-depth-5-face ((t (:foreground ,nyx-orange))))
     (rainbow-delimiters-depth-6-face ((t (:foreground ,nyx-blue-1))))
     (rainbow-delimiters-depth-7-face ((t (:foreground ,nyx-green+1))))
     (rainbow-delimiters-depth-8-face ((t (:foreground ,nyx-red-1))))
     (rainbow-delimiters-depth-9-face ((t (:foreground ,nyx-yellow-1))))
     (rainbow-delimiters-depth-10-face ((t (:foreground ,nyx-green+1))))
     (rainbow-delimiters-depth-11-face ((t (:foreground ,nyx-blue+1))))
     (rainbow-delimiters-depth-12-face ((t (:foreground ,nyx-red-1))))

     ;; rpm-mode
     (rpm-spec-dir-face ((t (:foreground ,nyx-green))))
     (rpm-spec-doc-face ((t (:foreground ,nyx-green))))
     (rpm-spec-ghost-face ((t (:foreground ,nyx-red))))
     (rpm-spec-macro-face ((t (:foreground ,nyx-yellow))))
     (rpm-spec-obsolete-tag-face ((t (:foreground ,nyx-red))))
     (rpm-spec-package-face ((t (:foreground ,nyx-red))))
     (rpm-spec-section-face ((t (:foreground ,nyx-yellow))))
     (rpm-spec-tag-face ((t (:foreground ,nyx-blue))))
     (rpm-spec-var-face ((t (:foreground ,nyx-red))))

     ;; show-paren
     (show-paren-mismatch ((t (:background ,nyx-red-1 :weight bold))))
     (show-paren-match ((t (:background ,nyx-blue-1 :weight bold))))

     ;; wanderlust
     (wl-highlight-folder-few-face ((t (:foreground ,nyx-red-1))))
     (wl-highlight-folder-many-face ((t (:foreground ,nyx-red-1))))
     (wl-highlight-folder-path-face ((t (:foreground ,nyx-orange))))
     (wl-highlight-folder-unread-face ((t (:foreground ,nyx-blue))))
     (wl-highlight-folder-zero-face ((t (:foreground ,nyx-fg))))
     (wl-highlight-folder-unknown-face ((t (:foreground ,nyx-blue))))
     (wl-highlight-message-citation-header ((t (:foreground ,nyx-red-1))))
     (wl-highlight-message-cited-text-1 ((t (:foreground ,nyx-red))))
     (wl-highlight-message-cited-text-2 ((t (:foreground ,nyx-green+1))))
     (wl-highlight-message-cited-text-3 ((t (:foreground ,nyx-blue))))
     (wl-highlight-message-cited-text-4 ((t (:foreground ,nyx-blue+1))))
     (wl-highlight-message-header-contents-face ((t (:foreground ,nyx-green))))
     (wl-highlight-message-headers-face ((t (:foreground ,nyx-red+1))))
     (wl-highlight-message-important-header-contents ((t (:foreground ,nyx-green+1))))
     (wl-highlight-message-header-contents ((t (:foreground ,nyx-green+1))))
     (wl-highlight-message-important-header-contents2 ((t (:foreground ,nyx-green+1))))
     (wl-highlight-message-signature ((t (:foreground ,nyx-green))))
     (wl-highlight-message-unimportant-header-contents ((t (:foreground ,nyx-fg))))
     (wl-highlight-summary-answered-face ((t (:foreground ,nyx-blue))))
     (wl-highlight-summary-disposed-face ((t (:foreground ,nyx-fg
                                                          :slant italic))))
     (wl-highlight-summary-new-face ((t (:foreground ,nyx-blue))))
     (wl-highlight-summary-normal-face ((t (:foreground ,nyx-fg))))
     (wl-highlight-summary-thread-top-face ((t (:foreground ,nyx-yellow))))
     (wl-highlight-thread-indent-face ((t (:foreground ,nyx-magenta))))
     (wl-highlight-summary-refiled-face ((t (:foreground ,nyx-fg))))
     (wl-highlight-summary-displaying-face ((t (:underline t :weight bold)))))))

(add-to-list 'color-themes '(color-theme-nyx
                             "nyx"
                             "Nyxxie"))

(color-theme-nyx)
