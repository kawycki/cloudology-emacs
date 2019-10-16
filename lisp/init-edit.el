;;; init-edit.el ---                                 -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Kamil Wydrzycki

;; Author: Kamil Wydrzycki <kamwyd@gmail.com>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(use-package avy
  :commands avy-go-to-char-2 avy-goto-char-timer
  :bind (("C-c C-c" . 'avy-goto-char-timer))
  :config
  (setq avy-all-windows nil
        avy-background t
        avy-style 'at-full
        avy-timeout-seconds 0.8))

(use-package smartparens
  :hook (after-init . smartparens-global-mode)
  :bind (("<M-right>" . sp-forward-sexp)
         ("<M-left>" . sp-backward-sexp))
  :init
  (setq sp-highlight-pair-overlay nil
        sp-highlight-wrap-overlay nil
        sp-highlight-wrap-tag-overlay nil)
  :config
  (require 'smartparens-config)

  (defun smartparens-pair-newline (id action context)
    (save-excursion
      (newline)
      (indent-according-to-mode)))
  
  (defun smartparens-pair-newline-and-indent (id action context)
    (smartparens-pair-newline id action context)
    (indent-according-to-mode))

  (sp-pair "{" nil :post-handlers
           '(:add (smartparens-pair-newline-and-indent "RET")))
  (sp-pair "[" nil :post-handlers
           '(:add (smartparens-pair-newline-and-indent "RET"))))

(provide 'init-edit)
;;; init-edit.el ends here
