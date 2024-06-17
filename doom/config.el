;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; (after! org
  ;; Set up directories and files
(setq org-directory "~/org/")
(setq org-gtd-update-ack "2.1.0")
(setq org-log-done 'time)
;; Define capture templates
;; Set up custom agenda views
(use-package! org-timeline
:after org-agenda
:config
(setq org-timeline-show-clocked-in t)
(add-hook 'org-agenda-mode-hook #'org-timeline-insert-timeline))

(setq org-agenda-prefix-format '((agenda . "  %-25:c%?-12t% s")
			 (timeline . "  % s")
				 (todo . "  %-12:c")
				 (tags . "  %-25:c")
				 (search . "  %-12:c")))

(setq org-agenda-tags-column -120)
(setq org-tags-column -80)

(setq org-agenda-sorting-strategy
      '((agenda habit-down time-up priority-down category-keep)
        (todo priority-down todo-state-up category-keep)
        (tags priority-down todo-state-up category-keep)
        (search category-keep)))

(define-key global-map "\C-cc" 'org-capture)

(after! org
  (setq org-roam-directory "~/org/notes"
        org-roam-graph-viewer "/usr/bin/brave"))

(map! :leader
      (:prefix ("n r" . "org-roam")
       :desc "Completion at point" "c" #'completion-at-point
       :desc "Find node"           "f" #'org-roam-node-find
       :desc "Show graph"          "g" #'org-roam-graph
       :desc "Insert node"         "i" #'org-roam-node-insert
       :desc "Capture to node"     "n" #'org-roam-capture
       :desc "Toggle roam buffer"  "r" #'org-roam-buffer-toggle))

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

(after! php
  (setq phpunit-default-program "./vendor/bin/pest"))

;; switch-window
(use-package! switch-window
        :config (setq switch-window-shortcut-style 'qwerty)
        :bind ("M-<tab>" . switch-window)
  )
(use-package org-journal
  :ensure t
  :defer t
  :init
  :config
  (setq org-journal-dir "~/org/journal/"
        org-journal-date-format "%A, %d %B %Y"))

(map! :leader
      (:prefix ("j" . "journal")
       :desc "New journal entry" "j" #'org-journal-new-entry))

(defun add-commit (commit-message)
  (interactive "sCommit message: ")
  (magit-stage-modified)
  (magit-commit-create `("-m" ,commit-message)))

(defun add-commit-push (commit-message)
  (interactive "sCommit message: ")
  (magit-stage-modified)
  (magit-commit-create `("-m" ,commit-message))
  (magit-run-git "push" "--set-upstream" "origin" (magit-get-current-branch)))


(map! :leader
        (:prefix ("g" . "git")
         :desc "Add and commit" "aC" #'add-commit)
      )

(map! :leader
      (:prefix ("g" . "git")
       :desc "Add, commit and push" "acp" #'add-commit-push))

;; bind the gpt-el functions to a better keybinding
(map! :leader
      (:desc "GPT-4" "r" #'gptel))

(defun hey (message)
  (interactive "sEnter your message: ")
  (let ((command (concat "~/scripts/hey \"" message "\"")))
    (async-shell-command command "*hey*")))

;; global set key for hey to be <leader> k
(map! :leader
      (:desc "Hey" "k" #'hey))

(defun run-new-post-script-and-open (title)
  "Run the new-post.js script with TITLE as argument and open the created file."
  (interactive "sPost title: ")
  (let ((script-path "~/workspace/superior-satellite/new-post.js")
        (default-directory "~/workspace/superior-satellite"))
    (let* ((command (format "node %s \"%s\"" script-path title))
           (output (shell-command-to-string command))
           (file-path (capture-file-path-from-output output)))
      (if (and file-path (file-exists-p file-path))
          (find-file file-path)
        (message "Failed to create or find the new blog post file.")))))

(defun capture-file-path-from-output (output)
  "Extract the file path from the script's OUTPUT."
  (when (string-match "Created file: \\(.*\\)" output)
    (match-string 1 output)))

(map! :leader
      :desc "Create new blog post using script and open"
      "n p" #'run-new-post-script-and-open)


(use-package! auth-source-pass
        :config
        (auth-source-pass-enable))

(map! :leader
      (:prefix ("e". "evaluate/erc/eww")
       :desc "launch erc with tls connection" "e" #'erc-tls))


(setq erc-prompt (lambda () (concat "[" (buffer-name) "]"))
      erc-server "irc.libera.chat"
      erc-nick "kodizen"
      erc-track-shorten-start 24
      erc-autojoin-channels-alist '(("irc.libera.chat" "#archlinux" "#linux" "#emacs"))
      erc-kill-buffer-on-part t
      erc-fill-column 100
      erc-fill-function 'erc-fill-static
      erc-fill-static-center 20
      ;; erc-auto-query 'bury
      )

(map! :leader
      (:prefix ("e". "evaluate/erc/eww")
       :desc "evaluate elisp in buffer"  "b" #'eval-buffer
       :desc "evaluate defun"            "d" #'eval-defun
       :desc "evaluate elisp expression" "e" #'eval-expression
       :desc "evaluate last sexpression" "l" #'eval-last-sexp
       :desc "evaluate elisp in region"  "r" #'eval-region))

;; define prompt function explicitly so it can be debugged.
(defun my-erc-prompt ()
  (concat "[" (buffer-name) "]"))

(setq erc-prompt 'my-erc-prompt) ; use the new prompt function
(map! :leader
      (:prefix ("e". "evaluate/ERC/EWW")
       :desc "Launch ERC with TLS connection" "E" #'erc-tls))

(map! :leader
      (:prefix ("e". "evaluate/ERC/EWW")
       :desc "Evaluate elisp in buffer"  "b" #'eval-buffer
       :desc "Evaluate defun"            "d" #'eval-defun
       :desc "Evaluate elisp expression" "e" #'eval-expression
       :desc "Evaluate last sexpression" "l" #'eval-last-sexp
       :desc "Evaluate elisp in region"  "r" #'eval-region))

(setq browse-url-browser-function 'eww-browse-url)
(map! :leader
      :desc "Search web for text between BEG/END"
      "s w" #'eww-search-words
      (:prefix ("e" . "evaluate/ERC/EWW")
       :desc "Eww web browser" "w" #'eww
       :desc "Eww reload page" "R" #'eww-reload))
;; WEB MODE
(use-package web-mode
  :ensure t)

;; ASTRO
(define-derived-mode astro-mode web-mode "astro")
(setq auto-mode-alist
      (append '((".*\\.astro\\'" . astro-mode))
              auto-mode-alist))

;; EGLOT
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs
               '(astro-mode . ("astro-ls" "--stdio"
                               :initializationOptions
                               (:typescript (:tsdk "./node_modules/typescript/lib")))))
  :init
  ;; auto start eglot for astro-mode
  (add-hook 'astro-mode-hook 'eglot-ensure))

(use-package! org-gtd
  :after org
  :config
  (setq org-gtd-directory "~/org/gtd/")
  (setq org-edna-use-inheritance t)
  (setq org-gtd-areas-of-focus '("Personal" "Work" "Health" "Finance" "Relationships" "Spiritual" "Learning" "Family" "BJJ" "Fun"))
  (org-edna-mode)
  (map! :leader
        (:prefix ("d" . "org-gtd")
         :desc "Capture"        "c"  #'org-gtd-capture
         :desc "Engage"         "e"  #'org-gtd-engage
         :desc "Process inbox"  "p"  #'org-gtd-process-inbox
         :desc "Show all next"  "n"  #'org-gtd-show-all-next
         :desc "Stuck projects" "s"  #'org-gtd-review-stuck-projects)

        )
  (map! :map org-gtd-clarify-map
        :desc "Organize this item" "C-c c" #'org-gtd-organize))

(use-package! gptel
        :config
        (setq gptel-model "gpt-4o")
  )

;; weekly review stuff
(require 'find-lisp)

(defun week-number ()
  "Return the current week number."
  (format-time-string "%V"))

(defun create-or-open-weekly-review ()
  "Create or open the weekly review file."
  (interactive)
  (let* ((week (week-number))
         (file (expand-file-name (format "week-%s.org" week) "~/org/reviews/weekly/")))
    (unless (file-exists-p file)
      (with-temp-buffer
        (insert (format "* Weekly Review - Week %s\n** Achievements\n- \n\n** Challenges\n- \n\n** Goals for Next Week\n- \n** Completed Items\n" week))
        (write-file file)))
    (find-file file)
    (goto-char (point-max))
    (insert-completed-items)))

(defun current-week-date-range ()
  "Return the start and end date of the current week in `YYYY-MM-DD` format."
  (let* ((now (current-time))
         (start-of-week (org-read-date nil nil "-mon"))
         (end-of-week (org-read-date nil nil "-sun")))
    (list start-of-week end-of-week)))

(defun org-agenda-get-completed-items ()
  "Retrieve items marked as DONE in the current week."
  (let* ((org-agenda-files (org-agenda-files))
         (range (current-week-date-range))
         (start-date (car range))
         (end-date (cadr range))
         (query (format "CLOSED>=\"%s\"<=\"%s\"" start-date end-date))
         (completed-items '()))
    (dolist (file org-agenda-files)
      (with-current-buffer (find-file-noselect file)
        (org-mode)
        (message "Scanning file: %s with query: %s" file query) ;; Debug information
        (org-map-entries
         (lambda ()
           (let ((item (format "- %s\n" (org-get-heading t t t t))))
             (push item completed-items)
             (message "Found item: %s" item))) ;; Debug information
         query 'agenda)))
    completed-items))

(defun insert-completed-items ()
  "Insert completed items at the end of buffer."
  (let ((completed-items (org-agenda-get-completed-items)))
    (when completed-items
      (goto-char (point-max))
      (dolist (item completed-items)
        (insert item)))))

(global-set-key (kbd "C-c r") 'create-or-open-weekly-review)

(evil-define-key 'normal elfeed-show-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)
(evil-define-key 'normal elfeed-search-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)
(setq elfeed-feeds (quote
                    (("https://www.reddit.com/r/linux.rss" reddit linux)
                     ("https://www.reddit.com/r/commandline.rss" reddit commandline)
                     ("https://www.reddit.com/r/distrotube.rss" reddit distrotube)
                     ("https://www.reddit.com/r/emacs.rss" reddit emacs)
                     ("https://www.gamingonlinux.com/article_rss.php" gaming linux)
                     ("https://hackaday.com/blog/feed/" hackaday linux)
                     ("https://opensource.com/feed" opensource linux)
                     ("https://linux.softpedia.com/backend.xml" softpedia linux)
                     ("https://itsfoss.com/feed/" itsfoss linux)
                     ("https://www.zdnet.com/topic/linux/rss.xml" zdnet linux)
                     ("https://www.phoronix.com/rss.php" phoronix linux)
                     ("http://feeds.feedburner.com/d0od" omgubuntu linux)
                     ("https://www.computerworld.com/index.rss" computerworld linux)
                     ("https://www.networkworld.com/category/linux/index.rss" networkworld linux)
                     ("https://www.techrepublic.com/rssfeeds/topic/open-source/" techrepublic linux)
                     ("https://betanews.com/feed" betanews linux)
                     ("http://lxer.com/module/newswire/headlines.rss" lxer linux))))
