;; yaml-mode
(autoload 'yaml-mode "yaml-mode")
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("jsTestDriver\\.conf$" . yaml-mode))

;; ruby-mode
(autoload 'ruby-mode "ruby-mode")
(add-to-list 'auto-mode-alist '("\\.rbw?$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Cakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

;; text-mode for bison grammars
(add-to-list 'auto-mode-alist '("\\.y$" . text-mode))

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js?$" . js2-mode))

;; json-mode
(autoload 'json-mode "json-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

;; jade-mode
(add-to-list 'auto-mode-alist '("\\.jade?$" . jade-mode))

;; lua-mode
(autoload 'lua-mode "lua-mode")
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

;; css-mode
(autoload 'css-mode "css-mode")
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.less?$" . css-mode))

;; c++-mode for .h & arduino
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ino$" . c++-mode))

;; batch-mode
(autoload 'batch-mode "batch-mode")
(add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode))
(add-to-list 'auto-mode-alist '("\\.cmd\\'" . batch-mode))

;; haml-mode
(autoload 'haml-mode "haml-mode")
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; cmake-mode
(autoload 'cmake-mode "cmake-mode")
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

(provide 'mode-mappings)
