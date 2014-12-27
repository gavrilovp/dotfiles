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
 '(fill-column 80)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(package-archives
   (quote
    (("mepla" . "http://melpa.milkbox.net/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(python-indent-offset 4)
 '(standard-indent 2)
 '(tab-width 2)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))
