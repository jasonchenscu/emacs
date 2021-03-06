;;----------------------------------------------------------------------------
;;界面颜色主题 color-theme
(load-file "~/myemacs/color-theme/color-theme.el")
(require 'color-theme)
(color-theme-dark-blue)
;;(set-face-background 'default "LightCyan3") ;;设置背景色为 浅青色3
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/point-undo/")
(require 'point-undo)
(global-set-key [M-left] 'point-undo)
(global-set-key [M-right] 'point-redo)
;;----------------------------------------------------------------------------
;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(load-file "~/myemacs/calendar-localization/cal-china-x.el")
(require 'cal-china-x)
;;----------------------------------------------------------------------------
;;go to last edit point
(load-file "~/myemacs/goto-last-change/goto-last-change.el")
(require 'goto-last-change)
(global-set-key [(meta p)(u)] 'goto-last-change)
;;----------------------------------------------------------------------------
(require 'xcscope) ;;加载xcscope
;;(setq cscope-initial-directory "c:/cygwin/usr/include/")
(setq cscope-index-recursively t)
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
;;----------------------------------------------------------------------------
;;dictionary
(add-to-list 'load-path "~/myemacs/dictionary")
(autoload 'dictionary-search "dictionary"
  "Ask for a word and search it in all dictionaries" t)
(autoload 'dictionary-match-words "dictionary"
  "Ask for a word and search all matching words in the dictionaries" t)
(autoload 'dictionary-lookup-definition "dictionary"
  "Unconditionally lookup the word at point." t)
(autoload 'dictionary "dictionary"
  "Create a new dictionary buffer" t)
(autoload 'dictionary-mouse-popup-matching-words "dictionary"
  "Display entries matching the word at the cursor" t)
(autoload 'dictionary-popup-matching-words "dictionary"
  "Display entries matching the word at the point" t)
(autoload 'dictionary-tooltip-mode "dictionary"
  "Display tooltips for the current word" t)
(autoload 'global-dictionary-tooltip-mode "dictionary"
  "Enable/disable dictionary-tooltip-mode for all buffers" t)
;; key bindings
(global-set-key "\C-cs" 'dictionary-search)
(global-set-key "\C-cm" 'dictionary-match-words)
;; choose a dictionary server
(setq dictionary-server "127.0.0.1")
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/wordpress")
(require 'weblogger)
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

;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/frame")
(load-file "~/myemacs/frame/frame-cmds.el")
(global-set-key [(control up)] 'move-frame-up)
(global-set-key [(control down)] 'move-frame-down)
(global-set-key [(control left)] 'move-frame-left)
(global-set-key [(control right)] 'move-frame-right)

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
(add-to-list 'load-path "~/myemacs/yasnippet-bundle-0.5.6.el")
(require 'yasnippet-bundle)
;;----------------------------------------------------------------------------
(appt-activate)
(setq appt-display-format 'window)
;;(setq appt-display-duration 3)
(setq appt-display-interval 10)
(setq appt-display-mode-line t)
;;----------------------------------------------------------------------------
(setq load-path (cons "~/myemacs/org-6.27a/lisp" load-path))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key mode-specific-map [?a] 'org-agenda)
(eval-after-load "org"
  '(progn
     (add-to-list 'org-file-apps '("py" . emacs))
     (define-prefix-command 'org-todo-state-map)
     (define-key org-mode-map "\C-cx" 'org-todo-state-map)
     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))
     )
)
(eval-after-load "org-agenda"
  '(progn
     (define-key org-agenda-mode-map "\C-n" 'next-line)
     (define-key org-agenda-keymap "\C-n" 'next-line)
     (define-key org-agenda-mode-map "\C-p" 'previous-line)
     (define-key org-agenda-keymap "\C-p" 'previous-line)))
(add-to-list 'load-path "~/myemacs/remember-2.0")
(require 'remember)
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map [(control meta ?r)] 'remember)
(custom-set-variables
'(org-agenda-files (quote ("~/myemacs/data/jason_todo.org")))
'(org-default-notes-file "~/myemacs/data/jason_notes.org")
'(org-agenda-ndays 7)
'(org-deadline-warning-days 14)
'(org-agenda-show-all-dates t)
'(org-agenda-skip-deadline-if-done t)
'(org-agenda-skip-scheduled-if-done t)
'(org-agenda-start-on-weekday nil)
'(org-reverse-note-order t)
'(org-fast-tag-selection-single-key (quote expert))
'(org-agenda-custom-commands
(quote (("d" todo "DELEGATED" nil)
("c" todo "DONE|DEFERRED|CANCELLED" nil)
("w" todo "WAITING" nil)
("W" agenda "" ((org-agenda-ndays 21)))
("A" agenda ""
((org-agenda-skip-function
(lambda nil
(org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
(org-agenda-ndays 1)
(org-agenda-overriding-header "Today's Priority #A tasks: ")))
("u" alltodo ""
((org-agenda-skip-function
(lambda nil
(org-agenda-skip-entry-if (quote scheduled) (quote deadline)
(quote regexp) "<[^>\n]+>")))
(org-agenda-overriding-header "Unscheduled TODO entries: "))))))
'(org-remember-store-without-prompt t)
'(org-remember-templates
(quote ((116 "* TODO %?\n  %u" "~/myemacs/data/todo.org" "Tasks")
(110 "* %u %?" "~/myemacs/data/notes.org" "Notes"))))
'(remember-annotation-functions (quote (org-remember-annotation)))
'(remember-handler-functions (quote (org-remember-handler))))

(org-remember-insinuate)
(setq org-directory "~/myemacs/data/")
(setq org-default-notes-file (concat org-directory "/todo.org"))
(define-key global-map "\C-cr" 'org-remember)

(setq org-todo-keyword-faces
      '(("TODO"      . org-warning)
        ("DEFERRED"  . shadow)
        ("CANCELED"  . (:foreground "blue" :weight bold))))
(setq org-tags-column 85);;to which column the tags should be indented
;;----------------------------------------------------------------------------
(load-file "~/myemacs/ascii/ascii.el")
(require 'ascii)
;;Usage:M-x ascii-on RET
;;----------------------------------------------------------------------------
;;Find file recursively
(load-file "~/myemacs/find-recursive/find-recursive.el")
(require 'find-recursive)
;;----------------------------------------------------------------------------
;; gnus setup
(setq user-mail-address "markfilebat@126.com")
(setq user-full-name "Denny Zhang")

;; pop setup
(setq mail-sources '((pop :server "pop3.126.com" :user "markfilebat@126.com" :password "file.bat")))

;; smtp
(load "smtpmail")
(setq smtpmail-default-smtp-server "smtp.126.com")
(setq smtpmail-smtp-service 25)
(setq smtpmail-local-domain nil)
(setq smtpmail-sendto-domain nil)
(setq smtpmail-debug-info t)
(setq smtpmail-smtp-server "smtp.126.com")
(setq smtp-server "smtp.126.com")
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-auth-login-username "markfilebat@126.com")
(setq smtpmail-auth-credentials '(("smtp.126.com" 25 "markfilebat" "file.bat")))

;; nntp setup
(setq gnus-select-method '(nntp "news.cn99.com"))
(setq gnus-secondary-select-methods '((nnml "")))

;;(setq starttls-use-gnutls t
;;      starttls-gnutls-program "gnutls-cli"
;;        starttls-extra-arguments nil)
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
(add-to-list 'load-path "~/myemacs/psvn")
(require 'psvn)
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/boxquote")
(require 'boxquote)
;;----------------------------------------------------------------------------
;;(add-to-list 'load-path "~/myemacs/extraedit/")
;;(require 'extraedit)
;;----------------------------------------------------------------------------
;;emms
;;(add-to-list 'load-path "~/myemacs/emms/")
;;(require 'emms-setup)
;;(emms-standard)
;;(emms-default-players)
;;----------------------------------------------------------------------------
;;(add-to-list 'load-path "~/myemacs/w3m")
;;(require 'w3m)
;;----------------------------------------------------------------------------
;;(load-file "~/myemacs/actionscript/actionscript-mode.el")
;;(require 'actionscript-mode)
;;(add-to-list 'auto-mode-alist '("\\.mxml$" . actionscript-mode))
;;----------------------------------------------------------------------------
;; Remote file editing via ssh
;(add-to-list 'load-path "~/myemacs/tramp/lisp/")
(require 'tramp)
(custom-set-variables
 '(tramp-auto-save-directory "~/myemacs/data")
 '(tramp-debug-buffer t)
 '(tramp-default-method "sshx")
 '(tramp-encoding-command-switch "-c")
 '(tramp-encoding-shell "bash")
 '(tramp-verbose 10)
)
;;----------------------------------------------------------------------------
(load-file "~/myemacs/sr-speedbar.el")
(require 'sr-speedbar)
(global-set-key (kbd "<f3>") 'sr-speedbar-toggle)
;;----------------------------------------------------------------------------
;;(add-to-list 'load-path "~/myemacs/speedbar-0.14beta4")
;;(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
;;(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
;;(define-key-after (lookup-key global-map [menu-bar tools])
;;  [speedbar] '("Speedbar" . speedbar-frame-mode) [calendar])
;;(global-set-key [(f4)] 'speedbar-get-focus)
