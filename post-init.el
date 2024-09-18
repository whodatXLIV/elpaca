;;; post-init.el --- Emacs pre package.el & GUI configuration -*- no-byte-compile: t; lexical-binding: t; -*-
    ;;; Code:

(which-key-mode)
(setq initial-buffer-choice t) ;;*scratch*



(keymap-global-set "H-r" 'revert-buffer)
(keymap-global-set "H-l" 'scroll-lock-mode)
(keymap-global-set "C-x e" 'eshell)
(keymap-global-set "C-x C-;" 'comment-line)
(keymap-global-set "C-H-<up>" 'scroll-other-window-down)
(keymap-global-set "C-H-<down>" 'scroll-other-window)


(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq mark-ring-max 4)
(setq global-mark-ring-max 4)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse


(global-display-line-numbers-mode t)
(show-paren-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq font-lock-maximum-decoration 2)


(defun connect-focusvq-home ()
  (interactive)
  (dired "/scp:sfigueroa@dev:~"))

(setq sql-connection-alist
      '(
        (mysql-fds (sql-product 'mysql)
                   (sql-port 0)
                   (sql-server "db.internal.focusvq.com")
                   (sql-user "fds")
                   (sql-password "WnJSuqmND9i0ePYw")
                   (sql-database "fds"))

        (mysql-elcano (sql-product 'mysql)
                      (sql-port 0)
                      (sql-server "db.internal.focusvq.com")
                      (sql-user "fds")
                      (sql-password "WnJSuqmND9i0ePYw")
                      (sql-database "elcano"))
        )
      )

(keymap-global-set "H-c h" 'connect-focusvq-home)


;;; recolor ansi

(defun ansi-color-on-buffer ()
  "..."
  (interactive)

  (replace-string-in-region "[43m" "[45m" (point-min) (point-max) ) ;; replace yellow highlights
  (replace-string-in-region ";43m" ";45m" (point-min) (point-max) )
  (replace-string-in-region "[34m" "[33m" (point-min) (point-max) ) ;; replace blue text
  (replace-string-in-region ";34m" ";33m" (point-min) (point-max) )
  (ansi-color-apply-on-region (point-min) (point-max)))

;;;This is for when I accidentally make a column in org mode

(defun set-region-writeable (begin end)
  "Removes the read-only text property from the marked region."
  ;; See http://stackoverflow.com/questions/7410125
  (interactive "r")
  (let ((modified (buffer-modified-p))
        (inhibit-read-only t))
    (remove-text-properties begin end '(read-only t))
    (set-buffer-modified-p modified)))


(provide 'post-init)
  ;;; post-init.el ends here
