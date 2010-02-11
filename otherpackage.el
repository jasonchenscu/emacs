;;----------------------------------------------------------------------------
;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(load-file "~/myemacs/calendar-localization/cal-china-x.el")
(require 'cal-china-x)
;;----------------------------------------------------------------------------
;;(require 'xcscope) ;;加载xcscope
;;(setq cscope-initial-directory "d:/cygwin/usr/include/")
;;(setq cscope-index-recursively t)
;;(require 'doxymacs)
;;(add-hook 'c-mode-common-hook 'doxymacs-mode)
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
;;(add-to-list 'load-path "~/myemacs/wordpress")
;;(require 'weblogger)
;;----------------------------------------------------------------------------
(appt-activate)
(setq appt-display-format 'window)
;;(setq appt-display-duration 3)
(setq appt-display-interval 10)
(setq appt-display-mode-line t)
;;----------------------------------------------------------------------------
;;Usage:M-x ascii-on RET
(load-file "~/myemacs/ascii/ascii.el")
(require 'ascii)
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
;;(add-to-list 'load-path "~/myemacs/speedbar-0.14beta4")
;;(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
;;(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
;;(define-key-after (lookup-key global-map [menu-bar tools])
;;  [speedbar] '("Speedbar" . speedbar-frame-mode) [calendar])
;;(global-set-key [(f4)] 'speedbar-get-focus)
;;----------------------------------------------------------------------------

