;; -*- coding: utf-8 -*-
;; File: clean-appearance-setting.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-08-05 11:10:00>
;;
;; --8<-------------------------- separator ------------------------>8--
(set-face-background 'modeline "#5f9ea0") ;; set color of modeline
(set-face-attribute 'mode-line nil :height 100)
(defun toggle-mode-line ()
  "toggles the modeline on and off"
  (interactive)
  (let ((normal-height 100) (minimum-height 1))
    (if (= normal-height (face-attribute 'mode-line :height))
        (set-face-attribute 'mode-line nil :height minimum-height)
      (set-face-attribute 'mode-line nil :height normal-height))))
(global-set-key [M-f12] 'toggle-mode-line)
;; --8<-------------------------- separator ------------------------>8--
;; when cursor and mouse is close, automatically move mouse away
(mouse-avoidance-mode 'animate)
(setq mouse-avoidance-threshold 10)
;; enable mouse wheel support
(mouse-wheel-mode 1)
;; --8<-------------------------- separator ------------------------>8--
(defun emacs-clean ()
  ;; let's have a clean world
  (interactive)
  (set-scroll-bar-mode 'right) ;;scroll bar
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;; Hide toolbar
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) ;;Hide menubar
  (setq inhibit-startup-message t
        ;; prevent showing initial information in draft buffer
        initial-scratch-message nil
        visible-bell t ;;no bell when error
        initial-scratch-message
        (purecopy "\
;; In sandbox
"))
  (set-frame-parameter nil 'scroll-bar-width 10)
  )
(emacs-clean)
;; --8<-------------------------- separator ------------------------>8--
(global-set-key (kbd "<C-f10>") 'toggle-transparency)
(set-frame-parameter (selected-frame) 'alpha '(97 97))
(defun toggle-transparency ()
  (interactive)
  (let* ((transparency-list '(10 97))
         (transparency (cadr (find 'alpha (frame-parameters nil) :key #'car)))
         (transparency-count (length transparency-list))
         (pos (position transparency transparency-list :test #'equal))
         (next-pos (mod (+ pos 1) transparency-count))
         (transparency-new (nth next-pos transparency-list)))
    (set-frame-parameter nil 'alpha (cons transparency-new transparency-new))
    ))
;; --8<-------------------------- separator ------------------------>8--
(setq initial-buffer-choice (concat DENNY_CONF "/org_data/org_share/question.org"))
;; --8<-------------------------- separator ------------------------>8--
(defun add-custom-global-font-locking ()
  "Hilight some keywords globally."
  (interactive)
  (unless (member mode-name '("Org"))
    (font-lock-add-keywords
     nil
     '(("\\<\\(FIXME\\)" 0 font-lock-warning-face t)
       ("\\<\\(fixme\\)" 0 font-lock-warning-face t)
       ("\\<\\(TODO\\)" 0 font-lock-warning-face t)
       ("\\<\\(todo\\)" 0 font-lock-warning-face t)
       ("\\<\\(Todo\\)" 0 font-lock-warning-face t)))
    (font-lock-mode 1)))
(add-hook 'find-file-hook 'add-custom-global-font-locking)
;; --8<-------------------------- separator ------------------------>8--
(defvar message-filter-regexp-list
  '("^Starting new Ispell process \\[.+\\] \\.\\.\\.$"
    "^Ispell process killed$")
  "filter formatted message string to remove noisy messages")
;; --8<-------------------------- separator ------------------------>8--
(load-file (concat EMACS_VENDOR "/hide-comnt/hide-comnt.el"))
(require 'newcomment nil t)
(require 'hide-comnt)
(global-set-key [(meta p)(t)] 'hide/show-comments-toggle)
;; --8<-------------------------- separator ------------------------>8--
(defun toggle-outline()
  (interactive)
  (if (null selective-display)
      (set-selective-display 6)
    (set-selective-display nil)))
(global-set-key [(meta p)(o)] 'toggle-outline)
;; --8<-------------------------- separator ------------------------>8--
;; (defun compile-face-settings ()
;;   "Face settings for `compile'."
;;   (custom-set-faces '(compilation-info
;;                       ((((type tty)) :bold t :foreground "green")
;;                        (t :foreground "green"))))
;;   (setq compilation-message-face nil)
;;   (custom-set-faces '(compilation-warning
;;                       ((((class color)) :foreground "red" :bold nil))))
;;   (custom-set-faces '(compilation-info
;;                       ((((type tty pc)) :foreground "magenta") (t (:foreground "magenta")))))
;;   (setq compilation-enter-directory-face 'beautiful-blue-face)
;;   (setq compilation-leave-directory-face 'magenta-face))

;; (eval-after-load "compile" `(compile-face-settings))
;; --8<-------------------------- separator ------------------------>8--
;; File: clean-appearance-setting.el ends here
