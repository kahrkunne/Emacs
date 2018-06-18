(setq user-full-name "Kahr Kunne"
      user-mail-address "kahr.kunne@gmail.com")

(setq backup-directory-alist '(("~/.emacs.d/backups")))

(setq delete-old-versions           -1
      version-control                t
      vc-make-backup-files           t
      auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list" t)))

(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t
      history-delete-duplicates t
      savehist-save-minibuffer-history 1
      savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

(put 'upcase-region 'disabled nil)



(eval-after-load "term"
  '(progn (term-set-escape-char ?\C-q)
          (define-key term-raw-map (kbd "C-c") nil)))
(eval-after-load "term"
  '(define-key term-raw-map (kbd "C-c C-c") (lambda ()(interactive)(term-send-raw-string "\C-c"))))

(defun eshell/cat-with-syntax-highlight (filename)
    "Like cat(1) but with syntax highlighting."
    (let ((existing-buffer (get-file-buffer filename))
          (buffer (find-file-noselect filename)))
      (eshell-print
       (with-current-buffer buffer
         (if (fboundp 'font-lock-ensure)
             (font-lock-ensure)
           (with-no-warnings
             (font-lock-fontify-buffer)))
         (buffer-string)))
      (unless existing-buffer
        (kill-buffer buffer))
      nil))

(defun eshell/imgcat (&rest args)
  "Display image(s)."
  (let ((elems (eshell-flatten-list args))
        (minibuffer-message-timeout 0))
    (if (not (file-exists-p (expand-file-name (car elems))))
        nil
      (while elems
        (call-process-shell-command
         (concat "scale-down.sh "
                 (car elems) " "
                 (number-to-string (* 0.75 (window-pixel-width))) " "
                 (number-to-string (* 0.75 (window-pixel-height)))))
        (setcar elems (concat "/tmp/" (car elems)))
        (eshell-printn
         (propertize " " 'display (create-image (expand-file-name (car elems)))))
        ;;(delete-file (car elems))
        (setq elems (cdr elems)))))) 

  (defun eshell/bettercat (filename &rest args)
    (if (equal (substring (mailcap-extension-to-mime (file-name-extension filename)) 0 5)
               "image")
        (eshell/imgcat (cons filename args))
      (eshell/cat-with-syntax-highlight filename))) 

  (advice-add 'eshell/cat :override #'eshell/bettercat) 

(add-hook 'eshell-mode-hook
  (lambda () 
    (define-key eshell-mode-map (kbd "<tab>")
      (lambda () (interactive) (pcomplete-std-complete)))))

(setq dired-recursive-copies 'always
      dired-recursive-deletes 'always
      dired-dwim-target t
      dired-listing-switches "-alh")

(dired-async-mode 1)

;; allow dired to delete or copy dir
(setq dired-recursive-copies (quote always)) ; “always” means no asking
(setq dired-recursive-deletes (quote top)) ; “top” means ask once

(show-paren-mode 1)
(setq show-paren-delay 0)

(add-hook 'prog-mode-hook 'nlinum-mode)

(setq ring-bell-function 'ignore)

(fset 'yes-or-no-p 'y-or-n-p)

(setq python-python-command "/usr/bin/python3")

(setq python-indent-offset 4)

(setq require-final-newline t)

(delete-selection-mode t)

(global-auto-revert-mode 1)

(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(add-hook 'term-mode-hook 'toggle-truncate-lines)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "google-chrome-stable")
 '(custom-safe-themes
   (quote
    ("104df8353e0475e27eac464e780400273ef384fa5803af8af8d0a27e2c33b761" "1e3b2c9e7e84bb886739604eae91a9afbdfb2e269936ec5dd4a9d3b7a943af7f" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" "158ca85e9f3eacdcbfc43163200b62c900ae5f64ba64819dbe4b27655351c051" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "ea489f6710a3da0738e7dbdfc124df06a4e3ae82f191ce66c2af3e0a15e99b90" default)))
 '(org-agenda-files (quote ("~/gitgud.org")))
 '(py-force-py-shell-name-p t)
 '(py-shell-name "python2"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit variable-pitch :foreground "#FD971F" :height 1.0 :family "Terminus"))))
 '(org-level-2 ((t (:inherit variable-pitch :foreground "#A6E22E" :height 1.0 :family "Terminus"))))
 '(org-level-3 ((t (:inherit variable-pitch :foreground "#66D9EF" :height 1.0 :family "Terminus"))))
 '(org-level-4 ((t (:inherit variable-pitch :foreground "#E6DB74" :height 1.0 :family "Terminus"))))
 '(org-level-5 ((t (:inherit variable-pitch :foreground "#E6DB74" :height 1.0 :family "Terminus")))))

(setq custom-safe-themes t)
(set-frame-font "xos4 Terminus-12")
(use-package ample-theme)
(ample-theme)

(use-package powerline
  :config (powerline-default-theme))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("elpy" . "http://jorgenschaefer.github.io/packages/")))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)
;;  (setq package-enable-at-startup nil)
;;  (package-initialize)
  (setq use-package-always-ensure t)

(use-package geiser
  :config
  (add-hook 'scheme-mode-hook 'geiser-mode))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0.25)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 4)
  (setq company-global-modes
        '(not
          eshell-mode comint-mode org-mode erc-mode)))

(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package lispy
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode) 1))
  (add-hook 'eval-expression-minibuffer-setup-hook (lambda () (lispy-mode 1)))
  (add-hook 'ielm-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'lisp-interaction-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'scheme-mode-hook (lambda () (lispy-mode 1)))
  (define-key  lispy-mode-map-lispy (kbd "\"") 'lispy-doublequote))

(use-package lispyville
  :config
  (add-hook 'lispy-mode-hook #'lispyville-mode))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(use-package company-jedi
  :init
  (add-hook 'python-mode-hook 'my/python-mode-hook))

(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))
  (setq web-mode-engines-alist
        '(("cheetah" . "\\.tmpl\\'"))))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package dired-details+
  :commands dired-details-toggle
  :config
  (setq-default dired-details-hidden-string "--- ")
  (dired-details-install)
  (dired-details-hide)
  (add-hook 'dired-mode-hook 'dired-details-toggle))

(use-package fic-mode
  :config
  (add-hook 'prog-mode-hook #'fic-mode)
  (setq fic-highlighted-words '("FIXME" "TODO" "BUG" "XXX" "NOTE" "HACK")))

(use-package rainbow-mode
  :config
  (rainbow-mode 1))

(use-package hlinum-hl
  :after nlinum
  :config
  (add-hook 'nlinum-mode-hook #'nlinum-hl-mode))

(use-package avy
  :config
  (setq avy-keys (number-sequence ?a ?z))
  (setq avy-all-windows nil)
  (setq avy-timeout-seconds 0.3)
  (setq avy-keys '(?a ?s ?d ?f ?j ?k ?l ?g ?h ?r ?e ?u ?i ?v ?n)))

(use-package ace-window
  :commands (ace-window)
  :bind (("C-x o" . ace-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l ?; ?g ?h)))

(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<up>") 'windmove-up)

(use-package magit
    :config
    (setq with-editor-emacsclient-executable "/usr/bin/emacsclient-emacs-25")
  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
)

(use-package evil
    :commands evil-ex
    :config
    (evil-mode 1)
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  (define-key evil-normal-state-map (kbd "SPC") 'avy-goto-char-timer)
  (define-key evil-visual-state-map (kbd "SPC") 'avy-goto-char-timer)
  (define-key evil-normal-state-map (kbd "g k") 'open-line-above)
  (define-key evil-normal-state-map (kbd "g j") 'open-line-below)
  (define-key evil-normal-state-map (kbd "g a") 'paste-above)
  (define-key evil-normal-state-map (kbd "g p") 'paste-below)

  (define-key evil-insert-state-map (kbd "C-o") nil)
  (define-key evil-insert-state-map (kbd "C-d") nil)
)

  (require 'evil)

(use-package evil-surround
  :config
  (evil-surround-mode t))

(use-package multiple-cursors
  :config
  ;; Multiple-cursors doesn't play well with evil mode.
  ;; Disable evil mode when going into multiple-cursors-mode.
  (add-hook 'multiple-cursors-mode-enabled-hook 'evil-emacs-state)
  (add-hook 'multiple-cursors-mode-disabled-hook 'evil-normal-state)
  (setq mc/unsupported-minor-modes '(company-mode auto-complete-mode flyspell-mode jedi-mode)))

(use-package expand-region
  :commands er/expand-region
  :bind ("C-=" . er/expand-region))

(use-package yasnippet
  :bind
  ("C-c c" . yas-expand)
  :config
  (yas-global-mode 1)
  (yas-load-directory "~/.emacs.d/snippets/"))

(use-package mozc
  :config
  (setq default-input-method "japanese-mozc"))

(use-package no-littering)

(use-package hydra)

(use-package ivy
  :bind
  (:map ivy-mode-map
        ("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  (setq ivy-height                10
        ivy-count-format          "(%d/%d) "
        ivy-use-virtual-buffers   t
        ivy-re-builders-alist     '((t . ivy--regex-ignore-order))
        ivy-initial-inputs-alist '((org-refile . "")
                                   (org-capture-refile . "")
                                   (counsel-M-x . "")
                                   (counsel-describe-function . "")
                                   (counsel-describe-variable . "")
                                   (man . "")
                                   (woman . "")))
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

(use-package key-chord
    :config
    (setq key-chord-two-keys-delay 0.5)
    (key-chord-mode t))
;; It wants to have this outside of :config for some reason.
;; TODO: Check out if it still does.
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(use-package which-key
  :config
  (which-key-mode t))

(use-package dired+)

(use-package shackle
  :config
  (setq shackle-default-alignment 'below
        shackle-default-size 10
        shackle-rules
        '(("*Backtrace*" :popup t :size 20 :align t)
          (buffer-menu-mode :size 20 :align t)
          (apropos :size 20 :popup t :align t :select t)
          ("*Warnings*" :ignore :align t)
          ("*Help*" :select t)))
  (shackle-mode t))

(use-package workgroups2
  :config
  (workgroups-mode t))

(use-package treemacs
  :config
  (global-set-key (kbd "C-c t") #'treemacs)
  )

(use-package treemacs-projectile)
(use-package treemacs-evil)

(use-package exwm)
(use-package exwm-x)
(use-package exwm-config
  :config
  ;; 9 Workspaces by default
  (setq exwm-workspace-number 10)
  ;; Naming windows; see the EXWM example config (https://github.com/ch11ng/exwm/wiki/Configuration-Example)
  (add-hook 'exwm-update-class-hook
            (lambda ()
              (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                          (string= "gimp" exwm-instance-name))
                (exwm-workspace-rename-buffer exwm-class-name))))
  (add-hook 'exwm-update-title-hook
            (lambda ()
              (when (or (not exwm-instance-name)
                        (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
                (exwm-workspace-rename-buffer exwm-title))))
  ;; Keybindings
  (exwm-input-set-key (kbd "s-x") #'exwm-reset)
  (exwm-input-set-key (kbd "s-w") #'exwm-workspace-switch)
  (dotimes (i 10)
    (exwm-input-set-key (kbd (format "s-%d" i))
                        `(lambda ()
                           (interactive)
                           (exwm-workspace-switch ,i)))) 
  (exwm-input-set-key (kbd "s-r") 'exwm-kahr/launcher)
  (exwm-input-set-key (kbd "s-t") 'exwmx-toggle-keyboard)
  ;; Start EXWM
  (require 'exwm-randr)
  (setq exwm-randr-workspace-output-plist '(0 "HDMI-0" 1 "DVI-D-1" 2 "DVI-D-1" 3 "DVI-D-1" 4 "DVI-D-1" 5 "DVI-D-1" 6 "HDMI-0" 7 "HDMI-0" 8 "HDMI-0" 9 "HDMI-0"))
  (add-hook 'exwm-randr-screen-change-hook
            (lambda ()
              (start-process-shell-command
               "xrandr" nil "xrandr --output HDMI-0 --right-of DVI-D-0 --auto")))
  (exwm-enable)
  (exwm-randr-enable))

;; exim
(require 'exim)
(add-hook 'exwm-init-hook 'exim-start)
(push ?\C-\\ exwm-input-prefix-keys)
(push ?\C-U exwm-input-prefix-keys) 
(push ?\C-u exwm-input-prefix-keys)

(setq org-agenda-files (quote ("~/Life/agenda.org")))
(add-to-list 'org-modules "org-habit")
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(global-set-key (kbd "C-c g") 'org-agenda )

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; FIXME this is horrible holy shit wtf I should neck myself
(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

(defun ra/special (s)
  (string= (substring s nil 1) "*"))

(defun ra/extract-cat (l)
  (let ((n (cl-position t (cdr (mapcar #'ra/special l)))))
    (list (subseq l 0 (+ n 1)) (nthcdr (+ n 1) l))))

(defun random-activity (&optional user-cat)
  (setq file-raw (read-lines "/home/kahr/Tools/activities.org"))
  (setq cats ())
  (let* ((num-special (count t (mapcar #'ra/special file-raw)))
         (activities
          (dotimes (n (- num-special 1))
            (let ((cat (car (ra/extract-cat file-raw)))
                  (new-raw (cadr (ra/extract-cat file-raw))))
              (setq cats (cons cat cats))
              (setq file-raw new-raw)))))
    ;; (nth (random (length activities))
    ;;   activities)
    (setq cats (cons file-raw cats))
    cats
    (let ((current-cat
           (if user-cat
               (car
                (seq-filter
                 (lambda (l)
                   (string= (downcase (car l)) (downcase (concat "* " user-cat))))
                 cats))
             (nth (random (length cats)) cats))))
(concat (nth (random (length (cdr current-cat)))
             (cdr current-cat))
        " (" (substring (car current-cat) 2 nil) ")"))))

(defun insert-date ()
  (interactive)
  (insert (format-time-string "%d.%m-%Y")))

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (forward-line -1))
(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (indent-for-tab-command))

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))
(defun magit-quit-session ()
  "Restore the previous window configuration and kill the magit buffer."
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (insert " ") ;; Dirty hack
  (forward-char)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun paste-above ()
  (interactive)
  (let ((pos (point))
        (cur-max (point-max)))
    (beginning-of-line)
    (yank)
    (newline-and-indent)
    (goto-char (+ pos (- (point-max) cur-max)))))

(defun paste-below ()
  (interactive)
  (let ((pos (point))
        (cur-max (point-max)))
    (beginning-of-line)
    (forward-line)
    (yank)
    (newline-and-indent)
    (goto-char pos)))

;  (use-package evil-magit)

(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

(defhydra hydra-launch (:color blue :hint nil)
  "
^Term^             ^Files^           ^IRC^          ^Email^        ^System        
^^^^^^^^--------------------------------------------------------------------------
_t_: ansi-term     _d_: dired        _i_: erc       _g_: gnus      _l_: linux app
_e_: eshell
_s_: shell
"
  ("t" ansi-term)
  ("e" eshell)
  ("s" shell)
  ("d" dired)
  ("i" erc)
  ("g" gnus)
  ("l" counsel-linux-app))
(global-set-key (kbd "C-c l") 'hydra-launch/body)

(defhydra hydra-navigate (:color blue :hint nil)
  "
^Char^             ^Line^           ^search^          ^File^          ^buffer
^^^^^^^^---------------------------------------------------------------------------------------
_c_: char timer    _l_: line        _s_: search       _f_: find-file  _b_ buffer
_j_: char                         _a_: search all   _p_: ffap       _o_ buffer other window
"
  ("c" avy-goto-char-timer)
  ("j" avy-goto-char)
  ("l" avy-goto-line)
  ("s" swiper)
  ("a" swiper-all)
  ("f" counsel-find-file)
  ("p" counsel-find-file-at-point)
  ("b" switch-to-buffer)
  ("o" switch-to-buffer-other-window))
(global-set-key (kbd "C-c n") 'hydra-navigate/body)

(defun eshell-full-clear ()
  (interactive)
  (eshell/clear t))

(defhydra hydra-eshell (:color blue :hint nil)
  "
^I/O^              ^Visual
^^^^^^^-----------------------------
_b_: buffer        _c_: clear
		 _x_: clear history
"
  ("b" eshell-insert-buffer-name)
  ("c" eshell/clear)
  ("x" eshell-full-clear))
(global-set-key (kbd "C-c e") 'hydra-eshell/body)

(defhydra hydra-workgroups (:color blue :hint nil)
  "
_c_: create    _A_: rename    _k_: kill    _v_: switch    _s_: save    _f_: load
"
  ("c" wg-create-workgroup)
  ("A" wg-rename-workgroup)
  ("k" wg-kill-workgroup)
  ("v" wg-switch-to-workgroup)
  ("s" wg-save-session-as)
  ("f" wg-open-session))
(global-set-key (kbd "C-c w") 'hydra-workgroups/body)

(global-set-key (kbd "C-c d") 'insert-date)
(global-set-key (kbd "C-x g") 'webjump)
(global-set-key (kbd "C-c b") 'paste-below)
(global-set-key (kbd "C-c a") 'paste-above)
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-c f") 'eval-region)
(global-set-key (kbd "C-x C-r") 'sudo-edit)
(global-set-key (kbd "C-c r") 'rename-buffer)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-c p") #'mingus-toggle)
(global-set-key (kbd "<XF86AudioLowerVolume>") #'mingus-vol-down)
(global-set-key (kbd "<XF86AudioRaiseVolume>") #'mingus-vol-up)
(global-set-key (kbd "<XF86AudioMute>") #'mingus-toggle)

((defun to-vm ()
  (interactive)
  (call-process "to-vm.sh"))

(defun from-vm ()
  (interactive)
  (call-process "from-vm.sh"))


(global-set-key (kbd "s-d") #'to-vm)
(global-set-key (kbd "s-f") #'from-vm)
