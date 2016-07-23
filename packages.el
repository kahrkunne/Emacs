;;; packages.el --- Package-related code
;;
;; Copyright © 2016-2016 Kahr Kunne
;;
;; Author: Kahr Kunne <kahr.kunne@gmail.com>
;; Version: 1.0.0

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Configuration of Emacs packages (using package.el)

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
;;; Setup stuff:
(require 'package)
;; NOTE: Org doesn't support https, so this is insecure!!
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)

;;; User-installed packages:
(use-package slime
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (load (expand-file-name "~/quicklisp/slime-helper.el")))
(use-package slime-company
  :config
  (slime-setup '(slime-company)))
(use-package multiple-cursors
  :config
  ;; Multiple-cursors doesn't play well with evil mode.
  ;; Disable evil mode when going into multiple-cursors-mode.
  (add-hook 'multiple-cursors-mode-enabled-hook 'evil-emacs-state)
  (add-hook 'multiple-cursors-mode-disabled-hook 'evil-normal-state))

(use-package pdf-tools
  :config
  (pdf-tools-install))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package dired-details+
  :commands dired-details-toggle
  :bind ("C-c t" . dired-details-toggle)
  :config
  (setq-default dired-details-hidden-string "--- ")
  (dired-details-install)
  (dired-details-hide))

(use-package magit)

(use-package ace-jump
  :commands ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode))

(use-package evil
  :commands evil-ex
  :config
  (evil-mode 1))

(require 'evil)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)
(use-package helm
  :init (require 'helm-config)
  :commands (helm-command-prefix
             helm-execute-persistent-action
             helm-select-action
             helm-select-action
             helm-M-x
             helm-show-kill-ring
             helm-mini
             helm-find-files
             helm-google-suggest)
  :bind (("C-c h" . helm-command-prefix)
         ("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("C-c h q" . helm-google-suggest)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
         ("C-z" . helm-select-action))
  :config
  (helm-mode t)
  (helm-autoresize-mode 1)
  (global-unset-key (kbd "C-x c"))
  (setq helm-split-window-in-side-p            t
        helm-move-to-line-cycle-in-source      t
        helm-ff-search-library-in-sexp         t
        helm-scroll-amount                     8
        helm-ff-file-name-history-use-recentf  t
        helm-mode-fuzzy-match                  t
        helm-completion-in-region-fuzzy-match  t
        helm-autoresize-max-height             30)
  (helm-autoresize-mode t)
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p))
  (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages))

(use-package key-chord
  :config
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-mode t))
;; It wants to have this outside of :config for some reason.
;; TODO: Check out if it still does.
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(use-package agressive-indent
  :config
  (global-aggressive-indent-mode 1))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0.25)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 4)
  (defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'my/python-mode-hook))

(use-package concurrent)

(use-package evil-surround
  :config
  (evil-surround-mode t))

;; TODO: Rediscover what this does.
(use-package evil-visual-mark-mode
  :config
  (evil-visual-mark-mode t))

(use-package expand-region
  :commands er/expand-region
  :bind ("C-=" . er/expand-region))

(use-package fic-mode
  :config
  ;; TODO: This mode isn't global, so this part does nothing.
  ;; Might just get rid of fic-mode altogether.
  (fic-mode 1))

;; TODO: Look into making this thing go a little less anal when editing elisp.
(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package geiser)

;; TODO: Figure out if I even need this.
(use-package async)

(use-package monokai-theme)

(use-package paredit
  :config
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode))

(use-package which-key
  :config
  (which-key-mode t))

;; TODO: Memorise snippets
;; Maybe autocomplete snippets?
(use-package yasnippet
  :config
  (yas-global-mode 1))

;; TODO: Start using this or trash it.
(use-package simple-mpc)

(provide 'packages)

;;; packages ends here
