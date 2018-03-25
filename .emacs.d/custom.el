(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "xelatex")
 '(TeX-PDF-mode t)
 '(TeX-engine (quote xetex))
 '(TeX-view-program-list
   (quote
    (("zathura" "zathura %o")
     ("okular" "okular --unique %o#src:%n%b"))))
 '(TeX-view-program-selection
   (quote
    ((engine-omega "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "zathura")
     (output-html "xdg-open"))))
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(autopair-pair-criteria (quote help-balance))
 '(column-number-mode t)
 '(desktop-save-mode 1)
 '(elpy-rpc-backend "jedi")
 '(elpy-rpc-large-buffer-size 2048)
 '(elpy-rpc-timeout 2)
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(haskell-font-lock-symbols t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(org-agenda-files
   (list "~/yandex-disk/org/home.org" "~/yandex-disk/org/work.org" "~/yandex-disk/org/studying.org"))
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(python-indent-offset 4)
 '(pyvenv-activate nil)
 '(show-paren-mode t)
 '(standard-indent 2)
 '(tab-width 2)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
