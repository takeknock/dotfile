;;基本設定
(set-language-environment 'Japanese);言語を日本語に

(set-default-coding-systems 'utf-8);UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;バックアップファイル作らない系
; *.~ とかのを作らない
(setq make-backup-files nil)
; .#* とかのを作らない
(setq auto-save-default nil)

;モードラインに行番号表示
(column-number-mode t)
;タブの表示幅
(setq-default tab-width 4)
;;横の行番号の表示
(global-linum-mode t)
;current directory transparent
(set-frame-parameter nil 'alpha 0.85)
;文字と画面サイズ
(set-face-attribute 'default nil :family "monaco" :height 120)
;(set-frame-height (next-frame) 40)
;(set-frame-width (next-frame) 70)

;;cl-libエラーへの対処（http://stackoverflow.com/questions/20678847/cannot-load-cl-lib-at-emacs-startup）
(add-to-list 'load-path "~/.emacs.d/elisp/cl-lib/")
(require 'cl-lib)

;elispフォルダをパスに追加
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/elisp/"))

;;auto-installの設定（『Emacs実践入門』、http://d.hatena.ne.jp/rubikitch/20091221/autoinstall）
(require 'auto-install)
;インストール場所の指定
(setq auto-install-directory "~/.emacs.d/elisp/")
;emacswikiに記載されてるelist名取得
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;;Auto Completeの設定（『Emacs実践入門』）
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(ac-config-default)

;;yasnippetの設定（http://fukuyama.co/yasnippet）
;yasnippetを置いているフォルダにパスを通す
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/elisp/yasnippet"))
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets" ;自作スニペット置くとこ
        "~/.emacs.d/elisp/yasnippet/snippets";デフォルトのスニペット置き場
		"~/.emacs/elisp/yasnippet/yasmate/snippets" ;; the yasmate collection
))
;(add-to-list 'yas/root-directory "");AndreaCrotti's snippet
;(yas/initialize)

;global-modeで起動
(yas-global-mode 1)
;TABキーで展開する
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((require-final-newline))))
 '(yas-prompt-functions (quote (my-yas/prompt)))
 '(yas-trigger-key "TAB"))
;既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)


;;Anythingの設定
(require 'anything)
;emacsコマンドを表示する
(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-dource-emacs-commands);anything-sources(標準のソース一覧)にanything-c-source-emacs-commands(emacsコマンドを表示するためのソース)を追加


;;********anything interface（anythingとyasnippetの連携）;;まだ対応できてない+内容理解できてない（内容に関して参考文献：http://d.hatena.ne.jp/sugyan/20120111/1326288445）
;（http://ochiailab.blogspot.jp/2012/12/yasnippet.html）
(eval-after-load "anything-config"
  '(progn
     (defun my-yas/prompt (prompt choices &optional display-fn)
        (let* ((names (loop for choice in choices
			    collect (or (and display-fn (funcall display-fn choice))
					choice)))
	       (selected (anything-other-buffer
			  '(((name . ,(format "%s" prompt))
			     (candidates . names)
			     (action . (("Insert snippet" . (lambda (arg) arg))))))
			  "*anything yas/prompt*")))
	  (if selecter
	      (let ((n (position selected names :test 'equal)))
		(nth n choices))
	    (signal 'quit "user quit!"))))
  (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
  (define-key anything-command-map (kbd "y") 'yas/insert-snipper)))


;;smart-compileの設定
(require 'smart-compile)
;(setq smart-compile-alist
;      (append
;       '(("\\.rb$" . "ruby %f"))
;       smart-compile-alist))
(add-hook 'ruby-mode-hook
		  '(lambda()
(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
(define-key ruby-mode-map (kbd "C-c C-c") (kbd "C-c c C-m"))))


;;;flymakeの設定
;;*******Ruby用flymakeの設定（書いてある内容わかってない）
;(defun flymake-ruby-init()
;  (list "ruby" (list "-c" (flymake-init-create-temp-buffer-copy
;					 'flymake-create-temp-inplace))))
;(add-to-list 'flymake-allowed-file-name-masks
;			 '("\\.rb\\'" flymake-ruby-init))
;(add-to-list 'flymake-err-line-patterns
;			 '("\\(.*\\):(\\([0-9]+\\)): \\(.*\\)" 1 2 nil 3))


;;;矩形関係の設定
;;cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;


;;;C-x bでミニバッファにバッファ候補を表示
;（http://e-arrows.sakura.ne.jp/2010/02/vim-to-emacs.html）
(iswitchb-mode t)


;;;todo
;デバッグ機能追加
;smartcompile追加(c++にも)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;
;;;compile set-up
;;;
(define-key esc-map "c" 'compile)
(define-key esc-map "k" 'kill-compilation)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;AucTex設定（http://ochiailab.blogspot.jp/2013/01/auctex-reftex.html）
(setq TeX-default-mode 'japanese-latex-mode)
 
(setq japanese-LaTeX-default-style "jarticle")
(setq TeX-output-view-style '(("^dvi$" "." "xdvi '%d'")))
(setq preview-image-type 'dvipng)
(add-hook 'LaTeX-mode-hook (function (lambda ()
  (add-to-list 'TeX-command-list
    '("pTeX" "%(PDF)ptex %`%S%(PDFout)%(mode)%' %t"
     TeX-run-TeX nil (plain-tex-mode) :help "Run ASCII pTeX"))
  (add-to-list 'TeX-command-list
    '("pLaTeX" "%(PDF)platex %`%S%(PDFout)%(mode)%' %t"
     TeX-run-TeX nil (latex-mode) :help "Run ASCII pLaTeX"))
  (add-to-list 'TeX-command-list
    '("acroread" "acroread '%s.pdf' " TeX-run-command t nil))
  (add-to-list 'TeX-command-list
    '("pdf" "dvipdfmx -V 4 '%s' " TeX-run-command t nil))
)))
 
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
 
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
 
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
 
;; Change key bindings
(add-hook 'reftex-mode-hook
 '(lambda ()
               (define-key reftex-mode-map (kbd "\C-cr") 'reftex-reference)
               (define-key reftex-mode-map (kbd "\C-cl") 'reftex-label)
               (define-key reftex-mode-map (kbd "\C-cc") 'reftex-citation)
))
 
;; 数式のラベル作成時にも自分でラベルを入力できるようにする
(setq reftex-insert-label-flags '("s" "sfte"))
 
;; \eqrefを使う
(setq reftex-label-alist
      '(
        (nil ?e nil "\\eqref{%s}" nil nil)
        ))
 
; RefTeXで使用するbibファイルの位置を指定する
(setq reftex-default-bibliography '("~/tex/biblio.bib" "~/tex/biblio2.bib"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
