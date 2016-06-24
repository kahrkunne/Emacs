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
;;; Appearance
(load "~/.emacs.d/appearance.el")
;;; Functions and keybindings
(load "~/.emacs.d/functions-and-keybindings.el")
;;; Editor config
(load "~/.emacs.d/editor-config.el")
;;; init.el ends here
