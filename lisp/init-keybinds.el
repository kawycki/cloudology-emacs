;;; init-keybinds.el ---                             -*- lexical-binding: t; -*-

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

(use-package general)

(use-package ryo-modal)

(pretty-hydra-define main-window (:foreign-keys warn :quit-key "q")
  ("Search"
   (("s" (call-interactively 'rg-dwim-project-dir) "search in project" :exit t)
    ("t" (call-interactively 'counsel-etags-find-tag-at-point) "search by tags" :exit t)
    ("i" (call-interactively 'counsel-rg) "interactive search" :exit t))
   "Buffer"
   (("b" 'bury-buffer "hide buffer")
    ("l" 'buf-move-left "swap with left buffer")
    ("r" 'buf-move-right "swap with right buffer"))
   "UI"
   (("d" diff-hl-mode "change indicators" :toggle t)
    ("f" flycheck-mode "syntax checking" :toggle t)
    ("h" highlight-indent-guides-mode "highlight indentation" :toggle t)
    ("w" whitespace-mode "whitespace" :toggle t))
   "Window"
   (("z" zoom-mode "zoom mode" :toggle t))))

(general-define-key "<f5>" 'main-window/body)

(general-define-key "C-<tab>" 'hs-toggle-hiding)

(provide 'init-keybinds)
;;; init-keybinds.el ends here
