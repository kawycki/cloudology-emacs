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
  (setq ivy-use-virtual-buffers t)
  
  (use-package ivy-prescient
    :demand t
    :after ivy
    :config
    (setq ivy-prescient-retain-classic-highlighting t)
    (ivy-prescient-mode))
  
  (ivy-mode)

  (eval-after-load 'hydra
    (use-package ivy-hydra
      :bind (:map ivy-minibuffer-map
                  ("M-o" . ivy-dispatching-done-hydra)))))

(use-package hippie-expand
  :ensure nil
  :bind (("M-/" . hippie-expand)))

(use-package swiper)

(use-package counsel
  :bind
  (("C-x C-r" . #'counsel-recentf)))

(provide 'init-completion)
;;; init-completion.el ends here
