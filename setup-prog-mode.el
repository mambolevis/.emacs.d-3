;;; Common settings for modes deriving from prog-mode

(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(defun local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (turn-on-auto-fill))

(defun prog-mode-defaults ()
  "Default coding hook"
  (flyspell-prog-mode)
  (local-comment-auto-fill)
  (add-watchwords)
  ;; Highlight changes made to files under vc
  (diff-hl-mode)
  ;; Highlight symbol at point
  (highlight-symbol-mode 1)
  (local-set-key (kbd "M-s n") 'highlight-symbol-next)
  (local-set-key (kbd "M-s p") 'highlight-symbol-prev)
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent))

(add-hook 'prog-mode-hook 'prog-mode-defaults)

(provide 'setup-prog-mode)
