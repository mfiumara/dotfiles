;; More package resources
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(company-backends
   (quote
    (company-irony company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
		   (company-dabbrev-code company-gtags company-etags company-keywords)
		   company-oddmuse company-dabbrev)))
 '(custom-enabled-themes (quote (wombat)))
 '(fringe-mode (quote (24 . 0)) nil (fringe))
 '(global-display-line-numbers-mode t)
 '(line-number-mode nil)
 '(package-selected-packages
   (quote
    (which-key company-lsp lsp-ui lsp-treemacs cargo lsp-mode rust-mode treemacs helm-projectile ## company-irony realgud irony neotree use-package projectile company magit flycheck paradox evil)))
 '(paradox-github-token t)
 '(tool-bar-mode nil))

; VIM key-bindings
(evil-mode 1)

; Line numbers
(global-display-line-numbers-mode)
; Font spacing
(setq-default line-spacing 2)
; Line Wrapping
(visual-line-mode)

; Language server settings
(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (rust-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)

;; optionally if you want to use debugger
;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :config
  (which-key-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro for Powerline" :size 14 :foundry "ADBO" :slant normal :weight normal :width normal :height 128)))))
