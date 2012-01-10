;;----------------------------------------------------------------------------
;;(add-to-list 'load-path "~/myemacs/eieio-0.17")
;;(add-to-list 'load-path "~/myemacs/semantic-1.4.4")
;;(setq semantic-load-turn-everything-on t)
;;(require 'semantic-load) ;;filebat error for python
;;ecb
;;(add-to-list 'load-path "~/myemacs/ecb-2.32")
;;(require 'ecb) ;;filebat error for python
;;(require 'ecb-autoloads)
;;----------------------------------------------------------------------------
;; Texinfo fancy chapter tags
;;(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))
;; HTML fancy chapter tags
;;(add-hook 'html-mode-hook (lambda () (require 'sb-html)))
;;----------------------------------------------------------------------------
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
(load-file "~/myemacs/cedet-1.0pre6/common/cedet.el")

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;;----------------------------------------------------------------------------
