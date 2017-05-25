;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'base-theme)
(require 'base-extensions)
(require 'base-functions)
(require 'base-global-keys)

(require 'lang-go)

;; deactive backup-file
(setq make-backup-files nil)

;; compile error
(setq byte-compile--use-old-handlers nil)

;; ESS Configuration
(add-hook 'ess-mode-hook
          '(lambda ()
             (ess-toggle-underscore nil)
             (local-set-key (kbd "C-c RET") 'ess-eval-region-or-line-and-step)
             ))

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
