;;; helm-ad-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "helm-ad" "helm-ad.el" (0 0 0 0))
;;; Generated autoloads from helm-ad.el

(autoload 'helm-ad "helm-ad" "\
Query the directory by using the `dsquery` command,
and display the selected property of a specific object.
The property can be selected as a helm action,
and will be displayed by using the `dsget` command.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "helm-ad" '("helm-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; helm-ad-autoloads.el ends here
