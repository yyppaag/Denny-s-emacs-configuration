;; -*- coding: utf-8 -*-
;; File: online-search-setting.el --- search internet for online dictionary, api reference, or search local index
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2009-08-01
;; Updated: Time-stamp: <2011-09-11 14:34:56>
;;
;; --8<-------------------------- §separator§ ------------------------>8--
;;(setq browse-url-browser-function 'w3m-browse-url) ;; w3m
(setq browse-url-default-browser "/usr/bin/firefox") ;; firefox in M$ Windows
;; --8<-------------------------- §separator§ ------------------------>8--
(load-file (concat CONTRIBUTOR_CONF "/online-search/online-search.el"))
(global-set-key [(control c) (s)] 'online-search)
;; If current environment is windows, w3m may be probably not available.
;; In this case downgrade from w3m mode to plaintext mode.
(if (string-equal system-type "windows-nt")
    (setq is-plaintext-enable 't))
;; --8<-------------------------- §separator§ ------------------------>8--
;; search python document
(setq pylookup-dir (concat CONTRIBUTOR_CONF "/pylookup"))
(add-to-list 'load-path pylookup-dir)
;; load pylookup when compile time
(eval-when-compile (require 'pylookup))

;; set executable file and db file
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)
(autoload 'pylookup-update "pylookup"
  "Run pylookup-update and create the database at `pylookup-db-file'." t)
;; --8<-------------------------- §separator§ ------------------------>8--
;;search c/c++ document
(setq cclookup-dir (concat CONTRIBUTOR_CONF "/cclookup"))
(add-to-list 'load-path cclookup-dir)
;; load cclookup when compile time
(eval-when-compile (require 'cclookup))

;; set executable file and db file
(setq cclookup-program (concat cclookup-dir "/cclookup.py"))
(setq cclookup-db-file (concat cclookup-dir "/cclookup.db"))

;; to speedup, just load it on demand
(autoload 'cclookup-lookup "cclookup"
  "Lookup SEARCH-TERM in the C++ Reference indexes." t)
(autoload 'cclookup-update "cclookup"
  "Run cclookup-update and create the database at `cclookup-db-file'." t)
;; --8<-------------------------- §separator§ ------------------------>8--
;; File: online-search-setting.el ends here