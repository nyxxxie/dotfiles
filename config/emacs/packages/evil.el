(require 'package)

;; TODO: Ok so I want each of the plugins to be installed and activated with their config values, so replicate this code in a bunch of files with a macro or something so the file takes care of both install and configuration.
(package-install 'evil)
(require 'evil)
(evil-mode 1)

(message "hello from evil")
