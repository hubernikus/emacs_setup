;; Custom setup --
;; @author: LukasHuber

;; setup files ending in “.js” to open in js2-mode
;; GAZEBO world files
(add-to-list 'auto-mode-alist '("\\.world\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.launch\\'" . xml-mode)) ;; ROS launch files
(add-to-list 'auto-mode-alist '("\\.urdf\\'" . xml-mode)) ;; URDF -- Unified Robot Description Format
(add-to-list 'auto-mode-alist '("\\.urdf\\'" . xml-mode)) ;; ROS -- configuration files

(add-to-list 'auto-mode-alist '("\\CMakeLists.txt\\'" . yaml-mode))

;; Custom hot key
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(menu-bar-mode -1) 

;; Set white space mode off (TOD0)
(setq prelude-whitespace nil)

(defun my-c++-mode-hook ()
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; Load faster
(setq xterm-query-timeout nil)

;; Chose theme
(load-theme 'manoj-dark)
;; Check out the theme further, put cursor on text and `C-u C-x =`



;;
;; (setq display-line-numbers-mode t)
;; (when (version<= "26.0.50" emacs-version )
  ;; (global-display-line-numbers-mode))

;; Linum Mode
(global-linum-mode 0)

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


;; Python Hook
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq indent-tabs-mode nil
                            tab-width 2))))

(require 'python-cell)
(add-hook 'python-mode-hook #'python-cell-mode 1)

;; (setq python-cell-mode-map
	  ;; (let ((map (make-sparse-keymap)))
		;; (define-key map (kbd "C-<S-return>") 'python-cell-shell-send-cell)
		;; ))
	  
      
;; (package-install 'use-package)
(require 'use-package)

;; (pyenv-mode)
;; (use-package pyvenv
			 ;; :ensure t
			 ;; :init
			 ;; (setenv "WORKON_HOME" "/home/__NAME__/anaconda/envs")
			 ;; (setenv "WORKON_HOME" "/home/lukas/anaconda/envs")
			 ;; (pyvenv-mode 1)
			 ;; (pyvenv-tracking-mode 1))

;; (use-package conda
  ;; :ensure t
  ;; :init
  ;; (setq conda-anaconda-home (expand-file-name "~/anaconda3"))
  ;; (setq conda-env-home-directory (expand-file-name "~/anaconda3")))

;; show available keybindings after you start typing
;; (require 'which-key)
;; (which-key-mode +1)

;; (electric-pair-mode 1)
(show-paren-mode 1)

;; Redundant I think
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; (when (memq window-system '(mac ns x))
  ;; (exec-path-from-shell-initialize))

;; Install elpy on command line / linux. Check github/wiki for more info.
;; (elpy-enable)

(require 'python)
(require 'python-mode)


(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t)
  
  ;; (pyvenv-tracking-mode 1)
  
  ;; Set correct Python interpreter
  (setq pyvenv-post-activate-hooks
        (list
		 (lambda ()
		   (setq python-shell-interpreter
				 (concat pyvenv-virtual-env "bin/ipython")))))
  
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
				(setq python-shell-interpreter "ipython"))))
  )

;; (setq python-shell-interpreter "ipython")
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))

(setq python-shell-interpreter "ipython"
	  python-shell-interpreter-args "--simple-prompt -i")

(set-language-environment "UTF-8")

;; Update execution of [py-execute-buffer]
(setq-default
     py-shell-name          "ipython" ;; \ Default value under Unixes
	 py-python-command      "ipython" ;; /
	 ;; py-python-command-args '("-i" "/absolute/path/to/manage.py" "shell_plus")
	 )

(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim)
  )

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

;; (add-hook 'python-mode-hook
;; (lambda () (local-set-key (kbd "C-c c") 'run-python)))
;; (defn py-execute-buffer () 'run-python)

;; Modified python mode to include cython (first edition, to be completed...)
;; (add-to-list 'load-path "~/.emacs.d/personal/python-mode-20210408.800/")


;; Make sure that snake_case stops at underscore (easier navigation)

;; NOT sure this actually works...
(defun change-major-mode-hook () (modify-syntax-entry ?_ "_"))
							   
(defun my-insert-tab-char ()
  "Insert a tab char. (ASCII 9, \t)"
  (interactive)
  ;; (insert (make-string )
  (insert "    ")
)

(global-set-key (kbd "C-<tab>") 'my-insert-tab-char)

(setq smerge-command-prefix "\C-ch")

;; TODO
;; python-cell
;; python-black

;; Don't break lines in the middle of a word
;; (add-hook 'tex-mode-hook (visual-line-mode t))
(add-hook 'plain-text-mode-hook (visual-line-mode t))
;; Latex/fast_obstxbacle_avoidance/
(add-hook 'latex-mode-hook #'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook #'visual-line-mode)
;; (global-visual-line-mode t)

;; (add-to-list 'package-archives
;; '("melpa" . "http://melpa.org/packages/") t)

;; Install auto-complete
;; (ac-config-default)

;; Global command definition
(global-set-key (kbd "C-'") 'comment-line)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-j") 'toggle-comment-on-line)
;; (global-set-key (kbd "C-m") 'toggle-comment-on-line)
;; (global-set-key (kbd "C-j") 'newline)
;; Which one is better??? try out and change
;; (global-set-key (kbd "C-m") 'newline)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yasnippet-snippets find-file-in-project csv-mode feature-mode auto-complete yaml-mode python-mode zop-to-char zenburn-theme which-key volatile-highlights use-package undo-tree super-save smartrep smartparens projectile operate-on-number move-text markdown-mode magit json-mode imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region exec-path-from-shell elpy editorconfig easy-kill dockerfile-mode discover-my-major diminish diff-hl crux browse-kill-ring beacon anzu ace-window))
 '(python-cell-highlight-cell t)
 '(safe-local-variable-values
   '((TeX-master . "../main")
	 (TeX-master . t)
	 (TeX-master . "main")
	 (flycheck-disabled-checkers emacs-lisp-checkdoc))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(python-cell-highlight-face ((t nil))))

(message "Custom master is ready..")
