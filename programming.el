;;----------------------------------------------------------------------------
;;在c-mode下输入main，就可以添加该skeleton了
(define-skeleton skeleton-c-mode-main-func
  "generate int main(int argc, char * argv[]) automatic" nil
  "int main (int argc, char * argv[]) \n{\n"
  > _  "\n" > "return 0;"
  "\n}")
(define-abbrev-table 'c-mode-abbrev-table '(
                                            ("main" "" skeleton-c-mode-main-func 1)
                                            ))
(define-abbrev-table 'c++-mode-abbrev-table '(
                                              ("main" "" skeleton-c-mode-main-func 1)
                                              ))
;;----------------------------------------------------------------------------
;;在c-mode, c++-mode, java-mode等模式下, 输入左边的括号，就会自动补全右边的部分.包括(), "", [] , {}
(defun my-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
                               (?\( _")")
                               (?\[ _ "]")
                               (?\" _ "\"")
                               (?\' _ "\'")
                               (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  ;;  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  )
(add-hook 'c-mode-hook 'my-auto-pair)
(add-hook 'c++-mode-hook 'my-auto-pair)
;;(add-hook 'c-mode-common-hook 'my-auto-pair)
(add-hook 'java-mode-hook 'my-auto-pair)

;;在状态条上显示当前光标在哪个函数体内部
(defun my-simple-mode()
  ;;(which-function-mode)
  )
(add-hook 'c-mode-hook 'my-simple-mode)
(add-hook 'c++-mode-hook 'my-simple-mode)
(add-hook 'java-mode-hook 'my-simple-mode)
;;----------------------------------------------------------------------------
(global-set-key [M-f12] 'my_indent_code);;indent code
(defun my_indent_code()
  (interactive)
  ;;remove blank lines
  (goto-char 0)
  (flush-lines "^[[:space:]]*$")
  (save-buffer)
  (setq current_filename (buffer-name (current-buffer)))
  ;;indent the code, add or remove some space
  (setq commandline "indent ") 
  (setq commandline (concat commandline current_filename))
  (shell-command-to-string commandline)
  ;;convert the line endings of text files from DOS style to unix style
  (setq commandline "dos2unix ")
  (setq commandline (concat commandline current_filename))
  (shell-command-to-string commandline)
  ;;reload
  (revert-buffer t t)
)
;;----------------------------------------------------------------------------
(defun insert-c++-class-header ()
  "Inserts a C++ class header which conforms to Oacis standards."
  (interactive)
  (insert
   "//-----------------------------------------------------------------------------\n"
   "//	Class:\t\t_class_\n"
   "//	Purpose:\t\n"
   "//-----------------------------------------------------------------------------\n"
   "\n")
  (message "Inserted C++ class header")
  )

(defun insert-c++-class ()
  "Inserts a C++ class which conforms to Oacis standards."
  (interactive)
  (insert-c++-class-header)
  (insert
   "class _class_\n"
   "{\n"
   "public:\n"
   "\n"
   "	// Constructor/destructor.\n"
   "	_class_();\n"
   "	virtual ~_class_();\n"
   "\n"
   "private:\n"
   "\n"
   "	// Unused ctor and assignment op.\n"
   "	_class_(const _class_&);\n"
   "	_class_& operator=(const _class_&);\n"
   "};\n"
   "\n")
  (message "Inserted C++ class")
  )
;;----------------------------------------------------------------------------
;; Will align c/c++ variable declarations in the selected region
;; Example:
;; int a;
;; const QString b;
;; static unsigned int c;
;;
;; will become:
;; int                 a;
;; const QString       b;
;; static unsigned int c;

;; Aligns all variable declarations in this buffer
(defun align-vars-buffer()
  "Aligns c/c++ variable declaration names on the same column in this buffer."
  (interactive)
  (save-excursion
    (let (beg end)
      (beginning-of-buffer)
      (setq beg (point))
      (end-of-buffer)
      (setq end (point))
      (align-vars beg end))))


;; Jump to beginning of the next line if possible.
(defun beginning-of-next-line()
  "Moves cursor to the beginning of the next line, or nowhere if at end of the buffer"
  (interactive)
  (end-of-line)
  (if (not (eobp))
      (forward-char 1)))


(defun align-vars(beg end)
  "Aligns c/c++ variable declaration names on the same column, with beginning and end taken from selected region."
  (interactive "r")
  (save-excursion
    (let (bol eol expr-end
          (max-col 0) col
          poslist curpos)
      (goto-char end)
      (if (not (bolp))
          (setq end (line-end-position)))
      (goto-char beg)
      (while (and (> end (point)) (not (eobp)))
        (setq bol (line-beginning-position))
        (setq eol (line-end-position))
        (beginning-of-line)
        (setq expr-end (point))
        (if (search-forward-regexp "^[^/][^/]\\([a-zA-Z][a-zA-Z]*\\)[ \t]+[^;]" eol t)
            (let ()
              (setq expr-end (match-end 1))
              (while (search-forward-regexp "\\([a-zA-Z][a-zA-Z]*\\)[ \t]+[^;]" eol t)
                (setq expr-end (match-end 1)))
              (goto-char expr-end)
              (setq col (current-column))
              (if (search-forward-regexp (concat "\\(\\*\\|&[ \t]*\\)?"
                                                 "\\([a-zA-Z\\_][a-zA-Z0-9\\_]*\\)\\([\[][0-9]+[\]]\\)?"
                                                 "\\([ \t]*,[ \t]*\\([a-zA-Z\\_][a-zA-Z0-9\\_]*\\)\\([\[][0-9]+[\]]\\)?\\)*"
                                                 "[ \t]*;$") eol t)
                  (let ((name-col-end 0))
                    (if (eq (match-beginning 2) (match-beginning 0))
                        (setq name-col-end 1))
                    (setq poslist (cons (list expr-end col (match-beginning 0) name-col-end) poslist))
                    (if (> col max-col)
                        (setq max-col col))
                    (beginning-of-next-line))
                (beginning-of-next-line)))
          (beginning-of-next-line)))
      (setq curpos poslist)
      (while curpos
        (let* ((pos (car curpos))
               (col (car (cdr pos)))
               (col-end (car (cdr (cdr pos))))
               (col-end-name (car (cdr (cdr (cdr pos)))))
               (abs-pos (car pos)))
          (goto-char abs-pos)
          (delete-region abs-pos col-end)
          (insert-string (make-string (+ (+ (- max-col col) 1) col-end-name) 32)))
        (setq curpos (cdr curpos))))))
;;----------------------------------------------------------------------------
