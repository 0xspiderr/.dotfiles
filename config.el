;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-dracula)
(setq doom-font (font-spec :family "JetBrains Mono" :size 18 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 20))
;; start in fullscreen
(setq default-frame-alist '((fullscreen . maximized)))
(set-frame-parameter nil 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95))
;; Automatically zoom in by 2 levels for every buffer
(add-hook! 'after-change-major-mode-hook
  (defun my/auto-zoom-in-except-dashboard ()
    (unless (or (eq major-mode '+doom-dashboard-mode)
                (string= (buffer-name) "*doom*")
                (minibufferp))
      (text-scale-set 2))))
;; Enable automatic documentation popups for lsp-mode
(after! lsp-ui
  (setq lsp-ui-doc-enable t                 ; Enable the doc popup
        lsp-ui-doc-show-with-cursor t       ; Show popup when the text cursor rests on a method
        lsp-ui-doc-show-with-mouse t        ; Show popup when the mouse pointer hovers over a method
        lsp-ui-doc-delay 0.5                ; Delay in seconds before it pops up (adjust to preference)
        lsp-ui-doc-position 'at-point))     ; Show the popup right next to the cursor/mouse

(setq-default line-spacing 0.20)
(setq display-line-numbers-type 'relative)
(global-visual-line-mode t)
(blink-cursor-mode 1)

(setq org-directory "~/org/")
(setq org-roam-directory "~/roam")

(after! org-modern
  (setq org-modern-star 'replace)
  (setq org-modern-replace-stars '"✱"))

;; gdscript customization
;; (add-hook 'gdscript-mode-hook 'eglot-ensure)
(setq gdscript-use-tab-indents t) ;; If true, use tabs for indents. Default: t
(setq gdscript-indent-offset 4)
(setq gdscript-gdformat-save-and-format t)
(setq gdscript-godot-executable "~/Downloads/linux64-g462-s164-gs4181-editor/godotsteam.462.editor.x86_64")

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
