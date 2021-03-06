;; -*- coding: utf-8 -*-
;; File: myemacs.el --- the entrance point for various emacs configuration files
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-08-31 23:14:09>
;;
;; --8<-------------------------- separator ------------------------>8--
(defconst EMACS_VENDOR "~/backup/essential/emacs_vendor/")
(defconst DENNY_CONF "~/backup/essential/Dropbox/private_data/emacs_stuff/")
(setq emacs-load-start-time (current-time))
(when (< emacs-major-version 22)
  (error "Configuration not supported on Emacs < 22."))

;; --8<-------------------------- separator ------------------------>8--
(add-to-list 'load-path (concat EMACS_VENDOR "/weibo/"))
(require 'weibo)

;; ;; --8<-------------------------- separator ------------------------>8--
(mapc '(lambda(emacs-file)
         (load-file
	  (expand-file-name emacs-file (concat DENNY_CONF "/emacs_conf"))))
      '("fundamental-setting.el"
        "clean-appearance-setting.el"
        "buffer-setting.el"
        "essentialpackage-setting.el"
        "dired-setting.el"
        "handyfunction-setting.el"
        "diff-setting.el"
        "regexp-setting.el"
        "magic-setting.el"
        "programming-setting.el"
        "facing-setting.el"
        ;;"flymake-setting.el"
        "calendar-setting.el"
        "largeessentialpackage-setting.el"
        "bbdb-setting.el"
        "org-setting.el"
        "gnus-setting.el"
        "ledger-setting.el"
        "online-search/online-search-setting.el"
        "web-setting.el"
        "insertion-setting.el"
        "set-os-environment-setting.el"
        "set-file-mode-setting.el"
        "comint-setting.el"
        "rectangle-setting.el"
        "emacs-aggregation/emacs-aggregation-setup.el"
        "capture-setting.el"
        "sns-setting.el"
        "otherpackage-setting.el"
        ))
(cond
 ((eq system-type 'gnu/linux)
  (mapc '(lambda(emacs-file)
         (load-file
	  (expand-file-name emacs-file (concat DENNY_CONF "/emacs_conf"))))
        '("linux-setting.el"
          "multimediea-setting.el"
          "shell-setting.el"
          "voice-setting.el"
          "interoperation-setting.el")))
 ((eq system-type 'windows-nt)
  (load-file (concat DENNY_CONF "/emacs_conf/windowsonly-setting.el")))
 ((eq system-type 'cygwin)
  (load-file (concat DENNY_CONF "/emacs_conf/cygwin-setting.el"))))
(mapc '(lambda(emacs-file)
         (load-file
	  (expand-file-name emacs-file (concat DENNY_CONF "/emacs_conf"))))
      '("postfundamental-setting.el"
        "passwd.el"
        "tmp.el"
        ))
;; --8<-------------------------- separator ------------------------>8--
(unless (server-running-p) (server-start))
;; calculate how long it takes for emacs start
(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: myemacs.el ends here
