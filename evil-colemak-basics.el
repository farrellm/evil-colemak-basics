;;; evil-colemak-basics.el --- Basic Colemak key bindings for evil-mode

;; Author: Wouter Bolsterlee <wouter@bolsterl.ee>
;; Version: 2.0.0
;; Package-Requires: ((emacs "24") (evil "1.2.12") (evil-snipe "2.0.3"))
;; Keywords: colemak evil
;; URL: https://github.com/wbolster/evil-colemak-basics
;;
;; This file is not part of GNU Emacs.

;;; License:

;; Licensed under the same terms as Emacs.

;;; Commentary:

;; This package provides basic key rebindings for evil-mode with the
;; Colemak keyboard layout.  See the README for more information.
;;
;; To enable globally, use:
;;
;;   (global-evil-colemak-basics-mode)
;;
;; To enable for just a single buffer, use:
;;
;;   (evil-colemak-basics-mode)

;;; Code:

(require 'evil)
(require 'evil-snipe)

(defgroup evil-colemak-basics nil
  "Basic key rebindings for evil-mode with the Colemak keyboard layout."
  :prefix "evil-colemak-basics-"
  :group 'evil)

(defcustom evil-colemak-basics-rotate-t-f-j t
  "Whether to keep find-char and end of word jumps at their qwerty position.

When non-nil, this will rotate the t, f, and j keys, so that f
jumps to the end of the word (qwerty e, same position), t jumps to a
char (qwerty f, same position), and j jumps until a char (qwerty t,
different position)."
  :group 'evil-colemak-basics
  :type 'boolean)

(defcustom evil-colemak-basics-char-jump-commands nil
  "The set of commands to use for jumping to characters.

By default, the built-in evil commands evil-find-char (and
variations) are used; when set to the symbol 'evil-snipe, this
behaves like evil-snipe-override-mode, but adapted to the right
keys.

This setting is only used when the character jump commands are
rotated; see evil-colemak-basics-rotate-t-f-j."
  :group 'evil-colemak-basics
  :type '(choice (const :tag "default" nil)
                 (const :tag "evil-snipe" evil-snipe)))

(defun evil-colemak-basics--make-keymap ()
  "Initialise the keymap baset on the current configuration."
  (let ((keymap (make-sparse-keymap)))
    (evil-define-key '(motion normal visual) keymap
      "n" 'evil-next-line
      "gn" 'evil-next-visual-line
      "gN" 'evil-next-visual-line
      "e" 'evil-previous-line
      "ge" 'evil-previous-visual-line
      "E" 'evil-lookup
      "i" 'evil-forward-char

      "l" 'evil-backward-word-begin
      "L" 'evil-backward-WORD-begin
      "y" 'evil-forward-word-begin
      "Y" 'evil-forward-WORD-begin
      "u" 'evil-forward-word-end
      "U" 'evil-forward-WORD-end

      "k" 'evil-search-next
      "K" 'evil-search-previous

      ;; "gk" 'evil-next-match
      ;; "gK" 'evil-previous-match
      ;; "zi" 'evil-scroll-column-right
      ;; "zI" 'evil-scroll-right
      )

    (evil-define-key '(normal visual) keymap
      "a" 'evil-visual-char
      "A" 'evil-visual-line

      "z" 'undo-tree-undo
      "Z" 'undo-tree-redo
      "X" 'evil-delete-line
      "c" 'evil-yank
      "C" 'evil-yank-line
      "v" 'evil-paste-after
      "V" 'evil-paste-before
      "gv" 'evil-paste-after
      "gV" 'evil-paste-before

      "jz" 'evil-scroll-line-to-center
      "jj" 'evil-scroll-line-to-center)

    (evil-define-key 'normal keymap
      "s" 'evil-insert
      "S" 'evil-insert-line
      "t" 'evil-append
      "T" 'evil-append-line
      "w" 'evil-change
      "W" 'evil-change-line)

    (evil-define-key '(visual operator) keymap
      "r" evil-inner-text-objects-map)

    (evil-define-key '(normal visual operator) keymap
      "p" 'evil-find-char-to
      "P" 'evil-find-char
      "b" 'evil-repeat-find-char
      "B" 'evil-repeat-find-char-reverse)

    keymap))

(defvar evil-colemak-basics-keymap
  (evil-colemak-basics--make-keymap)
  "Keymap for evil-colemak-basics-mode.")

(defun evil-colemak-basics--refresh-keymap ()
  "Refresh the keymap using the current configuration."
  (setq evil-colemak-basics-keymap (evil-colemak-basics--make-keymap)))

;;;###autoload
(define-minor-mode evil-colemak-basics-mode
  "Minor mode with evil-mode enhancements for the Colemak keyboard layout."
  :keymap evil-colemak-basics-keymap
  :lighter " hnei")

;;;###autoload
(define-globalized-minor-mode global-evil-colemak-basics-mode
  evil-colemak-basics-mode
  (lambda () (evil-colemak-basics-mode t))
  "Global minor mode with evil-mode enhancements for the Colemak keyboard layout.")

(provide 'evil-colemak-basics)

;;; evil-colemak-basics.el ends here
