;;----------------------------------------------------------------------------
;;color-theme
(load-file "~/myemacs/color-theme/color-theme.el")
(require 'color-theme)
(color-theme-dark-blue)
;;(set-face-background 'default "LightCyan3") ;;
;;----------------------------------------------------------------------------
;;(add-to-list 'load-path "~/myemacs/point-undo/")
;;(require 'point-undo)
;;(global-set-key [M-left] 'point-undo)
;;(global-set-key [M-right] 'point-redo)
;;----------------------------------------------------------------------------
;;go to last edit point
(load-file "~/myemacs/goto-last-change/goto-last-change.el")
(require 'goto-last-change)
(global-set-key [(meta p)(u)] 'goto-last-change)
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/frame")
(load-file "~/myemacs/frame/frame-cmds.el")
(global-set-key [(control up)] 'move-frame-up)
(global-set-key [(control down)] 'move-frame-down)
(global-set-key [(control left)] 'move-frame-left)
(global-set-key [(control right)] 'move-frame-right)
;;----------------------------------------------------------------------------
(load-file "~/myemacs/bm/bm-1.34.el")
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
;;move the current line up or down
(global-set-key [(meta up)] 'move-line-up)
(global-set-key [(meta down)] 'move-line-down)

(defun move-line (&optional n)
 "Move current line N (1) lines up/down leaving point in place."
 (interactive "p")
 (when (null n)
    (setq n 1))
 (let ((col (current-column)))
    (beginning-of-line)
    (next-line 1)
    (transpose-lines n)
    (previous-line 1)
    (forward-char col)))
(defun move-line-up (n)
 "Moves current line N (1) lines up leaving point in place."
 (interactive "p")
 (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
 "Moves current line N (1) lines down leaving point in place."
 (interactive "p")
 (move-line (if (null n) 1 n)))
;;----------------------------------------------------------------------------
;;(add-to-list 'load-path "~/myemacs/yasnippet-bundle-0.5.6.el")
;;(require 'yasnippet-bundle)
;;----------------------------------------------------------------------------
;;(load-file "~/myemacs/csharp/csharp-mode-0.4.0.el");;C#
;; C/C++/Java/C# Mode
(defun my-c-mode-common-hook ()
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'statement-cont 4)
  (c-set-offset 'topmost-intro-cont 0)
  (c-set-offset 'block-open 0)
  (c-set-offset 'arglist-intro 4)
  (c-set-offset 'arglist-cont-nonempty 4)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(defun my-csharp-mode-hook ()
  (progn
   (turn-on-font-lock)
   (auto-fill-mode)
   (setq tab-width 4)
   (define-key csharp-mode-map "\t" 'c-tab-indent-or-complete)))
;;(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)
;;----------------------------------------------------------------------------
(setq load-path (cons "~/myemacs/org-6.27a/lisp" load-path))
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t) 
(setq org-todo-keyword-faces
      '(("TODO"      . org-warning)
        ("DEFERRED"  . shadow)
        ("CANCELED"  . (:foreground "blue" :weight bold))))
(setq org-export-headline-levels 5);;set export headline level
;;set export css
(setq org-export-html-style
"<style type=\"text/css\">
  html { font-family: Times, serif; font-size: 13pt; }
  .title  { text-align: left; }
  .todo   { color: red; }
  .done   { color: green; }
  .tag    { background-color:lightblue; font-weight:normal }
  .target { }
  .timestamp { color: grey }
  .timestamp-kwd { color: CadetBlue }
  p.verse { margin-left: 3% }
  pre {
	border: 1pt solid #AEBDCC;
	background-color: #F3F5F7;
	padding: 5pt;
	font-family: courier, monospace;
        font-size: 90%;
        overflow:auto;
  }
  table { border-collapse: collapse; }
  td, th { vertical-align: top; }
  dt { font-weight: bold; }
</style>"
)
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/bbdb-2.35/lisp")
(require 'bbdb)
(bbdb-initialize)
(load-file "~/myemacs/bbdb-2.35/bbdb-xml-print.el")
(setq bbdb-file "~/myemacs/data/filebat.bbdb")
(require 'bbdb-xml-print)
;;----------------------------------------------------------------------------
;;etags
(setq tags-file-name "~/myemacs/data/TAGS")
;;----------------------------------------------------------------------------
;;ledger
(add-to-list 'load-path "~/myemacs/ledger")
(load "ledger")
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))
;;----------------------------------------------------------------------------
;;(add-to-list 'load-path "~/myemacs/psvn")
;;(require 'psvn)
;;----------------------------------------------------------------------------
(load-file "~/myemacs/sr-speedbar.el")
(require 'sr-speedbar)
(global-set-key (kbd "<f3>") 'sr-speedbar-toggle)
;;----------------------------------------------------------------------------

