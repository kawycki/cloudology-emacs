;;; init-dotnet.el ---                               -*- lexical-binding: t; -*-

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

(use-package csharp-mode
  :hook ((csharp-mode . omnisharp-mode)
         (csharp-mode . dotnet-mode)
         (csharp-mode . (lambda ()
                          (c-set-style "ellemtel")
                          (setq c-syntactic-indentation t
                                c-basic-offset 4
                                tab-width 4))))
  :company company-omnisharp company-dabbrev-code
  :config
  (use-package dotnet)
  
  (use-package csproj-mode))
  
(use-package popup)

(use-package auto-complete)

(use-package omnisharp
  :config
  (setq omnisharp-auto-complete-want-documentation nil
        omnisharp-company-begin-after-member-access t
        omnisharp-company-match-type 'company-match-simple
        omnisharp-completing-read-function 'ivy-completing-read))

(provide 'init-dotnet)
;;; init-dotnet.el ends here
