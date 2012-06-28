;; .emacs - Lars Christensen <larsch@belunktum.dk>

;; Personal elisp files
(add-to-list 'load-path "~/.elisp")

(require 'vc-git)
(require 'iedit)

;; Work-around for slow-downs
(setq w32-get-true-file-attributes nil)

;; Shortcut to maximize window on Windows
(defun maximize-window ()
  ""
  (interactive)
  (w32-send-sys-command #xf030))
(global-set-key [(meta f8)] 'maximize-window)
;; (maximize-window)

;; Server mode
(require 'server)
(defun server-ensure-safe-dir (dir) "Noop" t)
(server-start)

(setq make-backup-files nil)		; real men don't take backups
(setq vc-cvs-stay-local nil) 		; ditto
(setq vc-annotate-color-map nil)	; No annotate color
(setq vc-annotate-background nil)	; No annotate color
(column-number-mode 't)			; Column numbers always

(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-c\C-c" 'comment-dwim)
(setq split-width-threshold 'nil)

;; ibs - MSVC like Ctrl-TAB buffer cycling
;; http://www.geekware.de/software/emacs/
;; (require 'ibs)
;; (global-set-key [C-tab] 'next-buffer)
;; (global-set-key [C-S-tab] 'previous-buffer)

;; Enable grep under windows
(setq grep-command "grep -n ")
(setq grep-null-device "nul")

;; Recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 500)
(global-set-key "\C-x\C-r" 'recentf-open-files)

;; Auto-revert my buffers when they change on disk
(global-auto-revert-mode 1)

;; Revert all unedited files without asking
(setq revert-without-query ".*")

;; Visual settings
(blink-cursor-mode 0)       		; stop blinking !
(global-font-lock-mode 't)		; highlighting always
(menu-bar-mode 0)			; remove useless feature
(tool-bar-mode 0)			; remove useless feature
(set 'show-paren-delay 0.05)		; Reduce the delay for showing matching parens
(setq frame-title-format "%b - Emacs")	; Show filename first in title bar
(scroll-bar-mode 't)			; Keep scroll bar
(setq mouse-wheel-progressive-speed 'nil) ; No scroll acceleration
(show-paren-mode 't)

;; Convinient buffer navigation that returns to same position if you
;; go down  and up X.
(defun jump-up ()
  "Jumps 10 lines up"
  (interactive)
  (previous-line 10))
(defun jump-down()
  "Jumps 10 lines down"
  (interactive)
  (next-line 10))
(global-set-key "\M-p" 'jump-up)
(global-set-key "\M-n" 'jump-down)

(global-unset-key "\C-z")		; dont minimize on C-z
(global-set-key "\C-cg" 'goto-line)    	; goto-line
(global-set-key "\C-ct" 'todo-show)	; todo-show
(global-set-key [?\C-.] 'kill-this-buffer) ; quick buffer killing
(global-set-key "\C-cs" 'shell)		; shell mode shortcut
(global-set-key "\C-cc" 'compile)	; compile shortcut
(global-set-key "\C-cn" 'next-error)	; Jump to next error

;; fly-make
;; (autoload 'flymake-mode "flymake" "Flymake editing mode" t)

;; Put tag under cursor in kill ring for easy yanking (requires etags
;; to be loaded)
(defun kill-word-under-cursor ()
  "Kill word under cursor"
  (interactive)
  (kill-new (find-tag-default)))
(global-set-key "\M-c" 'kill-word-under-cursor)


;; 
;; Programming Modes
;;

(add-to-list 'auto-mode-alist '("\\.y$" . text-mode))

;; ruby-mode
(autoload 'ruby-mode "ruby-mode")
(add-to-list 'auto-mode-alist '("\\.rbw?$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(set 'ruby-deep-arglist 'nil)
(set 'ruby-deep-indent-paren 'nil)
(set 'ruby-deep-indent-paren-style 'nil)

;; javascript-mode
(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js?$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.as$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))

;; css-mode
(autoload 'css-mode "css-mode")
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.less?$" . css-mode))

;; lua-mode
(autoload 'lua-mode "lua-mode")
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(set 'lua-indent-offset 2)
(set 'lua-indent-level 2)

;; c-mode for ttcn3 source
(add-to-list 'auto-mode-alist '("\\.tt3$" . c-mode))

;; c++-mode for .h files
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;;
;; GH Style Settings
;;

;; highlight these words as types
(load "cc-mode")
(add-to-list 'c++-font-lock-extra-types "Tcl\\sw+")
(add-to-list 'c++-font-lock-extra-types "Ten\\sw+")
(add-to-list 'c++-font-lock-extra-types "Trec\\sw+")
(add-to-list 'c-font-lock-extra-types "HANDLE")
(add-to-list 'c-font-lock-extra-types "VOID")
(add-to-list 'c-font-lock-extra-types "LPVOID")
(add-to-list 'c-font-lock-extra-types "BOOL")
(add-to-list 'c-font-lock-extra-types "HFILE")
(add-to-list 'c-font-lock-extra-types "DWORD")
(add-to-list 'c-font-lock-extra-types "UINT")
(add-to-list 'c-font-lock-extra-types "uint")

					; indentation style based on k&r
(setq c-default-style '((java-mode . "java") (other . "gh"))) ; indentation-style
(set 'parens-require-spaces nil) 	;; dont insert space before parentheses

(c-add-style
 "gh"
 '("k&r"
   (c-basic-offset . 3)
   (c-offsets-alist . ((inline-open . 0)
                       (statement-case-open . +)
                       (inextern-lang . 0)
		       (innamespace . 0)
                       ))))

					; (shell-command (concat "ruby c:/user/lac/bin/jumptovc.rb " (buffer-name)))

(global-set-key [C-f7] 'jumptovc-and-build)
(defun jumptovc ()
  (interactive)
  (shell-command (concat "jumptovc.rb " (buffer-file-name) " " (int-to-string (line-number-at-pos)))))

(defun jumptovc-and-build ()
  (interactive)
  (shell-command (concat "jumptovcandbuild.rb " (buffer-file-name) " " (int-to-string (line-number-at-pos)))))

(defun run-buffer ()
  "Run Buffer"
  (interactive)
  (shell-command (concat (buffer-name) " &")))
(global-set-key "\C-cr" 'run-buffer)
(global-set-key [f5] 'run-buffer)

;; Google stuff 
(defun google-symbol-at-point ()
  "Google word at point"
  (interactive)
  (browse-url (concat "http://google.com/search?q=" (thing-at-point 'symbol))))
(global-set-key [f1] 'google-symbol-at-point)
(defun google-feeling-lucky-symbol-at-point ()
  "Google word at point"
  (interactive)
  (browse-url (concat "http://google.com/search?q=" (thing-at-point 'symbol) "&btnI")))
(global-set-key [C-f1] 'google-feeling-lucky-symbol-at-point)

;; C/C++ Programming
(defun setup-c++-mode () "Setups Custom C++ mode settings" (interactive)
  (set 'comment-column 35)
  (set 'fill-column 70)
  (set 'indent-tabs-mode nil)
  (local-set-key "\C-m" 'newline-and-indent)
  (local-set-key "\M-h" 'hs-hide-block)
  (local-set-key "\M-s" 'hs-show-block)
  (local-set-key "\M-]" 'toggle-source-header)
  (c-toggle-hungry-state 1))
(set 'c++-mode-hook 'setup-c++-mode)
(set 'c-mode-hook 'setup-c++-mode)
(setq dabbrev-case-fold-search nil) ; case sensitive expansion
(setq dabbrev-abbrev-char-regexp "\\sw\\|\\s_") ; complete only symbols (avoids completing & or *)

;; Handy diff function which opens a diff between current file and cvs
;; version. Bound to C-c d.
(defun diff-buffer () "diff buffer"
  (interactive)
  (set 'bname (buffer-name))
  (switch-to-buffer "*diff*")
  (erase-buffer)
  (diff-mode)
  (insert (shell-command-to-string (concat "cvs -q diff -u " bname)))
  (goto-line 1)
  (toggle-read-only)
  (local-set-key "q" 'kill-this-buffer))
(global-set-key "\C-cd" 'diff-buffer)

;; M-{ keybinding to inserts matching braces, indents the lines and
;; moves the cursor in between.
(defun insert-braces ()
  "Insert matching curly braces"
  (interactive)
  (if (region-active-p) (insert-braces-region) (insert-braces-point)))
(defun insert-braces-point () "Insert matching curly braces at point" (interactive)
  (set-mark-command 'nil)
  (insert "{\n\n}")
  (indent-region (- (line-beginning-position) 3) (line-end-position) nil)
  (previous-line 1)
  (c-indent-command))
(defun insert-braces-region () "Insert matching curly braces around region" (interactive)
  (let ((beginning (region-beginning))
	(end (region-end)))
    (goto-char end)
    (insert "}\n")
    (goto-char beginning)
    (insert "{\n")
    (indent-region (- beginning 2) (+ end 4))
    (c-indent-command)
    ))
(global-set-key "\M-{" 'insert-braces)

;; M-[ keybinding to inserts matching brackets, indents the lines and
;; moves the cursor in between.
(defun insert-brackets ()
  "Insert matching square brackets"
  (interactive)
  (set-mark-command 'nil)
  (insert "[]")
  (backward-char))
(global-set-key "\M-[" 'insert-brackets)

;; Toggle Source and Header File (.cpp <-> .h)
(defvar c++-default-header-ext "hpp")
(defvar c++-default-source-ext "cpp")
(defvar c++-header-ext-regexp "\\.\\(hpp\\|h\\|\hh\\|H\\)$")
(defvar c++-source-ext-regexp "\\.\\(cpp\\|c\\|\cc\\|C\\)$")
(defvar project-c++-include-regexp "#include[ \t]+\\(\\(<[^>]*>\\)\\|\\(\"[^\"]*\"\\)\\)[ \t]*\n")
(defvar project-c++-class-decl-regexp "class[ \t]+\\([A-Za-z][A-Za-z0-9_]*\\);[ \t]*\n")
(defvar c++-source-extension-list '("c" "cc" "C" "cpp" "c++"))
(defvar c++-header-extension-list '("h" "hh" "H" "hpp"))
(defun toggle-source-header()
  "Switches to the source buffer if currently in the header buffer and vice versa."
  (interactive)
  (let ((buf (current-buffer))
        (name (file-name-nondirectory (buffer-file-name)))
        file
        offs)
    (setq offs (string-match c++-header-ext-regexp name))
    (if offs
        (let ((lst c++-source-extension-list)
              (ok nil)
              ext)
          (setq file (substring name 0 offs))
          (while (and lst (not ok))
            (setq ext (car lst))
            (if (file-exists-p (concat file "." ext))
		(setq ok t))
            (setq lst (cdr lst)))
          (if ok
              (find-file (concat file "." ext))))
      (let ()
        (setq offs (string-match c++-source-ext-regexp name))
        (if offs
            (let ((lst c++-header-extension-list)
                  (ok nil)
                  ext)
              (setq file (substring name 0 offs))
              (while (and lst (not ok))
                (setq ext (car lst))
                (if (file-exists-p (concat file "." ext))
                    (setq ok t))
                (setq lst (cdr lst)))
              (if ok
                  (find-file (concat file "." ext)))))))))

;; Fly-make
;; (require 'compile)
;; (require 'flymake)
;; (defun flymake-get-make-cmdline (source base-dir)
;;   (list "mingw32-make" (list "-s" "-C" base-dir (concat "CHK_SOURCES=" source) "SYNTAX_CHECK_MODE=1" "check-syntax"))) 

;; (global-set-key [f4] 'flymake-goto-next-error)
;; (global-set-key [M-down] 'flymake-display-err-menu-for-current-line)
;; (global-set-key [M-up] 'find-tag-other-window)

;; (defun flymake-get-mingw32-make-cmdline (source base-dir)
;;   (list "mingw32-make"
;; 	(list "-s"
;; 	      "-C"
;; 	      base-dir
;; 	      (concat "CHK_SOURCES=" source)
;; 	      "SYNTAX_CHECK_MODE=1"
;; 	      "check-syntax")))


;; (defun flymake-simple-mingw32-make-init ()
;;   (flymake-simple-make-init-impl 'flymake-create-temp-inplace t t "Makefile" 'flymake-get-mingw32-make-cmdline)) 
;; (add-to-list 'flymake-allowed-file-name-masks '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-mingw32-make-init))

;; (defun flymake-master-mingw32-make-header-init ()
;;   (flymake-master-mingw32-make-init
;;    'flymake-get-include-dirs
;;    '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'")
;;    "[ \t]*#[ \t]*include[ \t]*\"\\([[:word:]0-9/\\_.]*%s\\)\""))
;; (add-to-list 'flymake-allowed-file-name-masks '("\\.h\\'" flymake-master-mingw32-make-header-init flymake-master-cleanup))

;; (add-hook 'find-file-hook 'flymake-find-file-hook)

;; Compile without prompting
(defun compile-no-prompt () "mybuild"
  (interactive)
  (save-some-buffers 1)
  (compile compile-command))
(global-set-key [f7] 'compile-no-prompt)
(global-set-key [f8] 'next-error)

;; Insert date/time function
(defun insert-date-time ()
  "Insert date and time at the current cursor position"
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M")))
(global-set-key [f5] 'insert-date-time)

;; More convinent way to call make (find an open Makefile buffer and
;; runs make)
(defun compile-makefile-buffer nil
  (interactive)
  (save-some-buffers)
  (set-buffer "Makefile")
  (compile "make"))
(global-set-key [C-return] 'compile-makefile-buffer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/org/bre_test_workshop.org" "~/org/org.org"))))

;; org-mode
;; (require 'org-install)
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (setq org-log-done t)
;; (defun find-default-org ()
;;   (interactive)
;;   (find-file "~/org/default.org"))
;; (global-set-key [f12] 'find-default-org)

;; CMake
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))
