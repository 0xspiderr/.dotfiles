;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-dracula)
(setq doom-font (font-spec :family "JetBrains Mono" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 16))
;; start in fullscreen
(setq default-frame-alist '((fullscreen . maximized)))

(setq-default line-spacing 0.20)
(setq display-line-numbers-type 'relative)
(global-visual-line-mode t)
(blink-cursor-mode 1)

(setq org-directory "~/org/")
(setq org-roam-directory "~/roam")
(setq org-modern-replace-stars '"✱")
