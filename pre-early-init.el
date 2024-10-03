;;; pre-early-init.el --- Emacs pre package.el & GUI configuration -*- no-byte-compile: t; lexical-binding: t; -*-
    ;;; Code:

;;; Misc
(setq package-enable-at-startup nil)
(setq custom-file null-device)
;; (setq minimal-emacs-gc-cons-threshold (* 64 1024 1024))

(setq inhibit-default-init nil)
(setq server-client-instructions nil)
(setq desktop-restore-forces-onscreen nil)
(setq ring-bell-function #'ignore)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-charset-priority 'unicode)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))


;; Set-language-environment sets default-input-method, which is unwanted.
(setq default-input-method nil)


(provide 'pre-early-init)
  ;;; pre-early-init.el ends here
