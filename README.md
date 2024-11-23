# orgstar-mode
WordStar like shortcut keys and editing for Emacs org mode.

Works really well with 'which-key' as a replacement for the WordStar help screens (bundled with emacs 30).

'ispell' is needed for spellchecking.

'powerthesaurus' package is used for thesaurus lookup etc.

Download orgstar-mode.el and load in your init file to install.

    (load-file "/path/to/orgstar-mode.el")
	
"M-x orgstar-mode" to activate in an org buffer.



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
    C-k d		dired
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
    C-k C-u		keyboard-quit
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
    C-o C-u		keyboard-quit

    C-o e		org-move-subtree-up
    C-o x		org-move-subtree-down
    C-o s		org-do-promote
    C-o d		org-do-demote
    C-o oa		org-agenda
    C-o oc		org-toggle-checkbox
    C-o od		org-todo
    C-o on		org-next-visible-heading
    C-o op		org-previous-visible-heading
    C-o ot		org-table-create

    C-o wd		delete-other-windows
    C-o wh		split-window-horizontally
    C-o wo		other-window
    C-o wv		split-window-vertically

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
    C-q j		powerthesaurus-lookup-dwim
    C-q k		os-to-block-end
    C-q l		ispell-buffer
    C-q n		ispell-word
    C-q p		os-last-cursorp
    C-q r		beginning-of-buffer
    C-q u		undo
    C-q C-u		keyboard-quit
    C-q w		os-last-error
    C-q y		os-kill-eol
    C-q DEL		os-kill-bol

Special thanks to user "thetemp_" on reddit for helping me set this up! :)

