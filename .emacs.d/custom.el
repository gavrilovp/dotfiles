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
 '(column-number-mode t)
 '(desktop-save-mode 1)
 '(haskell-font-lock-symbols t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(org-agenda-files
   (list "~/yandex-disk/org/home.org" "~/yandex-disk/org/work.org" "~/yandex-disk/org/university.org"))
 '(package-archives
   (quote
    (("mepla" . "http://melpa.milkbox.net/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(python-indent-offset 4)
 '(standard-indent 2)
 '(tab-width 2)
 '(tool-bar-mode nil))
