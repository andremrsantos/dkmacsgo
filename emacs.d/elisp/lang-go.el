(defvar my-packages
  '(;; Go stuff
    go-mode
    go-eldoc
    go-autocomplete)
  "My packages!")

(unless package-archive-contents
  (package-refresh-contents))

;; install missing packages
(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

;;goimports
(defun go-mode-setup ()
  ;; custom compile
  (setq compile-command "go build -v && go test -v && go vet")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  (go-eldoc-setup)
  ;; use goimports
  (setq gofmt-command "goimports")
  ;; format before save
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'go-mode-setup)

;;load autocomplete
(ac-config-default)
(require 'auto-complete-config)
(require 'go-autocomplete)

;;(add-to-list 'load-path (concat (getenv "GOPATH")
;;                                "/src/github.com/golang/lint/misc/emacs"))

(provide 'lang-go)
