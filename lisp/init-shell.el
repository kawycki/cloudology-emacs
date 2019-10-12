;;; init-shell.el ---                                -*- lexical-binding: t; -*-

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

(use-package eshell
  :ensure nil
  :commands eshell/alias
  :hook (eshell-mode . (lambda ()
                         (eshell/alias "f" "find-file $1")
                         (eshell/alias "d" "dired $1")
                         (eshell/alias "ll" "ls -l")
                         (eshell/alias "la" "ls -al")))
  :config
  (setq eshell-scroll-to-bottom-on-input 'all
        eshell-scroll-to-bottom-on-output 'all))

(use-package eshell-toggle
  :commands ehsell-toggle
  :bind (("C-'" . eshell-toggle))
  :config
  (setq eshell-modules-list (remq 'eshell-banner eshell-modules-list)
        eshell-toggle-run-command nil
        eshell-toggle-size-fraction 2))

(use-package eshell-prompt-extras
  :commands epe-theme-lambda
  :defines eshell-highlight-prompt eshell-prompt-function
  :init
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

(provide 'init-shell)
;;; init-shell.el ends here
