(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; Initialize and refresh packages on load
;;
;;(unless package-archive-contents    ;; Refresh the packages descriptions
;;  (package-refresh-contents))
;;(setq package-load-list '(all))     ;; List of packages to load
;;(unless (package-installed-p 'org)  ;; Make sure the Org package is
;;  (package-install 'org))           ;; installed, install it if not
(package-initialize)                ;; Initialize & Install Package


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (org-plus-contrib org rust-mode lsp-mode magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Keep the windows from resizing. I always want it to be this
;; size when I first open the application
;;
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 120) ; chars
              (height . 60) ; lines
              (left . 50)
              (top . 50)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 120)
              (height . 60)
              (left . 50)
              (top . 50)))
      (setq frame-title-format
      '(buffer-file-name "%b - %f"              ; File buffer
        (dired-directory dired-directory        ; Dired buffer
         (revert-buffer-function "%b"           ; Buffer Menu
          ("%b - Dir: " default-directory)))))) ; Plain buffer
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

(column-number-mode 1) ;; Show column position

;; Set font size to 14pt
;;
(set-face-attribute 'default nil :height 140)

;; Use spaces for tab
;;
(setq-default indent-tabs-mode nil)

;; Shut the bell up
;;
(setq ring-bell-function 'ignore)

;; Overwrite selected text
;;
(delete-selection-mode t)

;; org-mode config
;;
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-directory "~/org")
(setq org-startup-folded "showall")

;; other stuff
;;
(global-set-key [f7] (lambda () (interactive) (find-file user-init-file)))
