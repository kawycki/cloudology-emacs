;;; init-utils.el ---                                -*- lexical-binding: t; -*-

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

(use-package esup)

(use-package transient)

(use-package wgrep)

(when (executable-find "rg")
  (use-package rg))

(use-package try)

(use-package which-key
  :demand t
  :hook (after-init . which-key-mode)
  :init
  (setq which-key-sort-order 'which-key-prefix-then-key-order-reverse
        which-key-add-column-padding 3)
  :config
  (set-face-attribute 'which-key-command-description-face nil :weight 'bold))

(provide 'init-utils)
;;; init-utils.el ends here
