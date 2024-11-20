
;;; orgstar-mode.el --- WordStar emulation mode for GNU Emacs Org mode

;;; Commentary:

;; This emulates WordStar, with a major mode.
;; Crudely hacked together from the original ws-mode.el by shawnh
;; 'which-key' package and capslock remapped to control highly recommended

;;; Code:
  
(defvar orgstar-mode-map nil "")
(defvar orgstar-C-j-map nil "")
(defvar orgstar-C-k-map nil "")
(defvar orgstar-C-o-map nil "")
(defvar orgstar-C-q-map nil "")

(if orgstar-mode-map
    ()
  (setq orgstar-mode-map (make-keymap))
  (setq orgstar-C-k-map (make-keymap))
  (setq orgstar-C-o-map (make-keymap))
  (setq orgstar-C-q-map (make-keymap))
  ;; stop olivetti blocking C-c scroll
  (eval-after-load "olivetti"
  '(progn
     (define-key olivetti-mode-map (kbd "\C-c") #'nil))) 

  (define-key orgstar-mode-map "\C-a" 'backward-word)
  (define-key orgstar-mode-map "\C-b" 'fill-paragraph)
  (define-key orgstar-mode-map "\C-c" 'scroll-up)
  (define-key orgstar-mode-map "\C-d" 'forward-char)
  (define-key orgstar-mode-map "\C-e" 'previous-line)
  (define-key orgstar-mode-map "\C-f" 'forward-word)
  (define-key orgstar-mode-map "\C-g" 'delete-char)
  (define-key orgstar-mode-map "\C-h" 'backward-char)
  (define-key orgstar-mode-map "\C-i" 'indent-for-tab-command)
  (define-key orgstar-mode-map "\C-j" 'help-for-help)
  (define-key orgstar-mode-map "\C-k" orgstar-C-k-map)
  (define-key orgstar-mode-map "\C-l" 'os-repeat-search)
  (define-key orgstar-mode-map "\C-n" 'open-line)
  (define-key orgstar-mode-map "\C-o" orgstar-C-o-map)
  (define-key orgstar-mode-map "\C-p" 'quoted-insert)
  (define-key orgstar-mode-map "\C-q" orgstar-C-q-map)
  (define-key orgstar-mode-map "\C-r" 'scroll-down)
  (define-key orgstar-mode-map "\C-s" 'backward-char)
  (define-key orgstar-mode-map "\C-t" 'kill-word)
  (define-key orgstar-mode-map "\C-u" 'keyboard-quit)
  (define-key orgstar-mode-map "\C-v" 'overwrite-mode)
  (define-key orgstar-mode-map "\C-w" 'scroll-down-line)
  (define-key orgstar-mode-map "\C-x" 'next-line)
  (define-key orgstar-mode-map "\C-y" 'kill-complete-line)
  (define-key orgstar-mode-map "\C-z" 'scroll-up-line)
  (define-key orgstar-mode-map "\t" 'org-cycle)

  ;; orgstar-C-k-map
  (define-key orgstar-C-k-map " " ())
  (define-key orgstar-C-k-map "0" 'os-set-marker-0)
  (define-key orgstar-C-k-map "1" 'os-set-marker-1)
  (define-key orgstar-C-k-map "2" 'os-set-marker-2)
  (define-key orgstar-C-k-map "3" 'os-set-marker-3)
  (define-key orgstar-C-k-map "4" 'os-set-marker-4)
  (define-key orgstar-C-k-map "5" 'os-set-marker-5)
  (define-key orgstar-C-k-map "6" 'os-set-marker-6)
  (define-key orgstar-C-k-map "7" 'os-set-marker-7)
  (define-key orgstar-C-k-map "8" 'os-set-marker-8)
  (define-key orgstar-C-k-map "9" 'os-set-marker-9)
  (define-key orgstar-C-k-map "b" 'os-begin-block)
  (define-key orgstar-C-k-map "\C-b" 'os-begin-block)
  (define-key orgstar-C-k-map "c" 'os-copy-block)
  (define-key orgstar-C-k-map "\C-c" 'os-copy-block)
  (define-key orgstar-C-k-map "d" 'save-buffers-kill-emacs)
  (define-key orgstar-C-k-map "\C-d" 'save-buffers-kill-emacs)
  (define-key orgstar-C-k-map "f" 'find-file)
  (define-key orgstar-C-k-map "\C-f" 'find-file)
  (define-key orgstar-C-k-map "h" 'os-show-markers)
  (define-key orgstar-C-k-map "\C-h" 'os-show-markers)
  (define-key orgstar-C-k-map "i" 'os-indent-block)
  (define-key orgstar-C-k-map "\C-i" 'os-indent-block)
  (define-key orgstar-C-k-map "k" 'os-end-block)
  (define-key orgstar-C-k-map "\C-k" 'os-end-block)
  (define-key orgstar-C-k-map "p" 'os-print-block)
  (define-key orgstar-C-k-map "\C-p" 'os-print-block)
  (define-key orgstar-C-k-map "q" 'kill-emacs)
  (define-key orgstar-C-k-map "\C-q" 'kill-emacs)
  (define-key orgstar-C-k-map "r" 'insert-file)
  (define-key orgstar-C-k-map "\C-r" 'insert-file)
  (define-key orgstar-C-k-map "s" 'save-some-buffers)
  (define-key orgstar-C-k-map "\C-s" 'save-some-buffers)
  (define-key orgstar-C-k-map "t" 'os-mark-word)
  (define-key orgstar-C-k-map "\C-t" 'os-mark-word)
  (define-key orgstar-C-k-map "u" 'os-exdent-block)
  (define-key orgstar-C-k-map "\C-u" 'keyboard-quit)
  (define-key orgstar-C-k-map "v" 'os-move-block)
  (define-key orgstar-C-k-map "\C-v" 'os-move-block)
  (define-key orgstar-C-k-map "w" 'os-write-block)
  (define-key orgstar-C-k-map "\C-w" 'os-write-block)
  (define-key orgstar-C-k-map "x" 'save-buffers-kill-emacs)
  (define-key orgstar-C-k-map "\C-x" 'save-buffers-kill-emacs)
  (define-key orgstar-C-k-map "y" 'os-delete-block)
  (define-key orgstar-C-k-map "\C-y" 'os-delete-block)

  ;; orgstar-C-o-map
  (define-key orgstar-C-o-map " " ())
  (define-key orgstar-C-o-map "c" 'orgstar-center-line)
  (define-key orgstar-C-o-map "\C-c" 'orgstar-center-line)
  (define-key orgstar-C-o-map "b" 'switch-to-buffer)
  (define-key orgstar-C-o-map "\C-b" 'switch-to-buffer)
  (define-key orgstar-C-o-map "i" 'ibuffer)
  (define-key orgstar-C-o-map "j" 'justify-current-line)
  (define-key orgstar-C-o-map "\C-j" 'justify-current-line)
  (define-key orgstar-C-o-map "k" 'kill-buffer)
  (define-key orgstar-C-o-map "\C-k" 'kill-buffer)
  (define-key orgstar-C-o-map "l" 'list-buffers)
  (define-key orgstar-C-o-map "\C-l" 'list-buffers)
  (define-key orgstar-C-o-map "m" 'auto-fill-mode)
  (define-key orgstar-C-o-map "\C-m" 'auto-fill-mode)
  (define-key orgstar-C-o-map "r" 'set-fill-column)
  (define-key orgstar-C-o-map "\C-r" 'set-fill-column)
  (define-key orgstar-C-o-map "\C-u" 'keyboard-quit)
  ;;org headline manipulation
  (define-key orgstar-C-o-map "e" 'org-move-subtree-up)
  (define-key orgstar-C-o-map "\C-e" 'org-move-subtree-up)
  (define-key orgstar-C-o-map "x" 'org-move-subtree-down)
  (define-key orgstar-C-o-map "\C-x" 'org-move-subtree-down)
  (define-key orgstar-C-o-map "s" 'org-do-promote)
  (define-key orgstar-C-o-map "\C-s" 'org-do-promote)
  (define-key orgstar-C-o-map "d" 'org-do-demote)
  (define-key orgstar-C-o-map "\C-d" 'org-do-demote)
  ;; o prefix for org commands
  (define-key orgstar-C-o-map "oa" 'org-agenda)
  (define-key orgstar-C-o-map "oc" 'org-toggle-checkbox)
  (define-key orgstar-C-o-map "od" 'org-todo)
  (define-key orgstar-C-o-map "on" 'org-next-visible-heading)
  (define-key orgstar-C-o-map "op" 'org-previous-visible-heading)
  (define-key orgstar-C-o-map "ot" 'org-table-create)
  ;; w prefix for window managgement
  (define-key orgstar-C-o-map "wd" 'delete-other-windows)
  (define-key orgstar-C-o-map "wh" 'split-window-horizontally)
  (define-key orgstar-C-o-map "wo" 'other-window)
  (define-key orgstar-C-o-map "wv" 'split-window-vertically)

  ;; orgstar-C-q-map
  (define-key orgstar-C-q-map " " ())
  (define-key orgstar-C-q-map "0" 'os-find-marker-0)
  (define-key orgstar-C-q-map "1" 'os-find-marker-1)
  (define-key orgstar-C-q-map "2" 'os-find-marker-2)
  (define-key orgstar-C-q-map "3" 'os-find-marker-3)
  (define-key orgstar-C-q-map "4" 'os-find-marker-4)
  (define-key orgstar-C-q-map "5" 'os-find-marker-5)
  (define-key orgstar-C-q-map "6" 'os-find-marker-6)
  (define-key orgstar-C-q-map "7" 'os-find-marker-7)
  (define-key orgstar-C-q-map "8" 'os-find-marker-8)
  (define-key orgstar-C-q-map "9" 'os-find-marker-9)
  (define-key orgstar-C-q-map "a" 'os-query-replace)
  (define-key orgstar-C-q-map "\C-a" 'os-query-replace)
  (define-key orgstar-C-q-map "b" 'os-goto-block-begin)
  (define-key orgstar-C-q-map "\C-b" 'os-goto-block-begin)
  (define-key orgstar-C-q-map "c" 'end-of-buffer)
  (define-key orgstar-C-q-map "\C-c" 'end-of-buffer)
  (define-key orgstar-C-q-map "d" 'org-end-of-line)
  (define-key orgstar-C-q-map "\C-d" 'org-end-of-line)
  (define-key orgstar-C-q-map "f" 'os-search)
  (define-key orgstar-C-q-map "\C-f" 'os-search)
  (define-key orgstar-C-q-map "k" 'os-goto-block-end)
  (define-key orgstar-C-q-map "\C-k" 'os-goto-block-end)
  (define-key orgstar-C-q-map "l" 'ispell-buffer)
  (define-key orgstar-C-q-map "\C-l" 'ispell-buffer)
  (define-key orgstar-C-q-map "n" 'ispell-word)
  (define-key orgstar-C-q-map "\C-n" 'ispell-word)
  (define-key orgstar-C-q-map "p" 'os-last-cursorp)
  (define-key orgstar-C-q-map "\C-p" 'os-last-cursorp)
  (define-key orgstar-C-q-map "r" 'beginning-of-buffer)
  (define-key orgstar-C-q-map "\C-r" 'beginning-of-buffer)
  (define-key orgstar-C-q-map "s" 'org-beginning-of-line)
  (define-key orgstar-C-q-map "\C-s" 'org-beginning-of-line)
  (define-key orgstar-C-q-map "u" 'os-undo)
  (define-key orgstar-C-q-map "\C-u" 'keyboard-quit)
  (define-key orgstar-C-q-map "w" 'os-last-error)
  (define-key orgstar-C-q-map "\C-w" 'os-last-error)
  (define-key orgstar-C-q-map "y" 'os-kill-eol)
  (define-key orgstar-C-q-map "\C-y" 'os-kill-eol)
  (define-key orgstar-C-q-map "\177" 'os-kill-bol))

(put 'orgstar-mode 'mode-class 'special)

;;;###autoload
(defun orgstar-mode ()
  "Major mode with WordStar-like key bindings.

BUGS:
 - Help menus with WordStar commands (C-j just calls help-for-help)
   are not implemented
 - Options for search and replace
 - Show markers (C-k h) is somewhat strange
 - Search and replace (C-q a) is only available in forward direction

No key bindings beginning with ESC are installed, they will work
Emacs-like.

The key bindings are:

  C-a		backward-word
  C-b		fill-paragraph
  C-c		scroll-up-line
  C-d		forward-char
  C-e		previous-line
  C-f		forward-word
  C-g		delete-char
  C-h		backward-char
  C-i		indent-for-tab-command
  C-j		help-for-help
  C-k		ordstar-C-k-map
  C-l		os-repeat-search
  C-n		open-line
  C-p		quoted-insert
  C-r		scroll-down-line
  C-s		backward-char
  C-t		kill-word
  C-u		keyboard-quit
  C-v		overwrite-mode
  C-w		scroll-down
  C-x		next-line
  C-y		kill-complete-line
  C-z		scroll-up

  C-k 0		os-set-marker-0
  C-k 1		os-set-marker-1
  C-k 2		os-set-marker-2
  C-k 3		os-set-marker-3
  C-k 4		os-set-marker-4
  C-k 5		os-set-marker-5
  C-k 6		os-set-marker-6
  C-k 7		os-set-marker-7
  C-k 8		os-set-marker-8
  C-k 9		os-set-marker-9
  C-k b		os-begin-block
  C-k c		os-copy-block
  C-k d		save-buffers-kill-emacs
  C-k f		find-file
  C-k h		os-show-markers
  C-k i		os-indent-block
  C-k k		os-end-block
  C-k p		os-print-block
  C-k q		kill-emacs
  C-k r		insert-file
  C-k s		save-some-buffers
  C-k t		os-mark-word
  C-k u		os-exdent-block
  C-k C-u	keyboard-quit
  C-k v		os-move-block
  C-k w		os-write-block
  C-k x		kill-emacs
  C-k y		os-delete-block

  C-o c		orgstar-center-line
  C-o b		switch-to-buffer
  C-o j		justify-current-line
  C-o k		kill-buffer
  C-o l		list-buffers
  C-o m		auto-fill-mode
  C-o r		set-fill-column
  C-o C-u	keyboard-quit

  C-o e         org-move-subtree-up
  C-o x         org-move-subtree-down
  C-o s         org-do-promote
  C-o d         org-do-demote
  C-o oa        org-agenda
  C-o oc        org-toggle-checkbox
  C-o od        org-todo
  C-o on        org-next-visible-heading
  C-o op        org-previous-visible-heading
  C-o ot        org-table-create

  C-o wd	delete-other-windows
  C-o wh	split-window-horizontally
  C-o wo	other-window
  C-o wv	split-window-vertically

  C-q 0		os-find-marker-0
  C-q 1		os-find-marker-1
  C-q 2		os-find-marker-2
  C-q 3		os-find-marker-3
  C-q 4		os-find-marker-4
  C-q 5		os-find-marker-5
  C-q 6		os-find-marker-6
  C-q 7		os-find-marker-7
  C-q 8		os-find-marker-8
  C-q 9		os-find-marker-9
  C-q a		os-query-replace
  C-q b		os-to-block-begin
  C-q c		end-of-buffer
  C-q d		end-of-line
  C-q f		os-search
  C-q k		os-to-block-end
  C-q l		os-undo
  C-q p		os-last-cursorp
  C-q r		beginning-of-buffer
  C-q u         undo
  C-q C-u	keyboard-quit
  C-q w		os-last-error
  C-q y		os-kill-eol
  C-q DEL	os-kill-bol
"
  (interactive)
;;  (kill-all-local-variables)
  (use-local-map orgstar-mode-map)
  (setq mode-name "Orgstar")
  (setq major-mode 'orgstar-mode)
  (run-mode-hooks 'orgstar-mode-hook))


(defun orgstar-center-paragraph ()
  "Center each line in the paragraph at or after point.
See `orgstar-center-line' for more info."
  (interactive)
  (save-excursion
    (forward-paragraph)
    (or (bolp) (newline 1))
    (let ((end (point)))
      (backward-paragraph)
      (orgstar-center-region (point) end))))

(defun orgstar-center-region (from to)
  "Center each line starting in the region.
See `orgstar-center-line' for more info."
  (interactive "r")
  (if (> from to)
      (let ((tem to))
	(setq to from from tem)))
  (save-excursion
    (save-restriction
      (narrow-to-region from to)
      (goto-char from)
      (while (not (eobp))
	(orgstar-center-line)
	(forward-line 1)))))

(defun orgstar-center-line ()
  "Center the line point is on, within the width specified by `fill-column'.
This means adjusting the indentation to match
the distance between the end of the text and `fill-column'."
  (interactive)
  (save-excursion
    (let (line-length)
      (beginning-of-line)
      (delete-horizontal-space)
      (end-of-line)
      (delete-horizontal-space)
      (setq line-length (current-column))
      (beginning-of-line)
      (indent-to
       (+ left-margin
	  (/ (- fill-column left-margin line-length) 2))))))

(defun scroll-down-line ()
  "Scroll one line down."
  (interactive)
  (scroll-down 1))

(defun scroll-up-line ()
  "Scroll one line up."
  (interactive)
  (scroll-up 1))

;;;;;;;;;;;
;; orgstar special variables:

(defvar os-marker-0 nil "Position marker 0 in Orgstar mode.")
(defvar os-marker-1 nil "Position marker 1 in Orgstar mode.")
(defvar os-marker-2 nil "Position marker 2 in Orgstar mode.")
(defvar os-marker-3 nil "Position marker 3 in Orgstar mode.")
(defvar os-marker-4 nil "Position marker 4 in Orgstar mode.")
(defvar os-marker-5 nil "Position marker 5 in Orgstar mode.")
(defvar os-marker-6 nil "Position marker 6 in Orgstar mode.")
(defvar os-marker-7 nil "Position marker 7 in Orgstar mode.")
(defvar os-marker-8 nil "Position marker 8 in Orgstar mode.")
(defvar os-marker-9 nil "Position marker 9 in Orgstar mode.")

(defvar os-block-begin-marker nil "Beginning of \"Block\" in Orgstar mode.")
(defvar os-block-end-marker nil "End of \"Block\" in Orgstar mode.")

(defvar os-search-string nil "String of last search in Orgstar mode.")
(defvar os-search-direction t
  "Direction of last search in Orgstar mode. t if forward, nil if backward.")

(defvar os-last-cursorposition nil
  "Position before last search etc. in Orgstar mode.")

(defvar os-last-errormessage nil
  "Last error message issued by a Orgstar mode function.")

;;;;;;;;;;;
;; orgstar special functions:

(defun os-error (string)
  "Report error of a Orgstar special function. Error message is saved
in os-last-errormessage for recovery with C-q w."
  (setq os-last-errormessage string)
  (error string))

(defun os-set-marker-0 ()
  "In Orgstar mode: Set marker 0 to current cursor position."
  (interactive)
  (setq os-marker-0 (point-marker))
  (message "Marker 0 set"))

(defun os-set-marker-1 ()
  "In Orgstar mode: Set marker 1 to current cursor position."
  (interactive)
  (setq os-marker-1 (point-marker))
  (message "Marker 1 set"))

(defun os-set-marker-2 ()
  "In Orgstar mode: Set marker 2 to current cursor position."
  (interactive)
  (setq os-marker-2 (point-marker))
  (message "Marker 2 set"))

(defun os-set-marker-3 ()
  "In Orgstar mode: Set marker 3 to current cursor position."
  (interactive)
  (setq os-marker-3 (point-marker))
  (message "Marker 3 set"))

(defun os-set-marker-4 ()
  "In Orgstar mode: Set marker 4 to current cursor position."
  (interactive)
  (setq os-marker-4 (point-marker))
  (message "Marker 4 set"))

(defun os-set-marker-5 ()
  "In Orgstar mode: Set marker 5 to current cursor position."
  (interactive)
  (setq os-marker-5 (point-marker))
  (message "Marker 5 set"))

(defun os-set-marker-6 ()
  "In Orgstar mode: Set marker 6 to current cursor position."
  (interactive)
  (setq os-marker-6 (point-marker))
  (message "Marker 6 set"))

(defun os-set-marker-7 ()
  "In Orgstar mode: Set marker 7 to current cursor position."
  (interactive)
  (setq os-marker-7 (point-marker))
  (message "Marker 7 set"))

(defun os-set-marker-8 ()
  "In Orgstar mode: Set marker 8 to current cursor position."
  (interactive)
  (setq os-marker-8 (point-marker))
  (message "Marker 8 set"))

(defun os-set-marker-9 ()
  "In Orgstar mode: Set marker 9 to current cursor position."
  (interactive)
  (setq os-marker-9 (point-marker))
  (message "Marker 9 set"))

(defun os-begin-block ()
  "In Orgstar mode: Set block begin marker to current cursor position."
  (interactive)
  (setq os-block-begin-marker (point-marker))
  (message "Block begin marker set"))

(defun os-show-markers ()
  "In Orgstar mode: Show block markers."
  (interactive)
  (if (or os-block-begin-marker os-block-end-marker)
      (save-excursion
	(if os-block-begin-marker
	    (progn
	      (goto-char os-block-begin-marker)
	      (message "Block begin marker")
	      (sit-for 2))
	  (message "Block begin marker not set")
	  (sit-for 2))
	(if os-block-end-marker
	    (progn
	      (goto-char os-block-end-marker)
	      (message "Block end marker")
	      (sit-for 2))
	  (message "Block end marker not set"))
	(message ""))
    (message "Block markers not set")))


(defun os-indent-block ()
  "In Orgstar mode: Indent block (not yet implemented)."
  (interactive)
  (os-error "Indent block not yet implemented"))

(defun os-end-block ()
  "In Orgstar mode: Set block end marker to current cursor position."
  (interactive)
  (setq os-block-end-marker (point-marker))
  (message "Block end marker set"))

(defun os-print-block ()
  "In Orgstar mode: Print block."
  (interactive)
  (message "Don't do this. Write block to a file (C-k w) and print this file."))

(defun os-mark-word ()
  "In Orgstar mode: Mark current word as block."
  (interactive)
  (save-excursion
    (forward-word 1)
    (sit-for 1)
    (os-end-block)
    (forward-word -1)
    (sit-for 1)
    (os-begin-block)))

(defun os-exdent-block ()
  "I don't know what this (C-k u) should do."
  (interactive)
  (os-error "This won't be done -- not yet implemented."))

(defun os-move-block ()
  "In Orgstar mode: Move block to current cursor position."
  (interactive)
  (if (and os-block-begin-marker os-block-end-marker)
      (progn
	(kill-region os-block-begin-marker os-block-end-marker)
	(yank)
	(save-excursion
	  (goto-char (region-beginning))
	  (setq os-block-begin-marker (point-marker))
	  (goto-char (region-end))
	  (setq os-block-end-marker (point-marker))))
    (os-error (cond (os-block-begin-marker "Block end marker not set")
		    (os-block-end-marker "Block begin marker not set")
		    (t "Block markers not set")))))

(defun os-write-block ()
  "In Orgstar mode: Write block to file."
  (interactive)
  (if (and os-block-begin-marker os-block-end-marker)
      (let ((filename (read-file-name "Write block to file: ")))
	(write-region os-block-begin-marker os-block-end-marker filename))
    (os-error (cond (os-block-begin-marker "Block end marker not set")
		    (os-block-end-marker "Block begin marker not set")
		    (t "Block markers not set")))))


(defun os-delete-block ()
  "In Orgstar mode: Delete block."
  (interactive)
  (if (and os-block-begin-marker os-block-end-marker)
      (progn
	(kill-region os-block-begin-marker os-block-end-marker)
	(setq os-block-end-marker nil)
	(setq os-block-begin-marker nil))
    (os-error (cond (os-block-begin-marker "Block end marker not set")
		    (os-block-end-marker "Block begin marker not set")
		    (t "Block markers not set")))))

(defun os-find-marker-0 ()
  "In Orgstar mode: Go to marker 0."
  (interactive)
  (if os-marker-0
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-marker-0))
    (os-error "Marker 0 not set")))

(defun os-find-marker-1 ()
  "In Orgstar mode: Go to marker 1."
  (interactive)
  (if os-marker-1
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-marker-1))
    (os-error "Marker 1 not set")))

(defun os-find-marker-2 ()
  "In Orgstar mode: Go to marker 2."
  (interactive)
  (if os-marker-2
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-marker-2))
    (os-error "Marker 2 not set")))

(defun os-find-marker-3 ()
  "In Orgstar mode: Go to marker 3."
  (interactive)
  (if os-marker-3
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-marker-3))
    (os-error "Marker 3 not set")))

(defun os-find-marker-4 ()
  "In Orgstar mode: Go to marker 4."
  (interactive)
  (if os-marker-4
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-marker-4))
    (os-error "Marker 4 not set")))

(defun os-find-marker-5 ()
  "In Orgstar mode: Go to marker 5."
  (interactive)
  (if os-marker-5
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-marker-5))
    (os-error "Marker 5 not set")))

(defun os-find-marker-6 ()
  "In Orgstar mode: Go to marker 6."
  (interactive)
  (if os-marker-6
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-marker-6))
    (os-error "Marker 6 not set")))

(defun os-find-marker-7 ()
  "In Orgstar mode: Go to marker 7."
  (interactive)
  (if os-marker-7
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-marker-7))
    (os-error "Marker 7 not set")))

(defun os-find-marker-8 ()
  "In Orgstar mode: Go to marker 8."
  (interactive)
  (if os-marker-8
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-marker-8))
    (os-error "Marker 8 not set")))

(defun os-find-marker-9 ()
  "In Orgstar mode: Go to marker 9."
  (interactive)
  (if os-marker-9
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-marker-9))
    (os-error "Marker 9 not set")))

(defun os-goto-block-begin ()
  "In Orgstar mode: Go to block begin marker."
  (interactive)
  (if os-block-begin-marker
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-block-begin-marker))
    (os-error "Block begin marker not set")))

(defun os-search (string)
  "In Orgstar mode: Search string, remember string for repetition."
  (interactive "sSearch for: ")
  (message "Forward (f) or backward (b)")
  (let ((direction
	 (read-char)))
    (cond ((equal (upcase direction) ?F)
	   (setq os-search-string string)
	   (setq os-search-direction t)
	   (setq os-last-cursorposition (point-marker))
	   (search-forward string))
	  ((equal (upcase direction) ?B)
	   (setq os-search-string string)
	   (setq os-search-direction nil)
	   (setq os-last-cursorposition (point-marker))
	   (search-backward string))
	  (t (keyboard-quit)))))

(defun os-goto-block-end ()
  "In Orgstar mode: Go to block end marker."
  (interactive)
  (if os-block-end-marker
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-block-end-marker))
    (os-error "Block end marker not set")))

(defun os-undo ()
  "In Orgstar mode: Undo and give message about undoing more changes."
  (interactive)
  (undo)
  (message "Repeat C-q u to undo more changes."))

(defun os-goto-last-cursorposition ()
  "In Orgstar mode: "
  (interactive)
  (if os-last-cursorposition
      (progn
	(setq os-last-cursorposition (point-marker))
	(goto-char os-last-cursorposition))
    (os-error "No last cursor position available.")))

(defun os-last-error ()
  "In Orgstar mode: repeat last error message.
This will only work for errors raised by Orgstar mode functions."
  (interactive)
  (if os-last-errormessage
      (message "%s" os-last-errormessage)
    (message "No Orgstar error yet.")))

(defun os-kill-eol ()
  "In Orgstar mode: Kill to end of line (like Orgstar, not like Emacs)."
  (interactive)
  (let ((p (point)))
    (end-of-line)
    (kill-region p (point))))

(defun os-kill-bol ()
  "In Orgstar mode: Kill to beginning of line
\(like Orgstar, not like Emacs)."
  (interactive)
  (let ((p (point)))
    (beginning-of-line)
    (kill-region (point) p)))

(defun kill-complete-line ()
  "Kill the complete line."
  (interactive)
  (beginning-of-line)
  (if (eobp) (error "End of buffer"))
  (let ((beg (point)))
    (forward-line 1)
    (kill-region beg (point))))

(defun os-repeat-search ()
  "In Orgstar mode: Repeat last search."
  (interactive)
  (setq os-last-cursorposition (point-marker))
  (if os-search-string
      (if os-search-direction
	  (search-forward os-search-string)
	(search-backward os-search-string))
    (os-error "No search to repeat")))

(defun os-query-replace (from to)
  "In Orgstar mode: Search string, remember string for repetition."
  (interactive "sReplace:
sWith: " )
  (setq os-search-string from)
  (setq os-search-direction t)
  (setq os-last-cursorposition (point-marker))
  (query-replace from to))

(defun os-copy-block ()
  "In Orgstar mode: Copy block to current cursor position."
  (interactive)
  (if (and os-block-begin-marker os-block-end-marker)
      (progn
	(copy-region-as-kill os-block-begin-marker os-block-end-marker)
	(yank)
	(save-excursion
	  (goto-char (region-beginning))
	  (setq os-block-begin-marker (point-marker))
	  (goto-char (region-end))
	  (setq os-block-end-marker (point-marker))))
    (os-error (cond (os-block-begin-marker "Block end marker not set")
		    (os-block-end-marker "Block begin marker not set")
		    (t "Block markers not set")))))


(provide 'orgstar-mode)

;;; orgstar-mode.el ends here
