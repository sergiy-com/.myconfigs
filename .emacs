(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enanble-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(evil-tutor powerline markdown-mode help use-package helm evil-visual-mark-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'evil)
(evil-mode t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package helm
	     :ensure t)

(use-package markdown-mode
	     :ensure t)

(use-package powerline
  :ensure t)
(powerline-default-theme)

;;; If `display-line-numbers-mode' is available (only in Emacs 26),
;;; use it! Otherwise, install and run nlinum-relative.
(if (functionp 'display-line-numbers-mode)
    (and (add-hook 'display-line-numbers-mode-hook
                   (lambda () (setq display-line-numbers-type 'relative)))
         (add-hook 'prog-mode-hook #'global-display-line-numbers-mode))
  (use-package nlinum-relative
    :ensure t
    :config
    (nlinum-relative-setup-evil)
    (setq nlinum-relative-redisplay-delay 0)
    (add-hook 'prog-mode-hook #'nlinum-relative-mode)))

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "M-n") 'org-next-link)
  (define-key org-mode-map (kbd "M-p") 'org-previous-link))

(setq initial-frame-alist
      `((top . 50)
	(left . 400)))

;;; Make command key on mac behaves like meta
;;; to be able to use opt+key for special (e.g. polish) symbols
(setq mac-option-key-is-meta nil)
(setq mac-command-key-ismeta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(setq default-directory "~/")
(setq command-line-default-directory "~/")

;;;(setq doom-font (font-spec :family "JetBrains Mono" :size 13.0))
(set-face-font 'default "-unknown-JetBrains Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")
(setq line-spacing 0.2)

(setq org-hide-emphasis-markers t)

(add-hook 'org-mode-hook
	  (lambda ()
	    (org-indent-mode t)
	    (visual-line-mode t))
	  t)
