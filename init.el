;; load emacs 24's package system. Add MELPA repository.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))
; (custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  '(dired-mode-hook
;    (cons
;     (quote tramp-theme-hook-function)
;     (delete
;      (quote tramp-theme-hook-function)
;      dired-mode-hook)))
;  '(eshell-directory-change-hook
;    (cons
;     (quote tramp-theme-hook-function)
;     (delete
;      (quote tramp-theme-hook-function)
;      eshell-directory-change-hook)))
;  '(find-file-hook
;    (cons
;     (quote tramp-theme-hook-function)
;     (delete
;      (quote tramp-theme-hook-function)
;      find-file-hook)))
;  '(global-linum-mode t)
;  '(line-number-mode t)
;  '(mode-line-buffer-identification
;    (quote
;     (:eval
;      (tramp-theme-mode-line-buffer-identification))) t)
;  '(package-selected-packages
;    (quote
;     (ahungry-theme tramp-theme addressbook-bookmark dash emmet-mode gitignore-mode request helm-ack helm-ad helm-addressbook helm-ag helm-ag-r helm-dictionary helm-directory helm-emmet helm-git helm-gitignore helm-pydoc helm-themes python-info python-mode async helm-core popup helm)))
;  '(red "#ffffff"))
; (custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  )


;; helm mode ayarlari
(require 'helm-config)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
;;
;; helm mode'u baslangicta calistirıyor
(helm-mode 1)
;;
;; parantezleri otomatik çiftliyor
(electric-pair-mode 1)
;;
;; gereksiz ust menuyu(toolbar) kaldırıyor
;;(tool-bar-mode -1)
;;(menu-bar-mode -1)
;;(scroll-bar-mode -1)
;;
;; emacsi terminalden kullanirken disardan kopyala yapistir yapabilmeyi sagliyor
;; once sudo apt-get install xclip
(xclip-mode 1)

;;auto-complete with emacs i başlatıyor
(require 'auto-complete)
;;default ayarları hallediyor auto-complete için
(require 'auto-complete-config)
(ac-config-default)
;;yasnippet i başlatma auto complete devamı
(require 'yasnippet)
(yas-global-mode 1)
;;initialize auto-complete-c-headers
(defun my:acc-c-header-init ()
  (require 'auto-complete-c-headers))
;;yazdığımız fonksiyonu c/c++ hooks tan çağırıyoruz
(add-hook 'c++-mode-hook 'my:acc-c-header-init)
(add-hook 'c-mode-hook 'my:acc-c-header-init)
;;(add-to-list 'achead:include-directories '"/Library/Developer/CommandLineTools/usr/include")



;; bir yaziyi sectikten sonra yazmaya baslarsan secili yeri silip oyle yaziyor
(delete-selection-mode 1)

;; once kelimeyi sonra parantezin icini sonra fonksiyonun icini... seciyor
(global-set-key (kbd "C-t") 'er/expand-region)

;; satir sayilarini gosteriyor
;;(global-linum-mode 1)

;; flycheck'i (syntax check) acilista calistiriyor
(add-hook 'after-init-hook #'global-flycheck-mode)

;; eslesen parantezleri, koseli parantezleri vs esliyor
(show-paren-mode 1)

;; backup dosyalarinin (~ ile bitenler) calisilan klasor yerine
;; "/tmp" klasorunde olusturulmasını ve saklanmasini sagliyor
    (setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))


;; ahungry temasini acilista calistiriyor
(load-theme 'ahungry t)

;; load theme yapinca eskilerin disable olmasini sagliyor
(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(setq c-default-style "linux"
          c-basic-offset 4)


(require 'linum)
(global-linum-mode t)
;; use customized linum-format: add a addition space after the line number                                                                      
(setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))
(set-face-foreground 'linum "white")



;; auto-complete-mode'u baslangicta calistiriyor
;;(global-auto-complete-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-complete-c-headers yasnippet auto-complete xclip tramp-theme python-mode python-info helm-themes helm-pydoc helm-gitignore helm-git helm-emmet helm-directory helm-dictionary helm-ag-r helm-ag helm-addressbook helm-ad helm-ack ahungry-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
