;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     javascript
     sql
     php
     python
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     emacs-lisp
     ;; http://spacemacs.org/layers/+source-control/git/README.html 
     ;; - git repository management the indispensable magit package
     ;; - git-flow add-on for magit.
     ;; - quick in buffer history browsing with git-timemachine.
     ;; - quick in buffer last commit message per line with git-messenger
     ;; - colorize buffer line by age of commit with smeargle
     ;; - gitignore generator with helm-gitignore
     ;; - org integration with magit via orgit
     ;; Magit:
     ;;   SPC g s - show status
     ;;     TAB - open/close diff for file
     ;;     s / u - stage / unstage
     ;;     c - commit message, C-c C-c - commit
     ;;     g - refresh
     ;;     q - close
     ;;     ? - help
     git
     ;; Requires GNU global, see ~/.i3/install-gnu-global-cscope.sh
     ;; to create tags, CD into project dir and run-at-time
     ;;   gtags --gtagslabel=pygments
     ;; Keys:
     ;; SPC m g c	create a tag database
     ;; SPC m g f	jump to a file in tag database
     ;; SPC m g g	jump to a location based on context
     ;; SPC m g G	jump to a location based on context (open another window)
     ;; SPC m g d	find definitions
     ;; SPC m g i	present tags in current function only
     ;; SPC m g l	jump to definitions in file
     ;; SPC m g n	jump to next location in context stack
     ;; SPC m g p	jump to previous location in context stack
     ;; SPC m g r	find references
     ;; SPC m g R	resume previous helm-gtags session
     ;; SPC m g s	select any tag in a project retrieved by gtags
     ;; SPC m g S	show stack of visited locations
     ;; SPC m g u	manually update tag database
     gtags
     ;;
     ;; pycscope for python code: see ~/.i3/install-gnu-global-cscope.sh
     ;;  run SPC m g i to create the index
     ;; Keys
     ;; SPC m g c	find which functions are called by a function
     ;; SPC m g C	find where a function is called
     ;; SPC m g d	find global definition of a symbol
     ;; SPC m g e	search regular expression
     ;; SPC m g f	find a file
     ;; SPC m g F	find which files include a file
     ;; SPC m g i	create Cscope index
     ;; SPC m g r	find references of a symbol
     ;; SPC m g x	search text
     ;; cscope
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     vinegar
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages'()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages
   '(
     ;; See https://github.com/tarao/evil-plugins
     ;; provides C-R support for command-line mode-line
     ;; also additional text objects and operators
     ;; TODO: add more details
     (evil-plugins :location (recipe :fetcher github :repo "tarao/evil-plugins"))
     )
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     ;; this package emulates vim behavior to persist search highlight
     ;; results, we remove it here to automatically clear search highlight
     ;; when it is not needed (you stop navigating search results)
     ;; evil-search-highlight-persist
     )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
  This function is called at the very end of Spacemacs initialization after
  layers configuration.
  This is the place where most of your configurations should be done. Unless it is
  explicitly specified that a variable should be set before a package is loaded,
  you should place your code here."
  (setq-default evil-escape-key-sequence "jk")
                                        ;(setq-default evil-escape-key-sequence "kj")
  (define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
  (define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
  (define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
  (define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
  (define-key evil-visual-state-map (kbd "C-j") 'split-window-below-and-focus)
  (define-key evil-visual-state-map (kbd "C-k") 'split-window-vertically)
  (define-key evil-visual-state-map (kbd "C-l") 'split-window-right-and-focus)
  (define-key evil-visual-state-map (kbd "C-h") 'split-window-horizontally)
  ;; don't create .#filename lock files
  (setq create-lockfiles nil)
  ;; Show directories first in vinegar (dired)
  ;; BEWARE ! This option breaks ange-ftp!!! This option is not compatible with ‘ls’ on ftp.
  (setq dired-listing-switches "-lXGh --group-directories-first")

  ;; Persistent undo, see https://github.com/syl20bnr/spacemacs/issues/774
  ;; may cause some problems though
  ;; (setq undo-tree-auto-save-history t
  ;;       undo-tree-history-directory-alist
  ;;       `(("." . ,(concat spacemacs-cache-directory "undo"))))
  ;; (unless (file-exists-p (concat spacemacs-cache-directory "undo"))
  ;;   (make-directory (concat spacemacs-cache-directory "undo")))

  ;; Don't count underscore as word character.
  ;; For python
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;; For ruby
  (add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;; For Javascript
  (add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  ;; Enable aggresive indent
  ;; See http://emacsredux.com/blog/2016/02/07/auto-indent-your-code-with-aggressive-indent-mode/
  ;; and https://github.com/Malabarba/aggressive-indent-mode
  (global-aggressive-indent-mode 1)
  )

;; TODO / what doesn't work:
;; - something similar to dbext
;;   check SPC m ' in sql file - how to pre-configure connections?
;; - how to diff two buffers?
;; - how to search / replace in files (similar to CtrlSF / vim-swoop or at least quick fix
;;   editing as in vim-enmasse), is there something similar to ctrlsf?
;;   - check moccur
;;   - check https://www.emacswiki.org/emacs/SearchBuffers
;;   - check https://github.com/ShingoFukuyama/helm-swoop, it can swoop across multiple buffers
;;     although it usues separate list of results,
;;     SPC s C-s opens search and you can navigate the list with preview, but how to switch to the
;;     buffer at the top without closing the list? or how to do mass-replace with it?
;;   - check iedit mode
;;   - in general - wouldn't it be better to have ctrlsf-like UI for all the tasks that are
;;     covered by helm / vim unite / fzf / etc - instead of having a kind of a list which is
;;     hard to havigate and easy to close accidentally, we could just have a regular buffer
;;     with text + special keybindings
;;     another example of such UI is magit (and vim-magit)
;; - how to use help?
;;   there are some key-bindings to access help (see below), but I still fail to find
;;   the topics I am interested in, so just google for things
;; - check emacs as merge tool for git
;; - persistent undo history (to be able to undo or g; after you restart emacs)
;; - C-F in command line mode / search mode to show command buffer (same as shown with q: and q/)
;; - repeat indent in visual mode (< or >) with dot
;; - go to tag with C-] - gtags work, but the key is not binded, do I need to have ctags tags for
;;   that? or just re-bind the C-]?
;; - do I need gtags or cscope?
;; - check helm http://tuhdo.github.io/helm-intro.html
;;              http://tuhdo.github.io/helm-projectile.html
;; - what's the (practical) difference between helm and ivy?
;; - check org mode
;; - what are real benefits over vim?
;;   shell (VimShell in (n)vim works quite good, nvim's term still sucks - no editing, hard to use)
;;   additional modes are auto installed
;; - status line - how to display file path (now there is only a file name)
;; - interactive debugger (python, node, php)?
;; - check ibuffer: 
;;   - https://www.emacswiki.org/emacs/IbufferMode
;;   - http://martinowen.net/blog/2010/02/03/tips-for-emacs-ibuffer.html
;;   seems like this is a nice way to explore open buffers
;; - autosave files - should work according to the settings above
;;   (see auto-save), but I've noticed that sometimes files don't get saved automatically.
;; - http client, check http://spacemacs.org/layers/restclient/README.html
;; - snippets? check https://github.com/joaotavora/yasnippet
;; - check https://github.com/tarao/evil-plugins
;;   it is installed because it makes :C-R work, but there are more things than that.
;;
;;
;; DONE:
;; - C-R C-W in command mode to insert word under cursor (and other C-R stuff)
;;   solved with https://github.com/tarao/evil-plugins
;; - Navigation with w in undersored_word - jumped to underscore
;;   solved with add-hook for python mode (see above), but probably
;;   there should be the way to do that globally
;; - Show dirs first in vinegar (dired)
;;   solved by configuring dired-listing-switches
;; - how to :copen (show quickfix list) - for flycheck, SPC e l
;; - how to use tabs? - use layouts, like SPC l 2 to create or switch to 2nd tab
;;   there is also `evil-tabs` package which provides :tabnew, gt
;; - how to reload config? SPC f e R
;;
;; Usage
;; - Layouts (tabs)
;;   See develop branch docs -
;;      https://github.com/syl20bnr/spacemacs/blob/develop/doc/DOCUMENTATION.org#layouts-and-workspaces
;;   layout name is displayed in the status string, bottom left
;;   SPC l <num> - switch to layout <num> or create new layout (enter the name in this case)
;;   SPC l s - save the layout to the file
;;   SPC l L - load the layout
;;   SPC l - layouts transient state, ? to show the commands
;;
;;   There are also workspaces - tabs inside the tab:
;;   SPC l w 2 - create second workspace inside the current layout
;;   (workspace number is displayed near the layout number, bottom left:
;;    name | workspace | layout)
;;   SPC l w - workspace transient state
;;
;; - Select last pasted text: C-x C-x
;;
;; - Flycheck - SPC e l - open error list (check also other keys under SPC e)
;;
;; - Windows
;;   SPC w / - vert split, SPC w - - horizontal split-window-horizontally
;;   SPC w c - close window (same as :q)
;;   SPC b d - delete buffer without closing the split
;;   SPC w u - undo window operation (for example, restore splits after :only)
;;   SPC w . - window transient state (commands, related to windows)
;;   SPC w b - focus mini-buffer (useful to get back to Helm if you accidentally left it)
;;
;; - Wrap / no wrap - SPC t l (toogle line truncation)
;;
;; - Show/hide whitespace - SPC t w
;;
;; - Search for the file by name
;;   SPC f f - search from the current dir
;;   SPC f r - search in recent files
;;   SPC p f - search in a project
;;
;; - Search in files
;;   SPC s a [b,f,p] - search with ag in buffers, files, project
;;   SPC s s - swwop, search for word under cursor
;;             SPC s S - multi-swoop (?), SPC s C-s multi-swoop all
;;   SPC s j - display symbols in a buffer
;;
;; - shell / ansi-term / eshell
;;   See https://www.masteringemacs.org/article/running-shells-in-emacs-overview
;;
;; - Helm
;;   M-SPC while in helm (for example, after SPC f f) - helm transient state
;;
;; - Help
;;   SPC h d - help describe ... (function, variable, key, etc)
;;   SPC <F1> - search for help
;;   SPC ? - searchable list of keybindings
;;   SPC h SPC - list of layers (plugins), packages, toggles
;;   SPC h k - top-level bindings
;;   SPC h i - search in info pages
;;   SPC h m - search in man pages
;;
;;   Navigation key bindings in help-mode:
;;   g b or [	go back (same as clicking on [back] button)
;;   g f or ]	go forward (same as clicking on [forward] button)
;;   g h	go to help for symbol under point
;;   o - initiate ace link mode in help-mode and info-mode
;;
;; - Other
;;   SPC SPC - run Emacs command, also can run in command mode (:command-name)
;;   SPC s w g - search google, open browser
;;
;;   vim-surround - included
;;   unimpared bindinds included
;;   comment / uncomment with gc - works
;;
;; - Text manipulation (align, sort, count, move up/down, google translate, etc) - SPC x
;;
;; - Text insert (lorem-ipsum, UUID) - SPC i
;;
;; - Zoom - SPC z x - buffer, SPC z f - whole frame
;;
;; - Terminology
;;   mode = state (insert mode = evil-insert-state)
;;   transient state - temporary state with own keybindings (similar to i3 resize mode)
;;   minor-mode - additional feature activated in the major mode
;;   major-mode - editing behavior in the current buffer, usually depends on the file type
;;                like python-mode for python files
;;   layers - similar to vim plugins (layer can be composed of several packages)
;;
;; - Sometimes evil mode disappears, to exit emacs: C-x C-c (but try 'jk' first)
;;   Other Emacs keys:
;;     M-x - enter and execute command (like : mode in vim)
;;     C-g (that is Control and g at the same time) to cancel prompts.
;;     C-x k to kill (close) a buffer. Automatically opened windows are usually closeable with “q”.
;;     C-x o (that’s an “o” not a zero) to rotate between window
;;     C-x 2 to create an horizontal split (window)
;;     C-x 3 to create a vertical split
;;     M-x shows the “minibuffer” where you can call Emacs functions.
;;     C-y: yank/paste. The only way to paste on the modeline even when you’re using Evil.
;;
;; - Additional text objects are defined in Spacemacs:
;;   a	an argument
;;   g	the entire buffer
;;   $	text between $
;;   *	text between *
;;   8	text between /* and */
;;   %	text between %
;;   \vert	text between \vert
;;   ii, iI, iJ - indent object - inner indentation / above and indentation / above, below and indentation
;;
;; - Vimperator-like avy motions (use after operator)
;;   SPC j b	go back to the previous location (before the jump)
;;   SPC j j	initiate avy jump char
;;   SPC j w	initiate avy jump word
;;   SPC j l	initiate avy jump line
;;
;; - Jumping, splitting / joining
;;   SPC j ...
;;
;; - Expand region mode
;;   SPC v - semi-automatically select the object
;;
;; - Narrow region
;;   SPC n [f,p,r] - to function, visible page, selected text
;;   SPC n w - show the whole buffer again
;;
;; - iedit - edit multiple occurrences
;;     SPC s e	normal or visual -> iedit
;;     e	expand-region -> 	iedit
;;     ESC	iedit -> 	normal
;;     C-g	iedit -> 	normal
;;     fd	iedit -> 	normal
;;     ESC	iedit-insert -> 	iedit
;;     C-g	iedit-insert -> 	normal
;;     fd	iedit-insert -> 	normal
;;   --
;;   In iedit state
;;   iedit state inherits from normal state, the following key bindings are specific to iedit state.
;;     ESC	go back to normal state
;;     TAB	toggle current occurrence
;;     0	go to the beginning of the current occurrence
;;     $	go to the end of the current occurrence
;;     #	prefix all occurrences with an increasing number (SPC u to choose the starting number).
;;     A	go to the end of the current occurrence and switch to iedit-insert state
;;     D	delete the occurrences
;;     F	restrict the scope to the function
;;     gg	go to first occurrence
;;     G	go to last occurrence
;;     I	go to the beginning of the current occurrence and switch to iedit-insert state
;;     J	increase the editing scope by one line below
;;     K	increase the editing scope by one line above
;;     L	restrict the scope to the current line
;;     n	go to next occurrence
;;     N	go to previous occurrence
;;     p	replace occurrences with last yanked (copied) text
;;     S	(substitute) delete the occurrences and switch to iedit-insert state
;;     V	toggle visibility of lines with no occurrence
;;     U	Up-case the occurrences
;;     C-U	down-case the occurrences
;;     Note: 0, $, A and I have the default Vim behavior when used outside of an occurrence.
;;     In iedit-insert state
;;     Key Binding	Description
;;     ESC	go back to iedit state
;;     C-g	go back to normal state
;;   ... - also can replace in multiple files
;;
;;   Renaming files in a directory
;;     It is possible to batch rename files in a directory using wdired from an helm session:
;;     - browse for a directory using SPC f f
;;     - enter wdired with C-c C-e
;;     - edit the file names and use C-c C-c to confirm the changes
;;     - use C-c C-k to abort any changes
;;
;; - Helm
;;   F3 - save results to regular buffer
;;
;; - Set the variable
;;   (setq variable value) ; Syntax
;;   ;; Setting variables example
;;   (setq variable1 t ; True
;;         variable2 nil ; False
;;         variable3 '("A" "list" "of" "things"))
;;
;; - Define the keybinding
;;   NOTE: SPC o and SPC m o are reserved for user keybindings
;;   (define-key map new-keybinding function) ; Syntax
;;   ;; Map H to go to the previous buffer in normal mode
;;   (define-key evil-normal-state-map (kbd "H") 'previous-buffer)
;;   ;; Mapping keybinding to another keybinding
;;   (define-key evil-normal-state-map (kbd "H") (kbd "^")) ; H goes to beginning of the line
;;   To map <Leader> keybindings, use the spacemacs/set-leader-keys function.
;;
;;   (spacemacs/set-leader-keys key function) ; Syntax
;;   ;; Map killing a buffer to <Leader> b c
;;   (spacemacs/set-leader-keys "bc" 'spacemacs/kill-this-buffer)
;;   ;; Map opening a link to <Leader> o l only in org-mode (works for any major-mode)
;;   (spacemacs/set-leader-keys-for-major-mode 'org-mode
;;     "ol" 'org-open-at-point)
;;
;;   Function:
;;
;;   (defun func-name (arg1 arg2)
;;     "docstring"
;;     ;; Body
;;     )
;;
;;   Calling a function
;;   (func-name arg1 arg1)
;;
;;   Here is an example of a function that is useful in real life:
;;   ;; This snippet allows you to run clang-format before saving
;;   ;; given the current file as the correct filetype.
;;   ;; This relies on the c-c++ layer being enabled.
;;   (defun clang-format-for-filetype ()
;;     "Run clang-format if the current file has a file extensions
;;   in the filetypes list."
;;     (let ((filetypes '("c" "cpp")))
;;       (when (member (file-name-extension (buffer-file-name)) filetypes)
;;         (clang-format-buffer))))

;; See http://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html for
;; what this line means
;; (add-hook 'before-save-hook 'clang-format-for-filetype)
;;
;; Included plugins:
;;
;;   evil-args	motions and text objects for arguments
;;   evil-exchange	port of vim-exchange
;;   evil-indent-textobject	add text object based on indentation level
;;   evil-matchit	port of matchit.vim
;;   evil-nerd-commenter	port of nerdcommenter
;;   evil-numbers	like C-a and C-x in vim
;;   evil-search-highlight-persist	emulation of hlsearch behavior
;;   evil-surround	port of vim-surround
;;   evil-visualstar	search for current selection with *
;;   NeoTree	mimic NERD Tree
;;
;; Search for packages - paradox
;;   SPC a k	launch paradox
;;   Important Note 1: Installing a new package from Paradox won't make it persistent.
;;                     To install a package persistently you have to add it explicitly
;;                     to a configuration layer.
;;   Important Note 2: Don't update your packages from Paradox or package-list-packages
;;                     because they don't support the rollback feature of Spacemacs.
;;
;; GUI Toggles
;;   SPC t 8	highlight any character past the 80th column
;;   SPC t f	display the fill column (by default the fill column is set to 80)
;;   SPC t h h	toggle highlight of the current line
;;   SPC t h i	toggle highlight indentation levels
;;   SPC t h c	toggle highlight indentation current column
;;   SPC t i	toggle indentation guide at point
;;   SPC t l	toggle truncate lines
;;   SPC t L	toggle visual lines
;;   SPC t n	toggle line numbers
;;   SPC t v	toggle smooth scrolling
;;
;;   SPC T ~	display ~ in the fringe on empty lines
;;   SPC T F	toggle frame fullscreen
;;   SPC T f	toggle display of the fringe
;;   SPC T m	toggle menu bar
;;   SPC T M	toggle frame maximize
;;   SPC T t	toggle tool bar
;;   SPC T T	toggle frame transparency and enter transparency transient state
;;   Note: These toggles are all available via the helm-spacemacs-help interface
;;         (press SPC h SPC to display the helm-spacemacs-help buffer,
;;          then enter 'SPC' to filter the information).


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Emacs lisp
;; ;; https://learnxinyminutes.com/docs/elisp/
;; 
;; ;; C-j after the sexp to run it in the buffer
;; ;; C-xC-e to execute and display the result in mini-buffer at the bottom
;; (+ 2 2)
;; 4
;; (+ 3 (+ 2 1))
;; 6
;; (setq my-var "test")
;; "test"
;; 
;; (insert "hello" " world! " my-var)
;; hello world! testnil
;; 
;; ;; Need to evaluate function body before using it
;; (defun hello () (insert "Hello " my-var))
;; (hello)
;; 
;; (defun hello(name) (insert "hello " name "!\n"))
;; (hello "yo")
;; 
;; (switch-to-buffer-other-window "*test*")
;; 
;; ;; combine sexps with progn
;; (progn
;;   (switch-to-buffer-other-window "*test*")
;;   (erase-buffer)
;;   (hello "you"))
;; 
;; ;; `let` defines the local variable and it also works as `progn` 
;; (let ((my-name "bugs"))
;;   (switch-to-buffer-other-window "*test*")
;;   (erase-buffer)
;;   (hello my-name)
;;   (other-window 1))
;; 
;; (format "Hello %s!\n" "John")
;; 
;; (defun greeting (name)
;;   (let ((your-name "Jack"))
;;     (insert (format "Hello %s! I am %s."
;;                     name
;;                     your-name)
;;             )))
;; (greeting "John")
;; 
;; (read-from-minibuffer "Enter your name: ")
;; 
;; (defun greeting (name)
;;   (let ((your-name (read-from-minibuffer "Enter your name: ")))
;;     (switch-to-buffer-other-window "*test*")
;;     (erase-buffer)
;;     (insert (format "Hello %s! I am %s."
;;                     name
;;                     your-name)
;;             )))
;; (greeting "John")
;; 
;; (setq list-of-names '("Sarah" "Chloe" "Mathilde"))
;; ;; first elem
;; (car list-of-names)
;; ;; tail of the list after first elem
;; (cdr list-of-names)
;; ;; add elem at the beginning - it modifies the list
;; (push "Moo" list-of-names)
;; ;; call 'hello' for each element
;; (mapcar 'hello list-of-names)
;; 
;; (defun greeting ()
;;   (switch-to-buffer-other-window "*test*")
;;   (erase-buffer)
;;   (mapcar 'hello list-of-names)
;;   (other-window 1))
;; 
;; (greeting)
;; 
;; (defun boldify-names ()
;;   (switch-to-buffer-other-window "*test*")
;;   (goto-char (point-min))
;;   (while (re-search-forward "hello \\(.+\\)!" nil 't)
;;     (add-text-properties (match-beginning 1)
;;                          (match-end 1)
;;                          (list 'face 'bold)))
;;   (other-window 1))
;; (boldify-names)
