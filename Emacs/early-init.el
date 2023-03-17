;; Load configuration
(let ((org-file "~/Workspaces/Personal/dotfiles/Emacs/Emacs.org")
      (init-file "~/Workspaces/Personal/dotfiles/Emacs/init.el"))
  (cond
   ;; Load init.el if it exists
   ((file-exists-p init-file)
    (load-file init-file))

   ;; Otherwise, load and tangle Emacs.org
   ((file-exists-p org-file)
    ;; Load necessary packages
    (require 'package)
    (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
    (package-initialize)
    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))
    ;; load org and tangle file
    (require 'org)
    (org-babel-tangle-file org-file)
    (load-file init-file))))
