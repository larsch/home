(provide 'setup-auto-insert)

;; (setq auto-insert 'other)
;; (setq auto-insert-directory)
(defun my/autoinsert-yas-expand()
  "Replace text in yasnippet template."
  (yas/expand-snippet (buffer-string) (point-min) (point-max)))

(setq auto-insert 'other)
(setq auto-insert-query nil)
(setq auto-insert-directory "~/.emacs.d/autoinsert/")
(setq auto-insert-alist
      '((("\\.\\([Hh]\\|hh\\|hpp\\)\\'" . "C / C++ header") . ["template.h" c++-mode my/autoinsert-yas-expand])
	(("\\.\\([C]\\|cc\\|cpp\\)\\'" . "C++ source") . ["template.cc" my/autoinsert-yas-expand])
	(("\\.sh\\'" . "Shell script") . ["template.sh" my/autoinsert-yas-expand])
	(("\\.el\\'" . "Emacs Lisp") . ["template.el" my/autoinsert-yas-expand])
	(("\\.pl\\'" . "Perl script") . ["template.pl" my/autoinsert-yas-expand])
	(("\\.pm\\'" . "Perl module") . ["template.pm" my/autoinsert-yas-expand])
	(("\\.py\\'" . "Python script") . ["template.py" my/autoinsert-yas-expand])
	(("\\.rb\\'" . "Ruby script") . ["template.rb" my/autoinsert-yas-expand])
	(("\\.ino\\'" . "Arduino program") . ["template.ino" my/autoinsert-yas-expand])
	(("[mM]akefile\\'" . "Makefile") . ["Makefile" my/autoinsert-yas-expand])
	(("\\.tex\\'" . "TeX/LaTeX") . ["template.tex" my/autoinsert-yas-expand])))
(auto-insert-mode 1)

(defun init-yas-minor-mode-map ()
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map [C-tab] 'yas-expand))

(add-hook 'yas-minor-mode-hook 'init-yas-minor-mode-map)

(defun make-header-guard ()
  "foo")
