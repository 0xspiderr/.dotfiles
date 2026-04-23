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

(after! org-modern
  (setq org-modern-star 'replace)
  (setq org-modern-replace-stars '"✱"))

(after! treemacs
  (setq treemacs-follow-mode t)
  (setq treemacs-project-follow-mode t)
  (setq treemacs-add-and-display-current-project-exclusively t)
  (add-hook 'projectile-after-switch-project-hook #'treemacs-add-and-display-current-project-exclusively))
;; org roam ui setup(must also install org-roam-ui from MELPA)
(use-package! websocket
  :after org-roam)
(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))
