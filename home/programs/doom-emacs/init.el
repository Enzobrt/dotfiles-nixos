;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       vertico

       :ui
       doom
       dashboard
       modeline
       (popup +defaults)

       :editor
       evil

       :emacs
       undo

       :term
       vterm

       :lang
       emacs-lisp
       (nix +lsp)

       :tools
       (lsp +eglot)

       :config
       (default +bindings +smartparens))
