;;; editor-config.el --- Editor configuration
;;
;; Copyright © 2016-2016 Kahr Kunne
;;
;; Author: Kahr Kunne <kahr.kunne@gmail.com>
;; Version: 1.0.0

;; This file is not part of GNU Emacs.

;;; Commentary:
;; General editor configuration

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
(setq python-python-command "/usr/bin/python3")
(global-linum-mode 1)
(which-function-mode 1)
(setq ring-bell-function 'ignore)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(put 'set-goal-column 'disabled nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq require-final-newline t)
(delete-selection-mode t)
(setq mc/unsupported-minor-modes '(company-mode auto-complete-mode flyspell-mode jedi-mode))
(add-hook 'before-save-hook 'cleanup-buffer-safe)

(defvar hexcolor-keywords
  '(("#[abcdef[:digit:]]+"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background
                     (match-string-no-properties 0)))))))
(defun hexcolor-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolor-keywords))
(add-hook 'css-mode-hook 'hexcolor-add-to-font-lock)
(add-hook 'emacs-lisp-mode-hook 'hexcolor-add-to-font-lock)
(add-hook 'less-css-mode-hook 'hexcolor-add-to-font-lock)
(add-hook 'conf-xdefaults-mode-hook 'hexcolor-add-to-font-lock)

(provide 'editor-config)
;;; editor-config.el ends here
