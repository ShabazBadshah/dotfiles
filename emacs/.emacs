(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("e52718d4b950106873fed00c469941ad8db20f02392d2c7ac184c6defe37ad2c" default)))
 '(org-format-latex-header
   "\\documentclass{article}
\\usepackage[usenames]{color}
[PACKAGES]
[DEFAULT-PACKAGES]
\\pagestyle{empty}             % do not remove
% The settings below are copied from fullpage.sty
\\setlength{\\textwidth}{\\paperwidth}
\\addtolength{\\textwidth}{-3cm}
\\setlength{\\oddsidemargin}{1.5cm}
\\addtolength{\\oddsidemargin}{-2.54cm}
\\setlength{\\evensidemargin}{\\oddsidemargin}
\\setlength{\\textheight}{\\paperheight}
\\addtolength{\\textheight}{-\\headheight}
\\addtolength{\\textheight}{-\\headsep}
\\addtolength{\\textheight}{-\\footskip}
\\addt
olength{\\textheight}{-3cm
\\setlength{\\topmargin}{1.5cm}
\\addtolength{\\topmargin}{-2.54cm}")
 '(org-latex-default-packages-alist
(quote
 (("AUTO" "inputenc" t)
  ("T1" "fontenc" t)
  ("" "fixltx2e" nil)
  ("" "graphicx" t)
  ("" "longtable" nil)
  ("" "float" nil)
  ("" "rotating" nil)
  ("normalem" "ulem" t)
  ("" "amsmath" t)
  ("" "textcomp" t)
  ("" "marvosym" t)
  ("" "wasysym" t)
  ("" "amssymb" t)
  ("" "hyperref" nil)
  "\\tolerance=1000")))
 '(recentf-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; start the following files in org-mode
(setq auto-mode-alist
  '(
    ("\\.org$" . org-mode)
    ("\\.org.gpg$" . org-mode)
    ("\\.ref$" . org-mode)
    ("\\.ref.gpg$" . org-mode)
    ("\\.notes$" . org-mode)
    ("\\.txt$". org-mode)
    ("\\.tex$". org-mode)
))

;; packages to load on startup
(global-linum-mode t)

; custom theme to be loaded on startup
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-hook 'after-init-hook (lambda () (load-theme 'monokai)))


