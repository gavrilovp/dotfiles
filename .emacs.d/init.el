;; CL extensions
(require 'cl)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)

(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;; package.el
(package-initialize)

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

    (add-hook 'neotree-mode-hook
      (lambda ()
        (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
        (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
        (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
        (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
    )
  )

(use-package evil-nerd-commenter
  :ensure t
  )

(use-package magit
  :ensure t
  :config (global-set-key (kbd "C-x g") 'magit-status)
  )

(use-package monky
  :ensure t
  )

(use-package auto-complete
  :ensure t
  :config (global-auto-complete-mode t)
  )

(use-package autopair
  :ensure t
  :config (autopair-global-mode)
  )

(use-package linum-relative
  :ensure t
  :config
  (progn
    (global-linum-mode t)
    ;; Auto change between relative and absolute styles
    (add-hook 'post-command-hook
              (lambda ()
                (cond ((evil-insert-state-p)
                       (progn
                         (setq linum-format 'dynamic)
                         (linum-schedule)
                         ))
                      ((evil-normal-state-p)
                       (progn
                         (setq linum-format 'linum-relative)
                         (linum-schedule)
                         ))
                      )))
    )
  )

(use-package neotree
  :ensure t
  :config
  (progn
    (global-set-key [f2] 'neotree-toggle)
    (defadvice helm-projectile-find-file
        (after helm-projectile-find-file activate)
      (neotree-dir projectile-project-root))
    )
  )

(use-package helm
  :ensure t
  :config
  (progn
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
    )     
  )

(use-package projectile
  :ensure t
  )

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

(defun helm-gtags-add-keys ()
  (local-set-key (kbd "M-g") 'helm-gtags-dwim)
  (local-set-key (kbd "M-b") 'helm-gtags-pop-stack)
  )

(use-package helm-gtags
  :ensure t
  :config
  (progn
    (add-hook 'c-mode-hook 'helm-gtags-mode)
    (add-hook 'helm-gtags-mode-hook 'helm-gtags-add-keys)
    (setq helm-gtags-auto-update t)
    )
  )

(defun elpy-add-keys ()
  (local-set-key (kbd "M-g") 'elpy-goto-definition)
  (local-set-key (kbd "M-b") 'pop-tag-mark)
  (local-set-key [f9] 'elpy-test)
  (local-set-key [f5] 'recompile)
  )

(use-package elpy
  :ensure t
  :init
  (progn
    (elpy-enable)
    (setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
    (setq elpy-rpc-ignored-buffer-size 100)
    )
  :config
  (progn
    (add-hook 'elpy-mode-hook 'hs-minor-mode)
    (add-hook 'elpy-mode-hook 'elpy-add-keys)
    (add-hook 'elpy-mode-hook 'which-function-mode)
    )
  )

(add-hook 'c-mode-hook
          (lambda ()
            (local-set-key [f5] 'compile))
  )

;; newline-and-indent on RET
(add-hook 'lisp-mode-hook
          '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

(use-package tex
  :ensure auctex
  :config (progn
            (setq TeX-parse-self t
                  TeX-auto-save t
                  TeX-save-query nil)
            )
  )

(use-package auctex-latexmk
  :ensure t
  :config (progn
            (auctex-latexmk-setup)
            (add-hook 'LaTeX-mode-hook (lambda () (setq TeX-command-default "LatexMk")))
            )
  )

(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-dark)
  )

(use-package ghc
	:ensure t
	:commands ghc-init
	)

(use-package haskell-mode
  :ensure t
  :config (progn
            (add-hook 'haskell-mode-hook 'haskell-indentation-mode)
            (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
            )
  )

(use-package sql
  :defer t
  :config
  (progn
    (sql-set-product 'oracle)
    (add-hook 'sql-mode-hook 'sql-highlight-oracle-keywords)
    )
  )

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

(use-package powerline
  :ensure t
  :config (powerline-default-theme)
  )

(use-package ess
  :ensure t
  )

(use-package docker
  :ensure t
  )

(use-package dockerfile-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
  )

(use-package nginx-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("/nginx/sites-\\(?:available\\|enabled\\)/" . nginx-mode))
  )

;; for testing
(setenv "PYTHONPATH" "/home/pavel/balance/utils")
(setenv "YANDEX_XML_CONFIG" "/home/pavel/balance/configs/balance-dev.cfg")
(pyvenv-activate "/home/pavel/balance/env")


(put 'erase-buffer 'disabled nil)


(global-auto-revert-mode) 

(use-package realgud
  :ensure t
  )
