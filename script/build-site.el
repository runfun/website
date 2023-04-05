;;; site-build.el---Build Website -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 Runfun
;;
;; Author: Runfun <runfunwolf@gmail.com>
;; Maintainer: Runfun <runfunwolf@gmail.com>
;; Created: March 10, 2023
;; Modified: March 10, 2023
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/runfun/site-build
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

;; Load the publishing system
(require 'ox-publish)
;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
;; (require 'package)

;; Initialize the package system
(package-initialize)
  (unless package-archive-contents
   (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

(require 'org)

;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; (setq org-id-extra-files (org-roam-list-files))

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "my-org-site"
             :recursive t
             :base-directory "~/org/content"
             :publishing-directory "~/org/public"
             :publishing-function 'org-html-publish-to-html
             :with-author t
             :with-creator t
             :with-top t
             :section-numbers nil
             :time-stamp-file t)))

;; Generate the site output
(org-publish-all t)

;; End building
(message "Build Complete!")

(provide 'site-build)
;;; site-build.el ends here

















