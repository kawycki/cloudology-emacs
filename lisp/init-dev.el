;;; init-dev.el ---                                  -*- lexical-binding: t; -*-

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

(use-package docker-tramp)

(use-package docker
  :config
  (setq docker-container-shell-file-name "cmdproxy.exe")

  (defun cloudology/docker-utils-shell-command-to-string (command)
  "Execute shell command COMMAND and return its output as a string.
Wrapper around function `shell-command-to-string'."
  (let ((shell-file-name docker-container-shell-file-name))
    (shell-command-to-string command)))

  (fset 'docker-utils-shell-command-to-string 'cloudology/docker-utils-shell-command-to-string))

(require 'docker)

(provide 'init-dev)
;;; init-dev.el ends here
