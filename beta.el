;;----------------------------------------------------------------------------
;;按alt+p del来, 将选中区域,每行行首去掉一个字符
(define-key global-map  (kbd "M-p <left>")   'my-region-eliminate)
(defun my-region-eliminate (beginning end)
  (interactive "r")
  (save-excursion
    (if (< end beginning)
        (let (tmp beginning)
          (beginning end)
          (end tmp)))
    (goto-char beginning)
    (while (< (point) end)
      (delete-char 1)
      (forward-line 1)
     )
    (goto-char beginning)
    (set-mark-command)
    )
)
;;----------------------------------------------------------------------------
;;按alt+p space来, 将选中区域,每行行首添加一个空格
(define-key global-map  (kbd "M-p <right>")   'my-region-space)
(defun my-region-space (beginning end)
  (interactive "r")
  (if (< end beginning)
      (let (tmp beginning)
        (beginning end)
        (end tmp)))
  (goto-char beginning)
  (while (< (point) end)
    (insert-char '?\ ' 1 )
    (setq end (+ 1 end))
    (forward-line 1)
    )
  (goto-char 1)
  (set-mark beginning)
  )
;;----------------------------------------------------------------------------
;;ruby
;;ruby mode
(add-to-list 'load-path "~/myemacs/ruby-mode")
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
;;inf-ruby
;;(autoload 'run-ruby "inf-ruby"
;;  "Run an inferior Ruby process")
;;(autoload 'inf-ruby-keys "inf-ruby"
;;  "Set local key defs for inf-ruby in ruby-mode")
;;(add-hook 'ruby-mode-hook
;;          '(lambda ()
;;             (inf-ruby-keys)
;;             ))
;;ruby-electric
;;(require 'ruby-electric)
;;rails
;;(setq load-path (cons "~/myemacs/emacs-rails" load-path))
;;(require 'rails)
;;----------------------------------------------------------------------------
;; split windows should display different buffers  question
(global-set-key [(control x) \2] 'split-window-switch-buffer)
(defun split-window-switch-buffer () (interactive)
  "Split current window and display the two last buffers used."
  (split-window)
  (switch-to-buffer (other-buffer (current-buffer)))
  )
(global-set-key [(control x) \3] 'hsplit-window-switch-buffer)
(defun hsplit-window-switch-buffer () (interactive)
  "Split current window horizontally and display the two last buffers used."
  (split-window-horizontally)
  (switch-to-buffer (other-buffer (current-buffer)))
  )
;;----------------------------------------------------------------------------
(add-hook 'before-save-hook 'time-stamp) ;;question
;;----------------------------------------------------------------------------
;;(require 'autoinsert) ;; 这个模块是EMACS带的 不用自己下载
;;(auto-insert-mode t)  ;;; 自动打开这个模块，在启动EMACS的时候
;;(setq auto-insert-directory "~/myemacs/template/") ;;; 定义你自己的模板目录
;;(setq auto-insert-query nil) ;;; 插入的时候要不要提示
;;(define-auto-insert "\.cpp" "t.cpp")
;;(define-auto-insert "\.c" "t.cpp")
;;(define-auto-insert "\.cc" "t.cpp")
;;(define-auto-insert "\Makefile" "t.mak")
;;----------------------------------------------------------------------------
;; Use time stamps
;;(add-hook 'write-file-hooks 'time-stamp)
;;(setq time-stamp-active t)
;;(setq time-stamp-format "%:u %04y-%02m-%02d %02H:%02M:%02S")
;;(setq time-stamp-end: "\n")
;;----------------------------------------------------------------------------
;;(require 'thumbs)
;;(auto-image-file-mode t)
;;----------------------------------------------------------------------------
;;删除当前文件中重复行,使得每一行都是unique alt+p a
;;(global-set-key [(meta p)(a)] 'uniquify-buffer-lines)
;;(defun uniquify-buffer-lines ()
;;  (interactive)
;;  (while
;;      (progn
;;      (goto-char (point-min))
;;      (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1$" nil t))
;;    (if (= 0 (length (match-string 1)))
;;      (replace-match "\\2")
;;      (replace-match "\\1\n\\2"))))
