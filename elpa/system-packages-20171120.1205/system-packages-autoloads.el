;;; system-packages-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "system-packages" "system-packages.el" (23061
;;;;;;  6582 296263 677000))
;;; Generated autoloads from system-packages.el

(autoload 'system-packages-install "system-packages" "\
Installs system packages using the package manager named in
system-packages-packagemanager.

\(fn PACK)" t nil)

(autoload 'system-packages-search "system-packages" "\
Search for system packages using the package manager named in
system-packages-packagemanager.

\(fn PACK)" t nil)

(autoload 'system-packages-uninstall "system-packages" "\
Uninstalls installed system packages using the package manager named in
system-packages-packagemanager.

\(fn PACK)" t nil)

(autoload 'system-packages-list-dependencies-of "system-packages" "\
List all the dependencies of PACK.

\(fn PACK)" t nil)

(autoload 'system-packages-get-info "system-packages" "\
Display local package information of PACK.

With a prefix argument, display remote package information.

\(fn PACK)" t nil)

(autoload 'system-packages-list-files-provided-by "system-packages" "\
List the files provided by PACK.

\(fn PACK)" t nil)

(autoload 'system-packages-update "system-packages" "\
Updates installed system packages using the package manager named in
system-packages-packagemanager.

\(fn)" t nil)

(autoload 'system-packages-remove-orphaned "system-packages" "\
This function removes orphaned packages (i.e. unused packages). using the package manager named in
system-packages-packagemanager.

\(fn)" t nil)

(autoload 'system-packages-list-installed-packages "system-packages" "\
List explicitly installed packages using the package manager
named in system-packages-packagemanager. With
\\[universal-argument], list all installed packages.

\(fn ARG)" t nil)

(autoload 'system-packages-clean-cache "system-packages" "\
Clean the cache of the package manager.

\(fn)" t nil)

(autoload 'system-packages-log "system-packages" "\
Show a log of the actions taken by the package manager.

\(fn)" t nil)

(autoload 'system-packages-verify-all-packages "system-packages" "\
Check that files owned by packages are present on the system.

\(fn)" t nil)

(autoload 'system-packages-verify-all-dependencies "system-packages" "\
Verify that all required dependencies are installed on the system.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; system-packages-autoloads.el ends here
