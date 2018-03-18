;;; erc-image-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "erc-image" "erc-image.el" (23165 42082 471356
;;;;;;  720000))
;;; Generated autoloads from erc-image.el

(eval-after-load 'erc '(define-erc-module image nil "Display inlined images in ERC buffer" ((add-hook 'erc-insert-modify-hook 'erc-image-show-url t) (add-hook 'erc-send-modify-hook 'erc-image-show-url t)) ((remove-hook 'erc-insert-modify-hook 'erc-image-show-url) (remove-hook 'erc-send-modify-hook 'erc-image-show-url)) t))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; erc-image-autoloads.el ends here
