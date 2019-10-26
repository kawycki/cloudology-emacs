;;; init-markdown.el ---                             -*- lexical-binding: t; -*-

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

(when (executable-find "pandoc")
  (use-package markdown-mode
    :init
    (setq markdown-command "pandoc --from=markdown --to=html --standalone --highlight-style=pygments"
          markdown-enable-math t
          markdown-enable-wiki-links t
          markdown-italic-underscore t
          markdown-asymmetric-header t
          markdown-fontify-code-blocks-natively t
          markdown-gfm-uppercase-checkbox t
          markdown-make-gfm-checkboxes-buttons t

          markdown-content-type "application/xhtml+xml"
          markdown-css-paths
          '("https://cdn.jsdelivr.net/npm/github-markdown-css/github-markdown.min.css"
            "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/styles/github.min.css")
          markdown-xhtml-header-content
                  (concat "<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>"
                "<style> body { box-sizing: border-box; max-width: 740px; width: 100%; margin: 40px auto; padding: 0 10px; } </style>"
                "<script src='https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/highlight.min.js'></script>"
                "<script>document.addEventListener('DOMContentLoaded', () => { document.body.classList.add('markdown-body'); document.querySelectorAll('pre[lang] > code').forEach((code) => { code.classList.add(code.parentElement.lang); hljs.highlightBlock(code); }); }); </script>")))

  (use-package pandoc-mode
    :after markdown-mode
    :hook (markdown-mode . pandoc-mode)))

(provide 'init-markdown)
;;; init-markdown.el ends here
