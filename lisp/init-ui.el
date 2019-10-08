;;; init-ui.el ---                               -*- lexical-binding: t; -*-

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

(setq inhibit-startup-screen t
      use-dialog-box nil
      use-file-dialog nil)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tooltip-mode 0)
(blink-cursor-mode 0)

;; Favor horizontal splits over vertical ones
(setq split-width-threshold nil
      split-height-threshold 160)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-whell-progressive-speed nil
      scroll-step 1
      scroll-margin 0
      scroll-conservatively 1000)

(use-package display-line-numbers
  :ensure nil
  :hook (prog-mode . display-line-numbers-mode))

(use-package doom-themes
  :config
  (doom-themes-visual-bell-config))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-project-root t
        doom-modeline-buffer-file-name-style 'truncate-upto-project
        doom-modeline-minor-modes t))

(load-theme 'doom-vibrant t)

(use-package page-break-lines
  :hook ((prog-mode . page-break-lines-mode)))

(provide 'init-ui)
;;; init-ui.el ends here
