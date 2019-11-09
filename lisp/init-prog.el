;;; init-prog.el ---                                 -*- lexical-binding: t; -*-

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

(use-package flycheck
  :hook (after-init . global-flycheck-mode)
  :config
  (setq flycheck-indication-mode 'left-fringe
        flycheck-emacs-lisp-load-path 'inherit
        flycheck-check-syntax-automatically '(save idle-change mode-enabled)))

(use-package flycheck-posframe
  :hook (flycheck-mode . flycheck-posframe-mode)
  :config
  (setq flycheck-posframe-border-width 8
        flycheck-posframe-position 'window-bottom-right-corner)

  (set-face-attribute 'flycheck-posframe-warning-face nil :inherit 'warning)
  (set-face-attribute 'flycheck-posframe-error-face nil :inherit 'error))

(use-package lsp-mode
  :config
  (use-package lsp-clients
    :ensure nil)

  (setq lsp-auto-guess-root nil
        lsp-prefer-flymake nil
        lsp-keep-workspace-alive nil)

  (use-package lsp-ui
    :init (setq lsp-ui-doc-enable t
                lsp-ui-doc-use-webkit nil
                lsp-ui-doc-delay 0.5
                lsp-ui-doc-include-signature t
                lsp-ui-doc-position 'top
                lsp-ui-doc-border (face-foreground 'default)

                lsp-ui-sideline-enable t
                lsp-ui-sideline-show-hover nil
                lsp-ui-sideline-ignore-duplicate t))

  (use-package company-lsp
    :init
    (setq company-lsp-cache-candidates 'auto)))

(use-package dap-mode
  :hook (((go-mode js-mode js2-mode python-mode) . dap-mode)
         (dap-mode . dap-ui-mode)
         (dap-session-created . (lambda (&_rest) (dap-hydra)))
         (dap-terminated . (lambda (&_rest) (dap-hydra/nil)))

         (python-mode . (lambda () (require 'dap-python)))
         (go-mode . (lambda () (require 'dap-go)))
         ((js-mode js2-mode) . (lambda () (require 'dap-chrome)))))

(use-package json-mode)

(use-package yaml-mode)

(provide 'init-prog)
;;; init-prog.el ends here
