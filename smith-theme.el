;;; smith-theme.el --- Kahr Kunne's personal Emacs colour theme.

;; Copyright (C) 2016-2016

;; Author: Kahr Kunne <kahr.kunne@gmail.com>
;; URL: http://kahrkunne.com
;; Package-Version: 420
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; My personal colour scheme.

;;; Code:

(unless (>= emacs-major-version 24)
  (error "Smith theme requires Emacs 24 or above!"))

(deftheme smith "The Smith colour theme")

(defgroup smith nil
  "Smith theme options.
The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom smith-distinct-fringe-background nil
  "Make the fringe background different from the normal background color.
Also affects 'linum-mode' background."
  :type 'boolean
  :group 'smith)

(defcustom smith-use-variable-pitch t
  "Use variable pitch face for some headings and titles."
  :type 'boolean
  :group 'smith)

(defcustom smith-high-contrast-mode-line nil
  "Make the active/inactive mode line stand out more."
  :type 'boolean
  :group 'smith)

(defcustom smith-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'smith)

(defcustom smith-height-plus-1 1.1
  "Font size +1."
  :type 'number
  :group 'smith)

(defcustom smith-height-plus-2 1.15
  "Font size +2."
  :type 'number
  :group 'smith)

(defcustom smith-height-plus-3 1.2
  "Font size +3."
  :type 'number
  :group 'smith)

(defcustom smith-height-plus-4 1.3
  "Font size +4."
  :type 'number
  :group 'smith)

(let* ((class                  '((class color) (min-colors 257)))
       ;; Primary colorsj
       (smith-yellow           "#d1bd2c")
       (smith-orange           "#d1732d")
       (smith-red              "#852620")
       (smith-magenta          "#793cba")
       (smith-violet           "#984aba")
       (smith-blue             "#2c5578")
       (smith-cyan             "#5dabba")
       (smith-green            "#3e7833")
       (smith-gray             "#3e3d31")
       ;; Darker and lighter accented colors
       (smith-yellow-d         "#ab9b24")
       (smith-yellow-l         "#dbc62e")
       (smith-orange-d         "")))

(provide 'smith-theme)
;;; smith-theme.el ends here

