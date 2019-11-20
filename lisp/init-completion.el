;;; init-completion.el ---                           -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Kamil Wydrzycki

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

(use-package company
  :hook (after-init . global-company-mode)
  :init
  (setq company-global-modes
        '(not eshell-mode help-mode inferior-python-mode message-mode shell-mode))
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-require-match nil
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil))

(use-package compdef
  :demand t)

(use-package ivy
  :demand t
  :config
  (setq ivy-display-style 'fancy
        ivy-format-functions-alist '((t . ivy-format-function-line))
        ivy-initial-inputs-alist nil
        ivy-use-selectable-prompt t
        ivy-use-virtual-buffers t
        ivy-virtual-abbreviate 'full
        ivy-wrap t)

  (use-package ivy-prescient
    :demand t
    :after ivy
    :config
    (setq ivy-prescient-retain-classic-highlighting t)
    (ivy-prescient-mode))
  
  (ivy-mode)

  (with-eval-after-load 'hydra
    (use-package ivy-hydra)))

(use-package ivy-posframe
  :demand t
  :config
  (setq ivy-posframe-border-width 8
        ivy-posframe-display-functions-alist
        '((counsel-M-x . ivy-posframe-display-at-frame-top-center))
        ivy-posframe-height-alist '((counsel-M-x . 20)))

  (ivy-posframe-mode))

(use-package hippie-expand
  :ensure nil
  :bind (("M-/" . hippie-expand)))

(use-package swiper)

(use-package counsel
  :bind
  (("C-x C-r" . #'counsel-recentf)
   ("M-x" . #'counsel-M-x)))

(use-package counsel-etags
  :config
  (setq counsel-etags-tags-program "ctags"))

(use-package yasnippet
  :hook (after-init . yas-global-mode)
  :bind (("C-c y n" . 'yas-new-snippet)
         ("C-c y i" . 'yas-insert-snippet)
         ("C-c y v" . 'yas-visit-snippet-file)
         ("C-c y r" . 'yas-reload-all)
         ("C-c y c" . 'aya-create)
         ("C-c y e" . 'aya-expand))
  :config
  (use-package yasnippet-snippets)

  (use-package auto-yasnippet))

(provide 'init-completion)
;;; init-completion.el ends here
