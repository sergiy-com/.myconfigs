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
   '(evil-indent-plus evil-indent-textobject evil-leader magit yaml-mode evil-tutor powerline markdown-mode help use-package helm evil-visual-mark-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(defun my-config-evil-leader ()
  "Configure evil leader mode."
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "," 'other-window
    "d" 'kill-this-buffer
    "g" 'magit-status
    "o" 'delete-other-windows
    "y" 'yank-to-x-clipboard))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (my-config-evil-leader))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-plus
    :ensure t
    :config
    (define-key evil-inner-text-objects-map "i" 'evil-indent-plus-i-indent)
    (define-key evil-outer-text-objects-map "i" 'evil-indent-plus-a-indent)
    (define-key evil-inner-text-objects-map "I" 'evil-indent-plus-i-indent-up)
    (define-key evil-outer-text-objects-map "I" 'evil-indent-plus-a-indent-up)
    (define-key evil-inner-text-objects-map "J" 'evil-indent-plus-i-indent-up-down)
    (define-key evil-outer-text-objects-map "J" 'evil-indent-plus-a-indent-up-down)))

(use-package helm
	     :ensure t)

(use-package markdown-mode
	     :ensure t)

(use-package yaml-mode
             :ensure t)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(use-package powerline
             :ensure t)
(powerline-default-theme)

(use-package magit
             :ensure t)

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
	    (visual-line-mode t)
	    (define-key evil-normal-state-map (kbd "C-0") 'evil-beginning-of-visual-line)
	    (define-key evil-normal-state-map (kbd "C-h") 'evil-backward-char)
	    (define-key evil-normal-state-map (kbd "C-l") 'evil-forward-char)
	    (define-key evil-normal-state-map (kbd "C-j") 'evil-next-visual-line)
	    (define-key evil-normal-state-map (kbd "C-k") 'evil-previous-visual-line))
	  t)

(setq org-startup-with-inline-images t)
