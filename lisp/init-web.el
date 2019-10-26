;;; init-web.el ---                                  -*- lexical-binding: t; -*-

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

(use-package css-mode
  :ensure nil
  :init
  (setq css-indent-offset 2))

(use-package js2-mode
  :mode "\\.m?js\\'"
  :interpreter "node"
  :hook ((js2-mode . js2-imenu-extras-mode)
         (js2-mode . js2-highlight-unused-variables-mode)
         (js2-mode . lsp-deferred))
  :company company-dabbrev company-dabbrev-code
  :config
  (setq js-chain-indent t
        js2-skip-preprocessor-directives t
        js2-highlight-level 3
        js2-highlight-external-variables t)

  (add-to-list 'projectile-project-root-files "package.json")
  (add-to-list 'projectile-globally-ignored-directories "node_modules")

  (set-face-attribute 'js2-error nil :foreground nil :underline '(:color "red" :style line)))

(use-package typescript-mode
  :config
  (use-package tide
    :hook((typescript-mode . tide-setup))))

(use-package web-mode
  :mode "\\.\\(as[cp]x\\|html?\\|jade\\|tm?pl\\|vue\\)$"
  :company company-web-html company-web-jade company-web-slim
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2)

  (use-package company-web))

(provide 'init-web)
;;; init-web.el ends here
