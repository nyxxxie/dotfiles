(package-install 'sublimity)
(require 'sublimity)
(sublimity-mode 1)

;; Enable minimap
(require 'sublimity-map)
(sublimity-map-set-delay nil) ; Don't disappear

;; Enable smooth scroll
(require 'sublimity-scroll)
(setq sublimity-scroll-weight 5
      sublimity-scroll-drift-length 10)

;; Enable attractive stuff
(require 'sublimity-attractive)
(setq sublimity-attractive-centering-width nil) ; Disable silly view centering
(sublimity-attractive-hide-bars) ; No more scroll bars 
