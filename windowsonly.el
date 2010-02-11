;;---------------------------------------------------------------------------- 
(global-set-key [f11]   'w32-maximize-frame)
(global-set-key [C-f11] 'w32-restore-frame)
(defun w32-restore-frame (&optional arg)
  "Restore a minimized frame"
  (interactive)
  (w32-send-sys-command 61728 arg))
(defun w32-maximize-frame (&optional arg)
  "Maximize the current frame"
  (interactive)
  (w32-send-sys-command 61488 arg))
;;---------------------------------------------------------------------------- 
;;zoom in and zoom out font like firefox
(global-set-key (kbd "C-=") 'sacha/increase-font-size)
(global-set-key (kbd "C--") 'sacha/decrease-font-size)
(defun sacha/increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height))))
  (w32-restore-frame)
  (w32-maximize-frame)
  )
(defun sacha/decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                  (face-attribute 'default :height))))
  (w32-restore-frame)
  (w32-maximize-frame)
  )
