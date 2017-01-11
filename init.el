
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))


;; Fucking Emacs keeps adding this crap here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "browseropen.sh")
 '(custom-safe-themes
   (quote
    ("104df8353e0475e27eac464e780400273ef384fa5803af8af8d0a27e2c33b761" "1e3b2c9e7e84bb886739604eae91a9afbdfb2e269936ec5dd4a9d3b7a943af7f" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" "158ca85e9f3eacdcbfc43163200b62c900ae5f64ba64819dbe4b27655351c051" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "ea489f6710a3da0738e7dbdfc124df06a4e3ae82f191ce66c2af3e0a15e99b90" default)))
 '(org-agenda-files (quote ("~/gitgud.org")))
 '(package-selected-packages
   (quote
    (closure-lint-mode ace-window switch-window avy web-mode moe-theme zenburn-theme yasnippet which-key use-package solarized-theme slime-company simple-mpc scheme-complete rainbow-delimiters python-environment pdf-tools paredit multiple-cursors monokai-theme monochrome-theme magit key-chord ivy hlinum helm haskell-mode geiser flycheck fic-mode expand-region evil-visual-mark-mode evil-surround evil-mc epc dired-details+ crux company-c-headers color-theme-solarized cherry-blossom-theme bliss-theme aggressive-indent ace-jump-mode)))
 '(py-force-py-shell-name-p t)
 '(py-shell-name "python2"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
