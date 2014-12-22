(add-to-list 'load-path "~/.emacs.d/use-package")
;; CL extensions
(require 'cl)

;; for simplifying .emacs
(require 'use-package)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; package.el
(package-initialize)

;; eVIl options
(use-package evil
  :ensure t
  :config
  (progn
    (evil-mode t)

    ;; eVIl leader options and mappings
    (define-key evil-normal-state-map (kbd ",ci") 'evilnc-comment-or-uncomment-lines)
    (define-key evil-normal-state-map (kbd ",cc") 'evilnc-comment-or-uncomment-to-the-line)
    (define-key evil-normal-state-map (kbd ",b") 'switch-to-buffer)

    ;; Window motions
    (define-key evil-normal-state-map (kbd "M-h") 'windmove-left)
    (define-key evil-normal-state-map (kbd "M-j") 'windmove-down)
    (define-key evil-normal-state-map (kbd "M-k") 'windmove-up)
    (define-key evil-normal-state-map (kbd "M-l") 'windmove-right)
    
    ;; PageUp/PageDown/Home/End likes
    (define-key evil-motion-state-map (kbd "C-h") 'evil-first-non-blank)
    (define-key evil-motion-state-map (kbd "C-j") 'evil-scroll-page-down)
    (define-key evil-motion-state-map (kbd "C-k") 'evil-scroll-page-up)
    (define-key evil-motion-state-map (kbd "C-l") 'evil-end-of-line)
    )
  )

;; auto-complete-mode
(use-package auto-complete
  :ensure t
  :config (global-auto-complete-mode t)
)

;; helm
(use-package helm
  :ensure t
  :config (global-set-key (kbd "M-x") 'helm-M-x)
)

;; helm-projectile
(use-package helm-projectile
  :ensure t
  :config 
  (progn
    (projectile-global-mode)
    (setq projectile-completion-system 'helm)
    (global-set-key (kbd "C-c h") 'helm-projectile)
    (helm-projectile-on)
  )
)

;; python autocompletion
(use-package jedi
  :ensure jedi
  :commands jedi:setup
  :init
  (progn
    (setq jedi:setup-keys t)
    (setq jedi:complete-on-dot t)
  )
)

;; python
(use-package python
  :defer t
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
)

;; newline-and-indent on RET
(add-hook 'lisp-mode-hook
  '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
