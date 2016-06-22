;;; .emacs --- Kahr Kunne's emacs init file

;;; Commentary:
;;; None at the moment!

;;; Code:
;; This needs to be first, in order for startup to look pretty
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; Packages
(load "~/.emacs.d/packages.el")
;; TODO: Flycheck errors on this line, dunno why.
(require 'packages)

;;; Appearance
(load "~/.emacs.d/appearance.el")
(require 'appearance)

;;; Functions and keybindings
(load "~/.emacs.d/functions-and-keybindings.el")
(require 'functions-and-keybindings)

;;; Editor config
(load "~/.emacs.d/editor-config.el")
(require 'editor-config)

;;; init.el ends here
