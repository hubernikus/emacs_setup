;; Custom setup --
;; @author: LukasHuber

;; setup files ending in “.js” to open in js2-mode
;; GAZEBO world files
(add-to-list 'auto-mode-alist '("\\.world\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.launch\\'" . xml-mode)) ;; ROS launch files
(add-to-list 'auto-mode-alist '("\\.urdf\\'" . xml-mode)) ;; URDF -- Unified Robot Description Format
(add-to-list 'auto-mode-alist '("\\.urdf\\'" . xml-mode)) ;; ROS -- configurtation files

;; Custom hot key
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

;; (global-set-key (kbd "C-'") 'toggle-comment-on-line)
(global-set-key (kbd "C-;") 'toggle-comment-on-line)
(global-set-key (kbd "C-j") 'toggle-comment-on-line)
;; (global-set-key (kbd "C-j") 'newline)
;; Which one is better??? try out and change
(global-set-key (kbd "C-m") 'newline)

(menu-bar-mode -1) 

;; Set white space mode off (TODD)
;; (global-whitespace-mode 0)
;; (whitespace-mode 0)
(setq prelude-whitespace nil)

(defun my-c++-mode-hook ()
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(add-to-list 'auto-mode-alist '("\\CMakeLists.txt\\'" . yaml-mode))

;; Load faster
(setq xterm-query-timeout nil)

;; Chose theme
(load-theme 'manoj-dark)

;;
;; (setq display-line-numbers-mode t)
;; (when (version<= "26.0.50" emacs-version )
  ;; (global-display-line-numbers-mode))

;; (global-linum-mode 1)

;; (message "Prelude is ready to do thy bidding, Master %s!" current-user)

;; (setq-default tab-width 4)
;; (setq c-default-style "linux"
      ;; c-basic-offset 4)
;; (c-set-offset 'substatement-open 0)
;; (setq-default c-basic-offset 4)
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)
(setq c-default-style "user") ;; DOES NOT WORK
(setq c-indentation-style "user")

(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))

(setq python-shell-interpreter "ipython"
	  python-shell-interpreter-args "--simple-prompt -i")

;; Python Hook
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq indent-tabs-mode nil
                            tab-width 2))))

;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (package-install 'use-package)
(require 'use-package)

;; (pyenv-mode)
(use-package pyvenv
			 :ensure t
			 :init
			 ;; (setenv "WORKON_HOME" "/home/__NAME__/anaconda/envs")
			 (setenv "WORKON_HOME" "/home/lukas/anaconda/envs")
			 (pyvenv-mode 1)
			 (pyvenv-tracking-mode 1))

(use-package conda
  :ensure t
  :init
  (setq conda-anaconda-home (expand-file-name "~/anaconda3"))
  (setq conda-env-home-directory (expand-file-name "~/anaconda3")))

;; (setenv "PATH" "/home/lukas/anaconda3/bin:/home/lukas/bin:/home/lukas/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/game")

;; Anaconda in python
;; (setenv "WORKON_HOME" "/Users/Pablo/anaconda/envs")
;; (pyvenv-mode 1)
;; (use-package conda
			 ;; :ensure t
			 ;; :init
			 ;; (setq conda-anaconda-home (expand-file-name "~/miniconda3"))
			 ;; (setq conda-env-home-directory (expand-file-name "~/miniconda3")))


;; show available keybindings after you start typing
;; (require 'which-key)
;; (which-key-mode +1)

;; (electric-pair-mode 1)
(show-paren-mode 1)

;; Redundant I think
(require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; (use-package elpy
			 ;; :ensure t
			 ;; :init
			 ;; (elpy-enable))

;; Install elpy on command line / linux. Check github/wiki for more info.
(elpy-enable)
(setenv "WORKON_HOME" "/home/user/anaconda3/envs/")

;; M-x package-install lsp-mode
(require 'company-lsp)
(require 'lsp-mode)

;; for completions
(use-package company-lsp
  :after lsp-mode
  :config (push 'company-lsp company-backends))

;; M-x package isntall vue-mode
(use-package vue-mode
  :mode "\\.vue\\'"
  :config
  (add-hook 'vue-mode-hook #'lsp))

;; Setup json and vue intent 
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)

;;; Python specialized rx is modified to include cython parts
;; Disable background (?)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mmm-default-submode-face ((t (:background nil)))))

;; (setq mweb-tags 
      ;; '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
        ;; (js-mode  "<script[^>]*>" "</script>")
        ;; (css-mode "<style[^>]*>" "</style>")))
;; (setq-default tab-width 2)
;; (setq indent-line-function 'insert-tab)

;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)

;; (require 'python)

(add-to-list 'load-path "~/.emacs.d/personal/python-mode-20210408.800/")
(require 'python-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (python-mode cython-mode dockerfile-mode yaml-mode csv-mode scss-mode company-lsp lsp-mode vue-mode json-mode markdown-mode puppet-mode conda use-package pyenv-mode yasnippet-snippets find-file-in-project elpy zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens projectile operate-on-number nlinum move-text magit imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region exec-path-from-shell editorconfig easy-kill discover-my-major diminish diff-hl crux browse-kill-ring anzu ag ace-window))))

(message "Custom master is ready..")
