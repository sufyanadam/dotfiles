;;Disable startup message
(setq inhibit-startup-message t)

;;Text customizations
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(show-paren-mode 1)
(add-hook 'lisp-mode-hook '(lambda()
			     (local-set-key (kbd "RET") 'newline-and-indent)))

;;Indentation fix (4 spaces instead of 8)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;Enable cookies in w3m
(setq w3m-use-cookies t)

;;Enable colours in shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;Slime
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;(setq inferior-lisp-program "clisp")
;(slime-setup '(slime-fancy slime-asdf))

;;Enable interactive mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)


;;CEDET
;(load-file "~/.emacs.d/lib/cedet-1.0/common/cedet.el")
;(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)


;;Rinari
(add-to-list 'load-path "~/.emacs.d/lib/rinari")
(require 'rinari)


;;rhtml-mode
(add-to-list 'load-path "~/.emacs.d/lib/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))

;;Setup GMail SMTP
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials (expand-file-name "~/.authinfo")
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

(require 'smtpmail)


;;Set default font
(add-to-list 'default-frame-alist '(font . "Inconsolata Medium 24"))
(set-default-font "Inconsolata Medium 24")


;; Color-theme.el
(require 'color-theme)
(setq color-them-is-global t)
(load-file "~/.emacs.d/themes/zenburn-el/zenburn.el")
(color-theme-zenburn)