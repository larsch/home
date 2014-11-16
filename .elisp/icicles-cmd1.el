<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: icicles-cmd1.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-cmd1.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: icicles-cmd1.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-cmd1.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for icicles-cmd1.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=icicles-cmd1.el" /><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22icicles-cmd1.el%22">icicles-cmd1.el</a></h1></div><div class="wrapper"><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs-en/download/icicles-cmd1.el">Download</a></p><pre class="code"><span class="linecomment">;;; icicles-cmd1.el --- Top-level commands for Icicles</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: icicles-cmd1.el</span>
<span class="linecomment">;; Description: Top-level commands for Icicles</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1996-2013, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Mon Feb 27 09:25:04 2006</span>
<span class="linecomment">;; Version: 22.0</span>
<span class="linecomment">;; Last-Updated: Sun Jan  6 15:20:35 2013 (-0800)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 25432</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/icicles-cmd1.el</span>
<span class="linecomment">;; Doc URL: http://www.emacswiki.org/Icicles</span>
<span class="linecomment">;; Keywords: extensions, help, abbrev, local, minibuffer,</span>
<span class="linecomment">;;           keys, apropos, completion, matching, regexp, command</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x, 24.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `apropos', `apropos-fn+var', `avoid', `cl', `cus-edit',</span>
<span class="linecomment">;;   `cus-face', `cus-load', `cus-start', `doremi', `easymenu',</span>
<span class="linecomment">;;   `el-swank-fuzzy', `ffap', `ffap-', `frame-cmds', `frame-fns',</span>
<span class="linecomment">;;   `fuzzy', `fuzzy-match', `hexrgb', `icicles-face', `icicles-fn',</span>
<span class="linecomment">;;   `icicles-mcmd', `icicles-opt', `icicles-var', `image-dired',</span>
<span class="linecomment">;;   `kmacro', `levenshtein', `misc-fns', `mouse3', `mwheel',</span>
<span class="linecomment">;;   `naked', `regexp-opt', `ring', `ring+', `second-sel', `strings',</span>
<span class="linecomment">;;   `thingatpt', `thingatpt+', `wid-edit', `wid-edit+', `widget'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This is a helper library for library `icicles.el'.  It defines</span>
<span class="linecomment">;;  top-level commands (and a few non-interactive functions used in</span>
<span class="linecomment">;;  those commands).  Library `icicles-cmd2.el' is a continuation of</span>
<span class="linecomment">;;  this file (a single file for all top-level commands would be too</span>
<span class="linecomment">;;  large to upload to Emacs Wiki).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  For commands to be used mainly in the minibuffer or buffer</span>
<span class="linecomment">;;  `*Completions*', see `icicles-mcmd.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  For Icicles documentation, see `icicles-doc1.el' and</span>
<span class="linecomment">;;  `icicles-doc2.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you use the byte-compiled version of this library,</span>
<span class="linecomment">;;  `icicles-cmd1.elc', in Emacs 23, then it must be byte-compiled</span>
<span class="linecomment">;;  using Emacs 23.  Otherwise, Icicles key completion (and perhaps</span>
<span class="linecomment">;;  other things?) will not work correctly.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Widgets defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-file', `icicle-ORIG-file'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Commands defined here - (+) means a multi-command:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (+)`clear-option', (+)`icicle-add-buffer-candidate',</span>
<span class="linecomment">;;    (+)`icicle-add-buffer-config',</span>
<span class="linecomment">;;    `icicle-add-entry-to-saved-completion-set', `icicle-apropos',</span>
<span class="linecomment">;;    `icicle-apropos-command', `icicle-apropos-function',</span>
<span class="linecomment">;;    `icicle-apropos-option', (+)`icicle-apropos-options-of-type',</span>
<span class="linecomment">;;    (+)`icicle-apropos-value', `icicle-apropos-variable',</span>
<span class="linecomment">;;    (+)`icicle-apropos-vars-w-val-satisfying',</span>
<span class="linecomment">;;    `icicle-apropos-zippy', `icicle-bbdb-complete-mail',</span>
<span class="linecomment">;;    `icicle-bbdb-complete-name', (+)`icicle-bookmark',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-all-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-all-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-all-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-all-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autofile',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autofile-all-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autofile-all-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autofile-all-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autofile-all-tags-regexp-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-autofile-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autofile-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autofile-some-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autofile-some-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autofile-some-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autofile-some-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autonamed',</span>
<span class="linecomment">;;    `icicle-bookmark-autonamed-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autonamed-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autonamed-this-buffer',</span>
<span class="linecomment">;;    `icicle-bookmark-autonamed-this-buffer-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-autonamed-this-buffer-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-bookmark-file',</span>
<span class="linecomment">;;    `icicle-bookmark-bookmark-file-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-bookmark-list',</span>
<span class="linecomment">;;    `icicle-bookmark-bookmark-list-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-cmd', (+)`icicle-bookmark-desktop',</span>
<span class="linecomment">;;    `icicle-bookmark-desktop-narrow', (+)`icicle-bookmark-dired',</span>
<span class="linecomment">;;    `icicle-bookmark-dired-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-dired-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmarked-buffer-list',</span>
<span class="linecomment">;;    (+)`icicle-bookmarked-file-list', (+)`icicle-bookmark-file',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-all-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-all-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-all-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-all-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-file-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-some-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-some-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-some-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-some-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-all-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-all-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-all-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-all-tags-regexp-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-file-this-dir-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-some-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-some-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-some-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-file-this-dir-some-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-gnus', `icicle-bookmark-gnus-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-gnus-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-image', `icicle-bookmark-image-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-image-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-info', `icicle-bookmark-info-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-info-other-window', `icicle-bookmark-jump',</span>
<span class="linecomment">;;    `icicle-bookmark-jump-other-window', (+)`icicle-bookmark-list',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-local-file',</span>
<span class="linecomment">;;    `icicle-bookmark-local-file-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-local-file-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-man', `icicle-bookmark-man-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-man-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-non-file',</span>
<span class="linecomment">;;    `icicle-bookmark-non-file-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-non-file-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-other-window', (+)`icicle-bookmark-region',</span>
<span class="linecomment">;;    `icicle-bookmark-region-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-region-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-remote-file',</span>
<span class="linecomment">;;    `icicle-bookmark-remote-file-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-remote-file-other-window',</span>
<span class="linecomment">;;    `icicle-bookmark-save-marked-files',</span>
<span class="linecomment">;;    `icicle-bookmark-save-marked-files-as-project',</span>
<span class="linecomment">;;    `icicle-bookmark-save-marked-files-more',</span>
<span class="linecomment">;;    `icicle-bookmark-save-marked-files-persistently',</span>
<span class="linecomment">;;    `icicle-bookmark-save-marked-files-to-variable',</span>
<span class="linecomment">;;    `icicle-bookmark-set', (+)`icicle-bookmark-some-tags',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-some-tags-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-some-tags-regexp',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-some-tags-regexp-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-specific-buffers',</span>
<span class="linecomment">;;    `icicle-bookmark-specific-buffers-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-specific-buffers-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-specific-files',</span>
<span class="linecomment">;;    `icicle-bookmark-specific-files-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-specific-files-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-temporary',</span>
<span class="linecomment">;;    `icicle-bookmark-temporary-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-temporary-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-this-buffer',</span>
<span class="linecomment">;;    `icicle-bookmark-this-buffer-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-this-buffer-other-window',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-url', `icicle-bookmark-url-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-url-other-window', (+)`icicle-bookmark-w3m',</span>
<span class="linecomment">;;    `icicle-bookmark-w3m-narrow',</span>
<span class="linecomment">;;    (+)`icicle-bookmark-w3m-other-window', (+)`icicle-buffer',</span>
<span class="linecomment">;;    (+)`icicle-buffer-config', (+)`icicle-buffer-list',</span>
<span class="linecomment">;;    (+)`icicle-buffer-no-search',</span>
<span class="linecomment">;;    (+)`icicle-buffer-no-search-other-window',</span>
<span class="linecomment">;;    (+)`icicle-buffer-other-window', `icicle-cd-for-abs-files',</span>
<span class="linecomment">;;    `icicle-cd-for-loc-files', (+)`icicle-clear-history',</span>
<span class="linecomment">;;    (+)`icicle-clear-current-history', (+)`icicle-color-theme',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-complete',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-complete-filename',</span>
<span class="linecomment">;;    `icicle-comint-replace-by-expanded-filename',</span>
<span class="linecomment">;;    (+)`icicle-command-abbrev', (+)`icicle-command-abbrev-command',</span>
<span class="linecomment">;;    (+)`icicle-completing-yank', `icicle-customize-apropos',</span>
<span class="linecomment">;;    `icicle-customize-apropos-faces',</span>
<span class="linecomment">;;    `icicle-customize-apropos-groups',</span>
<span class="linecomment">;;    `icicle-customize-apropos-options',</span>
<span class="linecomment">;;    (+)`icicle-customize-apropos-options-of-type',</span>
<span class="linecomment">;;    (+)`icicle-customize-apropos-opts-w-val-satisfying',</span>
<span class="linecomment">;;    (+)`icicle-customize-face',</span>
<span class="linecomment">;;    (+)`icicle-customize-face-other-window',</span>
<span class="linecomment">;;    `icicle-customize-icicles-group', `icicle-dabbrev-completion',</span>
<span class="linecomment">;;    (+)`icicle-delete-file', (+)`icicle-delete-window',</span>
<span class="linecomment">;;    (+)`icicle-describe-option-of-type', `icicle-describe-process',</span>
<span class="linecomment">;;    (+)`icicle-describe-var-w-val-satisfying',</span>
<span class="linecomment">;;    (+)`icicle-delete-windows', (+)`icicle-directory-list',</span>
<span class="linecomment">;;    (+)`icicle-dired', `icicle-dired-chosen-files',</span>
<span class="linecomment">;;    `icicle-dired-chosen-files-other-window',</span>
<span class="linecomment">;;    (+)`icicle-dired-insert-as-subdir',</span>
<span class="linecomment">;;    (+)`icicle-dired-other-window', `icicle-dired-project',</span>
<span class="linecomment">;;    `icicle-dired-project-other-window',</span>
<span class="linecomment">;;    `icicle-dired-saved-file-candidates',</span>
<span class="linecomment">;;    `icicle-dired-saved-file-candidates-other-window',</span>
<span class="linecomment">;;    `icicle-dired-save-marked',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-as-project',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-more',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-more-recursive',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-persistently',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-recursive',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-to-cache-file-recursive',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-to-fileset-recursive',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-to-variable',</span>
<span class="linecomment">;;    `icicle-dired-save-marked-to-variable-recursive',</span>
<span class="linecomment">;;    `icicle-doremi-increment-variable+',</span>
<span class="linecomment">;;    `icicle-ess-complete-filename',</span>
<span class="linecomment">;;    `icicle-ess-complete-object-name',</span>
<span class="linecomment">;;    `icicle-ess-internal-complete-object-name',</span>
<span class="linecomment">;;    `icicle-ess-R-complete-object-name',</span>
<span class="linecomment">;;    (+)`icicle-execute-extended-command',</span>
<span class="linecomment">;;    (+)`icicle-execute-named-keyboard-macro', (+)`icicle-face-list',</span>
<span class="linecomment">;;    (+)`icicle-file', (+)`icicle-file-list',</span>
<span class="linecomment">;;    (+)`icicle-file-other-window', (+)`icicle-find-file',</span>
<span class="linecomment">;;    (+)`icicle-find-file-absolute',</span>
<span class="linecomment">;;    (+)`icicle-find-file-absolute-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-in-tags-table',</span>
<span class="linecomment">;;    (+)`icicle-find-file-in-tags-table-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-of-content',</span>
<span class="linecomment">;;    (+)`icicle-find-file-of-content-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-file-read-only',</span>
<span class="linecomment">;;    (+)`icicle-find-file-read-only-other-window',</span>
<span class="linecomment">;;    (+)`icicle-find-first-tag',</span>
<span class="linecomment">;;    (+)`icicle-find-first-tag-other-window', (+)`icicle-find-tag',</span>
<span class="linecomment">;;    `icicle-grep-saved-file-candidates',</span>
<span class="linecomment">;;    `icicle-gud-gdb-complete-command', (+)`icicle-increment-option',</span>
<span class="linecomment">;;    (+)`icicle-increment-variable', (+)`icicle-insert-buffer',</span>
<span class="linecomment">;;    (+)`icicle-keyword-list', (+)`icicle-kill-buffer',</span>
<span class="linecomment">;;    (+)`icicle-kmacro', `icicle-lisp-complete-symbol',</span>
<span class="linecomment">;;    (+)`icicle-locate', (+)`icicle-locate-file',</span>
<span class="linecomment">;;    (+)`icicle-locate-file-no-symlinks',</span>
<span class="linecomment">;;    (+)`icicle-locate-file-no-symlinks-other-window',</span>
<span class="linecomment">;;    (+)`icicle-locate-file-other-window',</span>
<span class="linecomment">;;    (+)`icicle-locate-other-window', `icicle-ORIG-customize-face',</span>
<span class="linecomment">;;    `icicle-ORIG-customize-face-other-window',</span>
<span class="linecomment">;;    `icicle-ORIG-dabbrev-completion',</span>
<span class="linecomment">;;    `icicle-ORIG-lisp-complete-symbol',</span>
<span class="linecomment">;;    `icicle-ORIG-lisp-completion-at-point',</span>
<span class="linecomment">;;    `icicle-ORIG-repeat-complex-command',</span>
<span class="linecomment">;;    (+)`icicle-other-window-or-frame', `icicle-pop-tag-mark',</span>
<span class="linecomment">;;    `icicle-pp-eval-expression', (+)`icicle-recent-file',</span>
<span class="linecomment">;;    (+)`icicle-recent-file-other-window',</span>
<span class="linecomment">;;    `icicle-recompute-shell-command-candidates',</span>
<span class="linecomment">;;    (+)`icicle-regexp-list', (+)`icicle-remove-buffer-candidate',</span>
<span class="linecomment">;;    (+)`icicle-remove-buffer-config',</span>
<span class="linecomment">;;    `icicle-remove-entry-from-saved-completion-set',</span>
<span class="linecomment">;;    (+)`icicle-remove-file-from-recentf-list',</span>
<span class="linecomment">;;    (+)`icicle-remove-saved-completion-set',</span>
<span class="linecomment">;;    `icicle-repeat-complex-command',</span>
<span class="linecomment">;;    (+)`icicle-reset-option-to-nil',</span>
<span class="linecomment">;;    (+)`icicle-select-bookmarked-region', (+)`icicle-select-frame',</span>
<span class="linecomment">;;    `icicle-select-frame-by-name', (+)`icicle-select-window',</span>
<span class="linecomment">;;    `icicle-select-window-by-name', `icicle-send-bug-report',</span>
<span class="linecomment">;;    (+)`icicle-send-signal-to-process', (+)`icicle-set-option-to-t',</span>
<span class="linecomment">;;    (+)`icicle-sexp-list', `icicle-shell-dynamic-complete-command',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-environment-variable',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-filename',</span>
<span class="linecomment">;;    (+)`icicle-string-list', (+)`icicle-toggle-option',</span>
<span class="linecomment">;;    (+)`icicle-visit-marked-file-of-content',</span>
<span class="linecomment">;;    (+)`icicle-visit-marked-file-of-content-other-window',</span>
<span class="linecomment">;;    `icicle-widget-file-complete',</span>
<span class="linecomment">;;    (+)`icicle-yank-maybe-completing',</span>
<span class="linecomment">;;    (+)`icicle-yank-pop-commands', `icicle-zap-to-char',</span>
<span class="linecomment">;;    (+)`toggle'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Non-interactive functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `custom-variable-p', `icicle-apropos-opt-action',</span>
<span class="linecomment">;;    `icicle-binary-option-p',</span>
<span class="linecomment">;;    `icicle-bookmark-bind-narrow-commands',</span>
<span class="linecomment">;;    `icicle-bookmark-cleanup', `icicle-bookmark-cleanup-on-quit',</span>
<span class="linecomment">;;    `icicle-bookmark-delete-action', `icicle-bookmark-help-string',</span>
<span class="linecomment">;;    `icicle-bookmark-jump-1',</span>
<span class="linecomment">;;    `icicle-buffer-apropos-complete-match',</span>
<span class="linecomment">;;    `icicle-buffer-multi-complete', `icicle-buffer-name-prompt',</span>
<span class="linecomment">;;    `icicle-cached-files-without-buffers', `icicle-clear-history-1',</span>
<span class="linecomment">;;    `icicle-clear-history-entry',</span>
<span class="linecomment">;;    `icicle-comint-completion-at-point',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-complete-as-filename',</span>
<span class="linecomment">;;    `icicle-comint-dynamic-simple-complete',</span>
<span class="linecomment">;;    `icicle-comint-replace-orig-completion-fns',</span>
<span class="linecomment">;;    `icicle-command-abbrev-action',</span>
<span class="linecomment">;;    `icicle-command-abbrev-matching-commands',</span>
<span class="linecomment">;;    `icicle-command-abbrev-record', `icicle-command-abbrev-regexp',</span>
<span class="linecomment">;;    `icicle-customize-apropos-opt-action', `icicle-customize-faces',</span>
<span class="linecomment">;;    `icicle-dabbrev--abbrev-at-point',</span>
<span class="linecomment">;;    `icicle-default-buffer-names',</span>
<span class="linecomment">;;    `icicle-delete-file-or-directory', `icicle-describe-opt-action',</span>
<span class="linecomment">;;    `icicle-describe-opt-of-type-complete',</span>
<span class="linecomment">;;    `icicle-execute-extended-command-1', `icicle-explore',</span>
<span class="linecomment">;;    `icicle-file-of-content-apropos-complete-match',</span>
<span class="linecomment">;;    `icicle-find-file-of-content-multi-complete',</span>
<span class="linecomment">;;    `icicle-find-first-tag-action',</span>
<span class="linecomment">;;    `icicle-find-first-tag-other-window-action',</span>
<span class="linecomment">;;    `icicle-find-tag-action', `icicle-find-tag-define-candidates',</span>
<span class="linecomment">;;    `icicle-find-tag-define-candidates-1',</span>
<span class="linecomment">;;    `icicle-find-tag-final-act', `icicle-find-tag-help',</span>
<span class="linecomment">;;    `icicle-find-tag-quit-or-error', `icicle-insert-for-yank',</span>
<span class="linecomment">;;    `icicle-kill-a-buffer-and-update-completions',</span>
<span class="linecomment">;;    `icicle-kmacro-action', `icicle-lisp-completion-at-point',</span>
<span class="linecomment">;;    (+)`icicle-locate-file-1', `icicle-locate-file-action',</span>
<span class="linecomment">;;    `icicle-locate-file-other-window-action',</span>
<span class="linecomment">;;    `icicle-make-bookmark-candidate',</span>
<span class="linecomment">;;    `icicle-make-file+date-candidate', `icicle-make-frame-alist',</span>
<span class="linecomment">;;    `icicle-make-window-alist',</span>
<span class="linecomment">;;    `icicle-bookmark-propertize-candidate',</span>
<span class="linecomment">;;    `icicle-pp-display-expression',</span>
<span class="linecomment">;;    `icicle-read-args-w-val-satisfying',</span>
<span class="linecomment">;;    `icicle-recent-files-without-buffers.',</span>
<span class="linecomment">;;    `icicle-remove-buffer-candidate-action',</span>
<span class="linecomment">;;    `icicle-remove-buffer-config-action',</span>
<span class="linecomment">;;    `icicle-remove-from-recentf-candidate-action',</span>
<span class="linecomment">;;    `icicle-remove-saved-set-action',</span>
<span class="linecomment">;;    `icicle-shell-command-on-file',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-as-command',</span>
<span class="linecomment">;;    `icicle-shell-dynamic-complete-as-environment-variable'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Internal variables defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `icicle-locate-file-action-fn',</span>
<span class="linecomment">;;    `icicle-locate-file-no-symlinks-p',</span>
<span class="linecomment">;;    `icicle-locate-file-use-locate-p'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `dabbrev.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `dabbrev-completion' - Use Icicles minibuffer completion when there</span>
<span class="linecomment">;;                         are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `bbdb-com.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;              (BBDB is available here: http://bbdb.sourceforge.net/.)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `bbdb-complete-name' - Use Icicles minibuffer completion when there</span>
<span class="linecomment">;;                         are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `lisp.el' have</span>
<span class="linecomment">;;              been REDEFINED in Icicles:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `lisp-complete-symbol' - Selects `*Completions*' window even if on</span>
<span class="linecomment">;;                           another frame.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following function defined in `simple.el' has</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `repeat-complex-command' - Use `completing-read' to read command.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following functions defined in `cus-edit.el' have</span>
<span class="linecomment">;;              been REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `customize-apropos', `customize-apropos-faces',</span>
<span class="linecomment">;;  `customize-apropos-groups', `customize-apropos-options' -</span>
<span class="linecomment">;;     Use `completing-read' to read the regexp.</span>
<span class="linecomment">;;  `customize-face', `customize-face-other-window' - Multi-commands.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Key bindings made by Icicles: See "Key Bindings" in</span>
<span class="linecomment">;;  `icicles-doc2.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  For descriptions of changes to this file, see `icicles-chg.el'.</span>
 
<span class="linecomment">;;(@&gt; "Index")</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  If you have library `linkd.el' and Emacs 22 or later, load</span>
<span class="linecomment">;;  `linkd.el' and turn on `linkd-mode' now.  It lets you easily</span>
<span class="linecomment">;;  navigate around the sections of this doc.  Linkd mode will</span>
<span class="linecomment">;;  highlight this Index, as well as the cross-references and section</span>
<span class="linecomment">;;  headings throughout this file.  You can get `linkd.el' here:</span>
<span class="linecomment">;;  http://dto.freeshell.org/notebook/Linkd.html.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  (@&gt; "Icicles Top-Level Commands, Part 1")</span>
 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or</span>
<span class="linecomment">;; modify it under the terms of the GNU General Public License as</span>
<span class="linecomment">;; published by the Free Software Foundation; either version 3, or</span>
<span class="linecomment">;; (at your option) any later version.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU</span>
<span class="linecomment">;; General Public License for more details.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(eval-when-compile (require 'cl)) <span class="linecomment">;; lexical-let[*], pushnew</span>
                                  <span class="linecomment">;; plus, for Emacs &lt; 21: dolist, push</span>
(eval-when-compile (when (&gt;= emacs-major-version 21) (require 'recentf))) <span class="linecomment">;; recentf-mode</span>
(require 'apropos-fn+var nil t) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; apropos-command, apropos-function, apropos-option, apropos-variable</span>
(eval-when-compile (require 'dabbrev))
  <span class="linecomment">;; dabbrev-case-fold-search, dabbrev-upcase-means-case-search, dabbrev--last-obarray,</span>
  <span class="linecomment">;; dabbrev--last-completion-buffer, dabbrev--last-abbreviation, dabbrev--check-other-buffers,</span>
  <span class="linecomment">;; dabbrev-case-replace, dabbrev--reset-global-variables, dabbrev--minibuffer-origin,</span>
  <span class="linecomment">;; dabbrev--find-all-expansions, dabbrev--substitute-expansion</span>
(eval-when-compile (require 'bookmark))
  <span class="linecomment">;; bookmark-all-names, bookmark-buffer-name, bookmark-current-bookmark</span>
(eval-when-compile (require 'comint))
  <span class="linecomment">;; comint-completion-addsuffix, comint-completion-autolist, comint-completion-fignore,</span>
  <span class="linecomment">;; comint-completion-recexact, comint-directory, comint-dynamic-complete-filename,</span>
  <span class="linecomment">;; comint-dynamic-complete-functions, comint-line-beginning-position,</span>
  <span class="linecomment">;; comint-match-partial-filename, comint-quote-filename</span>
(eval-when-compile (require 'cookie1 nil t)) <span class="linecomment">;; (no error if not found): cookie-cache</span>
(eval-when-compile (require 'shell)) <span class="linecomment">;; shell-backward-command, shell-completion-execonly,</span>
  <span class="linecomment">;; shell-dynamic-complete-command, shell-dynamic-complete-environment-variable,</span>
  <span class="linecomment">;; shell-dynamic-complete-filename, shell-match-partial-variable</span>
(eval-when-compile (require 'etags))
  <span class="linecomment">;; file-of-tag, find-tag, find-tag-default, find-tag-default-function,</span>
  <span class="linecomment">;; find-tag-marker-ring, find-tag-other-window, goto-tag-location-function, snarf-tag-function,</span>
  <span class="linecomment">;; tag-find-file-of-tag-noselect, tags-case-fold-search,</span>
  <span class="linecomment">;; tags-lazy-completion-table, tags-table-files, visit-tags-table-buffer</span>
(eval-when-compile (require 'yow nil t)) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; apropos-zippy, yow-after-load-message, yow-file, yow-load-message</span>

<span class="linecomment">;; Commented out because `synonyms.el' soft-requires Icicles.</span>
<span class="linecomment">;; (eval-when-compile (require 'synonyms nil t)) ;; (no error if not found):</span>
  <span class="linecomment">;; synonyms-ensure-synonyms-read-from-cache, synonyms-obarray</span>
(eval-when-compile (require 'misc-cmds nil t)) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; kill-buffer-and-its-windows</span>
(eval-when-compile (require 'bbdb nil t) (require 'bbdb-com nil t)) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; bbdb-auto-fill-function, bbdb-complete-name, bbdb-complete-name-allow-cycling,</span>
  <span class="linecomment">;; bbdb-complete-name-cleanup, bbdb-complete-name-hooks, bbdb-completion-display-record,</span>
  <span class="linecomment">;; bbdb-completion-predicate, bbdb-completion-type, bbdb-display-records-1,</span>
  <span class="linecomment">;; bbdb-dwim-net-address, bbdb-expand-mail-aliases, bbdb-extract-address-components-func,</span>
  <span class="linecomment">;; bbdb-gag-messages, bbdb-hashtable, bbdb-mapc, bbdb-pop-up-bbdb-buffer, bbdb-record-aka,</span>
  <span class="linecomment">;; bbdb-record-name, bbdb-record-net, bbdb-search-intertwingle, bbdb-string-trim</span>
(require 'cus-edit)
  <span class="linecomment">;; customize-apropos, customize-apropos-faces, customize-apropos-groups,</span>
  <span class="linecomment">;; customize-apropos-options, custom-buffer-create, custom-buffer-order-groups, customize-face,</span>
  <span class="linecomment">;; customize-face-other-window, custom-sort-items</span>
(require 'misc-fns nil t)   <span class="linecomment">;; (no error if not found): another-buffer</span>
(require 'frame-cmds nil t) <span class="linecomment">;; (no error if not found): delete-windows-on (my version)</span>
(require 'second-sel nil t) <span class="linecomment">;; (no error if not found):</span>
  <span class="linecomment">;; secondary-selection-yank-commands, secondary-selection-yank-secondary-commands,</span>
  <span class="linecomment">;; yank-pop-secondary</span>

(eval-when-compile
 (or (condition-case nil
         (load-library "<span class="quote">icicles-mac</span>")   <span class="linecomment">; Use load-library to ensure latest .elc.</span>
       (error nil))
     (require 'icicles-mac)))           <span class="linecomment">; Require, so can load separately if not on `load-path'.</span>
  <span class="linecomment">;; icicle-assoc-delete-all, icicle-(buffer|file)-bindings, icicle-condition-case-no-debug,</span>
  <span class="linecomment">;; icicle-define-bookmark(-other-window)-command, icicle-define(-file)-command,</span>
  <span class="linecomment">;; icicle-define-add-to-alist-command</span>
(require 'icicles-mcmd)
  <span class="linecomment">;; icicle-bind-buffer-candidate-keys, icicle-bind-file-candidate-keys, icicle-unbind-buffer-candidate-keys,</span>
  <span class="linecomment">;; icicle-unbind-file-candidate-keys, icicle-yank</span>
(require 'icicles-opt)                  <span class="linecomment">; (This is required anyway by `icicles-var.el'.)</span>
  <span class="linecomment">;; icicle-add-proxy-candidates-flag, icicle-buffer-configs, icicle-buffer-extras,</span>
  <span class="linecomment">;; icicle-buffer-ignore-space-prefix-flag, icicle-buffer-match-regexp,</span>
  <span class="linecomment">;; icicle-buffer-no-match-regexp, icicle-buffer-predicate, icicle-buffer-require-match-flag,</span>
  <span class="linecomment">;; icicle-buffer-sort, icicle-color-themes, icicle-kbd, icicle-saved-completion-sets,</span>
  <span class="linecomment">;; icicle-sort-comparer, icicle-transform-function</span>
(require 'icicles-var)                  <span class="linecomment">; (This is required anyway by `icicles-fn.el'.)</span>
  <span class="linecomment">;; icicle-abs-file-candidates, icicle-all-candidates-list-action-fn,</span>
  <span class="linecomment">;; icicle-all-candidates-list-alt-action-fn, icicle-bookmark-history,</span>
  <span class="linecomment">;; icicle-bookmark-list-names-only-p, icicle-bookmark-types, icicle-buffer-config-history,</span>
  <span class="linecomment">;; icicle-bufflist, icicle-candidate-action-fn, icicle-candidate-alt-action-fn,</span>
  <span class="linecomment">;; icicle-candidate-help-fn, icicle-candidate-nb, icicle-candidate-properties-alist,</span>
  <span class="linecomment">;; icicle-candidates-alist, icicle-color-theme-history, icicle-command-abbrev-history,</span>
  <span class="linecomment">;; icicle-commands-for-abbrev, icicle-comp-base-is-default-dir-p, icicle-completion-candidates,</span>
  <span class="linecomment">;; icicle-completion-set-history, icicle-current-input, icicle-delete-candidate-object,</span>
  <span class="linecomment">;; icicle-explore-final-choice, icicle-explore-final-choice-full, icicle-extra-candidates,</span>
  <span class="linecomment">;; icicle-face-name-history, icicle-frame-alist, icicle-frame-name-history, icicle-full-cand-fn,</span>
  <span class="linecomment">;; icicle-function-name-history, icicle-get-alist-candidate-function, icicle-hist-var,</span>
  <span class="linecomment">;; icicle-incremental-completion-p, icicle-inhibit-sort-p, icicle-inhibit-try-switch-buffer,</span>
  <span class="linecomment">;; icicle-kill-history, icicle-kmacro-alist, icicle-kmacro-history,icicle-list-use-nth-parts, </span>
  <span class="linecomment">;; icicle-must-match-regexp, icicle-must-not-match-regexp, icicle-must-pass-after-match-predicate,</span>
  <span class="linecomment">;; icicle-new-last-cmd, icicle-orig-buff, icicle-orig-must-pass-after-match-pred,</span>
  <span class="linecomment">;; icicle-orig-pt-explore, icicle-orig-window, icicle-orig-win-explore, icicle-pref-arg,</span>
  <span class="linecomment">;; icicle-previous-raw-file-name-inputs, icicle-previous-raw-non-file-name-inputs, icicle-prompt,</span>
  <span class="linecomment">;; icicle-proxy-candidates, icicle-read-expression-map, icicle-remove-icicles-props-p,</span>
  <span class="linecomment">;; icicle-re-no-dot, icicle-saved-completion-candidates, icicle-search-history,</span>
  <span class="linecomment">;; icicle-transform-before-sort-p, icicle-use-candidates-only-once-alt-p,</span>
  <span class="linecomment">;; icicle-whole-candidate-as-text-prop-p, icicle-variable-name-history</span>
(require 'icicles-fn)                   <span class="linecomment">; (This is required anyway by `icicles-mcmd.el'.)</span>
  <span class="linecomment">;; icicle-delete-dups, icicle-highlight-lighter, icicle-multi-comp-apropos-complete-match,</span>
  <span class="linecomment">;; icicle-read-from-minibuf-nil-default</span>


<span class="linecomment">;; Byte-compiling this file, you will likely get some byte-compiler warning messages.</span>
<span class="linecomment">;; These are probably benign - ignore them.  Icicles is designed to work with multiple</span>
<span class="linecomment">;; versions of Emacs, and that fact provokes compiler warnings.  If you get byte-compiler</span>
<span class="linecomment">;; errors (not warnings), then please report a bug, using `M-x icicle-send-bug-report'.</span>

<span class="linecomment">;;; Some defvars to quiet byte-compiler a bit:</span>

(when (&lt; emacs-major-version 21)
  (defvar eval-expression-debug-on-error))

(when (&lt; emacs-major-version 22)
  (defvar history-delete-duplicates)
  (defvar icicle-kmacro-alist)          <span class="linecomment">; In `icicles-var.el'</span>
  (defvar kmacro-ring)                  <span class="linecomment">; In `kmacro.el'</span>
  (defvar read-file-name-completion-ignore-case) <span class="linecomment">;  In `minibuffer.el'</span>
  (defvar recentf-list)                 <span class="linecomment">; In `recentf.el'</span>
  (defvar tags-case-fold-search)        <span class="linecomment">; In `etags.el'</span>
  (defvar tooltip-mode))                <span class="linecomment">; In `tooltip.el'</span>

(when (&lt; emacs-major-version 23)
  (defvar read-buffer-completion-ignore-case))

(when (&lt; emacs-major-version 24)
  (defvar minibuffer-local-filename-syntax))

(defvar apropos-do-all)                 <span class="linecomment">; In `apropos.el'</span>
(defvar bbdb-complete-mail-allow-cycling) <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-complete-name-allow-cycling) <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-completion-list)           <span class="linecomment">; In `bbdb-come.el'</span>
(defvar bbdb-extract-address-components-func) <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-expand-mail-aliases)       <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-complete-name-hooks)       <span class="linecomment">; In `bbdb-com.el'</span>
(defvar bbdb-completion-display-record) <span class="linecomment">; In `bbdb.el'</span>
(defvar bbdb-completion-type)           <span class="linecomment">; In `bbdb.el'</span>
(defvar bbdb-hashtable)                 <span class="linecomment">; In `bbdb.el'</span>
(defvar bbdb-version)                   <span class="linecomment">; In `bbdb.el'</span>
(defvar bmkp-non-file-filename)         <span class="linecomment">; In `bookmark+-1.el'</span>
(defvar bmkp-prompt-for-tags-flag)      <span class="linecomment">; In `bookmark+-1.el'</span>
(defvar bmkp-sorted-alist)              <span class="linecomment">; In `bookmark+-1.el'</span>
(defvar bookmark-current-point)         <span class="linecomment">; In `bookmark.el' for Emacs &lt; </span>
(defvar color-theme)                    <span class="linecomment">; In `color-theme.el'</span>
(defvar color-themes)                   <span class="linecomment">; In `color-theme.el'</span>
(defvar color-theme-initialized)        <span class="linecomment">; In `color-theme.el'</span>
(defvar cookie-cache)
(defvar dabbrev--last-obarray)
(defvar dabbrev--last-completion-buffer)
(defvar ess-current-process-name)       <span class="linecomment">; In `ess-inf.el'</span>
(defvar ess-mode-syntax-table)          <span class="linecomment">; In `ess-cust.el'</span>
(defvar ess-use-R-completion)           <span class="linecomment">; In `ess-cust.el'</span>
(defvar existing-bufs)                  <span class="linecomment">; `icicle-visit-marked-file-of-content', `icicle-find-file-of-content'</span>
(defvar file-cache-alist)               <span class="linecomment">; In `filecache.el'</span>
(defvar filesets-data)                  <span class="linecomment">; In `filesets.el'</span>
(defvar find-tag-default-function)      <span class="linecomment">; In `etags.el'</span>
(defvar find-tag-marker-ring)           <span class="linecomment">; In `etags.el'</span>
(defvar goto-tag-location-function)     <span class="linecomment">; In `etags.el'</span>
(defvar icicle-buffer-easy-files)       <span class="linecomment">; Here</span>
(defvar icicle-clear-history-hist)      <span class="linecomment">; In `icicle-clear-history-1',`icicle-clear-current-history'</span>
(defvar icicle--last-toggle-transforming-msg) <span class="linecomment">; Here</span>
(defvar icicle-window-alist)            <span class="linecomment">; In `icicle-select-window'</span>
(defvar locate-make-command-line)       <span class="linecomment">; In `locate.el'</span>
(defvar proced-signal-list)             <span class="linecomment">; In `proced.el' (Emacs 23+)</span>
(defvar shell-completion-execonly)      <span class="linecomment">; In `shell.el'</span>
(defvar snarf-tag-function)             <span class="linecomment">; In `etags.el'</span>
(defvar translation-table-for-input)    <span class="linecomment">; Built-in, Emacs 21+</span>
(defvar w3m-current-title)              <span class="linecomment">; In `w3m.el'</span>
(defvar yow-after-load-message)
(defvar yow-file)
(defvar yow-load-message)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
 
<span class="linecomment">;;(@* "Icicles Top-Level Commands, Part 1")</span>
<span class="linecomment">;;; Icicles Top-Level Commands, Part 1 .   .   .   .   .   .   .   .   .</span>


<span class="linecomment">;; REPLACE ORIGINAL `pp-eval-expression' defined in `pp.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This is essentially the same as `pp-eval-expression' defined in `pp+.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Read with completion, using `icicle-read-expression-map'.</span>
<span class="linecomment">;; 2. Progress message added.</span>
<span class="linecomment">;; 3. Added optional arg and insertion behavior.</span>
<span class="linecomment">;; 4. Respect `icicle-pp-eval-expression-print-length', `icicle-pp-eval-expression-print-level',</span>
<span class="linecomment">;;    and `eval-expression-debug-on-error'.</span>
<span class="linecomment">;; 5. Adjusted to work in different Emacs releases.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-pp-eval-expression "icicles")</span>
(defun icicle-pp-eval-expression (expression <span class="linecomment">; Bound to `M-:' in Icicle mode.</span>
                                  &optional insert-value)
  "<span class="quote">Evaluate Emacs-Lisp sexp EXPRESSION, and pretty-print its value.
Add the value to the front of the variable `values'.
With a prefix arg, insert the value into the current buffer at point.
 With a negative prefix arg, if the value is a string, then insert it
 into the buffer without double-quotes (`\"').
With no prefix arg:
 If the value fits on one line (frame width) show it in the echo area.
 Otherwise, show the value in buffer `*Pp Eval Output*'.

This command respects user options
`icicle-pp-eval-expression-print-length',
`icicle-pp-eval-expression-print-level', and
`eval-expression-debug-on-error'.

Emacs-Lisp mode completion and indentation bindings are in effect.

By default, Icicle mode remaps all key sequences that are normally
bound to `eval-expression' or `pp-eval-expression' to
`icicle-pp-eval-expression'.  If you do not want this remapping, then
customize option `icicle-top-level-key-bindings'.</span>"
  (interactive
   (list (read-from-minibuffer "<span class="quote">Eval: </span>" nil icicle-read-expression-map t 'read-expression-history)
         current-prefix-arg))
  (message "<span class="quote">Evaluating...</span>")
  (if (or (not (boundp 'eval-expression-debug-on-error))
          (null eval-expression-debug-on-error))
      (setq values  (cons (eval expression) values))
    (let ((old-value  (make-symbol "<span class="quote">t</span>"))
          new-value)
      <span class="linecomment">;; Bind debug-on-error to something unique so that we can</span>
      <span class="linecomment">;; detect when evaled code changes it.</span>
      (let ((debug-on-error  old-value))
        (setq values     (cons (eval expression) values)
              new-value  debug-on-error))
      <span class="linecomment">;; If evaled code has changed the value of debug-on-error,</span>
      <span class="linecomment">;; propagate that change to the global binding.</span>
      (unless (eq old-value new-value)
        (setq debug-on-error  new-value))))
  (let ((print-length  icicle-pp-eval-expression-print-length)
        (print-level   icicle-pp-eval-expression-print-level))
    (cond (insert-value
           (message "<span class="quote">Evaluating...done.  Value inserted.</span>")
           (setq insert-value  (prefix-numeric-value insert-value))
           (if (or (not (stringp (car values)))  (wholenump insert-value))
               (pp (car values) (current-buffer))
             (princ (car values) (current-buffer))))
          (t (icicle-pp-display-expression (car values) "<span class="quote">*Pp Eval Output*</span>")))))


<span class="linecomment">;; REPLACE ORIGINAL in `pp.el':</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Use no `emacs-lisp-mode-hook' or `change-major-mode-hook'.</span>
<span class="linecomment">;; 2. Call `font-lock-fontify-buffer'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Same as `pp-display-expression' definition in `pp+.el'.</span>
<span class="linecomment">;;</span>
(defun icicle-pp-display-expression (expression out-buffer-name)
  "<span class="quote">Prettify and show EXPRESSION in a way appropriate to its length.
If a temporary buffer is needed for representation, it is named
OUT-BUFFER-NAME.</span>"
  (let* ((old-show-function  temp-buffer-show-function)
         <span class="linecomment">;; Use this function to display the buffer.</span>
         <span class="linecomment">;; This function either decides not to display it at all</span>
         <span class="linecomment">;; or displays it in the usual way.</span>
         (temp-buffer-show-function
          `(lambda (buf)
            (with-current-buffer buf
              (goto-char (point-min))
              (end-of-line 1)
              (if (or (&lt; (1+ (point)) (point-max))
                      (&gt;= (- (point) (point-min)) (frame-width)))
                  (let ((temp-buffer-show-function  ',old-show-function)
                        (old-selected               (selected-window))
                        (window                     (display-buffer buf)))
                    (goto-char (point-min)) <span class="linecomment">; expected by some hooks ...</span>
                    (make-frame-visible (window-frame window))
                    (unwind-protect
                         (progn (select-window window)
                                (run-hooks 'temp-buffer-show-hook))
                      (when (window-live-p old-selected) (select-window old-selected))
                      (message "<span class="quote">Evaluating...done.  See buffer `%s'.</span>"
                               out-buffer-name)))
                (message "<span class="quote">%s</span>" (buffer-substring (point-min) (point))))))))
    (with-output-to-temp-buffer out-buffer-name
      (pp expression)
      (with-current-buffer standard-output
        (setq buffer-read-only  nil)
        <span class="linecomment">;; Avoid `let'-binding because `change-major-mode-hook' is local.</span>
        <span class="linecomment">;; IOW, avoid this runtime message:</span>
        <span class="linecomment">;; "Making change-major-mode-hook buffer-local while locally let-bound!"</span>
        <span class="linecomment">;; Suggestion from Stefan M.: Can just set these hooks instead of binding,</span>
        <span class="linecomment">;; because they are not permanent-local.  They'll be emptied and</span>
        <span class="linecomment">;; repopulated as needed by the call to emacs-lisp-mode.</span>
        (set (make-local-variable 'emacs-lisp-mode-hook) nil)
        (set (make-local-variable 'change-major-mode-hook) nil)
        (emacs-lisp-mode)
        (set (make-local-variable 'font-lock-verbose) nil)
        (font-lock-fontify-buffer)))))

(defun icicle-shell-command-on-file (file)
  "<span class="quote">Read a shell command and invoke it, passing FILE as an argument.</span>"
  (dired-run-shell-command
   (dired-shell-stuff-it (icicle-read-shell-command (format "<span class="quote">! on `%s': </span>" file)) (list file) nil)))

<span class="linecomment">;;;###autoload (autoload 'icicle-recompute-shell-command-candidates "icicles")</span>
(defun icicle-recompute-shell-command-candidates (&optional savep)
  "<span class="quote">Update option `icicle-shell-command-candidates-cache'.
Recompute the available shell commands using your search path.
Return the new option value.
With a prefix argument, the updated option is saved persistently.

If the value of option `icicle-guess-commands-in-path' is not `load',
then turning on Icicle mode (again) resets the cache value to ().
If the value of `icicle-guess-commands-in-path' is `first-use', then
the cache is updated when you next use it, but it is not saved.</span>"
  (interactive "<span class="quote">P</span>")
  (setq icicle-shell-command-candidates-cache  (icicle-compute-shell-command-candidates))
  (when savep (funcall icicle-customize-save-variable-function
                       'icicle-shell-command-candidates-cache
                       icicle-shell-command-candidates-cache))
  icicle-shell-command-candidates-cache)


<span class="linecomment">;; REPLACE ORIGINAL `comint-completion-at-point' defined in `comint.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-comint-completion-at-point "icicles")</span>
(when (&gt; emacs-major-version 23)
  (defalias 'icicle-comint-completion-at-point 'icicle-comint-dynamic-complete))


<span class="linecomment">;; REPLACE ORIGINAL `comint-dynamic-complete' defined in `comint.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Use Icicles completion when there are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-comint-dynamic-complete "icicles")</span>
(defun icicle-comint-dynamic-complete () <span class="linecomment">; Bound to `TAB' in Comint (and Shell) mode.</span>
  "<span class="quote">Dynamically perform completion at point.
Calls the functions in `comint-dynamic-complete-functions', but with
Icicles functions substituted, to perform completion until a function
returns non-nil.  Return that value.</span>"
  (interactive)
  <span class="linecomment">;; Need a symbol for `run-hook-with-args-until-success', so bind one.</span>
  (let ((hook  (icicle-comint-replace-orig-completion-fns)))
    (run-hook-with-args-until-success 'hook)))

(defun icicle-comint-replace-orig-completion-fns ()
  "<span class="quote">Return `comint-dynamic-complete-functions', but with Icicles functions.
Get the Icicles functions from option
`icicle-comint-dynamic-complete-replacements'.

Only one (the first matching) replacement is made for any function.</span>"
  (let ((result        ())
	(replacements  (copy-sequence icicle-comint-dynamic-complete-replacements)))
    (dolist (fn  comint-dynamic-complete-functions)
      (catch 'c-d-c-f-replacements-loop
	(dolist (rep  replacements)
	  (when (or (eq (car rep) fn)
		    (and (listp (car rep))  (memq fn (car rep))))
	    (push (eval (cadr rep)) result)
	    (unless (eq (car rep) fn)  (push fn result))
	    (setq replacements  (delete rep replacements)) <span class="linecomment">; For ((a b c) 'NEW), put NEW in front of only one.</span>
	    (throw 'c-d-c-f-replacements-loop nil))) <span class="linecomment">; Allow only one replacement.</span>
	(push fn result)))
    (nreverse result)))

<span class="linecomment">;;;###autoload (autoload 'icicle-comint-dynamic-complete-filename "icicles")</span>
(defun icicle-comint-dynamic-complete-filename (&optional replace-to-eol-p)
  "<span class="quote">Dynamically complete the file name before point, using Icicles completion.
Similar to `comint-replace-by-expanded-filename', except that this
does not change parts of the file name already in the buffer before
point.  It just appends completion characters at point.

Return t if successful, nil otherwise.

With a prefix arg, replace the rest of the line after point with the
completion choice.  Otherwise, replace only the filename-matching text
before point.

Completion is dependent on the value of `comint-completion-addsuffix',
`comint-completion-recexact' and `comint-completion-fignore', and the
timing of completions listing is dependent on the value of
`comint-completion-autolist'.  See also
`comint-match-partial-filename' and
`icicle-comint-dynamic-complete-as-filename'.</span>"
  (interactive "<span class="quote">P</span>")
  (require 'comint)
  (when (comint-match-partial-filename)
    (unless (window-minibuffer-p (selected-window)) (message "<span class="quote">Completing file name...</span>"))
    (icicle-comint-dynamic-complete-as-filename replace-to-eol-p)))

(defun icicle-comint-dynamic-complete-as-filename (&optional replace-to-eol-p)
  "<span class="quote">Dynamically complete at point as a filename.
Optional arg REPLACE-TO-EOL-P non-nil means replace the rest of the
line after point with the completion choice.
Return t if successful.
See `icicle-comint-dynamic-complete-filename'.</span>"
  (lexical-let* ((completion-ignore-case         (if (boundp 'read-file-name-completion-ignore-case)
                                                     read-file-name-completion-ignore-case
                                                   (memq system-type '(ms-dos windows-nt cygwin))))
                 (completion-ignored-extensions  comint-completion-fignore)
                 (minibuffer-p                   (window-minibuffer-p (selected-window)))
                 (success                        t)
                 (dirsuffix                      (cond ((not comint-completion-addsuffix)         "<span class="quote"></span>")
                                                       ((not (consp comint-completion-addsuffix)) "<span class="quote">/</span>")
                                                       (t  (car comint-completion-addsuffix))))
                 (filesuffix                     (cond ((not comint-completion-addsuffix)         "<span class="quote"></span>")
                                                       ((not (consp comint-completion-addsuffix)) "<span class="quote"> </span>")
                                                       (t  (cdr comint-completion-addsuffix))))
                 (filename                       (comint-match-partial-filename))
                 (filename-beg                   (if filename (match-beginning 0) (point)))
                 (filename-end                   (if filename
                                                     (if replace-to-eol-p
                                                         (line-end-position)
                                                       (match-end 0))
                                                   (point)))
                 (filename                       (or filename  "<span class="quote"></span>"))
                 (filedir                        (file-name-directory filename))
                 (filenondir                     (file-name-nondirectory filename))
                 (directory                      (if filedir (comint-directory filedir) default-directory))
                 (completion                     (file-name-completion filenondir directory)))
    (cond ((null completion)
           (if minibuffer-p
               (minibuffer-message (format "<span class="quote"> [No completions of `%s']</span>" filename))
             (message "<span class="quote">No completions of `%s'</span>" filename))
           (setq success  nil))
          ((eq completion t)            <span class="linecomment">; Already completed: "the-file".</span>
           (insert filesuffix)
           (unless minibuffer-p (message "<span class="quote">Sole completion</span>")))
          ((string-equal completion "<span class="quote"></span>") <span class="linecomment">; A directory: "dir/" - complete it.</span>
           (icicle-condition-case-no-debug nil
               (let* ((icicle-show-Completions-initially-flag      t)
                      (icicle-incremental-completion-p             'display)
                      (icicle-top-level-when-sole-completion-flag  t)
                      (choice
                       (save-excursion
                         (save-window-excursion (read-file-name "<span class="quote">Complete: </span>" directory nil t)))))
                 (when (and choice  (not (string= choice directory)))
                   (insert (comint-quote-filename
                            (directory-file-name (file-relative-name choice directory))))
                   (insert (if (file-directory-p choice) dirsuffix filesuffix))
                   (when replace-to-eol-p (delete-region (point) (line-end-position)))))
             (error nil)))
          (t                            <span class="linecomment">; COMPLETION is the common prefix string.</span>
           (let ((file            (concat (file-name-as-directory directory) completion))
                 (use-dialog-box  nil)) <span class="linecomment">; Inhibit use of open-file dialog box if called from menu.</span>
             <span class="linecomment">;; Insert completion.  The completion string might have a different case from</span>
             <span class="linecomment">;; what's in the prompt, if `read-file-name-completion-ignore-case' is non-nil.</span>
             (delete-region filename-beg filename-end)
             (if filedir (insert (comint-quote-filename filedir)))
             (insert (comint-quote-filename (directory-file-name completion)))
             (cond ((symbolp (file-name-completion completion directory))
                    <span class="linecomment">;; We inserted a unique completion.  Add suffix.</span>
                    (insert (if (file-directory-p file) dirsuffix filesuffix))
                    (unless minibuffer-p (message "<span class="quote">Completed</span>")))
                   ((and comint-completion-recexact  comint-completion-addsuffix
                         (string-equal filenondir completion)
                         (or (icicle-file-remote-p file) <span class="linecomment">; Don't let Tramp try to access it.</span>
                             (file-exists-p file)))
                    <span class="linecomment">;; It's not unique, but user wants shortest match.</span>
                    (insert (if (file-directory-p file) dirsuffix filesuffix))
                    (unless minibuffer-p (message "<span class="quote">Completed shortest</span>")))
                   <span class="linecomment">;; It's not unique.  Let user choose a completion.</span>
                   ((or comint-completion-autolist  (string-equal filenondir completion))
                    (icicle-condition-case-no-debug nil
                        (let* ((icicle-show-Completions-initially-flag      t)
                               (icicle-incremental-completion-p             'display)
                               (icicle-top-level-when-sole-completion-flag  t)
                               (choice
                                (save-excursion
                                  (save-window-excursion
                                    (read-file-name
                                     "<span class="quote">Complete: </span>" directory completion nil completion
                                     (and (&gt; emacs-major-version 21)
                                          (lambda (f) (string-match completion f)))))))) <span class="linecomment">; FREE: COMPLETION.</span>
                          (when choice
                            (delete-backward-char (length completion))
                            (insert (comint-quote-filename
                                     (directory-file-name (file-relative-name choice directory))))
                            (insert (if (file-directory-p choice) dirsuffix filesuffix))))
                      (error nil)))
                   (t (unless minibuffer-p (message "<span class="quote">Partially completed</span>")))))))
    success))

<span class="linecomment">;;;###autoload (autoload 'icicle-shell-dynamic-complete-command "icicles")</span>
(defun icicle-shell-dynamic-complete-command ()
  "<span class="quote">Dynamically complete the command at point.
Similar to `icicle-comint-dynamic-complete-filename', but this
searches `exec-path' (minus the trailing Emacs library path) for
completion candidates.  Note that this may not be the same as the
shell's idea of the path.

Completion is dependent on the value of `shell-completion-execonly',
plus those that effect file completion.
See `icicle-shell-dynamic-complete-as-command'.

Returns t if successful.

Uses Icicles completion.</span>"
  (interactive)
  (let ((filename  (comint-match-partial-filename)))
    (if (and filename
             (save-match-data (not (string-match "<span class="quote">[~/]</span>" filename)))
             (eq (match-beginning 0) (save-excursion (shell-backward-command 1) (point))))
        (prog2 (unless (window-minibuffer-p (selected-window))
                 (message "<span class="quote">Completing command name...</span>"))
            (icicle-shell-dynamic-complete-as-command)))))

(defun icicle-shell-dynamic-complete-as-command ()
  "<span class="quote">Dynamically complete text at point as a command.
See `icicle-shell-dynamic-complete-filename'.
Return t if successful.</span>"
  (let* ((filename       (or (comint-match-partial-filename)  "<span class="quote"></span>"))
         (filenondir     (file-name-nondirectory filename))
         (path-dirs      (cdr (reverse exec-path)))
         (cwd            (file-name-as-directory (expand-file-name default-directory)))
         (ignored-extensions
          (and comint-completion-fignore
               (mapconcat (lambda (x) (concat (regexp-quote x) "<span class="quote">$</span>"))  comint-completion-fignore "<span class="quote">\\|</span>")))
         (dir            "<span class="quote"></span>")
         (comps-in-dir   ())
         (file           "<span class="quote"></span>")
         (abs-file-name  "<span class="quote"></span>")
         (completions    ()))
    (while path-dirs                    <span class="linecomment">; Go thru each dir in the search path, finding completions.</span>
      (setq dir           (file-name-as-directory (comint-directory (or (car path-dirs)  "<span class="quote">.</span>")))
            comps-in-dir  (and (file-accessible-directory-p dir)
                               (file-name-all-completions filenondir dir)))
      (while comps-in-dir               <span class="linecomment">; Go thru each completion, to see whether it should be used.</span>
        (setq file           (car comps-in-dir)
              abs-file-name  (concat dir file))
        (when (and (not (member file completions))
                   (not (and ignored-extensions  (string-match ignored-extensions file)))
                   (or (string-equal dir cwd)  (not (file-directory-p abs-file-name)))
                   (or (null shell-completion-execonly)  (file-executable-p abs-file-name)))
          (setq completions  (cons file completions)))
        (setq comps-in-dir  (cdr comps-in-dir)))
      (setq path-dirs  (cdr path-dirs)))
    (let ((success  (let ((comint-completion-addsuffix  nil)
                          (icicle-candidate-help-fn
                           (lambda (cand)
                             (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
                               (princ (shell-command-to-string (concat "<span class="quote">apropos </span>"
                                                                       (shell-quote-argument cand))))))))
                      (icicle-comint-dynamic-simple-complete filenondir completions))))
      (when (and (memq success '(sole shortest))  comint-completion-addsuffix
                 (not (file-directory-p (comint-match-partial-filename))))
        (insert "<span class="quote"> </span>"))
      success)))

<span class="linecomment">;;;###autoload (autoload 'icicle-comint-replace-by-expanded-filename "icicles")</span>
(defun icicle-comint-replace-by-expanded-filename (&optional replace-to-eol-p)
  "<span class="quote">Dynamically complete, expand, and canonicalize the filename at point.
With a prefix arg, replace everthing past point on the current line.
Otherwise, replace only the filename-matching text before point.

Like vanilla `comint-replace-by-expanded-filename', but uses Icicles
completion.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((filename  (comint-match-partial-filename)))
    (when filename
      (replace-match (expand-file-name filename) t t)
      (icicle-comint-dynamic-complete-filename replace-to-eol-p))))

(defun icicle-comint-dynamic-simple-complete (stub candidates)
  "<span class="quote">Dynamically complete STUB from CANDIDATES list.
Inserts completion characters at point by completing STUB from the
strings in CANDIDATES.  Uses Icicles completion if completion is
ambiguous.

Returns nil if no completion was inserted.
Returns `sole' if completed with the only completion match.
Returns `shortest' if completed with the shortest of the completion matches.
Returns `partial' if completed as far as possible with the completion matches.
Returns `listed' if a completion listing was shown.

See also `icicle-comint-dynamic-complete-filename'.</span>"
  (let* ((completion-ignore-case  (memq system-type '(ms-dos windows-nt cygwin)))
         (minibuffer-p            (window-minibuffer-p (selected-window)))
         (suffix                  (cond ((not comint-completion-addsuffix)         "<span class="quote"></span>")
                                        ((not (consp comint-completion-addsuffix)) "<span class="quote"> </span>")
                                        (t  (cdr comint-completion-addsuffix))))
         (candidates              (mapcar #'list candidates))
         (completions             (all-completions stub candidates)))
    (cond ((null completions)
           (if minibuffer-p
               (minibuffer-message (format "<span class="quote"> [No completions of `%s']</span>" stub))
             (message "<span class="quote">No completions of `%s'</span>" stub))
           nil)
          ((= 1 (length completions))
           (let ((completion  (car completions)))
             (if (string-equal completion stub)
                 (unless minibuffer-p (message "<span class="quote">Sole completion</span>"))
               (insert (substring completion (length stub)))
               (unless minibuffer-p (message "<span class="quote">Completed</span>")))
             (insert suffix)
             'sole))
          (t                            <span class="linecomment">; There's no unique completion.</span>
           (let ((completion  (try-completion stub candidates)))
             <span class="linecomment">;; Insert the longest substring.</span>
             (insert (substring completion (length stub)))
             (cond ((and comint-completion-recexact  comint-completion-addsuffix
                         (string-equal stub completion)
                         (member completion completions))
                    (insert suffix)     <span class="linecomment">; User wants shortest match.</span>
                    (unless minibuffer-p (message "<span class="quote">Completed shortest</span>"))
                    'shortest)
                   ((or comint-completion-autolist  (string-equal stub completion))
                    (icicle-condition-case-no-debug nil <span class="linecomment">;  Let user choose a completion.</span>
                        (let* ((icicle-show-Completions-initially-flag      t)
                               (icicle-incremental-completion-p             'display)
                               (icicle-top-level-when-sole-completion-flag  t)
                               (choice (save-excursion
                                         (completing-read "<span class="quote">Complete: </span>" (mapcar #'list completions)
                                                          nil t nil nil completion))))
                          (when choice
                            (delete-backward-char (length completion))
                            (insert choice suffix)))
                      (error nil))
                    'listed)
                   (t
                    (unless minibuffer-p (message "<span class="quote">Partially completed</span>"))
                    'partial)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-shell-dynamic-complete-filename "icicles")</span>
(defun icicle-shell-dynamic-complete-filename ()
  "<span class="quote">Dynamically complete the filename at point.
Completes only if point is at a suitable position for a filename
argument.</span>"
  (interactive)
  (let ((opoint  (point))
        (beg     (comint-line-beginning-position)))
    (when (save-excursion
            (goto-char (if (re-search-backward "<span class="quote">[;|&]</span>" beg t) (match-end 0) beg))
            (re-search-forward "<span class="quote">[^ \t][ \t]</span>" opoint t))
      (icicle-comint-dynamic-complete-as-filename))))

<span class="linecomment">;;;###autoload (autoload 'icicle-shell-dynamic-complete-environment-variable "icicles")</span>
(defun icicle-shell-dynamic-complete-environment-variable ()
  "<span class="quote">`shell-dynamic-complete-environment-variable' but uses Icicles completion.</span>"
  (interactive)
  (require 'shell)
  (let ((variable  (shell-match-partial-variable)))
    (if (and variable  (string-match "<span class="quote">^\\$</span>" variable))
        (prog2 (unless (window-minibuffer-p (selected-window))
                 (message "<span class="quote">Completing variable name...</span>"))
            (icicle-shell-dynamic-complete-as-environment-variable)))))

(defun icicle-shell-dynamic-complete-as-environment-variable ()
  "<span class="quote">`shell-dynamic-complete-as-environment-variable' but uses Icicles completion.</span>"
  (require 'shell)
  (let* ((var                          (or (shell-match-partial-variable)  "<span class="quote"></span>"))
         (variable                     (substring var (or (string-match "<span class="quote">[^$({]\\|$</span>" var)  0)))
         (variables                    (mapcar (lambda (x) (substring x 0 (string-match "<span class="quote">=</span>" x)))
                                               process-environment))
         (addsuffix                    comint-completion-addsuffix)
         (comint-completion-addsuffix  nil)
         (success                      (icicle-comint-dynamic-simple-complete variable variables)))
    (if (memq success '(sole shortest))
        (let* ((var           (shell-match-partial-variable))
               (variable      (substring var (string-match "<span class="quote">[^$({]</span>" var)))
               (protection    (cond ((string-match "<span class="quote">{</span>" var)                                    "<span class="quote">}</span>")
                                    ((string-match "<span class="quote">(</span>" var)                                    "<span class="quote">)</span>")
                                    (t                                                         "<span class="quote"></span>")))
               (suffix        (cond ((null addsuffix)                                          "<span class="quote"></span>")
                                    ((file-directory-p (comint-directory (getenv variable)))   "<span class="quote">/</span>")
                                    (t                                                         "<span class="quote"> </span>"))))
          (insert protection  suffix)))
    success))


<span class="linecomment">;; Save vanilla `file' widget as `icicle-ORIG-file' widget, for restoring when you quit Icicle mode.</span>
(unless (get 'icicle-ORIG-file 'widget-type)
  (put 'icicle-ORIG-file 'widget-type (get 'file 'widget-type))
  (put 'icicle-ORIG-file 'widget-documentation (get 'file 'widget-documentation)))

<span class="linecomment">;;;###autoload</span>
(define-widget 'icicle-file 'string
  "<span class="quote">Icicles version of the `file' widget.
Reads a file name from an editable text field, with Icicles completion.</span>"
  <span class="linecomment">;; `icicle-widget-file-complete' handles both nil and non-nil `icicle-mode'.</span>
  <span class="linecomment">;; Use the following instead of:</span>
  <span class="linecomment">;;   :completions #'completion-file-name-table</span>
  :complete-function #'icicle-widget-file-complete
  :prompt-value 'widget-file-prompt-value
  :format "<span class="quote">%{%t%}: %v</span>"
  <span class="linecomment">;; Vanilla Emacs comment: This does not work well with terminating newline.</span>
  <span class="linecomment">;;                        :value-face 'widget-single-line-field</span>
  :tag "<span class="quote">File</span>")

<span class="linecomment">;;;###autoload (autoload 'icicle-widget-file-complete "icicles")</span>
(defun icicle-widget-file-complete (&optional replace-to-eol-p)
  "<span class="quote">Perform Icicles completion on the file name at point.
Like `widget-file-complete' (`widget-complete', for Emacs 24+), but
allows Icicles completion.

With a prefix arg, replace everthing past point on the current line.
Otherwise, replace only the filename-matching text before point.</span>"
  (interactive "<span class="quote">P</span>")
  (if (and (boundp 'icicle-mode)  icicle-mode)
      (let ((comint-completion-addsuffix  nil)) <span class="linecomment">; Do not append a space.</span>
        (icicle-comint-dynamic-complete-filename replace-to-eol-p))
    (cond ((&gt; emacs-major-version 23)
           <span class="linecomment">;; Vanilla Emacs 24+ `file' widget just has this:</span>
           <span class="linecomment">;;   :completions #'completion-file-name-table</span>
           <span class="linecomment">;; But we need the equivalent using `:complete-function', not `:completions'.</span>
           <span class="linecomment">;; This is it - this is in fact the Emacs 23 `widget-file-complete'.</span>
           <span class="linecomment">;; See `widget-default-completions' for the relations between keywords</span>
           <span class="linecomment">;; `:completions' and `:complete-function'.</span>
           (let* ((field  (widget-field-find (point)))
                  (start  (widget-field-start field))
                  (end    (max (point) (widget-field-text-end field))))
             (completion-in-region start end #'completion-file-name-table)))
          (t
           (widget-file-complete)))))

<span class="linecomment">;;;###autoload (autoload 'icicle-ess-complete-object-name "icicles")</span>
(defun icicle-ess-complete-object-name (&optional listcomp)
  "<span class="quote">`ess-complete-object-name', but uses Icicles completion.
Complete `ess-language' object preceding point.
This is `icicle-ess-R-complete-object-name' if `ess-use-R-completion',
and `icicle-ess-internal-complete-object-name' otherwise.</span>"
  (interactive "<span class="quote">P</span>")
  (if ess-use-R-completion
      (icicle-ess-R-complete-object-name)
    (icicle-ess-internal-complete-object-name listcomp)))

<span class="linecomment">;;;###autoload (autoload 'icicle-ess-internal-complete-object-name "icicles")</span>
(defun icicle-ess-internal-complete-object-name (&optional listcomp)
  "<span class="quote">`ess-internal-complete-object-name', but uses Icicles completion.
Complete `ess-language' object preceding point.</span>"
  (interactive "<span class="quote">P</span>")
  (ess-make-buffer-current)
  (if (memq (char-syntax (preceding-char)) '(?w ?_))
      (let* ((comint-completion-addsuffix  nil)
             (end                          (point))
             (buffer-syntax                (syntax-table))
             (beg                          (unwind-protect
                                                (save-excursion
                                                  (set-syntax-table ess-mode-syntax-table)
                                                  (backward-sexp 1)
                                                  (point))
                                             (set-syntax-table buffer-syntax)))
             (full-prefix                  (buffer-substring beg end))
             (pattern                      full-prefix)
             (listname                  <span class="linecomment">; See if we're indexing a list with `$'</span>
              (and (string-match "<span class="quote">\\(.+\\)\\$\\(\\(\\sw\\|\\s_\\)*\\)$</span>" full-prefix)
                   (setq pattern  (if (not (match-beginning 2))
                                      "<span class="quote"></span>"
                                    (substring full-prefix (match-beginning 2) (match-end 2))))
                   (substring full-prefix (match-beginning 1) (match-end 1))))
             (classname                 <span class="linecomment">; Are we trying to get a slot via `@' ?</span>
              (and (string-match "<span class="quote">\\(.+\\)@\\(\\(\\sw\\|\\s_\\)*\\)$</span>" full-prefix)
                   (setq pattern  (if (not (match-beginning 2))
                                      "<span class="quote"></span>"
                                    (substring full-prefix (match-beginning 2) (match-end 2))))
                   (progn (ess-write-to-dribble-buffer (format "<span class="quote">(ess-C-O-Name : slots..) : patt=%s</span>"
                                                               pattern))
                          (substring full-prefix (match-beginning 1) (match-end 1)))))
             (components
              (if listname
                  (ess-object-names listname)
                (if classname
                    (ess-slot-names classname)
                  <span class="linecomment">;; Default case: It hangs here when options (error=recoves):</span>
                  (ess-get-object-list ess-current-process-name)))))
        <span class="linecomment">;; Return non-nil to prevent history expansions</span>
        (or (icicle-comint-dynamic-simple-complete  pattern components)  'none))))

(defun icicle-ess-complete-filename ()
  "<span class="quote">`ess-complete-filename', but uses Icicles completion.
Do file completion only within strings, or when `!' call is used.</span>"
  (if (comint-within-quotes
       (1- (process-mark (get-buffer-process (current-buffer)))) (point))
      (progn (if (featurep 'xemacs)
                 (icicle-comint-dynamic-complete-filename) <span class="linecomment">; Work around XEmacs bug.  GNU Emacs and</span>
               (icicle-comint-replace-by-expanded-filename)) <span class="linecomment">; a working XEmacs return t in a string</span>
             t)))

<span class="linecomment">;;;###autoload (autoload 'icicle-ess-R-complete-object-name "icicles")</span>
(defun icicle-ess-R-complete-object-name ()
  "<span class="quote">`ess-R-complete-object-name', but uses Icicles completion.
Completion in R.</span>"
  (interactive)
  (ess-make-buffer-current)
  (let* ((comint-completion-addsuffix  nil)
         (bol                          (save-excursion (comint-bol nil) (point)))
         (eol                          (line-end-position))
         (line-buffer                  (buffer-substring bol eol))
         (NS                           (if (ess-current-R-at-least '2.7.0)
                                           "<span class="quote">utils:::</span>"
                                         "<span class="quote">rcompgen:::</span>"))
         (token-string                  <span class="linecomment">; Setup, including computation of the token</span>
          (progn
            (ess-command (format (concat NS "<span class="quote">.assignLinebuffer('%s')\n</span>") line-buffer))
            (ess-command (format (concat NS "<span class="quote">.assignEnd(%d)\n</span>") (- (point) bol)))
            (car (ess-get-words-from-vector (concat NS "<span class="quote">.guessTokenFromLine()\n</span>")))))
         (possible-completions          <span class="linecomment">; Compute and retrieve possible completions</span>
          (progn
            (ess-command (concat NS "<span class="quote">.completeToken()\n</span>"))
            (ess-get-words-from-vector (concat NS "<span class="quote">.retrieveCompletions()\n</span>")))))
    (or (icicle-comint-dynamic-simple-complete token-string possible-completions)  'none)))

<span class="linecomment">;;;###autoload (autoload 'icicle-gud-gdb-complete-command "icicles")</span>
(defun icicle-gud-gdb-complete-command (&optional command a b)
  "<span class="quote">`gud-gdb-complete-command', but uses Icicles completion.
Perform completion on the GDB command preceding point.</span>"
  (interactive)
  (if command
      (setq command  (concat "<span class="quote">p </span>" command)) <span class="linecomment">; Used by gud-watch in mini-buffer.</span>
    (let ((end  (point)))               <span class="linecomment">; Used in GUD buffer.</span>
      (setq command  (buffer-substring (comint-line-beginning-position) end))))
  (let* ((command-word
          <span class="linecomment">;; Find the word break.  This match will always succeed.</span>
          (and (string-match "<span class="quote">\\(\\`\\| \\)\\([^ ]*\\)\\'</span>" command)
               (substring command (match-beginning 2))))
         (complete-list
          (gud-gdb-run-command-fetch-lines (concat "<span class="quote">complete </span>" command)
                                           (current-buffer)
                                           <span class="linecomment">;; From string-match above.</span>
                                           (match-beginning 2))))
    <span class="linecomment">;; Protect against old versions of GDB.</span>
    (and complete-list
         (string-match "<span class="quote">^Undefined command: \"complete\"</span>" (car complete-list))
         (error "<span class="quote">This version of GDB doesn't support the `complete' command</span>"))
    <span class="linecomment">;; Sort the list like readline.</span>
    (setq complete-list  (sort complete-list (function string-lessp)))
    <span class="linecomment">;; Remove duplicates.</span>
    (let ((first   complete-list)
          (second  (cdr complete-list)))
      (while second
        (if (string-equal (car first) (car second))
            (setcdr first (setq second  (cdr second)))
          (setq first   second
                second  (cdr second)))))
    <span class="linecomment">;; Add a trailing single quote if there is a unique completion</span>
    <span class="linecomment">;; and it contains an odd number of unquoted single quotes.</span>
    (and (= (length complete-list) 1)
         (let ((str    (car complete-list))
               (pos    0)
               (count  0))
           (while (string-match "<span class="quote">\\([^'\\]\\|\\\\'\\)*'</span>" str pos)
             (setq count  (1+ count)
                   pos    (match-end 0)))
           (and (= (mod count 2) 1)
                (setq complete-list  (list (concat str "<span class="quote">'</span>"))))))
    <span class="linecomment">;; Let comint handle the rest.</span>
    (icicle-comint-dynamic-simple-complete command-word complete-list)))


<span class="linecomment">;; REPLACE ORIGINAL `dabbrev-completion' defined in `dabbrev.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You can complete from an empty abbrev also.</span>
<span class="linecomment">;; Uses Icicles completion when there are multiple candidates.</span>
<span class="linecomment">;;</span>
(when (and (fboundp 'dabbrev-completion)  (not (fboundp 'icicle-ORIG-dabbrev-completion)))
  (defalias 'icicle-ORIG-dabbrev-completion (symbol-function 'dabbrev-completion)))

<span class="linecomment">;;;###autoload (autoload 'icicle-dabbrev-completion "icicles")</span>
(defun icicle-dabbrev-completion (&optional arg) <span class="linecomment">; Bound to `C-M-/' globally.</span>
  "<span class="quote">Completion on current word.
Like \\[dabbrev-expand], but finds all expansions in the current buffer
and presents suggestions for completion.

With a prefix argument, it searches all buffers accepted by
`dabbrev-friend-buffer-function', to find the completions.

If the prefix argument is 16 (which comes from `C-u C-u'), then it
searches *ALL* buffers.

With no prefix argument, it reuses an old completion list
if there is a suitable one already.</span>"
  (interactive "<span class="quote">*P</span>")
  (unless (featurep 'dabbrev)
    (unless (require 'dabbrev nil t) (error "<span class="quote">Library `dabbrev' not found</span>"))
    (icicle-mode 1))                    <span class="linecomment">; Redefine `dabbrev-completion' to Icicles version.</span>
  (dabbrev--reset-global-variables)
  (let* ((dabbrev-check-other-buffers  (and arg  t)) <span class="linecomment">; Must be t</span>
         (dabbrev-check-all-buffers    (and arg  (= (prefix-numeric-value arg) 16)))
         (abbrev                       (icicle-dabbrev--abbrev-at-point))
         (ignore-case-p                (and (if (eq dabbrev-case-fold-search 'case-fold-search)
                                                case-fold-search
                                              dabbrev-case-fold-search)
                                            (or (not dabbrev-upcase-means-case-search)
                                                (string= abbrev (downcase abbrev)))))
         (my-obarray                   dabbrev--last-obarray)
         init)
    <span class="linecomment">;; If new abbreviation to expand, then expand it.</span>
    (save-excursion
      (unless (and (null arg)
                   my-obarray
                   (or (eq dabbrev--last-completion-buffer (current-buffer))
                       (and (window-minibuffer-p (selected-window))
                            (eq dabbrev--last-completion-buffer (dabbrev--minibuffer-origin))))
                   dabbrev--last-abbreviation
                   (&gt;= (length abbrev) (length dabbrev--last-abbreviation))
                   (string= dabbrev--last-abbreviation
                            (substring abbrev 0 (length dabbrev--last-abbreviation)))
                   (setq init  (try-completion abbrev my-obarray)))
        (setq dabbrev--last-abbreviation  abbrev)
        (let ((completion-list         (dabbrev--find-all-expansions abbrev ignore-case-p))
              (completion-ignore-case  ignore-case-p))
          <span class="linecomment">;; Make an obarray with all expansions</span>
          (setq my-obarray  (make-vector (length completion-list) 0))
          (unless (&gt; (length my-obarray) 0)
            (error "<span class="quote">No dynamic expansion for \"%s\" found%s</span>" abbrev
                   (if dabbrev--check-other-buffers "<span class="quote"></span>" "<span class="quote"> in this-buffer</span>")))
          (dolist (string  completion-list)
            (cond ((or (not ignore-case-p)  (not dabbrev-case-replace))
                   (intern string my-obarray))
                  ((string= abbrev (icicle-upcase abbrev))
                   (intern (icicle-upcase string) my-obarray))
                  ((string= (substring abbrev 0 1) (icicle-upcase (substring abbrev 0 1)))
                   (intern (capitalize string) my-obarray))
                  (t (intern (downcase string) my-obarray))))
          (setq dabbrev--last-obarray            my-obarray
                dabbrev--last-completion-buffer  (current-buffer)
                <span class="linecomment">;; Find the expanded common string.</span>
                init                             (try-completion abbrev my-obarray)))))
    <span class="linecomment">;; Let the user choose between the expansions</span>
    (unless (stringp init) (setq init  abbrev))
    (cond
      ((and (not (string-equal init "<span class="quote"></span>"))
            (not (string-equal (downcase init) (downcase abbrev)))
            (&lt;= (length (all-completions init my-obarray)) 1))
       (message "<span class="quote">Completed (no other completions)</span>")
       (if (&lt; emacs-major-version 21)
           (dabbrev--substitute-expansion nil abbrev init)
         (dabbrev--substitute-expansion nil abbrev init nil))
       (when (window-minibuffer-p (selected-window)) (message nil)))
<span class="linecomment">;;$$       ;; Complete text only up through the common root. NOT USED.</span>
<span class="linecomment">;;       ((and icicle-dabbrev-stop-at-common-root-p</span>
<span class="linecomment">;;             (not (string-equal init ""))</span>
<span class="linecomment">;;             (not (string-equal (downcase init) (downcase abbrev))))</span>
<span class="linecomment">;;        (message "Use `%s' again to complete further"</span>
<span class="linecomment">;;                 (icicle-key-description (this-command-keys) nil icicle-key-descriptions-use-&lt;&gt;-flag))</span>
<span class="linecomment">;;        (if (&lt; emacs-major-version 21)</span>
<span class="linecomment">;;            (dabbrev--substitute-expansion nil abbrev init)</span>
<span class="linecomment">;;          (dabbrev--substitute-expansion nil abbrev init nil))</span>
<span class="linecomment">;;        (when (window-minibuffer-p (selected-window)) (message nil))) ; $$ NEEDED?</span>
      (t
       <span class="linecomment">;; String is a common root already.  Use Icicles completion.</span>
       (icicle-highlight-lighter)
       (message "<span class="quote">Making completion list...</span>")
       (search-backward abbrev)
       (replace-match "<span class="quote"></span>")
       (condition-case nil
           (let* ((icicle-show-Completions-initially-flag  t)
                  (icicle-incremental-completion-p         'display)
                  (minibuffer-completion-table             my-obarray)
                  (choice
                   (completing-read "<span class="quote">Complete: </span>" my-obarray nil nil init nil init)))
             (when choice (insert choice)))
         (quit (insert abbrev)))))))

(defun icicle-dabbrev--abbrev-at-point ()
  "<span class="quote">Like `dabbrev--abbrev-at-point', but returns \"\" if there is no match.
Vanilla `dabbrev--abbrev-at-point' raises an error if no match.</span>"
  (let ((abv "<span class="quote"></span>"))
    (setq dabbrev--last-abbrev-location  (point)) <span class="linecomment">; Record the end of the abbreviation.</span>
    (unless (bobp)
      (save-excursion                   <span class="linecomment">; Return abbrev at point</span>
        <span class="linecomment">;; If we aren't right after an abbreviation, move point back to just after one.</span>
        <span class="linecomment">;; This is so the user can get successive words by typing the punctuation followed by M-/.</span>
        (save-match-data
          (when (and (save-excursion
                       (forward-char -1)
                       (not (looking-at
                             (concat "<span class="quote">\\(</span>" (or dabbrev-abbrev-char-regexp  "<span class="quote">\\sw\\|\\s_</span>") "<span class="quote">\\)+</span>"))))
                     (re-search-backward (or dabbrev-abbrev-char-regexp  "<span class="quote">\\sw\\|\\s_</span>") nil t))
            (forward-char 1)))
        (dabbrev--goto-start-of-abbrev) <span class="linecomment">; Now find the beginning of that one.</span>
        (setq abv  (buffer-substring-no-properties dabbrev--last-abbrev-location (point)))))
    abv))


<span class="linecomment">;; REPLACE ORIGINAL `bbdb-complete-mail' defined in `bbdb-com.el', version 3.02</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; BBDB Version 3.02, the Insidious Big Brother Database, is available here: http://melpa.milkbox.net/.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses Icicles completion when there are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Free vars here: `bbdb-*' are bound in `bbdb-com.el'.</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bbdb-complete-mail "icicles")</span>
(defun icicle-bbdb-complete-mail (&optional start-pos cycle-completion-buffer)
  "<span class="quote">In a mail buffer, complete the user name or mail address before point.
Completes up to the preceding newline, colon or comma, or the value of
START-POS.
Returns non-nil if there is a valid completion, else return nil.
You can control completion behaviour using `bbdb-completion-list'
\(`bbdb-completion-type' in older BBDB versions).

If what has been typed is unique, insert an entry \"User Name
&lt;mail-address&gt;\" - but see `bbdb-mail-allow-redundancy'
\(`bbdb-dwim-net-address-allow-redundancy' in older BBDB versions).
If it is a valid completion but not unique, you can choose from the
list of completions using Icicles completion.

If your input is completed and `bbdb-complete-mail-allow-cycling' is
true (`bbdb-complete-name-allow-cycling' for older BBDB versions),
you can repeat to cycle through the nets for the matching record.

When called with a prefix arg, display a list of all mail messages
available for cycling.

See your version of BBDB for more information.</span>"
  (interactive (list nil current-prefix-arg))
  (unless (and (require 'bbdb nil t)  (require 'bbdb-com nil t)
               (fboundp 'bbdb-complete-mail))
    (error "<span class="quote">`icicle-bbdb-complete-mail' requires a BBDB version such as 3.02</span>"))
  (bbdb-buffer)                         <span class="linecomment">; Make sure database is initialized.</span>
  (lexical-let* ((end                     (point))
                 (beg                     (or start-pos  (save-excursion
                                                           (re-search-backward "<span class="quote">\\(\\`\\|[\n:,]\\)[ \t]*</span>")
                                                           (goto-char (match-end 0)) (point))))
                 (orig                    (buffer-substring beg end))
                 (typed                   (downcase orig))
                 (pattern                 (bbdb-string-trim typed))
                 (completion-ignore-case  t)
                 (completion              (try-completion pattern bbdb-hashtable #'bbdb-completion-predicate))
                 (all-the-completions     ())
                 dwim-completions  one-record  done)
    <span class="linecomment">;; [:,] match would be interpreted as START-POS (e.g., a comma in LF-NAME).  Compensate.</span>
    (when (and (stringp completion)  (string-match "<span class="quote">[:,]</span>" completion))
      (setq completion  (substring completion 0 (match-beginning 0))))
    <span class="linecomment">;; Cannot use `all-completions' to set `all-the-completions' because it converts symbols to strings.</span>
    (all-completions pattern bbdb-hashtable (lambda (sym)
                                              (when (bbdb-completion-predicate sym)
                                                (push sym all-the-completions))))
    <span class="linecomment">;; Resolve records matching pattern.  Multiple completions could match the same record.</span>
    (let ((records  (icicle-delete-dups (apply #'append (mapcar #'symbol-value all-the-completions)))))
      (setq one-record  (and (not (cdr records))  (car records)))) <span class="linecomment">; Only one matching record.</span>
    (icicle-remove-Completions-window)
    (cond (one-record
           <span class="linecomment">;; Only one matching record.</span>
           <span class="linecomment">;; Determine mail address of ONE-RECORD to use for ADDRESS.</span>
           <span class="linecomment">;; Do we have a preferential order for the following tests?</span>
           (let ((completion-list  (if (eq t bbdb-completion-list)
                                       '(fl-name lf-name mail aka organization)
                                     bbdb-completion-list))
                 (mails            (bbdb-record-mail one-record))
                 mail elt)
             (unless mails (error "<span class="quote">Matching record has no `mail' field</span>"))
             <span class="linecomment">;; (1) If PATTERN matches name, AKA, or organization of ONE-RECORD,</span>
             <span class="linecomment">;;     then ADDRESS is the first mail address of ONE-RECORD.</span>
             (if (try-completion pattern (append (and (memq 'fl-name completion-list)
                                                      (list (or (bbdb-record-name one-record)  "<span class="quote"></span>")))
                                                 (and (memq 'lf-name completion-list)
                                                      (list (or (bbdb-record-name-lf one-record)  "<span class="quote"></span>")))
                                                 (and (memq 'aka completion-list)
                                                      (bbdb-record-field one-record 'aka-all))
                                                 (and (memq 'organization completion-list)
                                                      (bbdb-record-organization one-record))))
                 (setq mail  (car mails)))
             <span class="linecomment">;; (2) If PATTERN matches one or multiple mail addresses of ONE-RECORD,</span>
             <span class="linecomment">;;     then we take the first one matching PATTERN.</span>
             (unless mail (while (setq elt  (pop mails))
                            (if (try-completion pattern (list elt))
                                (setq mail   elt
                                      mails  ()))))
             (unless mail (error "<span class="quote">ICICLE-BBDB-COMPLETE-MAIL: No match for `%s'</span>" pattern)) <span class="linecomment">; Indicates a bug!</span>
             (let ((address  (bbdb-dwim-mail one-record mail)))
               (if (string= address (buffer-substring-no-properties beg end))
                   (unless (and bbdb-complete-mail-allow-cycling  (&lt; 1 (length (bbdb-record-mail one-record))))
                     (setq done  'UNCHANGED))
                 (delete-region beg end) <span class="linecomment">; Replace text with expansion.</span>
                 (insert address)
                 (bbdb-complete-mail-cleanup address)
                 (setq done  'UNIQUE)))))
          <span class="linecomment">;; Completed partially.</span>
          <span class="linecomment">;; Cannot use trimmed version of pattern here, else recurse infinitely on, e.g., common first names.</span>
          ((and (stringp completion)  (not (string= typed completion)))
           (delete-region beg end)
           (insert completion)
           (setq done  'PARTIAL))
          <span class="linecomment">;; Partial match not allowing further partial completion.</span>
          (completion
           (let ((completion-list  (if (eq t bbdb-completion-list)
                                       '(fl-name lf-name mail aka organization)
                                     bbdb-completion-list))
                 sname  records)
             <span class="linecomment">;; Collect dwim-addresses for each completion, but only once for each record!</span>
             <span class="linecomment">;; Add if mail is part of the completions.</span>
             (dolist (sym  all-the-completions)
               (setq sname  (symbol-name sym))
               (dolist (record  (symbol-value sym))
                 (unless (memq record records)
                   (push record records)
                   (let ((mails  (bbdb-record-mail record))
                         accept)
                     (when mails
                       (dolist (field  completion-list)
                         (if (case field
                               (fl-name (bbdb-string= sname (bbdb-record-name record)))
                               (lf-name (bbdb-string= sname (bbdb-cache-lf-name (bbdb-record-cache record))))
                               (aka (member-ignore-case sname (bbdb-record-field record 'aka-all)))
                               (organization (member-ignore-case sname (bbdb-record-organization record)))
                               (primary (bbdb-string= sname (car mails)))
                               (otherwise nil))
                             (push (car mails) accept)
                           (when (eq field 'mail)
                             (dolist (mail  mails)
                               (when (bbdb-string= sname mail) (push mail accept))))))
                       (when accept
                         <span class="linecomment">;; If DWIM-COMPLETIONS contains only one element, set DONE to `UNIQUE' (see below)</span>
                         <span class="linecomment">;;  and we want to know ONE-RECORD.</span>
                         (setq one-record  record)
                         (dolist (mail  (delete-dups accept))
                           (push (bbdb-dwim-mail record mail) dwim-completions))))))))
             (cond ((not dwim-completions) (error "<span class="quote">No mail address for \"%s\"</span>" orig))
                   <span class="linecomment">;; DWIM-COMPLETIONS might contain only one element, if multiple completions match the</span>
                   <span class="linecomment">;; same record.  In that case proceed with DONE set to `UNIQUE'.</span>
                   ((eq 1 (length dwim-completions))
                    (delete-region beg end)
                    (insert (car dwim-completions))
                    (bbdb-complete-mail-cleanup (car dwim-completions))
                    (setq done  'UNIQUE))
                   (t
                    (setq done  'CHOOSE))))))
    <span class="linecomment">;; If no completion so far, consider cycling.</span>
    <span class="linecomment">;; Completion is controlled by option `bbdb-completion-list'.  Cycling assumes that ORIG already holds</span>
    <span class="linecomment">;; a valid RFC 822 mail address.  So cycling can consider different records than completion.</span>
    (when (and (not done)  bbdb-complete-mail-allow-cycling)
      <span class="linecomment">;; Find the record we are working on.</span>
      (let* ((address  (mail-extract-address-components orig))
             (record   (and (listp address)  (car (bbdb-message-search (nth 0 address) (nth 1 address)))))
             (mails    (and record  (bbdb-record-mail record))))
        (when mails
          <span class="linecomment">;; Cycle, even if MAILS has only one address. `bbdb-dwim-mail' can give something different.</span>
          <span class="linecomment">;; E.g., header "JOHN SMITH &lt;FOO@BAR.COM&gt;" can be replaced by "John Smith &lt;foo@bar.com&gt;".</span>
          (cond ((and (= 1 (length mails))  (string= (bbdb-dwim-mail record (car mails))
                                                     (buffer-substring-no-properties beg end)))
                 (setq done  'UNCHANGED))
                (cycle-completion-buffer <span class="linecomment">; Use completion buffer.</span>
                 (setq dwim-completions  (mapcar (lambda (n) (bbdb-dwim-mail record n)) mails)
                       done              'CHOOSE))
                (t                      <span class="linecomment">; Use next mail</span>
                 (let ((mail  (or (nth 1 (or (icicle-member-ignore-case (nth 1 address) mails)
                                             (icicle-member-ignore-case orig mails)))
                                  (nth 0 mails))))
                   (delete-region beg end) <span class="linecomment">; Replace with new mail address</span>
                   (insert (bbdb-dwim-mail record mail))
                   (setq done  'CYCLE)))))))
    (when (eq done 'CHOOSE)
      <span class="linecomment">;; Icicles completion.  `completion-in-region' does not work here as `dwim-completions' is not a</span>
      <span class="linecomment">;; collection for completion in the usual sense.  It is really a list of replacements.</span>
      (unless (eq (selected-window) (minibuffer-window)) (message "<span class="quote">Making completion list...</span>"))
      (icicle-condition-case-no-debug nil
          (let* ((icicle-show-Completions-initially-flag      t)
                 (icicle-incremental-completion-p             'display)
                 (icicle-top-level-when-sole-completion-flag  t)
                 (completion-ignore-case                      t)
                 (choice
                  (save-excursion (completing-read "<span class="quote">Complete: </span>" (mapcar #'list dwim-completions)
                                                   nil t pattern nil pattern))))
            (when choice
              (delete-region beg end)
              (insert choice)))
        (error nil))
      (unless (eq (selected-window) (minibuffer-window)) (message "<span class="quote">Making completion list...done</span>")))
    done))


<span class="linecomment">;; REPLACE ORIGINAL `bbdb-complete-name' defined in `bbdb-com.el' version 2.35,</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Version 2.35 is an older version of BBDB, the Insidious Big Brother Database, available here:</span>
<span class="linecomment">;;       http://bbdb.sourceforge.net/.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses Icicles completion when there are multiple candidates.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Free vars here: `bbdb-*' are bound in `bbdb-com.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bbdb-complete-name "icicles")</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Avoid a byte-compile error if user has already loaded BBDB version 3+.</span>
<span class="linecomment">;; The error has to do with `bbdb-records' being a defsubst that takes no args.</span>
(unless (eval-when-compile (and (featurep 'bbdb)  (not (string-lessp bbdb-version "<span class="quote">3</span>"))))
  (defun icicle-bbdb-complete-name (&optional start-pos)
    "<span class="quote">Complete the user full-name or net-address before point.
Completes only up to the preceding newline, colon, or comma, or the
value of START-POS.

If what has been typed is unique, insert an entry of the form \"User
Name &lt;net-addr&gt;\" (but see `bbdb-dwim-net-address-allow-redundancy').
If it is a valid completion but not unique, you can choose from the
list of completions using Icicles completion.

If your input is completed and `bbdb-complete-name-allow-cycling' is
true, then you can repeat to cycle through the nets for the matching
record.

When called with a prefix arg, display a list of all nets.  You can
control completion behaviour using `bbdb-completion-type'.</span>"
    (interactive)
    (unless (and (require 'bbdb nil t)  (require 'bbdb-com nil t)
                 (fboundp 'bbdb-complete-name))
      (error "<span class="quote">`icicle-bbdb-complete-name' requires a BBDB version such as 2.35</span>"))
    (lexical-let* ((end                  (point))
                   (beg                  (or start-pos  (save-excursion (re-search-backward
                                                                         "<span class="quote">\\(\\`\\|[\n:,]\\)[ \t]*</span>")
                                                                        (goto-char (match-end 0)) (point))))
                   (orig                 (buffer-substring beg end))
                   (typed                (downcase orig))
                   (pattern              (bbdb-string-trim typed))
                   <span class="linecomment">;; DADAMS -</span>
                   <span class="linecomment">;; Replaced `(bbdb-hashtable)' by its expansion (bbdb-with-db-buffer ... bbdb-hashtable),</span>
                   <span class="linecomment">;; to avoid the silly macro altogether and simplify user byte-compiling a little.</span>
                   (ht                   (bbdb-with-db-buffer (bbdb-records nil t) bbdb-hashtable))
                   <span class="linecomment">;; Make a list of possible completion strings (all-the-completions), and a flag to</span>
                   <span class="linecomment">;; indicate if there's a single matching record or not (only-one-p).</span>
                   (only-one-p           t)
                   (all-the-completions  ())
                   (pred
                    (lambda (sym)       <span class="linecomment">; FREE here: ALL-THE-COMPLETIONS, ONLY-ONE-P.</span>
                      (and (bbdb-completion-predicate sym)
                           (progn
                             (when (and only-one-p
                                        all-the-completions
                                        (or
                                         <span class="linecomment">;; Not sure about this. More than one record attached to the symbol?</span>
                                         <span class="linecomment">;; Does that happen?</span>
                                         (&gt; (length (symbol-value sym)) 1)
                                         <span class="linecomment">;; This is the doozy. Multiple syms which all match the same record.</span>
                                         (delete t (mapcar (lambda (x) <span class="linecomment">; FREE here: SYM.</span>
                                                             (equal (symbol-value x) (symbol-value sym)))
                                                           all-the-completions))))
                               (setq only-one-p  nil))
                             (if (memq sym all-the-completions)
                                 nil
                               (setq all-the-completions  (cons sym all-the-completions)))))))
                   (completion           (progn (all-completions pattern ht pred)
                                                (try-completion pattern ht)))
                   (exact-match          (eq completion t)))
      (cond
        <span class="linecomment">;; No matches found OR you're trying completion on an already-completed record.</span>
        <span class="linecomment">;; In the latter case, we might have to cycle through the nets for that record.</span>
        ((or (null completion)
             (and bbdb-complete-name-allow-cycling
                  exact-match           <span class="linecomment">; Which is a net of the record</span>
                  (member orig (bbdb-record-net (car (symbol-value (intern-soft pattern ht)))))))
         (bbdb-complete-name-cleanup)   <span class="linecomment">; Clean up the completion buffer, if it exists</span>
         (unless (catch 'bbdb-cycling-exit <span class="linecomment">; Check for cycling</span>
                   <span class="linecomment">;; Jump straight out if we're not cycling</span>
                   (unless bbdb-complete-name-allow-cycling (throw 'bbdb-cycling-exit nil))
                   <span class="linecomment">;; Find the record we're working on.</span>
                   (lexical-let* ((addr  (funcall bbdb-extract-address-components-func orig))
                                  (rec  (and (listp addr)
                                             <span class="linecomment">;; For now, we ignore the case where this returns more than</span>
                                             <span class="linecomment">;; one record.  Ideally, the last expansion would be stored</span>
                                             <span class="linecomment">;; in a buffer-local variable, perhaps.</span>
                                             (car (bbdb-search-intertwingle (caar addr)
                                                                            (car (cdar addr)))))))
                     (unless rec (throw 'bbdb-cycling-exit nil))
                     (if current-prefix-arg
                         <span class="linecomment">;; Use completion buffer</span>
                         (let ((standard-output  (get-buffer-create "<span class="quote">*Completions*</span>")))
                           <span class="linecomment">;; A previously existing buffer has to be cleaned first</span>
                           (with-current-buffer standard-output
                             (setq buffer-read-only  nil)
                             (erase-buffer))
                           (display-completion-list
                            (mapcar (lambda (n) (bbdb-dwim-net-address rec n)) <span class="linecomment">; FREE here: REC.</span>
                                    (bbdb-record-net rec)))
                           (delete-region beg end)
                           (switch-to-buffer standard-output))
                       <span class="linecomment">;; Use next address</span>
                       (let* ((addrs      (bbdb-record-net rec))
                              (this-addr  (or (cadr (member (car (cdar addr)) addrs))  (nth 0 addrs))))
                         (if (= (length addrs) 1)
                             (throw 'bbdb-cycling-exit t) <span class="linecomment">; No alternatives. don't signal an error.</span>
                           <span class="linecomment">;; Replace with new mail address</span>
                           (delete-region beg end)
                           (insert (bbdb-dwim-net-address rec this-addr))
                           (run-hooks 'bbdb-complete-name-hooks)
                           (throw 'bbdb-cycling-exit t))))))
           <span class="linecomment">;; FALL THROUGH.  Check mail aliases</span>
           (when (and (or (not bbdb-expand-mail-aliases)  (not (expand-abbrev)))  bbdb-complete-name-hooks)
             (message "<span class="quote">No completion for `%s'</span>" pattern) (icicle-ding)))) <span class="linecomment">; no matches</span>

        <span class="linecomment">;; Match for a single record. If cycling is enabled then we don't</span>
        <span class="linecomment">;; care too much about the exact-match part.</span>
        ((and only-one-p  (or exact-match  bbdb-complete-name-allow-cycling))
         (let* ((sym   (if exact-match (intern-soft pattern ht) (car all-the-completions)))
                (recs  (symbol-value sym))
                the-net match-recs lst primary matched)
           (while recs
             (when (bbdb-record-net (car recs))
               <span class="linecomment">;; Did we match on name?</span>
               (let ((b-r-name  (or (bbdb-record-name (car recs))  "<span class="quote"></span>")))
                 (if (string= pattern (substring (downcase b-r-name) 0
                                                 (min (length b-r-name) (length pattern))))
                     (setq match-recs  (cons (car recs) match-recs)
                           matched     t)))
               <span class="linecomment">;; Did we match on aka?</span>
               (unless matched
                 (setq lst  (bbdb-record-aka (car recs)))
                 (while lst
                   (if (string= pattern (substring (downcase (car lst)) 0
                                                   (min (length (downcase (car lst)))
                                                        (length pattern))))
                       (setq match-recs  (append match-recs (list (car recs)))
                             matched     t
                             lst         ())
                     (setq lst  (cdr lst)))))
               <span class="linecomment">;; Name didn't match name so check net matching</span>
               (unless matched
                 (setq lst      (bbdb-record-net (car recs))
                       primary  t)      <span class="linecomment">; primary wins over secondary...</span>
                 (while lst
                   (if (string= pattern (substring (downcase (car lst)) 0
                                                   (min (length (downcase (car lst)))
                                                        (length pattern))))
                       (setq the-net     (car lst)
                             lst         ()
                             match-recs  (if primary
                                             (cons (car recs) match-recs)
                                           (append match-recs (list (car recs))))))
                   (setq lst      (cdr lst)
                         primary  nil))))
             (setq recs     (cdr recs)  <span class="linecomment">; Next rec for loop.</span>
                   matched  nil))
           (unless match-recs (error "<span class="quote">Only exact matching record has net field</span>"))
           <span class="linecomment">;; Replace the text with the expansion</span>
           (delete-region beg end)
           (insert (bbdb-dwim-net-address (car match-recs) the-net))
           <span class="linecomment">;; If we're past fill-column, wrap at the previous comma.</span>
           (when (and (bbdb-auto-fill-function)  (&gt;= (current-column) fill-column))
             (let ((p  (point))
                   bol)
               (save-excursion
                 (setq bol  (line-beginning-position))
                 (goto-char p)
                 (when (search-backward "<span class="quote">,</span>" bol t) (forward-char 1) (insert "<span class="quote">\n   </span>")))))
           <span class="linecomment">;; Update the *BBDB* buffer if desired.</span>
           (when bbdb-completion-display-record
             (let ((bbdb-gag-messages  t))
               (bbdb-pop-up-bbdb-buffer)
               (bbdb-display-records-1 match-recs t)))
           (bbdb-complete-name-cleanup)
           <span class="linecomment">;; Call the exact-completion hook</span>
           (run-hooks 'bbdb-complete-name-hooks)))

        <span class="linecomment">;; Partial match.  Note: we can't use the trimmed version of the pattern here or</span>
        <span class="linecomment">;; we'll recurse infinitely on e.g. common first names.</span>
        ((and (stringp completion)  (not (string= typed completion)))
         (delete-region beg end)
         (insert completion)
         (setq end  (point))
         (let ((last                              "<span class="quote"></span>")
               (bbdb-complete-name-allow-cycling  nil))
           (while (and (stringp completion)  (not (string= completion last))
                       (setq last        completion
                             pattern     (downcase orig)
                             completion  (progn (all-completions pattern ht pred)
                                                (try-completion pattern ht))))
             (when (stringp completion) (delete-region beg end) (insert completion)))
           (bbdb-complete-name beg)))   <span class="linecomment">; RECURSE &lt;================</span>

        <span class="linecomment">;; Exact match, but more than one record</span>
        (t
         (unless (eq (selected-window) (minibuffer-window)) (message "<span class="quote">Making completion list...</span>"))
         (lexical-let (dwim-completions uniq nets net name akas)
           <span class="linecomment">;; Collect all the dwim-addresses for each completion, but only once for each record.</span>
           <span class="linecomment">;; Add if the net is part of the completions.</span>
           (bbdb-mapc (lambda (sym)
                        (bbdb-mapc
                         <span class="linecomment">;; FREE here: AKAS, ALL-THE-COMPLETIONS, DWIM-COMPLETIONS, HT,</span>
                         <span class="linecomment">;;            NAME, NET, NETS, SYM, UNIQ.</span>
                         (lambda (rec)
                           (unless (member rec uniq)
                             (setq uniq  (cons rec uniq)
                                   nets  (bbdb-record-net rec)
                                   name  (downcase (or (bbdb-record-name rec)  "<span class="quote"></span>"))
                                   akas  (mapcar 'downcase (bbdb-record-aka rec)))
                             (while nets
                               (setq net  (car nets))
                               (when (cond
                                       ((and (member bbdb-completion-type <span class="linecomment">; Primary</span>
                                                     '(primary primary-or-name))
                                             (member (intern-soft (downcase net) ht)
                                                     all-the-completions))
                                        (setq nets  ())
                                        t)
                                       ((and name (member bbdb-completion-type <span class="linecomment">; Name</span>
                                                          '(nil name primary-or-name))
                                             (let ((cname  (symbol-name sym)))
                                               (or (string= cname name)  (member cname akas))))
                                        (setq name  nil)
                                        t)
                                       ((and (member bbdb-completion-type '(nil net)) <span class="linecomment">; Net</span>
                                             (member (intern-soft (downcase net) ht) all-the-completions)))
                                       <span class="linecomment">;; (name-or-)primary</span>
                                       ((and (member bbdb-completion-type '(name-or-primary))
                                             (let ((cname  (symbol-name sym)))
                                               (or (string= cname name)  (member cname akas))))
                                        (setq nets  ())
                                        t))
                                 (setq dwim-completions
                                       (cons (bbdb-dwim-net-address rec net)
                                             dwim-completions))
                                 (when exact-match (setq nets  ())))
                               (setq nets  (cdr nets)))))
                         (symbol-value sym)))
                      all-the-completions)
           (cond ((and dwim-completions  (null (cdr dwim-completions))) <span class="linecomment">; Insert the unique match.</span>
                  (delete-region beg end) (insert (car dwim-completions)) (message "<span class="quote"></span>"))
                 (t                     <span class="linecomment">; More than one match.  Use Icicles minibuffer completion.</span>
                  (icicle-condition-case-no-debug nil
                      (let* ((icicle-show-Completions-initially-flag      t)
                             (icicle-incremental-completion-p             'display)
                             (icicle-top-level-when-sole-completion-flag  t)
                             (completion-ignore-case                      t)
                             (choice
                              (save-excursion
                                (completing-read "<span class="quote">Complete: </span>" (mapcar #'list dwim-completions)
                                                 nil t pattern nil pattern))))
                        (when choice
                          (delete-region beg end)
                          (insert choice)))
                    (error nil))
                  (unless (eq (selected-window) (minibuffer-window))
                    (message "<span class="quote">Making completion list...done</span>"))))))))))


<span class="linecomment">;; REPLACE ORIGINAL `lisp-complete-symbol' (&lt; Emacs 23.2),</span>
<span class="linecomment">;; defined in `lisp.el', saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Select `*Completions*' window even if on another frame.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'icicle-ORIG-lisp-complete-symbol)
  (defalias 'icicle-ORIG-lisp-complete-symbol (symbol-function 'lisp-complete-symbol)))

<span class="linecomment">;;;###autoload (autoload 'icicle-lisp-complete-symbol "icicles")</span>
(defun icicle-lisp-complete-symbol (&optional predicate) <span class="linecomment">; `M-TAB' (`C-M-i', `ESC-TAB'), globally.</span>
  "<span class="quote">Complete the Lisp symbol preceding point against known Lisp symbols.
If there is more than one completion, use the minibuffer to complete.

When called from a program, optional arg PREDICATE is a predicate
determining which symbols are considered, e.g. `commandp'.

If PREDICATE is nil, the context determines which symbols are
considered.  If the symbol starts just after an open-parenthesis, only
symbols with function definitions are considered.  Otherwise, all
symbols with function definitions, values or properties are
considered.</span>"
  (interactive)
  (let* ((end            (point))
         (buffer-syntax  (syntax-table))
         (beg            (unwind-protect
                              (save-excursion
                                (set-syntax-table emacs-lisp-mode-syntax-table)
                                (backward-sexp 1)
                                (while (= (char-syntax (following-char)) ?\') (forward-char 1))
                                (point))
                           (set-syntax-table buffer-syntax)))
         (pattern       (buffer-substring beg end))
         (new           (try-completion pattern obarray)))
    (unless (stringp new) (setq new  pattern))
    (delete-region beg end)
    (insert new)
    (setq end  (+ beg (length new)))
    (if (and (not (string= new "<span class="quote"></span>"))  (not (string= (downcase new) (downcase pattern)))
             (&lt; (length (all-completions new obarray)) 2))
        (message "<span class="quote">Completed (no other completions)</span>")
      <span class="linecomment">;; Use minibuffer to choose a completion.</span>
      (let* ((enable-recursive-minibuffers                (active-minibuffer-window))
             (icicle-top-level-when-sole-completion-flag  t)
             (icicle-orig-window                          (selected-window)) <span class="linecomment">; For alt actions.</span>
             (alt-fn                                      nil)
             (icicle-show-Completions-initially-flag      t)
             (icicle-candidate-alt-action-fn
              (or icicle-candidate-alt-action-fn  (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">symbol</span>"))))
             (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
              (or icicle-all-candidates-list-alt-action-fn alt-fn
                  (icicle-alt-act-fn-for-type "<span class="quote">symbol</span>")))
             (predicate
              (or predicate
                  (save-excursion
                    (goto-char beg)
                    (if (not (eq (char-before) ?\( ))
                        (lambda (sym) <span class="linecomment">;why not just nil ?   -sm</span>
                          (or (boundp sym)  (fboundp sym)  (symbol-plist sym)))
                      <span class="linecomment">;; If first element of parent list is not an open paren, assume that this is a</span>
                      <span class="linecomment">;; funcall position: use `fboundp'.  If not, then maybe this is a variable in</span>
                      <span class="linecomment">;; a `let' binding, so no predicate: use nil.</span>
                      (and (not (condition-case nil
                                    (progn (up-list -2) (forward-char 1) (eq (char-after) ?\( ))
                                  (error nil)))
                           'fboundp))))))
        <span class="linecomment">;; $$$$$ Could bind `icicle-must-pass-after-match-predicate' to a predicate on interned</span>
        <span class="linecomment">;;       candidate and pass nil as PRED to `completing-read'.  Don't bother for now.</span>
        (setq new  (save-excursion (completing-read "<span class="quote">Complete Lisp symbol: </span>"
                                                    obarray predicate t new)))))
    (delete-region beg end)
    (insert new)))


<span class="linecomment">;; REPLACE ORIGINAL `lisp-completion-at-point' (&gt;= Emacs 23.2),</span>
<span class="linecomment">;; defined in `lisp.el', saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Select `*Completions*' window even if on another frame.</span>
<span class="linecomment">;;</span>
(when (fboundp 'completion-at-point)    <span class="linecomment">; Emacs 23.2+.</span>
  (unless (fboundp 'icicle-ORIG-lisp-completion-at-point)
    (defalias 'icicle-ORIG-lisp-completion-at-point (symbol-function 'lisp-completion-at-point))
    <span class="linecomment">;; Return a function that does all of the completion.</span>
    (defun icicle-lisp-completion-at-point () #'icicle-lisp-complete-symbol)))

<span class="linecomment">;;;###autoload (autoload 'icicle-customize-icicles-group "icicles")</span>
(defun icicle-customize-icicles-group ()
  "<span class="quote">Customize Icicles options and faces.  View their documentation.</span>"
  (interactive)
  (customize-group-other-window 'Icicles))

<span class="linecomment">;;;###autoload (autoload 'icicle-send-bug-report "icicles")</span>
(defun icicle-send-bug-report ()
  "<span class="quote">Send a bug report about an Icicles problem.</span>"
  (interactive)
  (browse-url (format (concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=\
Icicles bug: \
&body=Describe bug below, using a precise recipe that starts with `emacs -Q' or `emacs -q'.  \
Each Icicles file has a header `Update #' that you can use to identify it.\
%%0A%%0AEmacs version: %s.</span>")
                      (emacs-version))))


<span class="linecomment">;; REPLACE ORIGINAL `customize-face-other-window' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Multi-command version.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'icicle-ORIG-customize-face-other-window)
  (defalias 'icicle-ORIG-customize-face-other-window (symbol-function 'customize-face-other-window)))

<span class="linecomment">;;;###autoload (autoload 'icicle-customize-face-other-window "icicles")</span>
(defun icicle-customize-face-other-window (face)
  "<span class="quote">Customize face FACE in another window.
Same as `icicle-customize-face' except it uses a different window.</span>"
  (interactive
   (list (let* ((icicle-multi-completing-p             t)
                (icicle-list-use-nth-parts             '(1))
                (icicle-candidate-action-fn
                 (lambda (x)
                   (icicle-ORIG-customize-face-other-window (intern (icicle-transform-multi-completion x)))
                   (select-window (minibuffer-window))
                   (select-frame-set-input-focus (selected-frame))))
                (icicle-all-candidates-list-action-fn  'icicle-customize-faces)
                (icicle-orig-window                    (selected-window)) <span class="linecomment">; For alt actions.</span>
                (alt-fn                                nil)
                (icicle-candidate-alt-action-fn
                 (or icicle-candidate-alt-action-fn
                     (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">face</span>"))))
                (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
                 (or icicle-all-candidates-list-alt-action-fn
                     alt-fn
                     (icicle-alt-act-fn-for-type "<span class="quote">face</span>"))))
           (if (and (&gt; emacs-major-version 21)  current-prefix-arg)
               (read-face-name "<span class="quote">Customize face: </span>" "<span class="quote">all faces</span>" t)
             (read-face-name "<span class="quote">Customize face: </span>")))))
  (icicle-ORIG-customize-face-other-window face))


<span class="linecomment">;; REPLACE ORIGINAL `customize-face' defined in `cus-edit.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Multi-command version.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'icicle-ORIG-customize-face)
  (defalias 'icicle-ORIG-customize-face (symbol-function 'customize-face)))

<span class="linecomment">;;;###autoload (autoload 'icicle-customize-face "icicles")</span>
(defun icicle-customize-face (face &optional other-window)
  "<span class="quote">Customize face FACE.  If OTHER-WINDOW is non-nil, use another window.
Input-candidate completion and cycling are available.  While cycling,
these keys with prefix `C-' are active\\&lt;minibuffer-local-completion-map&gt;:

`C-mouse-2', `C-RET' - Act on current completion candidate only
`C-down'  - Move to next completion candidate and act
`C-up'    - Move to previous completion candidate and act
`C-next'  - Move to next apropos-completion candidate and act
`C-prior' - Move to previous apropos-completion candidate and act
`C-end'   - Move to next prefix-completion candidate and act
`C-home'  - Move to previous prefix-completion candidate and act
`\\[icicle-all-candidates-list-action]'     - Act on *all* candidates (or all that are saved):
            Customize all in the same buffer.
`\\[icicle-all-candidates-action]'     - Act on *all* candidates (or all that are saved):
            Customize each in a separate buffer.

When candidate action and cycling are combined (e.g. `C-next'), option
`icicle-act-before-cycle-flag' determines which occurs first.

With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
`C-M-return', `C-M-down', and so on) provide help about candidates.

Use `mouse-2', `RET', or `S-RET' to finally choose a candidate,
or `C-g' to quit.

With a prefix argument, you can enter multiple faces at the same time
with a single `RET' (in Emacs 22 or later).  This gives you more or
less the `crm' completion behavior of `customize-face' in vanilla
Emacs.  Most Icicles completion features are still available, but
`TAB' performs `crm' completion, so it does not also cycle among
completion candidates.  You can, as always, use `down' to do that.

A advantage of using a prefix argument is that the default value is
the list of all faces under the cursor.  A disadvantage is that face
candidates are not WYSIWYG in buffer `*Completions*'.

This is an Icicles command - see command `icicle-mode'.</span>"
  (interactive
   (list (let* ((icicle-multi-completing-p             t)
                (icicle-list-use-nth-parts             '(1))
                (icicle-candidate-action-fn
                 (lambda (x)
                   (icicle-ORIG-customize-face (intern (icicle-transform-multi-completion x)))
                   (select-window (minibuffer-window))
                   (select-frame-set-input-focus (selected-frame))))
                (icicle-all-candidates-list-action-fn  'icicle-customize-faces)
                (icicle-orig-window                    (selected-window)) <span class="linecomment">; For alt actions.</span>
                (alt-fn                                nil)
                (icicle-candidate-alt-action-fn
                 (or icicle-candidate-alt-action-fn  (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">face</span>"))))
                (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
                 (or icicle-all-candidates-list-alt-action-fn
                     alt-fn
                     (icicle-alt-act-fn-for-type "<span class="quote">face</span>"))))
           (if (and (&gt; emacs-major-version 21)  current-prefix-arg)
               (read-face-name "<span class="quote">Customize face: </span>" "<span class="quote">all faces</span>" t)
             (read-face-name "<span class="quote">Customize face: </span>")))))
  (if other-window
      (if (&gt; emacs-major-version 23)
          (icicle-ORIG-customize-face face t)
        (icicle-ORIG-customize-face-other-window face))
    (icicle-ORIG-customize-face face)))

(defun icicle-customize-faces (faces)
  "<span class="quote">Open Customize buffer on all faces in list FACES.</span>"
  (let ((icicle-list-nth-parts-join-string  "<span class="quote">: </span>")
        (icicle-list-join-string            "<span class="quote">: </span>")
        <span class="linecomment">;; $$$$$$ (icicle-list-end-string   "")</span>
        (icicle-list-use-nth-parts          '(1)))
    (custom-buffer-create
     (custom-sort-items
      (mapcar (lambda (f) (list (intern (icicle-transform-multi-completion f)) 'custom-face))  faces)
      t custom-buffer-order-groups)
     "<span class="quote">*Customize Apropos*</span>")))

<span class="linecomment">;; Icicles replacement for `customize-apropos', defined in `cus-edit.el'.</span>
<span class="linecomment">;; 1. Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;; 2. Fixes Emacs bugs #11132, #11126.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-customize-apropos "icicles")</span>
(defun icicle-customize-apropos (pattern &optional type msgp)
  "<span class="quote">Customize all loaded user preferences matching PATTERN.
When prompted for the PATTERN, you can use completion against
preference names - e.g. `S-TAB'.  Instead of entering a pattern you
can then just hit `RET' to accept the list of matching preferences.
This lets you see which preferences will be available in the customize
buffer and dynamically change that list.

Interactively:

With no prefix arg, customize all matching preferences: groups, faces,
and options.  With a prefix arg, show those plus all matching
non-option variables in Customize (but you cannot actually customize
the latter).

Non-interactively:

If TYPE is `options', include only user options.
If TYPE is `faces', include only faces.
If TYPE is `groups', include only groups.
If TYPE is t, include variables that are not user options, as well as
 faces and groups.

PATTERN is a regexp.

Starting with Emacs 22, if PATTERN includes no regexp special chars
then it can alternatively be a list of \"words\" separated by spaces.
Two or more of the words are matched in different orders against each
preference name.  \"Word\" here really means a string of non-space
chars.

This handling of \"words\" is for compatibility with vanilla Emacs,
and is only approximative.  It can include \"matches\" that you do not
expect.  For better matching use Icicles progressive completion, i.e.,
separate the words (any strings, in fact, including regexps) using
`S-SPC', not just `SPC'.</span>"
  (interactive
   (let* ((pref-arg                                current-prefix-arg)
          (pred                                    `(lambda (s)
                                                     (unless (symbolp s)  (setq s  (intern s)))
                                                     (or (get s 'custom-group)
                                                      (custom-facep s)
                                                      (and (boundp s)
                                                       (or (get s 'saved-value)
                                                        (custom-variable-p s)
                                                        (if (null ',pref-arg)
                                                            (user-variable-p s)
                                                          (get s 'variable-documentation)))))))
          (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
          (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred)))
     (list (completing-read "<span class="quote">Customize (pattern): </span>" obarray (and icompletep  pred) nil nil 'regexp-history)
           pref-arg
           t)))
  (let ((found  ()))
    (when (and (&gt; emacs-major-version 21)  (require 'apropos nil t)
               (string= (regexp-quote pattern) pattern)
               (not (string= "<span class="quote"></span>" pattern)))
      (setq pattern  (split-string pattern "<span class="quote">[ \t]+</span>" 'OMIT-NULLS)))
    (when (fboundp 'apropos-parse-pattern) (apropos-parse-pattern pattern)) <span class="linecomment">; Emacs 22+</span>
    (when msgp (message "<span class="quote">Gathering apropos data for customize `%s'...</span>" pattern))
    (mapatoms `(lambda (symbol)         <span class="linecomment">; FREE here: APROPOS-REGEXP.</span>
                (when (string-match ,(if (&gt; emacs-major-version 21) apropos-regexp pattern)
                                    (symbol-name symbol))
                  (when (and (not (memq ,type '(faces options))) <span class="linecomment">; groups or t</span>
                             (get symbol 'custom-group))
                    (push (list symbol 'custom-group) found))
                  (when (and (not (memq ,type '(options groups))) <span class="linecomment">; faces or t</span>
                             (custom-facep symbol))
                    (push (list symbol 'custom-face) found))
                  (when (and (not (memq ,type '(groups faces))) <span class="linecomment">; options or t</span>
                             (boundp symbol)
                             (or (get symbol 'saved-value)
                                 (custom-variable-p symbol)
                                 (if (memq ,type '(nil options))
                                     (user-variable-p symbol)
                                   (get symbol 'variable-documentation))))
                    (push (list symbol 'custom-variable) found)))))
    (unless found
      (error "<span class="quote">No %s matching %s</span>" (if (eq type t)
                                     "<span class="quote">items</span>"
                                   (format "<span class="quote">%s</span>" (if (memq type '(options faces groups))
                                                    (symbol-name type)
                                                  "<span class="quote">customizable items</span>")))
             pattern))
    (custom-buffer-create (custom-sort-items found t custom-buffer-order-groups) "<span class="quote">*Customize Apropos*</span>")))

<span class="linecomment">;; Define this for Emacs 20 and 21</span>
(unless (fboundp 'custom-variable-p)
  (defun custom-variable-p (variable)
    "<span class="quote">Return non-nil if VARIABLE is a custom variable.</span>"
    (or (get variable 'standard-value)  (get variable 'custom-autoload))))

<span class="linecomment">;; Icicles replacement for `customize-apropos-faces', defined in `cus-edit.el'.</span>
<span class="linecomment">;; 1. Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;; 2. Fixes Emacs bug #11124.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-customize-apropos-faces "icicles")</span>
(defun icicle-customize-apropos-faces (pattern &optional msgp)
  "<span class="quote">Customize all loaded faces matching PATTERN.
See `icicle-customize-apropos'.</span>"
  (interactive
   (let* ((pred                                    (lambda (s)
                                                     (unless (symbolp s) (setq s  (intern s)))
                                                     (custom-facep s)))
          (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
          (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred)))
     (list (completing-read "<span class="quote">Customize faces (pattern): </span>" obarray (and icompletep  pred)
                            nil nil 'regexp-history)
           t)))
  (when msgp (message "<span class="quote">Gathering apropos data for customizing faces...</span>"))
  (customize-apropos pattern 'faces))

<span class="linecomment">;; Icicles replacement for `customize-apropos-groups', defined in `cus-edit.el'.</span>
<span class="linecomment">;; 1. Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;; 2. Fixes Emacs bug #11124.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-customize-apropos-groups "icicles")</span>
(defun icicle-customize-apropos-groups (pattern &optional msgp)
  "<span class="quote">Customize all loaded customize groups matching PATTERN.
See `icicle-customize-apropos'.</span>"
  (interactive
   (let* ((pred                                    (lambda (s)
                                                     (unless (symbolp s) (setq s  (intern s)))
                                                     (get s 'custom-group)))
          (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
          (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred)))
     (list (completing-read "<span class="quote">Customize groups (pattern): </span>" obarray (and icompletep  pred)
                            nil nil 'regexp-history)
           t)))
  (when msgp (message "<span class="quote">Gathering apropos data for customizing groups...</span>"))
  (customize-apropos pattern 'groups))

<span class="linecomment">;; Icicles replacement for `customize-apropos-options', defined in `cus-edit.el'.</span>
<span class="linecomment">;; 1. Uses `completing-read' to read the regexp.</span>
<span class="linecomment">;; 2. Fixes Emacs bugs #11124, #11128.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-customize-apropos-options "icicles")</span>
(defun icicle-customize-apropos-options (pattern &optional arg msgp)
  "<span class="quote">Customize all loaded user options matching PATTERN.
See `icicle-customize-apropos'.

With a prefix arg, include variables that are not user options as
completion candidates, and include also matching faces and groups in
the customize buffer.</span>"
  (interactive
   (let* ((pref-arg                                current-prefix-arg)
          (pred                                    `(lambda (s)
                                                     (unless (symbolp s) (setq s  (intern s)))
                                                     (and (boundp s)
                                                      (or (get s 'saved-value)
                                                       (custom-variable-p s)
                                                       (user-variable-p s)
                                                       (and ',pref-arg
                                                        (get s 'variable-documentation))))))
          (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
          (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred)))
     (list (completing-read "<span class="quote">Customize options (pattern): </span>" obarray (and icompletep  pred)
                            nil nil 'regexp-history)
           pref-arg
           t)))
  (when msgp (message "<span class="quote">Gathering apropos data for customizing options...</span>"))
  (customize-apropos pattern (or arg  'options)))

<span class="linecomment">;;;###autoload (autoload 'icicle-customize-apropos-options-of-type "icicles")</span>
(icicle-define-command icicle-customize-apropos-options-of-type
  "<span class="quote">Customize all loaded user options of a given type.
Enter patterns for the OPTION name and TYPE definition in the
minibuffer, separated by `icicle-list-join-string', which is \"^G^J\",
by default.  (`^G' here means the Control-g character, input using
`C-h C-g'.  Likewise, for `^J'.)

OPTION is a regexp that is matched against option names.

See `icicle-describe-option-of-type', which handles input and
completion similarly, for a full description of TYPE, matching, and
the use of a prefix argument.</span>"          <span class="linecomment">; Doc string</span>
  icicle-customize-apropos-opt-action   <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  'icicle-describe-opt-of-type-complete nil nil nil nil nil nil
  ((prompt                             "<span class="quote">OPTION `C-M-j' TYPE: </span>") <span class="linecomment">; Bindings</span>
   (icicle-multi-completing-p          t)
   (icicle-candidate-properties-alist  '((1 (face icicle-candidate-part))))
   <span class="linecomment">;; Bind `icicle-apropos-complete-match-fn' to nil to prevent automatic input matching</span>
   <span class="linecomment">;; in `icicle-unsorted-apropos-candidates' etc., because `icicle-describe-opt-of-type-complete'</span>
   <span class="linecomment">;; does everything.</span>
   (icicle-apropos-complete-match-fn   nil)
   (icicle-candidate-help-fn           'icicle-describe-opt-action)
   (icicle-pref-arg                    current-prefix-arg))
  (progn (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
         (icicle-highlight-lighter)
         (message "<span class="quote">Gathering user options and their types...</span>")))

(defun icicle-customize-apropos-opt-action (opt+type)
  "<span class="quote">Action function for `icicle-customize-apropos-options-of-type'.</span>"
  (let ((icicle-list-use-nth-parts  '(1)))
    (custom-buffer-create (custom-sort-items (mapcar (lambda (s) (list (intern s) 'custom-variable))
                                                     icicle-completion-candidates)
                                             t "<span class="quote">*Customize Apropos*</span>"))))

<span class="linecomment">;;;###autoload (autoload 'icicle-apropos "icicles")</span>
(defun icicle-apropos (pattern &optional do-all msgp)
  "<span class="quote">Describe Lisp symbols whose names match PATTERN.
By default, show symbols only if they are defined as functions,
variables, or faces, or if they have nonempty property lists.

With a prefix argument, or if `apropos-do-all' is non-nil, describe all
matching symbols.

Return a list of the symbols and descriptions.

Like command `apropos', but you can preview the list of matches using
`S-TAB'.  Function names are highlighted using face
`icicle-special-candidate'.

When prompted for the PATTERN, you can use completion against
preference names - e.g. `S-TAB'.  Instead of entering a pattern you
can then just hit `RET' to accept the list of matching preferences.
This lets you see which preferences will be available in the customize
buffer and dynamically change that list.

PATTERN is a regexp.

Starting with Emacs 22, if PATTERN includes no regexp special chars
then it can alternatively be a list of \"words\" separated by spaces.
Two or more of the words are matched in different orders against each
preference name.  \"Word\" here really means a string of non-space
chars.

This handling of \"words\" is for compatibility with vanilla Emacs,
and is only approximative.  It can include \"matches\" that you do not
expect.  For better matching use Icicles progressive completion, i.e.,
separate the words (any strings, in fact, including regexps) using
`S-SPC', not just `SPC'.</span>"
  (interactive
   (list
    (unwind-protect
         (progn
           (mapatoms (lambda (symb) (when (fboundp symb) (put symb 'icicle-special-candidate t))))
           (let ((icicle-fancy-candidates-p  t)
                 (icicle-candidate-alt-action-fn
                  (or icicle-candidate-alt-action-fn
                      (icicle-alt-act-fn-for-type "<span class="quote">symbol</span>")))
                 (icicle-all-candidates-list-alt-action-fn
                  (or icicle-all-candidates-list-alt-action-fn
                      (icicle-alt-act-fn-for-type "<span class="quote">symbol</span>"))))
             (completing-read "<span class="quote">Apropos symbol (regexp or words): </span>" obarray
                              nil nil nil 'regexp-history)))
      (mapatoms (lambda (symb) (put symb 'icicle-special-candidate nil))))
    current-prefix-arg
    t))
  (when (and (&gt; emacs-major-version 21)  (require 'apropos nil t)
             (string= (regexp-quote pattern) pattern)
             (not (string= "<span class="quote"></span>" pattern)))
    (setq pattern  (split-string pattern "<span class="quote">[ \t]+</span>" 'OMIT-NULLS)))
  (when (fboundp 'apropos-parse-pattern) (apropos-parse-pattern pattern)) <span class="linecomment">; Emacs 22+</span>
  (when msgp (message "<span class="quote">Gathering apropos data...</span>"))
  (apropos pattern do-all))

(cond
  <span class="linecomment">;; Use my versions of the `apropos*' commands, defined in `apropos-fn+var.el'.</span>
  <span class="linecomment">;; Note that unlike my versions of `apropos-option' and `apropos-command', the `icicle-'</span>
  <span class="linecomment">;; versions here do not respect `apropos-do-all': they always work with options and commands.</span>
  ((fboundp 'apropos-option)
   (defun icicle-apropos-variable (pattern &optional msgp)
     "<span class="quote">Show variables that match PATTERN.
This includes variables that are not user options.
User options are highlighted using face `icicle-special-candidate'.
You can see the list of matches with `S-TAB'.
See `icicle-apropos' for a description of PATTERN.</span>"
     (interactive
      (list
       (unwind-protect
            (progn
              (mapatoms (lambda (symb) (when (user-variable-p symb) (put symb 'icicle-special-candidate t))))
              (let* ((icicle-fancy-candidates-p  t)
                     (pred                                      (lambda (s)
                                                                  (unless (symbolp s) (setq s  (intern s)))
                                                                  (and (boundp s)
                                                                       (get s 'variable-documentation))))
                     (icompletep                                (and (boundp 'icomplete-mode)
                                                                     icomplete-mode))
                     (icicle-must-pass-after-match-predicate    (and (not icompletep)  pred))
                     (icicle-candidate-alt-action-fn            (or icicle-candidate-alt-action-fn
                                                                    (icicle-alt-act-fn-for-type "<span class="quote">variable</span>")))
                     (icicle-all-candidates-list-alt-action-fn  (or icicle-all-candidates-list-alt-action-fn
                                                                    (icicle-alt-act-fn-for-type "<span class="quote">variable</span>"))))
                (completing-read
                 (concat "<span class="quote">Apropos variable (regexp</span>" (and (&gt;= emacs-major-version 22)  "<span class="quote"> or words</span>")
                         "<span class="quote">): </span>")
                 obarray (and icompletep  pred) nil nil 'regexp-history)))
         (mapatoms (lambda (symb) (put symb 'icicle-special-candidate nil))))
       t))
     (when (and (&gt; emacs-major-version 21)  (require 'apropos nil t)
                (string= (regexp-quote pattern) pattern)
                (not (string= "<span class="quote"></span>" pattern)))
       (setq pattern  (split-string pattern "<span class="quote">[ \t]+</span>" 'OMIT-NULLS)))
     (when (fboundp 'apropos-parse-pattern) (apropos-parse-pattern pattern)) <span class="linecomment">; Emacs 22+</span>
     (when msgp (message "<span class="quote">Gathering data apropos variables...</span>"))
     (apropos-variable pattern))

   (defun icicle-apropos-option (pattern &optional msgp)
     "<span class="quote">Show user options (variables) that match PATTERN.
You can see the list of matches with `S-TAB'.
See `icicle-apropos' for a description of PATTERN.</span>"
     (interactive
      (let* ((pred                                    (lambda (s)
                                                        (unless (symbolp s) (setq s  (intern s)))
                                                        (user-variable-p s)))
             (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
             (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred)))
        (list (completing-read
               (concat "<span class="quote">Apropos user option (regexp</span>" (and (&gt;= emacs-major-version 22)  "<span class="quote"> or words</span>")
                       "<span class="quote">): </span>") obarray (and icompletep  pred) nil nil 'regexp-history)
              t)))
     (let ((apropos-do-all  nil)
           (icicle-candidate-alt-action-fn
            (or icicle-candidate-alt-action-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>")))
           (icicle-all-candidates-list-alt-action-fn
            (or icicle-all-candidates-list-alt-action-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>"))))
       (when (and (&gt; emacs-major-version 21)  (require 'apropos nil t)
                  (string= (regexp-quote pattern) pattern)
                  (not (string= "<span class="quote"></span>" pattern)))
         (setq pattern  (split-string pattern "<span class="quote">[ \t]+</span>" 'OMIT-NULLS)))
       (when (fboundp 'apropos-parse-pattern) (apropos-parse-pattern pattern)) <span class="linecomment">; Emacs 22+</span>
       (when msgp (message "<span class="quote">Gathering data apropos user options...</span>"))
       (apropos-option pattern)))

   (defun icicle-apropos-function (pattern &optional msgp)
     "<span class="quote">Show functions that match PATTERN.
This includes functions that are not commands.
Command names are highlighted using face `icicle-special-candidate'.
You can see the list of matches with `S-TAB'.
See `icicle-apropos' for a description of PATTERN.</span>"
     (interactive
      (list
       (unwind-protect
            (progn
              (mapatoms (lambda (symb) (when (commandp symb) (put symb 'icicle-special-candidate t))))
              (let* ((icicle-fancy-candidates-p               t)
                     (pred                                     (lambda (s)
                                                                 (unless (symbolp s) (setq s  (intern s)))
                                                                 (fboundp s)))
                     (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
                     (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred))
                     (icicle-candidate-alt-action-fn          (or icicle-candidate-alt-action-fn
                                                                  (icicle-alt-act-fn-for-type "<span class="quote">function</span>")))
                     (icicle-all-candidates-list-alt-action-fn  
                      (or icicle-all-candidates-list-alt-action-fn
                          (icicle-alt-act-fn-for-type "<span class="quote">function</span>"))))
                (completing-read
                 (concat "<span class="quote">Apropos function (regexp</span>" (and (&gt;= emacs-major-version 22)  "<span class="quote"> or words</span>")
                         "<span class="quote">): </span>") obarray (and icompletep  pred) nil nil 'regexp-history)))
         (mapatoms (lambda (symb) (put symb 'icicle-special-candidate nil))))
       t))
     (when (and (&gt; emacs-major-version 21)  (require 'apropos nil t)
                (string= (regexp-quote pattern) pattern)
                (not (string= "<span class="quote"></span>" pattern)))
       (setq pattern  (split-string pattern "<span class="quote">[ \t]+</span>" 'OMIT-NULLS)))
     (when (fboundp 'apropos-parse-pattern) (apropos-parse-pattern pattern)) <span class="linecomment">; Emacs 22+</span>
     (when msgp (message "<span class="quote">Gathering data apropos functions...</span>"))
     (apropos-function pattern))

   (defun icicle-apropos-command (pattern &optional msgp)
     "<span class="quote">Show commands (interactively callable functions) that match PATTERN.
You can see the list of matches with `S-TAB'.
See `icicle-apropos' for a description of PATTERN.</span>"
     (interactive
      (let* ((pred                                      (lambda (s)
                                                          (unless (symbolp s) (setq s  (intern s)))
                                                          (commandp s)))
             (icompletep                                (and (boundp 'icomplete-mode)  icomplete-mode))
             (icicle-must-pass-after-match-predicate    (and (not icompletep)  pred))
             (icicle-candidate-alt-action-fn            (or icicle-candidate-alt-action-fn
                                                            (icicle-alt-act-fn-for-type "<span class="quote">command</span>")))
             (icicle-all-candidates-list-alt-action-fn  (or icicle-all-candidates-list-alt-action-fn
                                                            (icicle-alt-act-fn-for-type "<span class="quote">command</span>"))))
        (list (completing-read
               (concat "<span class="quote">Apropos command (regexp</span>" (and (&gt;= emacs-major-version 22)  "<span class="quote"> or words</span>")
                       "<span class="quote">): </span>") obarray (and icompletep  pred) nil nil 'regexp-history)
              t)))
     (when (and (&gt; emacs-major-version 21)  (require 'apropos nil t)
                (string= (regexp-quote pattern) pattern)
                (not (string= "<span class="quote"></span>" pattern)))
       (setq pattern  (split-string pattern "<span class="quote">[ \t]+</span>" 'OMIT-NULLS)))
     (when (fboundp 'apropos-parse-pattern) (apropos-parse-pattern pattern)) <span class="linecomment">; Emacs 22+</span>
     (when msgp (message "<span class="quote">Gathering data apropos commands...</span>"))
     (let ((apropos-do-all  nil))  (apropos-command pattern))))

  <span class="linecomment">;; My versions are not available.  Use the vanilla Emacs versions of the `apropos...' commands.</span>
  (t
   (defun icicle-apropos-variable (pattern &optional do-all msgp)
     "<span class="quote">Show variables that match PATTERN.
You can see the list of matches with `S-TAB'.
See `icicle-apropos' for a description of PATTERN.

By default, only user options are candidates.  With optional prefix
DO-ALL, or if `apropos-do-all' is non-nil, all variables are
candidates.  In that case, the user-option candidates are highlighted
using face `icicle-special-candidate'.</span>"
     (interactive
      (list
       (unwind-protect
            (progn
              (unless (or (boundp 'apropos-do-all)  (require 'apropos nil t))
                (error "<span class="quote">Library `apropos' not found</span>"))
              (when (or current-prefix-arg  apropos-do-all)
                (mapatoms (lambda (symb)
                            (when (user-variable-p symb) (put symb 'icicle-special-candidate t)))))
              (let* ((icicle-fancy-candidates-p               (or current-prefix-arg  apropos-do-all))
                     (pred                                    (if (or current-prefix-arg  apropos-do-all)
                                                                  (lambda (s)
                                                                    (unless (symbolp s)
                                                                      (setq s  (intern s)))
                                                                    (and (boundp s)
                                                                         (get s 'variable-documentation)))
                                                                (lambda (s)
                                                                  (unless (symbolp s) (setq s  (intern s)))
                                                                  (user-variable-p s))))
                     (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
                     (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred))
                     (icicle-candidate-alt-action-fn          (or icicle-candidate-alt-action-fn
                                                                  (icicle-alt-act-fn-for-type
                                                                   (if icicle-fancy-candidates-p
                                                                       "<span class="quote">variable</span>"
                                                                     "<span class="quote">option</span>"))))
                     (icicle-all-candidates-list-alt-action-fn
                      (or icicle-all-candidates-list-alt-action-fn
                          (icicle-alt-act-fn-for-type (if icicle-fancy-candidates-p
                                                          "<span class="quote">variable</span>"
                                                        "<span class="quote">option</span>")))))
                (completing-read
                 (concat "<span class="quote">Apropos </span>" (if (or current-prefix-arg  apropos-do-all)
                                        "<span class="quote">variable</span>" "<span class="quote">user option</span>")
                         "<span class="quote"> (regexp</span>" (and (&gt;= emacs-major-version 22)  "<span class="quote"> or words</span>") "<span class="quote">): </span>")
                 obarray (and icompletep  pred) nil nil 'regexp-history)))
         (when (or current-prefix-arg  apropos-do-all)
           (mapatoms (lambda (symb) (put symb 'icicle-special-candidate nil)))))
       current-prefix-arg
       t))
     (when (and (&gt; emacs-major-version 21)  (require 'apropos nil t)
                (string= (regexp-quote pattern) pattern)
                (not (string= "<span class="quote"></span>" pattern)))
       (setq pattern  (split-string pattern "<span class="quote">[ \t]+</span>" 'OMIT-NULLS)))
     (when (fboundp 'apropos-parse-pattern) (apropos-parse-pattern pattern)) <span class="linecomment">; Emacs 22+</span>
     (when msgp (message (format "<span class="quote">Gathering data apropos %s...</span>" (if do-all "<span class="quote">variables</span>" "<span class="quote">options</span>"))))
     (apropos-variable pattern do-all))

   (defun icicle-apropos-command (pattern &optional do-all var-predicate msgp)
     "<span class="quote">Show commands (interactively callable functions) that match PATTERN.
You can see the list of matches with `S-TAB'.

See `icicle-apropos' for a description of PATTERN.

With \\[universal-argument] prefix, or if `apropos-do-all' is non-nil,
also show noninteractive functions.  In that case, the command
candidates are highlighted using face `icicle-special-candidate'.

If VAR-PREDICATE is non-nil, show only variables, and only those that
satisfy the predicate VAR-PREDICATE.

Non-interactively, a string PATTERN is used as a regexp, while a list
of strings is used as a word list.</span>"
     (interactive
      (list
       (unwind-protect
            (progn
              (unless (boundp 'apropos-do-all)
                (unless (require 'apropos nil t) (error "<span class="quote">Library `apropos' not found</span>")))
              (when (or current-prefix-arg  apropos-do-all)
                (mapatoms (lambda (symb) (when (commandp symb) (put symb 'icicle-special-candidate t)))))
              (let* ((icicle-fancy-candidates-p               (or current-prefix-arg  apropos-do-all))
                     (pred                                    (if current-prefix-arg
                                                                  (lambda (s)
                                                                    (unless (symbolp s)
                                                                      (setq s  (intern s)))
                                                                    (fboundp s))
                                                                (lambda (s)
                                                                  (unless (symbolp s) (setq s  (intern s)))
                                                                  (commandp s))))
                     (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
                     (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred))
                     (icicle-candidate-alt-action-fn           (or icicle-candidate-alt-action-fn
                                                                   (icicle-alt-act-fn-for-type
                                                                    (if icicle-fancy-candidates-p
                                                                        "<span class="quote">function</span>"
                                                                      "<span class="quote">command</span>"))))
                     (icicle-all-candidates-list-alt-action-fn
                      (or icicle-all-candidates-list-alt-action-fn
                          (icicle-alt-act-fn-for-type (if icicle-fancy-candidates-p
                                                          "<span class="quote">function</span>"
                                                        "<span class="quote">command</span>")))))
                (completing-read
                 (concat "<span class="quote">Apropos </span>" (if (or current-prefix-arg  apropos-do-all)
                                        "<span class="quote">command or function</span>" "<span class="quote">command</span>")
                         "<span class="quote"> (regexp</span>" (and (&gt;= emacs-major-version 22)  "<span class="quote"> or words</span>") "<span class="quote">): </span>")
                 obarray (and icompletep  pred) nil nil 'regexp-history)))
         (when (or current-prefix-arg  apropos-do-all)
           (mapatoms (lambda (symb) (put symb 'icicle-special-candidate nil)))))
       current-prefix-arg
       nil
       t))
     (when (and (&gt; emacs-major-version 21)  (require 'apropos nil t)
                (string= (regexp-quote pattern) pattern)
                (not (string= "<span class="quote"></span>" pattern)))
       (setq pattern  (split-string pattern "<span class="quote">[ \t]+</span>" 'OMIT-NULLS)))
     (when (fboundp 'apropos-parse-pattern) (apropos-parse-pattern pattern)) <span class="linecomment">; Emacs 22+</span>
     (when msgp (message (format "<span class="quote">Gathering data apropos %s...</span>" (if do-all "<span class="quote">functions</span>" "<span class="quote">commands</span>"))))
     (apropos-command pattern do-all var-predicate))))

<span class="linecomment">;;;###autoload (autoload 'icicle-apropos-options-of-type "icicles")</span>
(icicle-define-command icicle-apropos-options-of-type
  "<span class="quote">Show user options of a given type.
Enter patterns for the OPTION name and TYPE definition in the
minibuffer, separated by `icicle-list-join-string', which is \"^G^J\",
by default.  (`^G' here means the Control-g character, input using
`C-h C-g'.  Likewise, for `^J'.)

OPTION is a regexp that is matched against option names.

See also:
* `icicle-describe-option-of-type', which handles input and completion
  similarly, for a full description of TYPE, matching, and the use of
  a prefix argument
* `icicle-apropos-value', using `C-$' to filter to options only</span>" <span class="linecomment">; Doc string</span>
  icicle-apropos-opt-action             <span class="linecomment">; Action function</span>
  prompt                       <span class="linecomment">; `completing-read' args</span>
  'icicle-describe-opt-of-type-complete nil nil nil nil nil nil
  ((prompt                             "<span class="quote">OPTION `C-M-j' TYPE: </span>") <span class="linecomment">; Bindings</span>
   (icicle-multi-completing-p          t)
   (icicle-candidate-properties-alist  '((1 (face icicle-candidate-part))))
   <span class="linecomment">;; Bind `icicle-apropos-complete-match-fn' to nil to prevent automatic input matching</span>
   <span class="linecomment">;; in `icicle-unsorted-apropos-candidates' etc., because `icicle-describe-opt-of-type-complete'</span>
   <span class="linecomment">;; does everything.</span>
   (icicle-apropos-complete-match-fn   nil)
   (icicle-candidate-help-fn           'icicle-describe-opt-action)
   (icicle-pref-arg                    current-prefix-arg))
  (progn (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
         (icicle-highlight-lighter)
         (message "<span class="quote">Gathering user options and their types...</span>")))

(defun icicle-apropos-opt-action (opt+type)
  "<span class="quote">Action function for `icicle-apropos-options-of-type'.</span>"
  (let ((icicle-list-use-nth-parts  '(1)))
    (apropos-option (icicle-transform-multi-completion opt+type))))

<span class="linecomment">;;;###autoload (autoload 'icicle-apropos-zippy "icicles")</span>
(defun icicle-apropos-zippy (regexp)
  "<span class="quote">Show all Zippy quotes matching the regular-expression REGEXP.
Return the list of matches.</span>"
  (interactive (progn (unless (boundp 'yow-file)
                        (unless (require 'yow nil t) (error "<span class="quote">Library `yow' not found</span>")))
                      (cookie yow-file yow-load-message yow-after-load-message)
                      (let* ((case-fold-search     t)
                             (cookie-table-symbol  (intern yow-file cookie-cache))
                             (string-table         (symbol-value cookie-table-symbol))
                             (table                (nreverse (mapcar #'list string-table))))
                        (list (completing-read "<span class="quote">Apropos Zippy (regexp): </span>" table
                                               nil nil nil 'regexp-history)))))
  (let ((matches  (apropos-zippy icicle-current-input)))
    (when (interactive-p)
      (with-output-to-temp-buffer "<span class="quote">*Zippy Apropos*</span>"
        (while matches
          (princ (car matches))
          (setq matches  (cdr matches))
          (and matches  (princ "<span class="quote">\n\n</span>")))))
    matches))                           <span class="linecomment">; Return matching Zippyisms.</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-apropos-value "icicles")</span>
(icicle-define-command icicle-apropos-value
  "<span class="quote">Choose a variable, function, or other symbol description.
This is similar to vanilla command `apropos-value', but you can match
against the variable name and its printed value at the same time.

By default, each completion candidate is multi-completion composed of
a variable name plus its value.  They are separated by
`icicle-list-join-string' \(\"^G^J\", by default). 

With a prefix arg, candidates are different kinds of symbols:

 &lt; 0: functions and their defs (but byte-compiled defs are skipped)
 &gt; 0: symbols and their plists
 = 0: variables and their values, functions and their definitions, and
     other symbols and their plists

plain (`C-u'): use the last-computed (cached) set of candidates

You can use `C-$' during completion to toggle filtering the domain of
initial candidates according to the prefix argument, as follows:

none: only user options (+ values)
 &lt; 0: only commands (+ definitions)
 &gt; 0: only faces (+ plists)
 = 0: only options (+ values), commands (+ defs), faces (+ plists)

Remember that you can use \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-cycle-incremental-completion]' to toggle incremental completion.

See also:
* `icicle-apropos-vars-w-val-satisfying',
  `icicle-describe-vars-w-val-satisfying' - values satisfy a predicate
* `icicle-plist' - similar to this command with positive prefix arg
* `icicle-vardoc', `icicle-fundoc', `icicle-doc' - match name & doc
* `icicle-apropos-options-of-type', `icicle-describe-option-of-type' -
  match name & defcustom type</span>"
  icicle-doc-action                     <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (let ((cands  (and (consp pref-arg)  icicle-apropos-value-last-initial-cand-set))
        cand)
    (unless cands                       <span class="linecomment">; COLLECTION arg is an alist whose items are ((SYMB INFO)).</span>
      (mapatoms (lambda (symb)
                  <span class="linecomment">;; Exclude the local vars bound by this command.  They are not what the user wants to see.</span>
                  (setq cand  (and (not (memq symb '(cands  pref-arg  num-arg  prompt
                                                     icicle-toggle-transforming-message
                                                     icicle-candidate-properties-alist
                                                     icicle-multi-completing-p  icicle-list-use-nth-parts
                                                     icicle-transform-before-sort-p  icicle-transform-function
                                                     icicle-last-transform-function  print-fn  make-cand)))
                                   (funcall make-cand symb)))
                  (when cand (push cand cands))))
      (setq icicle-apropos-value-last-initial-cand-set  cands))
    cands)
  nil nil nil nil nil nil
  ((pref-arg                            current-prefix-arg)
   (num-arg                             (prefix-numeric-value pref-arg))
   (prompt                              (format "<span class="quote">SYMBOL `C-M-j' %s: </span>" (if pref-arg "<span class="quote">INFO</span>" "<span class="quote">VALUE</span>"))) <span class="linecomment">; Bindings</span>
   (icicle-toggle-transforming-message  (cond ((or (consp pref-arg)  (= num-arg 0))
                                               "<span class="quote">Filtering to OPTIONS, COMMANDS, & FACES is now %s</span>")
                                              ((and pref-arg  (&gt; num-arg 0))
                                               "<span class="quote">Filtering to FACES (+ plists) is now %s</span>")
                                              ((&lt; num-arg 0)
                                               "<span class="quote">Filtering to COMMANDS (+ defs) is now %s</span>")
                                              (t "<span class="quote">Filtering to user OPTIONS (+ values) is now %s</span>")))
   (icicle-candidate-properties-alist   '((1 (face icicle-candidate-part))))
   (icicle-multi-completing-p           t)
   (icicle-list-use-nth-parts           '(1))
   (icicle-transform-before-sort-p      t)
   (icicle-transform-function           nil) <span class="linecomment">; No transformation: all symbols.</span>
   (icicle-last-transform-function      (lambda (cands) <span class="linecomment">; `C-$': only user options, commands, or faces.</span>
                                          (loop for cc in cands
                                                with symb
                                                do (setq symb  (intern (icicle-transform-multi-completion cc)))
                                                if (cond ((or (consp `,pref-arg)  (= `,num-arg 0))
                                                          (or (user-variable-p symb)
                                                              (commandp symb)
                                                              (facep symb)))
                                                         ((and `,pref-arg  (&gt; `,num-arg 0))
                                                          (facep symb))
                                                         ((&lt; `,num-arg 0)
                                                          (commandp symb))
                                                         (t
                                                          (user-variable-p symb)))
                                                collect cc)))
   (print-fn                            (lambda (obj)
                                          (let ((print-circle  t))
<span class="linecomment">;;; $$$$$$                                  (condition-case nil</span>
<span class="linecomment">;;;                                             (prin1-to-string obj)</span>
<span class="linecomment">;;;                                           (error "`icicle-apropos-value' printing error")))))</span>
                                            (prin1-to-string obj))))
   (make-cand                           (cond ((&lt; num-arg 0) <span class="linecomment">; Function</span>
                                               (lambda (symb)
                                                 (and (fboundp symb)
                                                      `((,(symbol-name symb)
                                                         ,(if (byte-code-function-p (symbol-function symb))
                                                              "<span class="quote"></span>"
                                                              (funcall print-fn (symbol-function symb))))))))
                                              ((= num-arg 0) <span class="linecomment">; Do ALL</span>
                                               (lambda (symb) <span class="linecomment">; Favor the var, then the fn, then the plist.</span>
                                                 (cond ((boundp symb)
                                                        `((,(symbol-name symb)
                                                           ,(funcall print-fn (symbol-value symb)))))
                                                       ((fboundp symb)
                                                        `((,(symbol-name symb)
                                                           ,(if (byte-code-function-p (symbol-function symb))
                                                                "<span class="quote"></span>"
                                                                (funcall print-fn (symbol-function symb))))))
                                                       ((symbol-plist symb)
                                                        `((,(symbol-name symb)
                                                           ,(funcall print-fn (symbol-plist symb))))))))
                                              ((and pref-arg  (&gt; num-arg 0)) <span class="linecomment">; Plist</span>
                                               (lambda (symb)
                                                 (and (symbol-plist symb)
                                                      `((,(symbol-name symb)
                                                         ,(funcall print-fn (symbol-plist symb)))))))
                                              (t <span class="linecomment">; Variable</span>
                                               (lambda (symb)
                                                 (and (boundp symb)
                                                      `((,(symbol-name symb)
                                                         ,(funcall print-fn (symbol-value symb))))))))))
  (progn (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code.</span>
         (icicle-highlight-lighter)
         (message "<span class="quote">Gathering %s%s...</span>" (cond ((consp pref-arg)              'SYMBOLS)
                                            ((and pref-arg  (&lt; num-arg 0)) 'FUNCTIONS)
                                            ((and pref-arg  (= num-arg 0)) "<span class="quote">all SYMBOLS</span>")
                                            ((and pref-arg  (&gt; num-arg 0)) 'SYMBOLS)
                                            (t                             'VARIABLES))
                  (cond ((consp pref-arg) "<span class="quote"> from last invocation (cached)</span>")
                        ((and pref-arg  (&lt; num-arg 0)) "<span class="quote"> and their definitions</span>")
                        ((and pref-arg  (= num-arg 0)) "<span class="quote"> and their info</span>")
                        ((and pref-arg  (&gt; num-arg 0)) "<span class="quote"> and their plists</span>")
                        (t "<span class="quote"> and their values</span>")))))

<span class="linecomment">;;;###autoload (autoload 'icicle-describe-option-of-type "icicles")</span>
(icicle-define-command icicle-describe-option-of-type <span class="linecomment">; Bound to `C-h C-o'.  Command name</span>
  "<span class="quote">Describe a user option that was defined with a given `defcustom' type.
Enter patterns for the OPTION name and TYPE definition in the
minibuffer, separated by `icicle-list-join-string', which is \"^G^J\",
by default.  (`^G' here means the Control-g character, input using
`C-h C-g'.  Likewise, for `^J'.)

Remember that you can insert `icicle-list-join-string' using `C-M-j'.

This command binds option `icicle-dot-string' to the value of
`icicle-anychar-regexp' for the duration, which means that `.' in your
input to this command matches any character, including a newline char.

This is for convenience because `defcustom' type sexps are often
multiline.  This is particularly important for progressive completion,
where your input definitely matches as a regexp (apropos completion).
If you do not want `.' to match newlines, use `C-M-.' during the
command.

Example use of progressive completion:

1. C-h C-o ici C-M-j choic S-TAB

   That shows all options whose names are apropos-matched by `ici' and
   whose types are matched by `choic'.

2. S-SPC om C-M-j sexp

   That limits the matches to options whose names also match `om' and
   whose types also match `sexp'.'


OPTION is a regexp that is matched against option names.

Depending on the prefix arg, TYPE is interpreted as either of these:

 - a regexp to match against the option type

 - a definition acceptable for `defcustom' :type, or its first symbol,
   for example, (choice (integer) (regexp)) or `choice'

In the second case, depending on the prefix arg, TYPE can be matched
against the option type, or it can be matched against either the
option type or one of its subtypes.

In the second case also, depending on the prefix arg, if TYPE does not
match some option's type, that option might still be a candidate, if
its current value satisfies TYPE.

In sum, the prefix arg determines the type-matching behavior, as
follows:

 - None:      OPTION is defined with TYPE or a subtype of TYPE.
              TYPE is a regexp.

 - `C-u':     OPTION is defined with TYPE or a subtype of TYPE,
                or its current value is compatible with TYPE.
              TYPE is a type definition or its first symbol.

 - Negative:  OPTION is defined with TYPE (exact match).
              TYPE is a regexp.

 - Positive:  OPTION is defined with TYPE,
                or its current value is compatible with TYPE.
              TYPE is a type definition or its first symbol.

 - Zero:      OPTION is defined with TYPE or a subtype of TYPE.
              TYPE is a type definition or its first symbol.

 - `C-u C-u': OPTION is defined with TYPE (exact match).
              TYPE is a type definition or its first symbol.

You can change these prefix-arg key sequences by customizing option
`icicle-option-type-prefix-arg-list'.  For example, if you tend to use
the matching defined here for `C-u', you might want to make that the
default behavior (no prefix arg).  You can assign any of the six
behaviors to any of the prefix-arg keys.

If TYPE is nil, then *all* options that match OPTION are candidates.

Note that options defined in libraries that have not been loaded can
be candidates, but their type will appear as nil, since it is not
known before loading the option definition.

You can match your input against the option name or the type
definition or both.  Use `C-M-j' (equivalent here to `C-q C-g C-j') to
input the default separator.

For example, to match all Icicles options whose type matches `string'
\(according to the prefix arg), use `S-TAB' with this input:

 icicle C-M-j string$

If you instead want all Icicles options whose type definition contains
`string', as in (repeat string), then use this:

 icicle C-M-j string

Remember that you can use `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-cycle-incremental-completion] to toggle incremental completion.

See also:
* `icicle-apropos-options-of-type', to show options of a given type
* `icicle-apropos-value', using `C-$' to filter to options only</span>" <span class="linecomment">; Doc string</span>
  icicle-describe-opt-action            <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  'icicle-describe-opt-of-type-complete nil nil nil nil nil nil
  ((prompt                                 "<span class="quote">OPTION `C-M-j' TYPE: </span>") <span class="linecomment">; Bindings</span>
   (icicle-multi-completing-p              t)
   (icicle-candidate-properties-alist      '((1 (face icicle-candidate-part))))
   (icicle-dot-string                      icicle-anychar-regexp)
   <span class="linecomment">;; Bind `icicle-apropos-complete-match-fn' to nil to prevent automatic input matching</span>
   <span class="linecomment">;; in `icicle-unsorted-apropos-candidates' etc., because `icicle-describe-opt-of-type-complete'</span>
   <span class="linecomment">;; does everything.</span>
   (icicle-apropos-complete-match-fn       nil)
   (icicle-last-apropos-complete-match-fn  'icicle-multi-comp-apropos-complete-match)
   (icicle-candidate-help-fn               'icicle-describe-opt-action)
   <span class="linecomment">;; $$$ (icicle-highlight-input-completion-failure nil)</span>
   (icicle-pref-arg                        current-prefix-arg))
  (progn (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
         (icicle-highlight-lighter)
         (message "<span class="quote">Gathering user options and their types...</span>")))

(defun icicle-describe-opt-action (opt+type)
  "<span class="quote">Action function for `icicle-describe-option-of-type'.</span>"
  (let ((icicle-list-use-nth-parts  '(1)))
    (describe-variable (intern (icicle-transform-multi-completion opt+type)))))

<span class="linecomment">;; Free var here: `icicle-pref-arg' - it is bound in `icicle-describe-option-of-type'.</span>
(defun icicle-describe-opt-of-type-complete (strg pred completion-mode)
  "<span class="quote">Completion function for `icicle-describe-option-of-type'.
This is used as the value of `minibuffer-completion-table'.</span>"
  (setq strg  icicle-current-input)
  <span class="linecomment">;; Parse strg into its option part and its type part: OPS  and TPS.</span>
  <span class="linecomment">;; Make raw alist of all options and their types: ((a . ta) (b . tb)...).</span>
  (lexical-let* ((num-prefix  (prefix-numeric-value icicle-pref-arg))
                 (mode        (cond ((not icicle-pref-arg) <span class="linecomment">; No prefix arg</span>
                                     (nth 4 icicle-option-type-prefix-arg-list))
                                    ((and (consp icicle-pref-arg)  (= 16 num-prefix)) <span class="linecomment">; C-u C-u</span>
                                     (nth 0 icicle-option-type-prefix-arg-list))
                                    ((consp icicle-pref-arg) (nth 2 icicle-option-type-prefix-arg-list)) <span class="linecomment">; C-u</span>
                                    ((zerop num-prefix) (nth 1 icicle-option-type-prefix-arg-list)) <span class="linecomment">; C-0</span>
                                    ((wholenump num-prefix) <span class="linecomment">; C-9</span>
                                     (nth 3 icicle-option-type-prefix-arg-list))
                                    (t (nth 5 icicle-option-type-prefix-arg-list)))) <span class="linecomment">; C--</span>
                 (ops         (let ((icicle-list-use-nth-parts  '(1)))
                                (icicle-transform-multi-completion strg)))
                 (tps         (let ((icicle-list-use-nth-parts  '(2)))
                                (icicle-transform-multi-completion strg)))
                 (tp          (and (not (string= "<span class="quote"></span>" tps))
                                   <span class="linecomment">;; Use regexp if no prefix arg or negative; else use sexp.</span>
                                   (if (memq mode '(inherit-or-regexp direct-or-regexp)) tps (read tps))))
                 (result      ()))
    (mapatoms
     (lambda (symb)                     <span class="linecomment">; FREE here: RESULT.</span>
       (when (if (fboundp 'custom-variable-p) (custom-variable-p symb) (user-variable-p symb))
         (condition-case nil
             (push (list symb (get symb 'custom-type)) result)
           (error nil)))))
    <span class="linecomment">;; Keep only candidates that correspond to input.</span>
    (setq result
          (lexical-let ((ops-re  (if (memq icicle-current-completion-mode '(nil apropos))
                                     ops
                                   (concat "<span class="quote">^</span>" ops))))
            (icicle-remove-if-not
             (lambda (opt+typ)          <span class="linecomment">; FREE here: OPS-RE, MODE, TP.</span>
               (and (string-match ops-re (symbol-name (car opt+typ)))
                    (or (null tp)
                        (condition-case nil
                            (icicle-var-is-of-type-p (car opt+typ) (list tp)
                                                     (case mode
                                                       ((inherit inherit-or-regexp) 'inherit)
                                                       ((direct  direct-or-regexp)  'direct)
                                                       (inherit-or-value     'inherit-or-value)
                                                       (direct-or-value      'direct-or-value)))
                          (error nil)))))
             result)))
    <span class="linecomment">;; Change alist entries to multi-completions: "op^G^Jtp".  Add short help for mode-line, tooltip.</span>
    (setq result
          <span class="linecomment">;; FREE here: ICICLE-HELP-IN-MODE-LINE-DELAY, ICICLE-LIST-JOIN-STRING, TOOLTIP-MODE.</span>
          (mapcar (lambda (entry)
                    (let* ((opt+typ-string
                            <span class="linecomment">;; $$$$$$ (concat (mapconcat (lambda (e) (pp-to-string e))</span>
                            <span class="linecomment">;;                           entry icicle-list-join-string)</span>
                            <span class="linecomment">;;                icicle-list-end-string)) ; $$$$$$</span>
                            (mapconcat (lambda (e) (pp-to-string e))  entry  icicle-list-join-string))
                           (doc         <span class="linecomment">; Don't bother to look up doc, if user won't see it.</span>
                            (and (or (&gt; icicle-help-in-mode-line-delay 0)
                                     (and (boundp 'tooltip-mode)  tooltip-mode))
                                 (documentation-property (car entry) 'variable-documentation t)))
                           (doc1  (and (stringp doc)  (string-match "<span class="quote">.+$</span>" doc)  (match-string 0 doc))))
                      (when doc1 (icicle-candidate-short-help doc1 opt+typ-string))
                      opt+typ-string))
                  result))
    (if completion-mode
        result                          <span class="linecomment">; `all-completions', `test-completion'</span>
      (try-completion                   <span class="linecomment">; `try-completion'</span>
       strg (mapcar #'list result) (and pred  (lambda (ss) (funcall pred ss)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-apropos-vars-w-val-satisfying "icicles")</span>
(defun icicle-apropos-vars-w-val-satisfying (predicate pattern &optional optionp)
  "<span class="quote">Show variables whose values satisfy PREDICATE and names match PATTERN.
You are prompted for a predicate sexp and a pattern matching the
variable names.  For the latter, before hitting `RET' you must use
completion (`S-TAB' or `TAB') to manifest the set of matching
variables.  Apropos information is shown for those variables when you
hit `RET'.

The predicate sexp must be a function symbol or a lambda form that
accepts the value of the variable as its (first) argument.

Typically the predicate is a type predicate, such as `integerp', but
it could be anything.  Instead of just `integerp', for example, it
could be `(lambda (val) (and (integerp val)  (&gt; val 5) (&lt; val 15)))'.

With a prefix argument, candidates are limited to user options.

See also: `icicle-apropos-value', which matches names and values.</span>"
  (interactive (icicle-read-args-w-val-satisfying "<span class="quote">Apropos var (hit `S-TAB' or `TAB'): </span>"
                                                  current-prefix-arg t))
  (if optionp
      (if (fboundp 'icicle-apropos-option)
          (icicle-apropos-option pattern)
        (icicle-apropos-variable pattern t))
    (icicle-apropos-variable pattern)))

<span class="linecomment">;;;###autoload (autoload 'icicle-customize-apropos-opts-w-val-satisfying "icicles")</span>
(defun icicle-customize-apropos-opts-w-val-satisfying (predicate pattern)
  "<span class="quote">Customize options whose values satisfy PREDICATE and names match PATTERN.
You are prompted for a predicate sexp and a pattern matching the
option names.  For the latter, before hitting `RET' you must use
completion (`S-TAB' or `TAB') to manifest the set of matching options.
A Customize buffer is opened for those options when you hit `RET'.

The predicate sexp must be a function symbol or a lambda form that
accepts the value of the variable as its (first) argument.

Typically the predicate is a type predicate, such as `integerp', but
it could be anything.  Instead of just `integerp', for example, it
could be `(lambda (val) (and (integerp val)  (&gt; val 5) (&lt; val 15)))'.</span>"
  (interactive (let ((xxx  (icicle-read-args-w-val-satisfying "<span class="quote">Customize vars (hit `S-TAB' or `TAB'): </span>"
                                                              t t)))
                 (list (car xxx) (cadr xxx))))
  (icicle-customize-apropos-options pattern))

(defun icicle-read-args-w-val-satisfying (prompt optionp patternp)
  "<span class="quote">Read args for `icicle-*-w-val-satisfying' commands.
Prompt for the variable names using PROMPT. 
Non-nil OPTIONP means allow only variables that are user options.  It
is used here during completion of the variable name, and it is
returned as the third arg for `icicle-describe-var-w-val-satisfying'.

Non-nil PATTERNP means return as the variable whatever input pattern
the user entered.  Otherwise, assume the pattern names a variable, and
return the symbol with that name.</span>"
  (let* ((enable-recursive-minibuffers            t)
         (valpred
          (let ((string-read  nil)
                (read-result  nil))
            (condition-case err
                (prog1 (setq read-result  (read (setq string-read  (completing-read
                                                                    "<span class="quote">Predicate to satify: </span>"
                                                                    icicle-predicate-types-alist
                                                                    nil nil nil
                                                                    (if (boundp 'function-name-history)
                                                                        'function-name-history
                                                                      'icicle-function-name-history)))))
                  (unless (functionp read-result) (error "<span class="quote"></span>"))) <span class="linecomment">; Read was OK, but not a function.</span>
              (error (error "<span class="quote">Invalid function: `%s'</span>" string-read))))) <span class="linecomment">; Read error.</span>
         (vardflt                                 (or (and (fboundp 'symbol-nearest-point)
                                                           (symbol-nearest-point))
                                                      (and (symbolp (variable-at-point))
                                                           (variable-at-point))))
         (symbpred                                (if optionp #'user-variable-p #'boundp))
         (varpred                                 `(lambda (sy)
                                                    (unless (symbolp sy)  (setq sy  (intern sy)))
                                                    (and
                                                     (funcall #',symbpred sy)
                                                     (funcall #',valpred (symbol-value sy)))))
         (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
         (icicle-must-pass-after-match-predicate  (and (not icompletep)  varpred))
         (varpat                                  (completing-read
                                                   prompt obarray (and icompletep  varpred) nil nil nil
                                                   (and vardflt  (symbol-name vardflt)) t)))
    (list valpred
          (if patternp
              (if icicle-completion-candidates
                  (regexp-opt icicle-completion-candidates)
                (message "<span class="quote">Predicate %s.  You did not complete var names (`S-TAB' or `TAB')</span>"
                         (icicle-propertize "<span class="quote">IGNORED</span>" 'face 'icicle-msg-emphasis))
                (sit-for 3)
                varpat)
            (intern varpat))
          optionp)))


<span class="linecomment">;; REPLACE ORIGINAL `repeat-complex-command' defined in `simple.el',</span>
<span class="linecomment">;; saving it for restoration when you toggle `icicle-mode'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Uses `completing-read' to read the command to repeat, letting you use `S-TAB' and</span>
<span class="linecomment">;; `TAB' to see the history list and `C-,' to toggle sorting that display.</span>
<span class="linecomment">;;</span>
(unless (fboundp 'icicle-ORIG-repeat-complex-command)
  (defalias 'icicle-ORIG-repeat-complex-command (symbol-function 'repeat-complex-command)))

<span class="linecomment">;;;###autoload (autoload 'icicle-repeat-complex-command "icicles")</span>
(defun icicle-repeat-complex-command (arg) <span class="linecomment">; Bound to `C-x ESC ESC', `C-x M-:' in Icicle mode.</span>
  "<span class="quote">Edit and re-evaluate the last complex command, or ARGth from last.
A complex command is one that used the minibuffer.
ARG is the prefix argument numeric value.

You can edit the past command you choose before executing it.  The
Lisp form of the command is used.  If the command you enter differs
from the previous complex command, then it is added to the front of
the command history.

Icicles completion is available for choosing a past command.  You can
still use the vanilla Emacs bindings `\\&lt;minibuffer-local-map&gt;\\[next-history-element]' and \
`\\[previous-history-element]' to cycle inputs,
and `\\[repeat-matching-complex-command]' to match regexp input, but Icicles input cycling (`up',
`down', `next', `prior', `home', `end') and apropos completion
\(`S-TAB') are superior and more convenient.</span>"
  (interactive "<span class="quote">p</span>")
  (let ((elt  (nth (1- arg) command-history))
        newcmd)
    (if elt
        (progn
          (setq newcmd
                (let ((print-level                   nil)
                      (minibuffer-history-position   arg)
                      (minibuffer-history-sexp-flag  (1+ (minibuffer-depth))))
                  (unwind-protect
                       (let ((icicle-transform-function  'icicle-remove-duplicates))
                         (read (completing-read
                                "<span class="quote">Redo: </span>" (mapcar (lambda (entry) (list (prin1-to-string entry)))
                                                 command-history)
                                nil nil (prin1-to-string elt) (cons 'command-history arg)
                                (prin1-to-string elt))))
                    <span class="linecomment">;; If command was added to command-history as a string, get rid of that.</span>
                    <span class="linecomment">;; We want only evaluable expressions there.</span>
                    (if (stringp (car command-history))
                        (setq command-history  (cdr command-history))))))
          <span class="linecomment">;; If command to be redone does not match front of history, add it to the history.</span>
          (or (equal newcmd (car command-history))
              (setq command-history  (cons newcmd command-history)))
          (eval newcmd))
      (if command-history
          (error "<span class="quote">Argument %d is beyond length of command history</span>" arg)
        (error "<span class="quote">There are no previous complex commands to repeat</span>")))))

<span class="linecomment">;;;###autoload (autoload 'icicle-add-entry-to-saved-completion-set "icicles")</span>
(defun icicle-add-entry-to-saved-completion-set (set-name entry type)
  "<span class="quote">Add ENTRY to saved completion-candidates set SET-NAME.
ENTRY is normally a single candidate (a string).
 With a prefix arg, however, and if option
 `icicle-filesets-as-saved-completion-sets-flag' is non-nil, then
 ENTRY is the name of an Emacs fileset (Emacs 22 or later).
TYPE is the type of entry to add: `Fileset' or `Candidate'.</span>"
  (interactive
   (let ((typ (if (and current-prefix-arg  icicle-filesets-as-saved-completion-sets-flag
                       (prog1 (or (require 'filesets nil t)
                                  (error "<span class="quote">Feature `filesets' not provided</span>"))
                         (filesets-init))
                       filesets-data)
                  'Fileset
                'Candidate)))
     (list
      (save-selected-window
        (completing-read "<span class="quote">Saved completion set: </span>" icicle-saved-completion-sets nil t nil
                         'icicle-completion-set-history))
      (if (eq typ 'Fileset)
          (list ':fileset               <span class="linecomment">; Just save the fileset name, not the data.</span>
                (car (assoc (completing-read "<span class="quote">Fileset to add: </span>" filesets-data nil t)
                            filesets-data)))
        (completing-read "<span class="quote">Candidate to add: </span>" (mapcar #'list icicle-saved-completion-candidates)))
      typ)))
  (let ((file-name  (cdr (assoc set-name icicle-saved-completion-sets))))
    (unless (icicle-file-readable-p file-name) (error "<span class="quote">Cannot read cache file `%s'</span>" file-name))
    (let ((list-buf  (find-file-noselect file-name 'NOWARN 'RAW))
          candidates newcands entry-type)
      (unwind-protect
           (condition-case icicle-add-entry-to-saved-completion-set
               (when (listp (setq newcands  (setq candidates  (read list-buf))))
                 (message "<span class="quote">Set `%s' read from file `%s'</span>" set-name file-name))
             (error (error "<span class="quote">Bad cache file.  %s</span>"
                           (error-message-string icicle-add-entry-to-saved-completion-set))))
        (kill-buffer list-buf))
      (unless (consp newcands) (error "<span class="quote">Bad data in cache file `%s'</span>" file-name))
      (pushnew entry newcands :test #'equal)
      (setq entry  (if (eq type 'Fileset) (caar entry) entry))
      (if (= (length candidates) (length newcands))
          (message "<span class="quote">%s `%s' is already in saved set `%s', file `%s'</span>" type entry set-name file-name)
        (with-temp-message (format "<span class="quote">Writing entry to cache file `%s'...</span>" file-name)
          (with-temp-file file-name (prin1 newcands (current-buffer))))
        (message "<span class="quote">%s `%s' added to saved set `%s', file `%s'</span>" type
                 (icicle-propertize entry     'face 'icicle-msg-emphasis)
                 (icicle-propertize set-name  'face 'icicle-msg-emphasis)
                 (icicle-propertize file-name 'face 'icicle-msg-emphasis))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-remove-entry-from-saved-completion-set "icicles")</span>
(defun icicle-remove-entry-from-saved-completion-set (set-name)
  "<span class="quote">Remove an entry from saved completion-candidates set SET-NAME.
SET-NAME can be an Icicles saved completions set (cache file) or the
name of an Emacs fileset.

The entry to remove can be a single completion candidate (a string) or
an Emacs fileset.  You can thus remove a file name from a fileset or
remove a fileset from an Icicles saved completion set.  (You can also
remove a file name from a saved completion set.)  If a saved set has
both a file and a fileset of the same name, then both are removed.

To use filesets here, use Emacs 22 or later, load library `filesets',
use `(filesets-init)', and ensure that option
`icicle-filesets-as-saved-completion-sets-flag' is non-nil.</span>"
  (interactive
   (list (completing-read "<span class="quote">Saved completion set: </span>"
                          (if (and icicle-filesets-as-saved-completion-sets-flag
                                   (featurep 'filesets)  filesets-data)
                              (append filesets-data icicle-saved-completion-sets)
                            icicle-saved-completion-sets)
                          nil t nil 'icicle-completion-set-history)))
  (let* ((file-name                              (cdr (assoc set-name icicle-saved-completion-sets)))
         (candidates                             (icicle-get-candidates-from-saved-set
                                                  set-name 'dont-expand))
         (icicle-whole-candidate-as-text-prop-p  t)
         (icicle-remove-icicles-props-p          nil) <span class="linecomment">; Need prop `icicle-whole-candidate' for now.</span>
         (entry
          (funcall icicle-get-alist-candidate-function
                   (completing-read
                    "<span class="quote">Candidate to remove: </span>"
                    (mapcar (lambda (e)
                              (cond ((icicle-saved-fileset-p e) <span class="linecomment">; Swap `:fileset' with fileset name</span>
                                     `(,(cadr e) ,(car e) ,@(cddr e)))
                                    ((consp e) e)
                                    (t (list e)))) <span class="linecomment">; Listify naked string.</span>
                            candidates)
                    nil t))))
    (when (and (consp entry)  (eq (cadr entry) ':fileset)) <span class="linecomment">; Swap back again: `:fileset' and name.</span>
      (setq entry  `(,(cadr entry) ,(car entry) ,@(cddr entry))))
    (when (and (consp entry)  (null (cdr entry))) (setq entry  (car entry))) <span class="linecomment">; Use just the string.</span>
    <span class="linecomment">;; Delete any such candidate, then remove text properties used for completion.</span>
    (setq candidates  (mapcar #'icicle-unpropertize-completion (delete entry candidates)))
    (cond (file-name
           (with-temp-message           <span class="linecomment">; Remove from cache file.</span>
               (format "<span class="quote">Writing remaining candidates to cache file `%s'...</span>" file-name)
             (with-temp-file file-name (prin1 candidates (current-buffer)))))
          ((icicle-saved-fileset-p (list ':fileset set-name)) <span class="linecomment">; Remove from fileset.</span>
           (unless (require 'filesets nil t) (error "<span class="quote">Feature `filesets' not provided</span>"))
           (filesets-init)
           (let ((fst  (and filesets-data  (assoc set-name filesets-data)))) <span class="linecomment">; The fileset itself.</span>
             (unless fst (error "<span class="quote">No such fileset: `%s'</span>" set-name))
             (let ((fst-files  (filesets-entry-get-files fst)))
               (if (car (filesets-member entry fst-files :test 'filesets-files-equalp))
                   (if fst-files        <span class="linecomment">; Similar to code in `filesets-remove-buffer'.</span>
                       (let ((new-fst  (list (cons ':files (delete entry fst-files)))))
                         (setcdr fst new-fst)
                         (filesets-set-config set-name 'filesets-data filesets-data))
                     (message "<span class="quote">Cannot remove `%s' from fileset `%s'</span>"
                              (icicle-propertize entry    'face 'icicle-msg-emphasis)
                              (icicle-propertize set-name 'face 'icicle-msg-emphasis)))
                 (message "<span class="quote">`%s' not in fileset `%s'</span>"
                          (icicle-propertize entry    'face 'icicle-msg-emphasis)
                          (icicle-propertize set-name 'face 'icicle-msg-emphasis)))))))
    (when entry
      (icicle-msg-maybe-in-minibuffer
       "<span class="quote">`%s' removed from %s `%s'%s</span>"
       (icicle-propertize (if (icicle-saved-fileset-p entry) (cadr entry) entry)
                          'face 'icicle-msg-emphasis)
       (if (icicle-saved-fileset-p entry) "<span class="quote">fileset</span>" "<span class="quote">saved set</span>")
       (icicle-propertize set-name 'face 'icicle-msg-emphasis)
       (if file-name
           (format "<span class="quote">, file `%s'</span>" (icicle-propertize file-name'face 'icicle-msg-emphasis))
         "<span class="quote"></span>")))))

<span class="linecomment">;;;###autoload (autoload 'icicle-remove-saved-completion-set "icicles")</span>
(icicle-define-command icicle-remove-saved-completion-set <span class="linecomment">; Command name</span>
  "<span class="quote">Remove an entry from `icicle-saved-completion-sets'.
Save the updated option.
You are prompted to also delete the associated cache file.
You can add entries to `icicle-saved-completion-sets' using command
`icicle-add/update-saved-completion-set'.</span>" <span class="linecomment">; Doc string</span>
  icicle-remove-saved-set-action
  "<span class="quote">Remove set of completion candidates named: </span>" <span class="linecomment">; `completing-read' args</span>
  icicle-saved-completion-sets nil t nil 'icicle-completion-set-history nil nil
  ((icicle-whole-candidate-as-text-prop-p  t) <span class="linecomment">; Additional bindings</span>
   (icicle-use-candidates-only-once-flag   t))
  nil nil (icicle-remove-Completions-window)) <span class="linecomment">; First code, undo code, last code</span>

(defun icicle-remove-saved-set-action (set-name)
  "<span class="quote">Remove saved set SET-NAME from `icicle-saved-completion-sets'.</span>"
  (let ((enable-recursive-minibuffers  t)
        (sets                          icicle-saved-completion-sets)
        set cache)
    (save-selected-window
      (select-window (minibuffer-window))
      (while (setq set    (assoc set-name sets)
                   cache  (cdr set))
        (when (file-exists-p cache)
          (if (y-or-n-p (format "<span class="quote">Delete cache file `%s'? </span>"
                                (icicle-propertize cache 'face 'icicle-msg-emphasis)))
              (when (condition-case err
                        (progn (delete-file cache) t)
                      (error (progn (message "<span class="quote">%s</span>" (error-message-string err)) nil)))
                (message "<span class="quote">%s `%s'</span>" (icicle-propertize "<span class="quote">DELETED</span>" 'face 'icicle-msg-emphasis) cache)
                (sit-for 1))
            (message "<span class="quote">OK, file NOT deleted</span>") (sit-for 1)))
        (setq sets  (delete set sets)))))
  (setq icicle-saved-completion-sets
        (icicle-assoc-delete-all set-name icicle-saved-completion-sets))
  (funcall icicle-customize-save-variable-function
           'icicle-saved-completion-sets
           icicle-saved-completion-sets)
  (message "<span class="quote">Candidate set `%s' removed</span>" (icicle-propertize set-name 'face 'icicle-msg-emphasis)))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-save-marked-files "icicles")</span>
(defun icicle-bookmark-save-marked-files (&optional arg) <span class="linecomment">; Bound to `C-M-&gt;' in *Bookmark List*.</span>
  "<span class="quote">Save file names of marked bookmarks as a set of completion candidates.
Saves file names in variable `icicle-saved-completion-candidates', by
default.  Marked bookmarks that have no associated file are ignored.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.
 To subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').</span>"
  (interactive "<span class="quote">P</span>")
  (unless (fboundp 'bmkp-bmenu-get-marked-files)
    (error "<span class="quote">Command `icicle-bookmark-save-marked-files' requires library `Bookmark+'</span>"))
  (bmkp-bmenu-barf-if-not-in-menu-list)
  (icicle-candidate-set-save-1 (bmkp-bmenu-get-marked-files) arg))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-save-marked-files-more "icicles")</span>
(defun icicle-bookmark-save-marked-files-more (&optional arg) <span class="linecomment">; Bound to `C-&gt;' in *Bookmark List*.</span>
  "<span class="quote">Add the file names of the marked bookmarks to the saved candidates set.
Marked bookmarks that have no associated file are ignored.
Add candidates to `icicle-saved-completion-candidates', by default.
A prefix argument acts the same as for `icicle-candidate-set-save'.

The existing saved candidates remain saved.  The current candidates
are added to those already saved.

You can retrieve the saved set of candidates with `C-M-&lt;'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').</span>"
  (interactive "<span class="quote">P</span>")
  (unless (fboundp 'bmkp-bmenu-get-marked-files)
    (error "<span class="quote">Command `icicle-bookmark-save-marked-files-more' requires library `Bookmark+'</span>"))
  (bmkp-bmenu-barf-if-not-in-menu-list)
  (icicle-candidate-set-save-1 (bmkp-bmenu-get-marked-files) arg t))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-save-marked-files-to-variable "icicles")</span>
(defun icicle-bookmark-save-marked-files-to-variable () <span class="linecomment">; Bound to `C-M-}' in *Bookmark List*.</span>
  "<span class="quote">Save the file names of the marked bookmarks to a variable.
Marked bookmarks that have no associated file are ignored.

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').</span>"
  (interactive)
  (unless (fboundp 'bmkp-bmenu-get-marked-files)
    (error "<span class="quote">Command `icicle-bookmark-save-marked-files-to-variable' requires library `Bookmark+'</span>"))
  (bmkp-bmenu-barf-if-not-in-menu-list)
  (icicle-candidate-set-save-1 (bmkp-bmenu-get-marked-files) 99))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-save-marked-files-as-project "icicles")</span>
(defalias 'icicle-bookmark-save-marked-files-as-project <span class="linecomment">; Bound to `C-}' in *Bookmark List*.</span>
    'icicle-bookmark-save-marked-files-persistently)
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-save-marked-files-persistently "icicles")</span>
(defun icicle-bookmark-save-marked-files-persistently (filesetp)
  "<span class="quote">Save the file names of the marked bookmarks as a persistent set.
Marked bookmarks that have no associated file are ignored.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a bookmark-list display buffer
\(`*Bookmark List*').</span>"
  (interactive "<span class="quote">P</span>")
  (unless (fboundp 'bmkp-bmenu-get-marked-files)
    (error "<span class="quote">This command requires library `Bookmark+'</span>"))
  (bmkp-bmenu-barf-if-not-in-menu-list)
  (icicle-candidate-set-save-1 (bmkp-bmenu-get-marked-files) (if filesetp 0 '(1))))


<span class="linecomment">;;;###autoload (autoload 'icicle-dired-save-marked                        "icicles")</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-save-marked-more                   "icicles")</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-save-marked-to-variable            "icicles")</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-save-marked-as-project             "icicles")</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-save-marked-persistently           "icicles")</span>
(defun icicle-dired-save-marked (&optional arg) <span class="linecomment">; Bound to `C-M-&gt;' in Dired.</span>
  "<span class="quote">Save the marked file names in Dired as a set of completion candidates.
Saves file names in variable `icicle-saved-completion-candidates', by
default.
With a plain prefix arg (`C-u'), save candidates in a cache file.
With a non-zero numeric prefix arg (`C-u N'), save candidates in a
 variable for which you are prompted.
With a zero prefix arg (`C-0'), save candidates in a fileset (Emacs 22
 or later).  Use this only for file-name candidates, obviously.
 To subsequently use a fileset for candidate retrieval, option
 `icicle-filesets-as-saved-completion-sets-flag' must be non-nil.

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.</span>"
  (interactive "<span class="quote">P</span>")
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (icicle-candidate-set-save-1 (dired-get-marked-files) arg))

(defun icicle-dired-save-marked-more (&optional arg) <span class="linecomment">; Bound to `C-&gt;' in Dired.</span>
  "<span class="quote">Add the marked file names in Dired to the saved candidates set.
Like `icicle-dired-save-marked', but add file names to those already
saved, if any.  A prefix argument has the same effect as for
`icicle-dired-save-marked'.</span>"
  (interactive "<span class="quote">P</span>")
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (icicle-candidate-set-save-1 (dired-get-marked-files) arg t))

(defun icicle-dired-save-marked-to-variable () <span class="linecomment">; Bound to `C-M-}' in Dired.</span>
  "<span class="quote">Save the marked file names in Dired to a variable as a candidate set.
Same as using `icicle-dired-save-marked' with no prefix argument.</span>"
  (interactive)
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (icicle-candidate-set-save-1 (dired-get-marked-files) 99))

(defalias 'icicle-dired-save-marked-as-project <span class="linecomment">; Bound to `C-}' in Dired.</span>
    'icicle-dired-save-marked-persistently)
(defun icicle-dired-save-marked-persistently (filesetp)
  "<span class="quote">Save the marked file names in Dired as a persistent set.
With no prefix arg, save in a cache file.
With a prefix arg, save in an Emacs fileset (Emacs 22 or later).

You can retrieve the saved set of file-name candidates during
completion using `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-candidate-set-retrieve]'.
You can use the saved set of candidates for operations such as
\\&lt;minibuffer-local-completion-map&gt;
`icicle-candidate-set-union' (`\\[icicle-candidate-set-union]'),
`icicle-candidate-set-intersection' (`\\[icicle-candidate-set-intersection]'), and
`icicle-candidate-set-difference' (`\\[icicle-candidate-set-difference]').

You can use this command only from a Dired buffer.</span>"
  (interactive "<span class="quote">P</span>")
  (unless (eq major-mode 'dired-mode)
    (error "<span class="quote">You must be in a Dired buffer to use this command</span>"))
  (icicle-candidate-set-save-1 (dired-get-marked-files) (if filesetp 0 '(1))))


<span class="linecomment">;;; These commands require library `Dired+'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-save-marked-recursive               "icicles")</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-save-marked-more-recursive          "icicles")</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-save-marked-to-variable-recursive   "icicles")</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-save-marked-to-cache-file-recursive "icicles")</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-save-marked-to-fileset-recursive    "icicles")</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-insert-as-subdir                    "icicles")</span>
(when (fboundp 'diredp-get-files)       <span class="linecomment">; In Dired+.</span>
  (defun icicle-dired-save-marked-recursive (&optional ignore-marks-p arg) <span class="linecomment">; Bound to `M-+ C-M-&gt;' in Dired.</span>
    "<span class="quote">Save the marked file names in Dired, including those in marked subdirs.
Like `icicle-dired-save-marked', but act recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

You need library `Dired+' for this command.</span>"
    (interactive (progn
                   (unless (fboundp 'diredp-get-confirmation-recursive)
                     (error "<span class="quote">You need library `dired+.el' for this command</span>"))
                   (diredp-get-confirmation-recursive)
                   (list current-prefix-arg 1)))
    (icicle-candidate-set-save-1 (diredp-get-files ignore-marks-p) arg))

  (defun icicle-dired-save-marked-more-recursive (&optional ignore-marks-p arg) <span class="linecomment">; Bound to `M-+ C-&gt;' in Dired.</span>
    "<span class="quote">Add marked files, including those in marked subdirs, to saved candidates.
Like `icicle-dired-save-marked-more', but act recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

You need library `Dired+' for this command.</span>"
    (interactive (progn
                   (unless (fboundp 'diredp-get-confirmation-recursive)
                     (error "<span class="quote">You need library `dired+.el' for this command</span>"))
                   (diredp-get-confirmation-recursive)
                   (list current-prefix-arg 1)))
    (icicle-candidate-set-save-1 (diredp-get-files ignore-marks-p) arg t))

  (defun icicle-dired-save-marked-to-variable-recursive (&optional ignore-marks-p) <span class="linecomment">; `M-+ C-M-}' in Dired.</span>
    "<span class="quote">Save marked files, including those in marked subdirs, to a variable.
Like `icicle-dired-save-marked-to-variable', but act recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

You need library `Dired+' for this command.</span>"
    (interactive (progn
                   (unless (fboundp 'diredp-get-confirmation-recursive)
                     (error "<span class="quote">You need library `dired+.el' for this command</span>"))
                   (diredp-get-confirmation-recursive)
                   (list current-prefix-arg)))
    (icicle-candidate-set-save-1 (diredp-get-files ignore-marks-p) 99))

  (defun icicle-dired-save-marked-to-cache-file-recursive (&optional ignore-marks-p) <span class="linecomment">; `M-+ C-}' in Dired.</span>
    "<span class="quote">Save marked files, including in marked subdirs, to an Icicles cache set.
Like `icicle-dired-save-marked-persistently' with no prefix arg, but
act recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

You need library `Dired+' for this command.</span>"
    (interactive (progn
                   (unless (fboundp 'diredp-get-confirmation-recursive)
                     (error "<span class="quote">You need library `dired+.el' for this command</span>"))
                   (diredp-get-confirmation-recursive)
                   (list current-prefix-arg)))
    (icicle-candidate-set-save-1 (diredp-get-files ignore-marks-p) '(1)))

  (defun icicle-dired-save-marked-to-fileset-recursive (&optional ignore-marks-p) <span class="linecomment">; Not bound by default.</span>
    "<span class="quote">Save marked files, including those in marked subdirs, to an Emacs fileset.
Like `icicle-dired-save-marked-persistently' with no prefix arg, but
act recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

You need library `Dired+' for this command.</span>"
    (interactive (progn
                   (unless (fboundp 'diredp-get-confirmation-recursive)
                     (error "<span class="quote">You need library `dired+.el' for this command</span>"))
                   (unless (require 'filesets nil t)
                     (error "<span class="quote">Cannot save to a fileset - feature `filesets' not provided</span>"))
                   (diredp-get-confirmation-recursive)
                   (list current-prefix-arg)))
    (icicle-candidate-set-save-1 (diredp-get-files ignore-marks-p) 0)))

(when (and (&gt; emacs-major-version 21)   <span class="linecomment">; Emacs 20 has no PREDICATE arg to `read-file-name'.</span>
           (fboundp 'diredp-insert-as-subdir))
  (icicle-define-file-command icicle-dired-insert-as-subdir
    "<span class="quote">Choose a directory.  Insert it into a Dired ancestor listing.
If the directory you choose has a Dired buffer then its markings and
switches are preserved for the subdir listing in the ancestor Dired
buffer.

You need library `Dired+' for this command.</span>"
    (lambda (dir) (diredp-insert-as-subdir dir ancestor-dir)) <span class="linecomment">; FREE here: ANCESTOR-DIR.</span>
    "<span class="quote">Insert directory into ancestor Dired: </span>" <span class="linecomment">; `read-file-name' args</span>
    default-directory nil t nil `(lambda (ff)
                                  (and (file-directory-p  (expand-file-name ff))
                                   (dired-in-this-tree (expand-file-name ff) ',ancestor-dir)))
    ((ancestor-dir                      <span class="linecomment">; Bindings</span>
      (completing-read "<span class="quote">Ancestor Dired dir to insert into: </span>"
                       (cons (list default-directory)
                             (mapcar #'list (diredp-ancestor-dirs default-directory))))))))


(put 'icicle-dired-saved-file-candidates 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-chosen-files "icicles")</span>
(defalias 'icicle-dired-chosen-files 'icicle-dired-saved-file-candidates)
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-saved-file-candidates "icicles")</span>
(defun icicle-dired-saved-file-candidates (prompt-for-dir-p)
  "<span class="quote">Open Dired on a set of files and directories of your choice.
If you have saved a set of file names using \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-candidate-set-save]', then it is used.
If not, you are reminded to do so.
With a prefix argument, you are prompted for the default directory to use.
Otherwise, the current value of `default-directory' is used.
Names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the Dired
directory (default directory).</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets?</span>
  (unless icicle-saved-completion-candidates
    (error "<span class="quote">%s</span>" (substitute-command-keys "<span class="quote">No saved completion candidates.  \
Use \\&lt;minibuffer-local-completion-map&gt;`\\[icicle-candidate-set-save]' to save candidates</span>")))
  (let* ((default-directory           (if prompt-for-dir-p
                                          (read-file-name "<span class="quote">Directory: </span>" nil default-directory nil)
                                        default-directory))
         (icicle-multi-completing-p   t)
         (icicle-list-use-nth-parts   '(1))
         (file-names                  (icicle-remove-if
                                       (lambda (fil)
                                         (or (null fil)
                                             (not (or (icicle-file-remote-p fil) <span class="linecomment">; Avoid Tramp accessing.</span>
                                                      (file-exists-p fil)))))
                                       (or (and icicle-saved-completion-candidates
                                                (mapcar #'icicle-transform-multi-completion
                                                        icicle-saved-completion-candidates))
                                           (icicle-file-list)))))
    (dired (cons (generate-new-buffer-name "<span class="quote">Icy File Set</span>") (nreverse file-names)))))

<span class="linecomment">;;;###autoload (autoload 'icicle-dired-chosen-files-other-window "icicles")</span>
(defalias 'icicle-dired-chosen-files-other-window 'icicle-dired-saved-file-candidates-other-window)
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-saved-file-candidates-other-window "icicles")</span>
(defun icicle-dired-saved-file-candidates-other-window (prompt-for-dir-p) <span class="linecomment">; Bound `C-M-&lt;' in Dired.</span>
  "<span class="quote">Open Dired in other window on set of files & directories of your choice.
If you have saved a set of file names using \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-candidate-set-save]', then it is used.
If not, you are reminded to do so.
With a prefix arg, you are prompted for the default directory to use.
Otherwise, the current value of `default-directory' is used.
Names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the Dired
directory (default directory).</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets?</span>
  (let* ((default-directory           (if prompt-for-dir-p
                                          (read-file-name "<span class="quote">Directory: </span>" nil default-directory nil)
                                        default-directory))
         (icicle-multi-completing-p   t)
         (icicle-list-use-nth-parts   '(1))
         (file-names                  (icicle-remove-if
                                       (lambda (fil)
                                         (or (null fil)
                                             (not (or (icicle-file-remote-p fil) <span class="linecomment">; Avoid Tramp accessing.</span>
                                                      (file-exists-p fil)))))
                                       (or (and icicle-saved-completion-candidates
                                                (mapcar #'icicle-transform-multi-completion
                                                        icicle-saved-completion-candidates))
                                           (icicle-file-list)))))
    (dired-other-window (cons (generate-new-buffer-name "<span class="quote">Icy File Set</span>") (nreverse file-names)))))

(put 'icicle-dired-project 'icicle-Completions-window-max-height 200)
<span class="linecomment">;;;###autoload (autoload 'icicle-dired-project "icicles")</span>
(defun icicle-dired-project (prompt-for-dir-p)
  "<span class="quote">Open Dired on a saved project.
A project is either a persistent completion set or an Emacs fileset.
With a prefix argument, you are prompted for the directory.
Otherwise, the default directory is assumed.

Project file names that do not correspond to existing files are
ignored.  Existence of files with relative names is checked in the
directory.

You can use `C-x m' during completion to access Dired bookmarks, if
you use library `Bookmark+'.</span>"
  (interactive "<span class="quote">P</span>")
  (when (require 'bookmark+ nil t)
    (define-key minibuffer-local-completion-map (icicle-kbd "<span class="quote">C-x m</span>") <span class="linecomment">; `C-x m'</span>
      'icicle-bookmark-dired-other-window))
  (unwind-protect
       <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets?</span>
       (let ((set-name  (completing-read "<span class="quote">Project (saved file names): </span>"
                                         (if (and icicle-filesets-as-saved-completion-sets-flag
                                                  (featurep 'filesets) filesets-data)
                                             (append filesets-data icicle-saved-completion-sets)
                                           icicle-saved-completion-sets)
                                         nil nil nil 'icicle-completion-set-history)))
         (icicle-retrieve-candidates-from-set set-name)
         (let* ((default-directory  (if prompt-for-dir-p
                                        (read-file-name "<span class="quote">Dired directory: </span>" nil default-directory nil)
                                      default-directory))
                (file-names         ()))
           (dolist (ff  icicle-saved-completion-candidates)
             (when (or (icicle-file-remote-p ff) <span class="linecomment">; Don't let Tramp try to access it.</span>
                       (file-exists-p ff))
               (push ff file-names)))
           (unless file-names (error "<span class="quote">No files in project `%s' actually exist</span>" set-name))
           (dired (cons (generate-new-buffer-name set-name)
                        (nreverse (mapcar (lambda (file)
                                            (if (file-name-absolute-p file)
                                                (expand-file-name file)
                                              file))
                                          file-names))))))
    (define-key minibuffer-local-completion-map (icicle-kbd "<span class="quote">C-x m</span>") nil)))

<span class="linecomment">;;;###autoload (autoload 'icicle-dired-project-other-window "icicles")</span>
(defun icicle-dired-project-other-window (prompt-for-dir-p) <span class="linecomment">; Bound to `C-{' in Dired.</span>
  "<span class="quote">Open Dired on a saved project in another window.
A project is either a persistent completion set or an Emacs fileset.
With a prefix argument, you are prompted for the directory.
Otherwise, the default directory is assumed.

Project file names that do not correspond to existing files are
ignored.  Existence of files with relative names is checked in the
directory.

You can use `C-x m' during completion to access Dired bookmarks, if
you use library `Bookmark+'.</span>"
  (interactive "<span class="quote">P</span>")
  (when (require 'bookmark+ nil t)
    (define-key minibuffer-local-completion-map (icicle-kbd "<span class="quote">C-x m</span>") <span class="linecomment">; `C-x m'</span>
      'icicle-bookmark-dired-other-window))
  (unwind-protect
       <span class="linecomment">;; $$$$$$$ Maybe filter sets to get only file-name candidate sets?</span>
       (let ((set-name  (completing-read "<span class="quote">Project (saved file names): </span>"
                                         (if (and icicle-filesets-as-saved-completion-sets-flag
                                                  (featurep 'filesets) filesets-data)
                                             (append filesets-data icicle-saved-completion-sets)
                                           icicle-saved-completion-sets)
                                         nil nil nil 'icicle-completion-set-history)))
         (icicle-retrieve-candidates-from-set set-name)
         (let* ((default-directory  (if prompt-for-dir-p
                                        (read-file-name "<span class="quote">Dired directory: </span>" nil default-directory nil)
                                      default-directory))
                (file-names         ()))
           (dolist (ff  icicle-saved-completion-candidates)
             (when (or (icicle-file-remote-p ff) <span class="linecomment">; Don't let Tramp try to access it.</span>
                       (file-exists-p ff))
               (push ff file-names)))
           (unless file-names (error "<span class="quote">No files in project `%s' actually exist</span>" set-name))
           (dired-other-window (cons (generate-new-buffer-name set-name)
                                     (nreverse (mapcar (lambda (file)
                                                         (if (file-name-absolute-p file)
                                                             (expand-file-name file)
                                                           file))
                                                       file-names))))))
    (define-key minibuffer-local-completion-map (icicle-kbd "<span class="quote">C-x m</span>") nil)))

<span class="linecomment">;;;###autoload (autoload 'icicle-grep-saved-file-candidates "icicles")</span>
(defun icicle-grep-saved-file-candidates (command-args) <span class="linecomment">; Bound to `M-s M-s g' in Icicle mode.</span>
  "<span class="quote">Run `grep' on the set of completion candidates saved with \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-candidate-set-save]'.
Saved names that do not correspond to existing files are ignored.
Existence of files with relative names is checked in the default
directory.</span>"
  (interactive
   (list
    (let ((file-names  ()))
      (unless icicle-saved-completion-candidates
        (error "<span class="quote">%s</span>" (substitute-command-keys "<span class="quote">No saved completion candidates.  \
Use \\&lt;minibuffer-local-completion-map&gt;`\\[icicle-candidate-set-save]' to save candidates</span>")))
      (unless grep-command (grep-compute-defaults))
      (dolist (ff  icicle-saved-completion-candidates)
        (when (or (icicle-file-remote-p ff) <span class="linecomment">; Don't let Tramp try to access it.</span>
                  (file-exists-p ff))
          (push ff file-names)))
      (let ((default  (and (fboundp  'grep-default-command) (grep-default-command))))
        (read-from-minibuffer
         "<span class="quote">grep &lt;pattern&gt; &lt;files&gt; :  </span>"
         (let ((up-to-files  (concat grep-command "<span class="quote">   </span>")))
           (cons (concat up-to-files (mapconcat #'identity icicle-saved-completion-candidates "<span class="quote"> </span>"))
                 (- (length up-to-files) 2)))
         nil nil 'grep-history default)))))
  (grep command-args))

<span class="linecomment">;; Utility function.  Use it to define multi-commands that navigate.</span>
(defun icicle-explore (define-candidates-fn final-action-fn quit-fn error-fn cleanup-fn prompt
                                            &rest compl-read-args)
  "<span class="quote">Icicle explorer: explore complex completion candidates.
Navigate among locations or other entities represented by a set of
completion candidates.  See `icicle-search' for a typical example.

Arguments:
 DEFINE-CANDIDATES-FN:
   Function of no args called to fill `icicle-candidates-alist' with
   the candidates.
 FINAL-ACTION-FN:
   Function of no args called after the final choice of candidate
   (after both `icicle-explore-final-choice' and
   `icicle-explore-final-choice-full' have been set).  Typically uses
   `icicle-explore-final-choice-full', the full candidate.
 QUIT-FN: Function of no args called if user uses `C-g'.
 ERROR-FN: Function of no args called if an error is raised.
 CLEANUP-FN: Function of no args called after exploring.
 PROMPT: Prompt string for `completing-read'.
 COMPL-READ-ARGS: `completing-read' args other than PROMPT and
   COLLECTION.

If there is only one candidate, then FINAL-ACTION-FN is called
immediately.  The candidate is not available to act on (e.g. using
\\&lt;minibuffer-local-completion-map&gt;`\\[icicle-candidate-alt-action]').

Returns:
 The result of executing FINAL-ACTION-FN, if that arg is non-nil.
 Otherwise, `icicle-explore-final-choice-full'.

To use `icicle-explore' to define a multi-command, you must also bind
`icicle-candidate-action-fn'.

Though `icicle-explore' is typically used to define navigation
commands, it need not be.  It can be useful anytime you need to use
`completing-read' and also provide specific behavior for quitting
\(`C-g'), completion errors, and final actions.</span>"
  (let ((icicle-incremental-completion          'always)
        (icicle-whole-candidate-as-text-prop-p  t)
        (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
        (icicle-act-before-cycle-flag           icicle-act-before-cycle-flag)
        (icicle-orig-pt-explore                 (point-marker))
        (icicle-orig-win-explore                (selected-window))
        result)
    (setq icicle-act-before-cycle-flag      nil
          icicle-candidates-alist           ()
          icicle-explore-final-choice       nil
          icicle-explore-final-choice-full  nil)
    (icicle-highlight-lighter)
    (message "<span class="quote">Finding candidates...</span>")
    (when define-candidates-fn (funcall define-candidates-fn))
    (unless icicle-candidates-alist (error "<span class="quote">No candidates defined</span>"))
    (when (= (length icicle-candidates-alist) 1)
      (setq icicle-explore-final-choice  (icicle-display-cand-from-full-cand (car icicle-candidates-alist))))
    (unwind-protect
         (icicle-condition-case-no-debug failure
             (progn
               (unless icicle-explore-final-choice
                 (setq icicle-explore-final-choice
                       (let ((icicle-remove-icicles-props-p  nil)) <span class="linecomment">; Keep Icicles text properties.</span>
                         (apply #'completing-read prompt icicle-candidates-alist compl-read-args))))
               (setq icicle-explore-final-choice-full
                     (funcall icicle-get-alist-candidate-function icicle-explore-final-choice 'no-error-p))
               (unless icicle-explore-final-choice-full (error "<span class="quote">No such occurrence</span>"))
               (setq result  (if final-action-fn
                                 (funcall final-action-fn)
                               icicle-explore-final-choice-full)))
           (quit (if quit-fn (funcall quit-fn) (keyboard-quit)))
           (error (when error-fn (funcall error-fn))
                  (error "<span class="quote">%s</span>" (error-message-string failure))))
      (setq result  (icicle-unpropertize-completion result)) <span class="linecomment">; Remove any Icicles text properties.</span>
      (when cleanup-fn (funcall cleanup-fn)))
    result))

<span class="linecomment">;;;###autoload (autoload 'icicle-execute-extended-command "icicles")</span>
(icicle-define-command icicle-execute-extended-command <span class="linecomment">; Bound to `M-x' in Icicle mode.</span>
  "<span class="quote">Read command name, then read its arguments and call it.
This is `execute-extended-command', turned into a multi-command.

You can use `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-transforming]' \
to toggle filtering of candidates to those that are
bound to keys.

You can use `\\[icicle-toggle-annotation]' to toggle showing key bindings as annotations.
\(Menu bindings are not shown.)

By default, Icicle mode remaps all key sequences that are normally
bound to `execute-extended-command' to
`icicle-execute-extended-command'.  If you do not want this remapping,
then customize option `icicle-top-level-key-bindings'.</span>" <span class="linecomment">; Doc string</span>
  icicle-execute-extended-command-1     <span class="linecomment">; Function to perform the action</span>
  (format "<span class="quote">Execute command%s: </span>"         <span class="linecomment">; `completing-read' args</span>
          (if current-prefix-arg
              (format "<span class="quote"> (prefix %d)</span>" (prefix-numeric-value current-prefix-arg))
            "<span class="quote"></span>"))
  obarray (and icompletep  pred) t nil 'extended-command-history nil nil
  (<span class="linecomment">;; Bindings</span>
   (last-command                            last-command) <span class="linecomment">; Save and restore the last command.</span>
   (use-file-dialog                         nil) <span class="linecomment">; `mouse-2' in `*Completions*' won't use dialog box.</span>
   (alt-fn                                  nil)
   (icicle-orig-must-pass-after-match-pred  icicle-must-pass-after-match-predicate)
   (pred                                    (lambda (c)
                                              (unless (symbolp c) (setq c  (intern-soft c)))
                                              (commandp c)))
   (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
   (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred))
   (icicle-candidate-alt-action-fn          (or icicle-candidate-alt-action-fn
                                                (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>")))
   (icicle--last-toggle-transforming-msg    icicle-toggle-transforming-message)
   (icicle-toggle-transforming-message      "<span class="quote">Filtering to commands bound to keys is now %s</span>")
   (icicle-last-transform-function          (lambda (cands) <span class="linecomment">; Because we bind `icicle-transform-function'.</span>
                                              (with-current-buffer icicle-pre-minibuffer-buffer
                                                (loop for cand in cands
                                                      for symb = (intern-soft cand)
                                                      if (and (symbolp symb)
                                                              (where-is-internal symb nil 'non-ascii))
                                                      collect cand))))
   (icicle-transform-function               nil)
   (completion-annotate-function            (lambda (cand)
                                              (with-current-buffer icicle-pre-minibuffer-buffer
                                                (and (setq cand  (intern-soft cand))  (symbolp cand)
                                                     (let ((key  (where-is-internal cand nil t)))
                                                       (and key
                                                            (format "<span class="quote">  %s</span>" (icicle-key-description key))))))))
   icicle-new-last-cmd)                 <span class="linecomment">; Set in `icicle-execute-extended-command-1'.</span>
  nil  nil                              <span class="linecomment">; First code, undo code</span>
  (setq this-command  icicle-new-last-cmd)) <span class="linecomment">; Last code: this will update `last-command'</span>

<span class="linecomment">;; Free vars here: `icicle-orig-buff' and `icicle-orig-window' are bound by `icicle-define-command'.</span>
<span class="linecomment">;;                 `icicle-new-last-cmd' and `icicle-orig-must-pass-after-match-pred' are bound in</span>
<span class="linecomment">;;                 `icicle-execute-extended-command'.</span>
(defun icicle-execute-extended-command-1 (cmd-name)
  "<span class="quote">Action function to execute command or named keyboard macro CMD-NAME.</span>"
  (when (get-buffer icicle-orig-buff) (set-buffer icicle-orig-buff))
  (when (window-live-p icicle-orig-window) (select-window icicle-orig-window))
  (when (string= "<span class="quote"></span>" cmd-name) (error "<span class="quote">No command name</span>"))

  (let* ((cmd                                       (intern cmd-name))
         (fn                                        (and (fboundp cmd)  (symbol-function cmd)))
         (count                                     (prefix-numeric-value current-prefix-arg))
         (completion-annotate-function              nil) <span class="linecomment">; Cancel value from `icicle-execute-extended-command'.</span>
         (icicle-toggle-transforming-message        icicle--last-toggle-transforming-msg) <span class="linecomment">; Restore - FREE HERE</span>
         <span class="linecomment">;; Rebind alternative action functions to nil, so we don't override the command we call.</span>
         (icicle-candidate-alt-action-fn            nil)
         (icicle-all-candidates-list-alt-action-fn  nil)
         <span class="linecomment">;; Rebind `icicle-candidate-action-fn' to a function that calls the candidate command on a single</span>
         <span class="linecomment">;; argument that it reads.  This is used only if the command itself reads an input argument with</span>
         <span class="linecomment">;; completion.  When that is the case, you can use completion on that input, and if you do that,</span>
         <span class="linecomment">;; you can use `C-RET' to use the candidate command as a multi-command.  In other words, this</span>
         <span class="linecomment">;; binding allows for two levels of multi-commands.</span>
         (icicle-candidate-action-fn
          (and icicle-candidate-action-fn <span class="linecomment">; This is nil after the command name is read.</span>
               `(lambda (arg)
                 (setq arg  (icicle-transform-multi-completion arg))
                 (condition-case nil
                     (funcall ',cmd arg) <span class="linecomment">; Try to use string candidate `arg'.</span>
                   <span class="linecomment">;; If that didn't work, use a symbol or number candidate.</span>
                   (wrong-type-argument (funcall ',cmd (car (read-from-string arg))))
                   (wrong-number-of-arguments (funcall #'icicle-help-on-candidate))) <span class="linecomment">; Punt - show help.</span>
                 (select-window (minibuffer-window))
                 (select-frame-set-input-focus (selected-frame))))))

    (cond ((arrayp fn)
           (let ((this-command  cmd)) (execute-kbd-macro fn count))
           (when (&gt; count 1) (message "<span class="quote">(%d times)</span>" count)))
          ((commandp cmd)
           (run-hooks 'post-command-hook)
           (run-hooks 'pre-command-hook)
           (let ((enable-recursive-minibuffers            t)
                 <span class="linecomment">;; Restore this before we invoke command, since it might use completion.</span>
                 (icicle-must-pass-after-match-predicate  icicle-orig-must-pass-after-match-pred)
                 <span class="linecomment">;; Bind, don't set `this-command'.  When you use `C-next', `this-command' needs</span>
                 <span class="linecomment">;; to be `cmd' during the `C-RET' part, but `last-command' must not be `cmd'</span>
                 <span class="linecomment">;; during the `next' part.</span>
                 (this-command                            cmd))
             (call-interactively cmd 'record-it)))
          <span class="linecomment">;; Should not happen, since `icicle-e*-e*-command' calls `completing-read' with non-nil REQUIRE arg.</span>
          (t (error "<span class="quote">Not a command: `%s'</span>" cmd-name)))

    <span class="linecomment">;; Message showing what CMD is bound to.  This is pretty much the same as in `execute-extended-command',</span>
    <span class="linecomment">;; but do not show the message if we are not at the `M-x' top level, i.e., if we are acting on a</span>
    <span class="linecomment">;; candidate command using `C-RET' instead of `RET'.</span>
    (when (and suggest-key-bindings  (not executing-kbd-macro)
               (not (or (icicle-get-safe this-command 'icicle-action-command)
                        <span class="linecomment">;; This one is used for `*-per-mode-action', which sets `this-command' to the cycler.</span>
                        (icicle-get-safe this-command 'icicle-cycling-command))))
      (let* ((binding   (if (&gt; emacs-major-version 21)
                            (where-is-internal cmd overriding-local-map t 'NOINDIRECT)
                          (where-is-internal cmd overriding-local-map t)))
             (curr-msg   (current-message))
             (wait-time  (or (and (numberp suggest-key-bindings)  suggest-key-bindings)  2)))
        (when (and binding  (not (and (vectorp binding)  (eq (aref binding 0) 'mouse-movement))))
          (let ((message-log-max  nil)  <span class="linecomment">; Do not log this message.</span>
                <span class="linecomment">;; If CMD showed a msg in echo area, wait a bit, before showing the key-reminder msg.</span>
                (waited           (sit-for (if (current-message)  wait-time  0))))
            (when (and waited  (atom unread-command-events))
              (unwind-protect
                   (progn (message "<span class="quote">You can invoke command `%s' using `%s'</span>"
                                   (icicle-propertize (symbol-name cmd) 'face 'icicle-msg-emphasis)
                                   (icicle-propertize (key-description binding) 'face 'icicle-msg-emphasis))
                          (sit-for wait-time))
                (message "<span class="quote">%s</span>" curr-msg)))))))
    <span class="linecomment">;; After `M-x' `last-command' must be the command finally entered with `RET' or, if you end</span>
    <span class="linecomment">;; with `C-g', the last command entered with `C-RET'.</span>
    (setq icicle-new-last-cmd  cmd)))

<span class="linecomment">;; Inspired by Emacs partial completion and by library `exec-abbrev-cmd.el' (Tassilo Horn</span>
<span class="linecomment">;; &lt;tassilo@member.fsf.org&gt;).  The idea of command abbreviation is combined here with normal</span>
<span class="linecomment">;; command invocation, in an Icicles multi-command.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-command-abbrev "icicles")</span>
(icicle-define-command icicle-command-abbrev <span class="linecomment">; Bound to `C-x SPC' in Icicle mode.</span>
  "<span class="quote">Read command name or its abbreviation, read command args, call command.
Read input, then call `icicle-command-abbrev-action' to act on it.

If `icicle-add-proxy-candidates-flag' is non-nil, then command
abbreviations, as well as commands, are available as completion
candidates.  Otherwise, only commands are available.  You can toggle
`icicle-add-proxy-candidates-flag' using `\\&lt;minibuffer-local-completion-map&gt;\
\\[icicle-toggle-proxy-candidates]'in the minibuffer.

When an abbreviation is available, you can treat it just like a
command.  The rest of this description covers the behavior of choosing
an abbreviation.

Completion for an abbreviation is lax.  If you enter a new
abbreviation then it is added to option `icicle-command-abbrev-alist',
which is the list of your known abbreviations.  You can also customize
this list.

If an abbreviation that you enter matches a single command name then
that command is invoked.  If it matches more than one, then you can
use (strict) completion to choose one.

Hyphens (`-') in command names divide them into parts.  For example,
`find-file' has two parts: `find' and `file'.  Each character of a
command abbreviation corresponds to one part of each of the commands
that match the abbreviation.  For example, abbreviation `ff' matches
commands `find-file' and `focus-frame', and abbreviation `fg' matches
`find-grep'.

If user option `icicle-command-abbrev-match-all-parts-flag' is nil
then an abbreviation need not match all parts of a command name; it
need match only a prefix.  For example, if nil then abbreviation `ff'
also matches `find-file-other-window' and `fg' also matches
`find-grep-dired'.

You can use `\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-transforming]' \
to toggle filtering of candidates to those that are
bound to keys.

You can use `\\[icicle-toggle-annotation]' to toggle showing key bindings as annotations.
\(Menu bindings are not shown.)</span>"        <span class="linecomment">; Doc string</span>
  icicle-command-abbrev-action          <span class="linecomment">; Function to perform the action</span>
  prompt obarray (and icompletep  pred) nil nil <span class="linecomment">; `completing-read' args</span>
  'icicle-command-abbrev-history nil nil
  ((prompt                                  "<span class="quote">Command or abbrev: </span>")
   (last-command                            last-command) <span class="linecomment">; Save and restore the last command.</span>
   (icicle-sort-comparer                    'icicle-proxy-candidate-first-p)
   (first-sort-entries                      '(("<span class="quote">proxy candidates first</span>" . icicle-proxy-candidate-first-p)
                                              ("<span class="quote">by abbrev frequency</span>" . icicle-command-abbrev-used-more-p)))
   (icicle-sort-orders-alist                (append
                                             first-sort-entries
                                             (delete (car first-sort-entries)
                                                     (delete (cadr first-sort-entries)
                                                             (copy-sequence icicle-sort-orders-alist)))))
   (icicle-allowed-sort-predicate           'icicle-command-abbrev-used-more-p)
   (icicle-proxy-candidates                 (let ((ipc  ())
                                                  abv)
                                              (dolist (entry  icicle-command-abbrev-alist  ipc)
                                                (setq abv  (symbol-name (cadr entry)))
                                                (unless (member abv ipc) (push abv ipc)))
                                              ipc))
   (use-file-dialog                         nil) <span class="linecomment">; `mouse-2' in `*Completions*' won't use dialog box.</span>
   (alt-fn                                  nil)
   (icicle-orig-must-pass-after-match-pred  icicle-must-pass-after-match-predicate)
   (pred                                    (lambda (c)
                                              (unless (symbolp c) (setq c  (intern-soft c)))
                                              (commandp c)))
   (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
   (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred))
   (icicle-candidate-alt-action-fn          (or icicle-candidate-alt-action-fn
                                                (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>")))
   (icicle-toggle-transforming-message      "<span class="quote">Filtering to commands bound to keys is now %s</span>")
   (icicle-last-transform-function          (lambda (cands) <span class="linecomment">; Because we bind `icicle-transform-function'.</span>
                                              (with-current-buffer icicle-pre-minibuffer-buffer
                                                (loop for cand in cands
                                                      for symb = (intern-soft cand)
                                                      if (and (symbolp symb)
                                                              (where-is-internal symb nil 'non-ascii))
                                                      collect cand))))
   (icicle-transform-function               nil)
   (completion-annotate-function            (lambda (cand)
                                              (with-current-buffer icicle-pre-minibuffer-buffer
                                                (and (setq cand  (intern-soft cand))  (symbolp cand)
                                                     (let ((key  (where-is-internal cand nil t)))
                                                       (and key
                                                            (format "<span class="quote">  %s</span>" (icicle-key-description key)))))))))
  (when icicle-proxy-candidates (put-text-property 0 1 'icicle-fancy-candidates t prompt)) <span class="linecomment">; First code</span>
  nil (setq icicle-proxy-candidates  ())) <span class="linecomment">; Undo code, last code</span>

(defun icicle-command-abbrev-action (abbrev-or-cmd)
  "<span class="quote">Action function for `icicle-command-abbrev'.
If ABBREV-OR-CMD is a command, call it.
If ABBREV-OR-CMD is an abbreviation for a single command, invoke it.
If ABBREV-OR-CMD is an abbreviation for multiple commands, call
`icicle-command-abbrev-command', to let user choose commands.
If ABBREV-OR-CMD is not an abbreviation or a command, raise an error.</span>"
  (setq abbrev-or-cmd  (intern abbrev-or-cmd))
  (let* ((completion-annotate-function              nil) <span class="linecomment">; Cancel value from `icicle-command-abbrev'.</span>
         (icicle-add-proxy-candidates-flag          icicle-add-proxy-candidates-flag)
         (icicle-proxy-candidates                   icicle-proxy-candidates)
         <span class="linecomment">;; Restore this before we invoke command, since it might use completion.</span>
         <span class="linecomment">;; Free var `orig-must-pass...' is bound in `icicle-command-abbrev'.</span>
         (icicle-must-pass-after-match-predicate    icicle-orig-must-pass-after-match-pred)
         <span class="linecomment">;; Rebind alternative action functions to nil, so we don't override command we call.</span>
         (icicle-candidate-alt-action-fn            nil)
         (icicle-all-candidates-list-alt-action-fn  nil)
         (not-cmdp                                  (not (commandp abbrev-or-cmd)))
         (regexp                                    (and (or not-cmdp  icicle-command-abbrev-priority-flag)
                                                         (icicle-command-abbrev-regexp abbrev-or-cmd)))
         (icicle-commands-for-abbrev
          (and (or not-cmdp  icicle-command-abbrev-priority-flag)
               (nconc (let ((result  ()))
                        (dolist (abrv  icicle-command-abbrev-alist)
                          (when (string= (symbol-name (cadr abrv)) (symbol-name abbrev-or-cmd))
                            (push (list (symbol-name (car abrv))) result)))
                        result)
                      (icicle-command-abbrev-matching-commands regexp)))))
    (cond ((and not-cmdp  (null icicle-commands-for-abbrev))
           (error "<span class="quote">No such command or abbreviation `%s'</span>" abbrev-or-cmd))
          (icicle-commands-for-abbrev
           (let ((cmd  (if (null (cdr icicle-commands-for-abbrev))
                           (prog1 (intern (caar icicle-commands-for-abbrev))
                             (push (caar icicle-commands-for-abbrev) extended-command-history)
                             (call-interactively (intern (caar icicle-commands-for-abbrev)) t))
                         (let ((enable-recursive-minibuffers  t)
                               (icicle-current-input          abbrev-or-cmd))
                           (icicle-remove-Completions-window)
                           (icicle-command-abbrev-command)))))
             (icicle-command-abbrev-record abbrev-or-cmd cmd)))
          ((not not-cmdp) (call-interactively abbrev-or-cmd)))))

(defun icicle-command-abbrev-regexp (abbrev)
  "<span class="quote">Return the command-matching regexp for ABBREV.</span>"
  (let ((char-list  (append (symbol-name abbrev) ()))
        (str        "<span class="quote">^</span>"))
    (dolist (c  char-list) (setq str  (concat str (list c) "<span class="quote">[^-]*-</span>")))
    (concat (substring str 0 (1- (length str)))
            (if icicle-command-abbrev-match-all-parts-flag "<span class="quote">$</span>" "<span class="quote">.*$</span>"))))

(defun icicle-command-abbrev-matching-commands (regexp)
  "<span class="quote">Return a completion alist of commands that match REGEXP.</span>"
  (mapcar #'list (icicle-remove-if-not
                  `(lambda (strg) (string-match ',regexp strg))
                  (lexical-let ((cmds  ()))
                    (mapatoms
                     (lambda (symb) (when (commandp symb) (push (symbol-name symb) cmds)))) <span class="linecomment">; FREE here: CMDS.</span>
                    cmds))))

<span class="linecomment">;;;###autoload (autoload 'icicle-command-abbrev-command "icicles")</span>
(icicle-define-command icicle-command-abbrev-command
  "<span class="quote">Read command name, then read its arguments and call command.</span>" <span class="linecomment">; Doc string</span>
  icicle-execute-extended-command-1     <span class="linecomment">; Function to perform the action</span>
  (format "<span class="quote">Command abbreviated%s%s: </span>"   <span class="linecomment">; `completing-read' arguments</span>
          (cond ((and icicle-current-input  (not (string= "<span class="quote"></span>" icicle-current-input)))
                 (format "<span class="quote"> `%s'</span>" icicle-current-input))
                (icicle-candidate-nb
                 (format "<span class="quote"> `%s'</span>" (elt icicle-completion-candidates icicle-candidate-nb)))
                (t "<span class="quote"></span>"))
          (if current-prefix-arg
              (format "<span class="quote"> (prefix %d)</span>" (prefix-numeric-value current-prefix-arg))
            "<span class="quote"></span>"))
  icicle-commands-for-abbrev nil t nil 'extended-command-history nil nil
  (<span class="linecomment">;; Bindings</span>
   (use-file-dialog                   nil) <span class="linecomment">; `mouse-2' in `*Completions*' shouldn't use file dialog.</span>
   (alt-fn                            nil)
   (icicle-candidate-alt-action-fn    (or icicle-candidate-alt-action-fn
                                          (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>")))
   (icicle-add-proxy-candidates-flag  nil) <span class="linecomment">; No abbrevs - just commands here.</span>
   (last-command                      last-command) <span class="linecomment">; Save and restore the last command.</span>
   icicle-new-last-cmd)                 <span class="linecomment">; Set in `icicle-execute-extended-command-1'.</span>
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (setq this-command  icicle-new-last-cmd) <span class="linecomment">; Last code: this will update `last-command'.</span>
  'NON-INTERACTIVE)                     <span class="linecomment">; This is not a real command.</span>

(defun icicle-command-abbrev-record (abbrev command)
  "<span class="quote">Record ABBREV and COMMAND in `icicle-command-abbrev-alist'.</span>"
  (let ((entry  (assq command icicle-command-abbrev-alist)))
    (when (and abbrev  command)
      (if entry
          (setq icicle-command-abbrev-alist  (cons (list command abbrev (1+ (car (cddr entry))))
                                                   (delete entry icicle-command-abbrev-alist)))
        (push (list command abbrev 1) icicle-command-abbrev-alist)))))

<span class="linecomment">;;;###autoload (autoload 'icicle-execute-named-keyboard-macro "icicles")</span>
(icicle-define-command icicle-execute-named-keyboard-macro <span class="linecomment">; Bound to `C-x M-e' in Icicle mode.</span>
  "<span class="quote">Read the name of a keyboard macro, then execute it.</span>"
  icicle-execute-extended-command-1     <span class="linecomment">; Function to perform the action</span>
  (format "<span class="quote">Execute keyboard macro%s: </span>"  <span class="linecomment">; `completing-read' args</span>
          (if current-prefix-arg
              (format "<span class="quote"> (prefix %d)</span>" (prefix-numeric-value current-prefix-arg))
            "<span class="quote"></span>"))
  obarray (and icompletep  pred) t nil 'icicle-kmacro-history nil nil
  ((last-command                            last-command) <span class="linecomment">; Save and restore the last command.</span>
   (alt-fn                                  nil)
   (icicle-orig-must-pass-after-match-pred  icicle-must-pass-after-match-predicate)
   (pred                                    (lambda (fn)
                                              (unless (symbolp fn) (setq fn  (intern fn)))
                                              (and (commandp fn)  (arrayp (symbol-function fn)))))
   (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
   (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred))
   (icicle-candidate-alt-action-fn          (or icicle-candidate-alt-action-fn
                                                (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">command</span>")))))

<span class="linecomment">;;;###autoload (when (locate-library "kmacro") (autoload 'icicle-kmacro "icicles"))</span>
(when (locate-library "<span class="quote">kmacro</span>")
  (icicle-define-command icicle-kmacro  <span class="linecomment">; Bound to `S-f4' in Icicle mode (Emacs 22+).</span>
    "<span class="quote">Execute a keyboard macro according to its position in `kmacro-ring'.
Macros in the keyboard macro ring are given names `1', `2', and so on,
for use as completion candidates.

With prefix argument, repeat macro that many times (but see below).
If a macro is still being defined, end it first, then execute it.

Since this is a multi-command, you can execute any number of macros
any number of times in a single invocation.  In particular, you can
execute a given macro repeatedly using `C-RET' (be sure you use `TAB'
first, to make it the current candidate).

If you use a prefix arg for `icicle-kmacro', then each multi-command
action (e.g. `C-RET') repeats the macro that number of times.  However
if you use a prefix arg for an individual action, then the action
repeats the macro that number of times.  Without its own prefix arg,
an action uses the base prefix arg you used for `icicle-kmacro'.</span>"
    icicle-kmacro-action                <span class="linecomment">; Function to perform the action</span>
    (format "<span class="quote">Execute keyboard macro%s: </span>" <span class="linecomment">; `completing-read' args</span>
            (if current-prefix-arg
                (format "<span class="quote"> (prefix %s)</span>" (prefix-numeric-value current-prefix-arg))
              "<span class="quote"></span>"))
    (lexical-let ((count  0))
      (setq icicle-kmacro-alist
            (mapcar (lambda (x) (cons (format "<span class="quote">%d</span>" (setq count  (1+ count))) x)) <span class="linecomment">; FREE here: COUNT.</span>
                    (reverse (if nil kmacro-ring (cons (kmacro-ring-head) kmacro-ring))))))
    nil 'NO-EXIT-WO-MATCH nil 'icicle-kmacro-history
    (and (kmacro-ring-head)  (null kmacro-ring)  "<span class="quote">1</span>") nil
    ((icicle-pref-arg  current-prefix-arg))    <span class="linecomment">; Additional bindings</span>
    (progn                              <span class="linecomment">; First code</span>
      (unless (require 'kmacro nil t) (error "<span class="quote">This command requires library `kmacro.el'</span>"))
      (when defining-kbd-macro (kmacro-end-or-call-macro current-prefix-arg) (error "<span class="quote">Done</span>"))
      (unless (or (kmacro-ring-head)  kmacro-ring) (error "<span class="quote">No keyboard macro defined</span>"))))

  <span class="linecomment">;; Free vars here: `icicle-orig-buff' & `icicle-orig-window' are bound by `icicle-define-command'.</span>
  <span class="linecomment">;;                 `icicle-pref-arg' is bound in `icicle-kmacro'.</span>
  (defun icicle-kmacro-action (cand)
    "<span class="quote">Action function for `icicle-kmacro'.</span>"
    (when (get-buffer icicle-orig-buff) (set-buffer icicle-orig-buff))
    (when (window-live-p icicle-orig-window) (select-window icicle-orig-window))
    (let* ((count  (if current-prefix-arg (prefix-numeric-value current-prefix-arg) icicle-pref-arg))
           (macro  (cadr (assoc cand icicle-kmacro-alist))))
      (unless macro (error "<span class="quote">No such macro: `%s'</span>" cand))
      (execute-kbd-macro macro count #'kmacro-loop-setup-function)
      (when (&gt; count 1)
        (message "<span class="quote">(%s times)</span>" (icicle-propertize count 'face 'icicle-msg-emphasis))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-set-option-to-t "icicles")</span>
(icicle-define-command icicle-set-option-to-t <span class="linecomment">; Command name</span>
  "<span class="quote">Set option to t.  This makes sense for binary (toggle) options.
By default, completion candidates are limited to user options that
have `boolean' custom types.  However, there are many \"binary\" options
that allow other non-nil values than t.

You can use a prefix argument to change the set of completion
candidates, as follows:

 - With a non-negative prefix arg, all user options are candidates.
 - With a negative prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
  (lambda (opt) (set (intern opt) t) (message "<span class="quote">`%s' is now `t'</span>" opt)) <span class="linecomment">; Action function</span>
  "<span class="quote">Set option to t: </span>" obarray (and icompletep  pred) 'must-confirm nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil
  ((enable-recursive-minibuffers            t) <span class="linecomment">; Bindings</span>
   (icicle-use-candidates-only-once-flag    t)
   (alt-fn                                  nil)
   (pred
    (cond ((and current-prefix-arg  (wholenump (prefix-numeric-value current-prefix-arg)))
           (lambda (x)
             (unless (symbolp x) (setq x  (intern x)))
             (and (boundp x)  (user-variable-p x)  (eq nil (symbol-value x)))))
          (current-prefix-arg
           (lambda (x)
             (unless (symbolp x) (setq x  (intern x)))
             (and (boundp x)  (eq nil (symbol-value x)))))
          (t
           (lambda (x)
             (unless (symbolp x) (setq x  (intern x)))
             (and (boundp x)  (icicle-binary-option-p x)  (eq nil (symbol-value x)))))))
   (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
   (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn  (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>")))))

<span class="linecomment">;;;###autoload (autoload 'icicle-clear-history "icicles")</span>
(icicle-define-command icicle-clear-history
  "<span class="quote">Clear a minibuffer history of selected entries.
You are prompted for the history to clear, then you are prompted for
the entries to delete from it.  You can use multi-command completion
for both inputs.  That is, you can act on multiple histories and
delete multiple entries from each.

For convenience, you can use \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-delete-candidate-object]' the same way as `C-RET': Each
of them deletes the current entry candidate from the history.

With a prefix argument, empty the chosen history completely
\(you are not prompted to choose history entries to delete).

`icicle-act-before-cycle-flag' is bound to t here during completion of
history entries, so `C-next' and so on act on the current candidate.</span>"
  icicle-clear-history-1                <span class="linecomment">; Function to perform the action</span>
  "<span class="quote">History to clear: </span>" icicle-clear-history-hist-vars <span class="linecomment">; `completing-read' args</span>
  nil t nil nil (symbol-name minibuffer-history-variable) nil
  ((icicle-pref-arg                 current-prefix-arg) <span class="linecomment">; Bindings</span>
   (enable-recursive-minibuffers    t)
   (icicle-transform-function       'icicle-remove-duplicates)
   (icicle-clear-history-hist-vars  `((,(symbol-name minibuffer-history-variable))
                                      (,(symbol-name 'icicle-previous-raw-file-name-inputs))
                                      (,(symbol-name 'icicle-previous-raw-non-file-name-inputs))))
   (icicle-delete-candidate-object  'icicle-clear-history-entry))
  (mapatoms (lambda (x) (when (and (boundp x)  (consp (symbol-value x)) <span class="linecomment">; First code</span>
                                   (stringp (car (symbol-value x)))
                                   (string-match "<span class="quote">-\\(history\\|ring\\)\\'</span>" (symbol-name x)))
                          (push (list (symbol-name x)) <span class="linecomment">; FREE here: ICICLE-CLEAR-HISTORY-HIST-VARS.</span>
                                icicle-clear-history-hist-vars)))))

<span class="linecomment">;; Free vars here: `icicle-pref-arg' is bound in `icicle-clear-history'.</span>
(defun icicle-clear-history-1 (hist)
  "<span class="quote">Action function for `icicle-clear-history' history-variable candidates.</span>"
  (setq hist  (intern hist))
  (if (not icicle-pref-arg)
      (let* ((icicle-candidate-action-fn              'icicle-clear-history-entry)
             (icicle-transform-function               'icicle-remove-duplicates)
             (icicle-clear-history-hist               hist)
             (icicle-use-candidates-only-once-flag    t)
             (icicle-show-Completions-initially-flag  t)
             (icicle-act-before-cycle-flag            t))
        (when hist                      <span class="linecomment">; Maybe there are no more, due to deletion actions.</span>
          (funcall icicle-candidate-action-fn
                   (completing-read "<span class="quote">Clear input: </span>" (mapcar #'list (symbol-value hist)) nil t))))
    (set hist nil))
  (unless hist (message "<span class="quote">History `%s' is now empty</span>" hist))
  nil)

<span class="linecomment">;; Free vars here: `icicle-clear-history-hist' is bound in `icicle-clear-history-1'</span>
<span class="linecomment">;; and in `icicle-clear-current-history'.</span>
(defun icicle-clear-history-entry (cand)
  "<span class="quote">Action function for history entry candidates in `icicle-clear-history'.</span>"
  (unless (string= "<span class="quote"></span>" cand)
    (set icicle-clear-history-hist
         (icicle-remove-if
          `(lambda (x)
            (string= (icicle-substring-no-properties ',cand) (icicle-substring-no-properties x)))
          (symbol-value icicle-clear-history-hist)))
    <span class="linecomment">;; We assume here that CAND was in fact present in the history originally.</span>
    (message "<span class="quote">`%s' deleted from history `%s'</span>" cand icicle-clear-history-hist))
  nil)

<span class="linecomment">;;;###autoload (autoload 'icicle-clear-current-history "icicles")</span>
(icicle-define-command icicle-clear-current-history <span class="linecomment">; Bound to `M-i' in minibuffer.</span>
  "<span class="quote">Clear current minibuffer history of selected entries.
You are prompted for the history entries to delete.

With a prefix argument, however, empty the history completely
\(you are not prompted to choose history entries to delete).

`icicle-act-before-cycle-flag' is bound to t here during completion of
history entries, so `C-next' and so on act on the current candidate.</span>"
  icicle-clear-history-entry            <span class="linecomment">; Action function</span>
  "<span class="quote">Clear input: </span>" (mapcar #'list (symbol-value icicle-clear-history-hist)) <span class="linecomment">; `completing-read' args</span>
  nil t nil nil nil nil
  ((icicle-pref-arg                         current-prefix-arg) <span class="linecomment">; Bindings</span>
   (enable-recursive-minibuffers            t)
   (icicle-transform-function               'icicle-remove-duplicates)
   (icicle-use-candidates-only-once-flag    t)
   (icicle-show-Completions-initially-flag  t)
   (icicle-clear-history-hist               minibuffer-history-variable))
  (when icicle-pref-arg                 <span class="linecomment">; First code</span>
    (icicle-ding)                       <span class="linecomment">; Use `error' just to exit and make sure message is seen.</span>
    (if (not (yes-or-no-p (format "<span class="quote">Are you sure you want to empty `%s' completely? </span>"
                                  minibuffer-history-variable)))
        (error "<span class="quote"></span>")
      (set minibuffer-history-variable nil)
      (error "<span class="quote">History `%s' is now empty</span>" minibuffer-history-variable))))

(when (and icicle-define-alias-commands-flag  (not (fboundp 'clear-option)))
  (defalias 'clear-option 'icicle-reset-option-to-nil))

<span class="linecomment">;;;###autoload (autoload 'icicle-reset-option-to-nil "icicles")</span>
(icicle-define-command icicle-reset-option-to-nil <span class="linecomment">; Command name</span>
  "<span class="quote">Set option to nil.  This makes sense for binary and list options.
By default, the set of completion candidates is limited to user
options.  Note: it is *not* limited to binary and list options.
With a prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
  (lambda (opt) (set (intern opt) nil) (message "<span class="quote">`%s' is now `nil'</span>" opt)) <span class="linecomment">; Action function</span>
  "<span class="quote">Clear option (set it to nil): </span>" obarray (and icompletep  pred) t nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history)
  nil nil
  ((enable-recursive-minibuffers            t) <span class="linecomment">; Bindings</span>
   (icicle-use-candidates-only-once-flag    t)
   (alt-fn                                  nil)
   (pred                                    (if current-prefix-arg
                                                (lambda (x)
                                                  (unless (symbolp x) (setq x  (intern x)))
                                                  (and (boundp x)  (symbol-value x)))
                                              (lambda (x)
                                                (unless (symbolp x) (setq x  (intern x)))
                                                (and (boundp x)  (user-variable-p x)  (symbol-value x)))))
   (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
   (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn  (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>")))))

(when (and icicle-define-alias-commands-flag  (not (fboundp 'toggle)))
  (defalias 'toggle 'icicle-toggle-option))

<span class="linecomment">;;;###autoload (autoload 'icicle-toggle-option "icicles")</span>
(icicle-define-command icicle-toggle-option <span class="linecomment">; Command name</span>
  "<span class="quote">Toggle option's value.  This makes sense for binary (toggle) options.
By default, completion candidates are limited to user options that
have `boolean' custom types.  However, there are many \"binary\" options
that allow other non-nil values than t.

You can use a prefix argument to change the set of completion
candidates, as follows:

 - With a non-negative prefix arg, all user options are candidates.
 - With a negative prefix arg, all variables are candidates.</span>" <span class="linecomment">; Doc string</span>
  (lambda (opt)                         <span class="linecomment">; Action function</span>
    (let ((sym  (intern opt)))
      (set sym (not (eval sym)))
      (message "<span class="quote">`%s' is now `%s'</span>" opt (icicle-propertize (eval sym) 'face 'icicle-msg-emphasis))))
  "<span class="quote">Toggle value of option: </span>" obarray (and icompletep  pred) 'must-confirm nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil
  ((enable-recursive-minibuffers            t) <span class="linecomment">; Bindings</span>
   (alt-fn                                  nil)
   (pred
    (cond ((and current-prefix-arg  (wholenump (prefix-numeric-value current-prefix-arg)))
           (lambda (c) (unless (symbolp c) (setq c  (intern c))) (user-variable-p c)))
          (current-prefix-arg (lambda (c) (unless (symbolp c) (setq c  (intern c))) (boundp c)))
          (t                  (lambda (c)
                                (unless (symbolp c) (setq c  (intern c))) (icicle-binary-option-p c)))))
   (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
   (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn  (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>")))))

(defun icicle-binary-option-p (symbol)
  "<span class="quote">Non-nil if SYMBOL is a user option that has custom-type `boolean'.</span>"
  (eq (get symbol 'custom-type) 'boolean))

<span class="linecomment">;;;###autoload (autoload 'icicle-increment-option "icicles")</span>
(icicle-define-command icicle-increment-option <span class="linecomment">; Command name</span>
  "<span class="quote">Increment option's value using the arrow keys (`up', `down').
Completion candidates are limited to options that have `integer',
`float', and `number' custom types.
This command needs library `doremi.el'.</span>" <span class="linecomment">; Doc string</span>
  (lambda (opt)                         <span class="linecomment">; Action function</span>
    (let ((sym                                     (intern opt))
          <span class="linecomment">;; Restore this before we read number, since that might use completion.</span>
          (icicle-must-pass-after-match-predicate  icicle-orig-must-pass-after-match-pred))
      (icicle-doremi-increment-variable+ sym (icicle-read-number "<span class="quote">Increment (amount): </span>") t)
      (message "<span class="quote">`%s' is now `%s'</span>" opt (icicle-propertize (eval sym) 'face 'icicle-msg-emphasis))))
  "<span class="quote">Increment value of option: </span>" obarray (and icompletep  pred) 'must-confirm nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil
  ((enable-recursive-minibuffers            t) <span class="linecomment">; Bindings</span>
   (alt-fn                                  nil)
   (icicle-orig-must-pass-after-match-pred  icicle-must-pass-after-match-predicate)
   (pred                                    (lambda (symb)
                                              (unless (symbolp symb) (setq symb  (intern-soft symb)))
                                              (memq (get symb 'custom-type) '(number integer float))))
   (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
   (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn  (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">option</span>"))))
  (unless (require 'doremi nil t) (error "<span class="quote">This command needs library `doremi.el'.</span>"))) <span class="linecomment">; First code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-increment-variable "icicles")</span>
(icicle-define-command icicle-increment-variable <span class="linecomment">; Command name</span>
  "<span class="quote">Increment variable's value using the arrow keys (`up', `down').
With a prefix arg, only numeric user options are candidates.
With no prefix arg, all variables are candidates, even those that are
 not numeric. 
This command needs library `doremi.el'.</span>" <span class="linecomment">; Doc string</span>
  (lambda (var)                         <span class="linecomment">; FREE here: PREFIX-ARG.</span>
    (let ((sym                                     (intern var))
          <span class="linecomment">;; Restore this before we read number, since that might use completion.</span>
          (icicle-must-pass-after-match-predicate  icicle-orig-must-pass-after-match-pred))
      (icicle-doremi-increment-variable+ sym (icicle-read-number "<span class="quote">Increment (amount): </span>") prefix-arg)
      (message "<span class="quote">`%s' is now `%s'</span>" var (icicle-propertize (eval sym) 'face 'icicle-msg-emphasis))))
  "<span class="quote">Increment value of variable: </span>" obarray (and icompletep  pred) 'must-confirm nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'variable-name-history) 'variable-name-history 'icicle-variable-name-history) nil nil
  ((enable-recursive-minibuffers            t) <span class="linecomment">; Bindings</span>
   (prefix-arg                              current-prefix-arg)
   (alt-fn                                  nil)
   (icicle-orig-must-pass-after-match-pred  icicle-must-pass-after-match-predicate)
   (pred                                    (if prefix-arg
                                                (lambda (symb)
                                                  (unless (symbolp symb) (setq symb  (intern-soft symb)))
                                                  (memq (get symb 'custom-type) '(number integer float)))
                                              (lambda (symb)
                                                (unless (symbolp symb) (setq symb  (intern symb)))
                                                (boundp symb))))
   (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
   (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn
        (setq alt-fn  (icicle-alt-act-fn-for-type (if prefix-arg "<span class="quote">option</span>" "<span class="quote">variable</span>")))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn alt-fn
        (icicle-alt-act-fn-for-type (if prefix-arg "<span class="quote">option</span>" "<span class="quote">variable</span>")))))
  (unless (require 'doremi nil t) (error "<span class="quote">This command needs library `doremi.el'.</span>"))) <span class="linecomment">; First code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-doremi-increment-variable+ "icicles")</span>
(defun icicle-doremi-increment-variable+ (variable &optional increment optionp)
  "<span class="quote">Increment VARIABLE by INCREMENT (default 1).
Use arrow key `up' or `down' or mouse wheel to increase or decrease.
You can use the `Meta' key (e.g. `M-up') to increment in larger steps.

Interactively, you can choose VARIABLE using completion.
With a prefix arg, only user options are available to choose from.
Raises an error if VARIABLE's value is not a number.</span>"
  (interactive
   (let* ((symb                                    (or (and (fboundp 'symbol-nearest-point)
                                                            (symbol-nearest-point))
                                                       (and (symbolp (variable-at-point))
                                                            (variable-at-point))))
          (enable-recursive-minibuffers            t)
          (icicle-orig-must-pass-after-match-pred  icicle-must-pass-after-match-predicate)
          (pred                                    (if current-prefix-arg
                                                       (lambda (s)
                                                         (unless (symbolp s) (setq s  (intern s)))
                                                         (user-variable-p s))
                                                     (lambda (s)
                                                       (unless (symbolp s) (setq s  (intern s)))
                                                       (boundp s))))
          (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
          (icicle-must-pass-after-match-predicate  (and (not icompletep)  pred)))
     (list (intern (completing-read "<span class="quote">Increment variable: </span>" obarray (and icompletep  pred) t nil nil
                                    (and symb  (symbol-name symb)) t))
           <span class="linecomment">;; Restore this before we read number, since that might use completion.</span>
           (let ((icicle-must-pass-after-match-predicate  icicle-orig-must-pass-after-match-pred))
             (icicle-read-number "<span class="quote">Increment (amount): </span>"))
           current-prefix-arg)))
  (unless (require 'doremi nil t) (error "<span class="quote">This command needs library `doremi.el'.</span>"))
  (unless increment (setq increment 1))
  (unless (numberp (symbol-value variable))
    (error "<span class="quote">Variable's value is not a number: %S</span>" (symbol-value variable)))
  (doremi (lambda (new-val)             <span class="linecomment">; FREE here: VARIABLE.</span>
            (set variable  new-val)
            new-val)
          (symbol-value variable)
          increment))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-cmd "icicles")</span>
(defun icicle-bookmark-cmd (&optional parg) <span class="linecomment">; Bound to what `bookmark-set' is bound to (`C-x r m').</span>
  "<span class="quote">Set bookmark or visit bookmark(s).
With a negative prefix arg, visit bookmark(s), using
  `icicle-bookmark-other-window' (see that command for more info).

Otherwise, set a bookmark, as follows:

* No prefix arg: Prompt for the bookmark name.

  If feature `bookmark+' is present:

  . You can use (lax) completion for the bookmark name.
    The candidates are bookmarks in the current buffer (or all
    bookmarks if there are none in this buffer).

  . You can narrow the current completion candidates to bookmarks of a
    given type.  The keys for this are the same as for
    `icicle-bookmark' and for the bookmark-jumping keys at the top
    level.

  . See the `Bookmark+' doc string of redefined command `bookmark-set'
    for info about the available default values for the bookmark name.

  If feature `bookmark+' is not present, then completion is not
  available, and the default bookmark name is the last one used in
  the current buffer.

  Note: You can use command `icicle-bookmark-set' with a numeric
  prefix arg if you want to complete against all bookmark names,
  instead of those for the current buffer.

* Plain prefix arg (`C-u'): Same as no prefix arg, but do not
  overwrite any existing bookmark that has the same name.

* Non-negative numeric prefix arg: Do not prompt for bookmark name.
  If feature `bookmark+' is present and the region is active and
    nonempty, then use the buffer name followed by a prefix of the
    region text as the bookmark name.
  Otherwise, use the buffer name followed by the text of the current
    line, starting at point.
  Use at most `icicle-bookmark-name-length-max' chars, in either case.
  If the prefix arg is 0, then do not overwrite any existing bookmark
    that has the same name.

By default, Icicle mode remaps all key sequences that are normally
bound to `bookmark-set' to `icicle-bookmark-cmd'.  If you do not want
this remapping, then customize option `icicle-top-level-key-bindings'.
In particular, you might prefer to remap `bookmark-set' to
`icicle-bookmark-set' (see Note, above).</span>"
  (interactive "<span class="quote">P</span>")
  (if (and parg  (&lt; (prefix-numeric-value parg) 0))
      (icicle-bookmark-other-window)
    (if (or (not parg)  (consp parg))
        (icicle-bookmark-set nil parg 'PSEUDO-INTERACTIVEP)
      (let* ((regionp    (and (featurep 'bookmark+)  transient-mark-mode  mark-active
                              (not (eq (region-beginning) (region-end)))))
             (name-beg   (if regionp (region-beginning) (point)))
             (name-end   (if regionp (region-end) (line-end-position)))
             (def-name   (concat (buffer-name) "<span class="quote">: </span>" (buffer-substring name-beg name-end)))
             (trim-name  (replace-regexp-in-string
                          "<span class="quote">\n</span>" "<span class="quote"> </span>" (substring def-name 0 (min icicle-bookmark-name-length-max
                                                              (length def-name))))))
        (message "<span class="quote">Setting bookmark `%s'</span>" trim-name) (sit-for 2)
        (bookmark-set trim-name (and parg  (or (consp parg)  (zerop (prefix-numeric-value parg)))))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-set "icicles")</span>
(defun icicle-bookmark-set (&optional name parg interactivep) <span class="linecomment">; `C-x r m'</span>
  "<span class="quote">With `Bookmark+', this is `bookmark-set' with Icicles multi-completions.
In particular, you can use (lax) completion for the bookmark name.
Without `Bookmark+', this is the same as vanilla Emacs `bookmark-set'.

With `Bookmark+':

 . You can use (lax) completion for the bookmark name.
   The candidates are bookmarks in the current buffer (or all
   bookmarks if there are none in this buffer).

 . You can narrow the current completion candidates to bookmarks of a
   given type.  The keys for this are the same as for
   `icicle-bookmark' and for the bookmark-jumping keys at the top
   level.

 . See the `Bookmark+' doc string of redefined command `bookmark-set'
   for info about the available default values for the bookmark name.

If feature `bookmark+' is not present, then completion is not
available, and the default bookmark name is the last one used in
the current buffer.

Note: You can use command `icicle-bookmark-set' with a numeric
prefix arg if you want to complete against all bookmark names,
instead of those for the current buffer.</span>"
  (interactive (list nil current-prefix-arg t))
  (if (not (featurep 'bookmark+))
      (bookmark-set name parg)
    (unwind-protect
         (let ((enable-recursive-minibuffers           t) <span class="linecomment">; In case read input, e.g. File changed...</span>
               (completion-ignore-case                 bookmark-completion-ignore-case)
               (prompt                                 "<span class="quote">Bookmark: </span>")
               (icicle-multi-completing-p              icicle-show-multi-completion-flag)
               (icicle-list-use-nth-parts              '(1))
               (icicle-candidate-properties-alist      (if (not icicle-show-multi-completion-flag)
                                                           ()
                                                         (if (facep 'file-name-shadow)
                                                             '((2 (face file-name-shadow))
                                                               (3 (face bookmark-menu-heading)))
                                                           '((3 (face bookmark-menu-heading))))))
               (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
               (icicle-whole-candidate-as-text-prop-p  t)
               (icicle-transform-before-sort-p         t)
               (icicle-candidates-alist
                (if (not (featurep 'bookmark+))
                    (mapcar (lambda (cand)
                              (list (icicle-candidate-short-help
                                     (icicle-bookmark-help-string cand)
                                     (icicle-bookmark-propertize-candidate cand))))
                            (bookmark-all-names)) <span class="linecomment">; Loads bookmarks file, defining `bookmark-alist'.</span>
                  (bookmark-maybe-load-default-file) <span class="linecomment">; Loads bookmarks file, defining `bookmark-alist'.</span>
                  (mapcar #'icicle-make-bookmark-candidate
                          (bmkp-sort-omit
                           (and (or (not parg)  (consp parg)) <span class="linecomment">; No numeric PARG: all bookmarks.</span>
                                (or (bmkp-specific-buffers-alist-only)  bookmark-alist))))))
               (icicle-sort-orders-alist
                (append '(("<span class="quote">in *Bookmark List* order</span>") <span class="linecomment">; Renamed from "turned OFF'.</span>
                          ("<span class="quote">by bookmark name</span>" . icicle-alpha-p))
                        (and (featurep 'bookmark+)
                             '(("<span class="quote">by last bookmark access</span>" (bmkp-bookmark-last-access-cp)
                                icicle-alpha-p)
                               ("<span class="quote">by bookmark visit frequency</span>" (bmkp-visited-more-cp)
                                icicle-alpha-p)
                               ("<span class="quote">by last buffer or file access</span>"
                                (bmkp-buffer-last-access-cp
                                 bmkp-local-file-accessed-more-recently-cp)
                                icicle-alpha-p)
                               ("<span class="quote">marked before unmarked (in *Bookmark List*)</span>" (bmkp-marked-cp)
                                icicle-alpha-p)
                               ("<span class="quote">by local file type</span>" (bmkp-local-file-type-cp) icicle-alpha-p)
                               ("<span class="quote">by file name</span>" (bmkp-file-alpha-cp) icicle-alpha-p)
                               ("<span class="quote">by local file size</span>" (bmkp-local-file-size-cp) icicle-alpha-p)
                               ("<span class="quote">by last local file access</span>"
                                (bmkp-local-file-accessed-more-recently-cp)
                                icicle-alpha-p)
                               ("<span class="quote">by last local file update</span>"
                                (bmkp-local-file-updated-more-recently-cp)
                                icicle-alpha-p)
                               ("<span class="quote">by Info location</span>" (bmkp-info-cp) icicle-alpha-p)
                               ("<span class="quote">by Gnus thread</span>" (bmkp-gnus-cp) icicle-alpha-p)
                               ("<span class="quote">by URL</span>" (bmkp-url-cp) icicle-alpha-p)
                               ("<span class="quote">by bookmark type</span>"
                                (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp
                                 bmkp-local-file-type-cp bmkp-handler-cp)
                                icicle-alpha-p)))
                        '(("<span class="quote">by previous use alphabetically</span>" . icicle-historical-alphabetic-p)
                          ("<span class="quote">case insensitive</span>" . icicle-case-insensitive-string-less-p))))
               (icicle-candidate-help-fn
                <span class="linecomment">;; FREE here: CURRENT-PREFIX-ARG, ICICLE-GET-ALIST-CANDIDATE-FUNCTION,</span>
                <span class="linecomment">;;            ICICLE-SHOW-MULTI-COMPLETION-FLAG.</span>
                (lambda (cand)
                  (when (and (featurep 'bookmark+)  icicle-show-multi-completion-flag)
                    (setq cand  (funcall icicle-get-alist-candidate-function cand))
                    (setq cand  (cons (caar cand) (cdr cand))))
                  (if (featurep 'bookmark+)
                      (if current-prefix-arg
                          (bmkp-describe-bookmark-internals cand)
                        (bmkp-describe-bookmark cand))
                    (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand))))))
           (require 'bookmark)
           (when (featurep 'bookmark+)
             <span class="linecomment">;; Bind keys to narrow bookmark candidates by type.  Lax is for multi-completion case.</span>
             (dolist (map  '(minibuffer-local-must-match-map minibuffer-local-completion-map))
               (icicle-bookmark-bind-narrow-commands map)))
           (setq bookmark-current-point   (point)
                 bookmark-current-buffer  (current-buffer))
           (save-excursion (skip-chars-forward "<span class="quote"> </span>") (setq bookmark-yank-point  (point)))
           (let* ((record   (bookmark-make-record))
                  (defname  (or (and (stringp (car record))  (car record))
                                (cond ((eq major-mode 'w3m-mode) w3m-current-title)
                                      ((eq major-mode 'gnus-summary-mode)
                                       (elt (gnus-summary-article-header) 1))
                                      ((memq major-mode '(Man-mode woman-mode))
                                       (buffer-substring (point-min) (save-excursion
                                                                       (goto-char (point-min))
                                                                       (skip-syntax-forward "<span class="quote">^ </span>")
                                                                       (point))))
                                      (t nil))))
                  (defname  (and defname  (bmkp-replace-regexp-in-string "<span class="quote">\n</span>" "<span class="quote"> </span>" defname)))
                  (bname    (or name  (icicle-transform-multi-completion
                                       (bmkp-completing-read-lax "<span class="quote">Set bookmark </span>"
                                                                 (bmkp-new-bookmark-default-names defname)
                                                                 icicle-candidates-alist
                                                                 nil (if (boundp 'bookmark-history)
                                                                         'bookmark-history
                                                                       'icicle-bookmark-history))))))
             (when (string-equal bname "<span class="quote"></span>") (setq bname  defname))
             (bookmark-store bname (cdr record) (consp parg))
             (when (and interactivep  bmkp-prompt-for-tags-flag)
               (bmkp-add-tags bname (bmkp-read-tags-completing))) <span class="linecomment">; Don't bother to refresh tags. (?)</span>
             (case (and (boundp 'bmkp-auto-light-when-set)  bmkp-auto-light-when-set)
               (autonamed-bookmark       (when (bmkp-autonamed-bookmark-p bname)
                                           (bmkp-light-bookmark bname)))
               (non-autonamed-bookmark   (unless (bmkp-autonamed-bookmark-p bname)
                                           (bmkp-light-bookmark bname)))
               (any-bookmark             (bmkp-light-bookmark bname))
               (autonamed-in-buffer      (bmkp-light-bookmarks
                                          (bmkp-remove-if-not
                                           #'bmkp-autonamed-bookmark-p
                                           (bmkp-this-buffer-alist-only)) nil interactivep))
               (non-autonamed-in-buffer  (bmkp-light-bookmarks
                                          (bmkp-remove-if
                                           #'bmkp-autonamed-bookmark-p
                                           (bmkp-this-buffer-alist-only)) nil interactivep))
               (all-in-buffer            (bmkp-light-this-buffer nil interactivep)))
             <span class="linecomment">;; Maybe make bookmark temporary.</span>
             (if bmkp-autotemp-all-when-set-p
                 (bmkp-make-bookmark-temporary bname)
               (catch 'icicle-bookmark-set
                 (dolist (pred  bmkp-autotemp-bookmark-predicates)
                   (when (and (functionp pred)  (funcall pred bname))
                     (bmkp-make-bookmark-temporary bname)
                     (throw 'icicle-bookmark-set t)))))
             (run-hooks 'bmkp-after-set-hook)
             (if bookmark-use-annotations
                 (bookmark-edit-annotation bname)
               (goto-char bookmark-current-point)))
           (setq bookmark-yank-point      nil
                 bookmark-current-buffer  nil))
      (icicle-bookmark-cleanup))))

(defun icicle-make-bookmark-candidate (bookmark)
  "<span class="quote">Return a propertized full bookmark candidate for BOOKMARK.
BOOKMARK is a bookmark name or a bookmark record.
The return value is of the form (DISPLAY . RECORD), where:

 DISPLAY is the display candidate, propertized with
  `icicle-bookmark-help-string' and `icicle-bookmark-propertize-candidate'.

 RECORD is the full BOOKMARK record.

If option `icicle-show-multi-completion-flag' is non-nil then DISPLAY
is a multi-completion with three parts:

 bookmark name
 target file for the bookmark
 tags in the bookmark

If the option value is nil then DISPLAY is just the bookmark name.</span>"
  (setq bookmark  (bookmark-get-bookmark bookmark))
  (icicle-condition-case-no-debug nil   <span class="linecomment">; Ignore errors, e.g. from bad or stale bookmark records.</span>
      (if icicle-show-multi-completion-flag
          (let* ((bname     (bookmark-name-from-full-record bookmark))
                 (guts      (bookmark-get-bookmark-record bookmark))
                 (file      (bookmark-get-filename bookmark))
                 (buf       (bmkp-get-buffer-name bookmark))
                 (file/buf  (if (and buf  (equal file bmkp-non-file-filename))
                                buf
                              file))
                 (tags      (bmkp-get-tags bookmark)))
            (cons `(,(icicle-candidate-short-help
                      (icicle-bookmark-help-string bname)
                      (icicle-bookmark-propertize-candidate bname))
                    ,file/buf
                    ,@(and tags  (list (format "<span class="quote">%S</span>" tags))))
                  guts))
        (let ((bname  (bookmark-name-from-full-record bookmark))
              (guts   (bookmark-get-bookmark-record bookmark)))
          (cons (icicle-candidate-short-help
                 (icicle-bookmark-help-string bname)
                 (icicle-bookmark-propertize-candidate bname))
                guts)))
    (error nil)))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark "icicles")</span>
(icicle-define-command icicle-bookmark  <span class="linecomment">; Bound to `C-x j j', `C-x p b', `C-x r b'.</span>
  "<span class="quote">Jump to a bookmark.
With a plain prefix argument (`C-u'), reverse the effect of option
`icicle-bookmark-refresh-cache-flag'.  See the doc for that option.
In particular, if the option value is nil and you try to jump to a
bookmark that is not up to date or does not exist, then try using a
prefix arg to refresh the cache.

During completion, you can use \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-delete-candidate-object]' on a bookmark to delete it.

If you also use library `Bookmark+', then:

 * `C-M-return' shows detailed info about the current bookmark candidate.
   `C-u C-M-return' shows the complete, internal info for the bookmark.
   Likewise, for the other candidate help keys: `C-M-down' etc.
   (And the mode line always shows summary info about the bookmark.)
   
 * You can use `C-,' to sort bookmarks in many different ways,
   according to their properties.

 * In `*Completions*', the candidate bookmarks are highlighted
   according to their type.  You can customize the highlighting faces:

  `bmkp-bad-bookmark'              - possibly bad bookmark
  `bmkp-bookmark-list'             - bookmark list
  `bmkp-buffer'                    - buffer
  `bmkp-desktop'                   - desktop
  `bmkp-function'                  - function bookmark
  `bmkp-gnus'                      - Gnus article
  `bmkp-info'                      - Info node
  `bmkp-local-directory'           - local directory
  `bmkp-local-file-with-region'    - local file with a region
  `bmkp-local-file-without-region' - local file without a region
  `bmkp-man'                       - `man' page
  `bmkp-non-file'                  - non-file (no current buffer)
  `bmkp-remote-file'               - remote-file
  `bmkp-sequence'                  - sequence bookmark
  `bmkp-url'                       - URL

 * In `*Completions*', if option `icicle-show-multi-completion-flag'
   is non-nil, then each completion candidate is a multi-completion:

    a. the bookmark name
    b. the bookmark file or buffer name
    c. any tags

   You can match any parts of the multi-completion.  You can toggle
   the option (for the next command) using `M-m' during completion.
   For example, you can match all bookmarks that have tags by typing:

     C-M-j . * C-M-j S-TAB

   (Each `C-M-j' inserts `^G\n', which is `icicle-list-join-string'.)

 * You can narrow the current completion candidates to bookmarks of a
   given type.  The keys for this are the same as the bookmark-jumping
   keys at the top level.

   `C-x j a'   - autofile bookmarks
   `C-x j b'   - non-file (buffer) bookmarks
   `C-x j B'   - bookmark-list bookmarks
   `C-x j d'   - Dired bookmarks
   `C-x j f'   - file bookmarks
   `C-x j . f' - bookmarks to files in the current directory
   `C-x j g'   - Gnus bookmarks
   `C-x j i'   - Info bookmarks
   `C-x j M-i' - image bookmarks
   `C-x j K'   - desktop bookmarks
   `C-x j l'   - local-file bookmarks
   `C-x j m'   - `man' pages
   `C-x j n'   - remote-file bookmarks
   `C-x j r'   - bookmarks with regions
   `C-x j u'   - URL bookmarks
   `C-x j w'   - W3M (URL) bookmarks
   `C-x j x'   - temporary bookmarks
   `C-x j y'   - bookmark-file bookmarks
   `C-x j #'   - autonamed bookmarks
   `C-x j , #' - autonamed bookmarks for the current buffer
   `C-x j , ,' - bookmarks for the current buffer
   `C-x j = b' - bookmarks for specific buffers
   `C-x j = f' - bookmarks for specific files

   See also the individual multi-commands for different bookmark
   types: `icicle-bookmark-info-other-window' etc.

If you also use library `crosshairs.el', then the visited bookmark
position is highlighted.</span>"               <span class="linecomment">; Doc string</span>
  (lambda (cand) (icicle-bookmark-jump (icicle-transform-multi-completion cand))) <span class="linecomment">; Action</span>
  prompt icicle-candidates-alist nil (not icicle-show-multi-completion-flag) <span class="linecomment">; `completing-read' args</span>
  nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history)
  (and (boundp 'bookmark-current-bookmark)  bookmark-current-bookmark) nil
  ((enable-recursive-minibuffers           t) <span class="linecomment">; In case we read input, e.g. File changed on disk...</span>
   (completion-ignore-case                 bookmark-completion-ignore-case)
   (prompt                                 "<span class="quote">Bookmark: </span>")
   (icicle-multi-completing-p              icicle-show-multi-completion-flag)
   (icicle-list-use-nth-parts              '(1))
   (icicle-candidate-properties-alist      (if (not icicle-show-multi-completion-flag)
                                               ()
                                             (if (facep 'file-name-shadow)
                                                 '((2 (face file-name-shadow))
                                                   (3 (face bookmark-menu-heading)))
                                               '((3 (face bookmark-menu-heading))))))
   (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
   (icicle-whole-candidate-as-text-prop-p  t)
   (icicle-transform-before-sort-p         t)
   (icicle-delete-candidate-object         'icicle-bookmark-delete-action)
   (icicle-sort-orders-alist
    (append '(("<span class="quote">in *Bookmark List* order</span>") <span class="linecomment">; Renamed from "turned OFF'.</span>
              ("<span class="quote">by bookmark name</span>" . icicle-alpha-p))
            (and (featurep 'bookmark+)
                 '(("<span class="quote">by last bookmark access</span>" (bmkp-bookmark-last-access-cp) icicle-alpha-p)
                   ("<span class="quote">by bookmark visit frequency</span>" (bmkp-visited-more-cp) icicle-alpha-p)
                   ("<span class="quote">by last buffer or file access</span>" (bmkp-buffer-last-access-cp
                                                     bmkp-local-file-accessed-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">marked before unmarked (in *Bookmark List*)</span>" (bmkp-marked-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by local file type</span>" (bmkp-local-file-type-cp) icicle-alpha-p)
                   ("<span class="quote">by file name</span>" (bmkp-file-alpha-cp) icicle-alpha-p)
                   ("<span class="quote">by local file size</span>" (bmkp-local-file-size-cp) icicle-alpha-p)
                   ("<span class="quote">by last local file access</span>" (bmkp-local-file-accessed-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by last local file update</span>" (bmkp-local-file-updated-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by Info location</span>" (bmkp-info-cp) icicle-alpha-p)
                   ("<span class="quote">by Gnus thread</span>" (bmkp-gnus-cp) icicle-alpha-p)
                   ("<span class="quote">by URL</span>" (bmkp-url-cp) icicle-alpha-p)
                   ("<span class="quote">by bookmark type</span>" (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp
                                        bmkp-local-file-type-cp bmkp-handler-cp)
                    icicle-alpha-p)))
            '(("<span class="quote">by previous use alphabetically</span>" . icicle-historical-alphabetic-p)
              ("<span class="quote">case insensitive</span>" . icicle-case-insensitive-string-less-p))))
   (icicle-candidate-help-fn
    <span class="linecomment">;; FREE here: CURRENT-PREFIX-ARG, ICICLE-GET-ALIST-CANDIDATE-FUNCTION,</span>
    <span class="linecomment">;;            ICICLE-SHOW-MULTI-COMPLETION-FLAG.</span>
    (lambda (cand)
      (when (and (featurep 'bookmark+)  icicle-show-multi-completion-flag)
        (setq cand  (funcall icicle-get-alist-candidate-function cand)
              cand  (cons (caar cand) (cdr cand))))
      (if (featurep 'bookmark+)
          (if current-prefix-arg (bmkp-describe-bookmark-internals cand) (bmkp-describe-bookmark cand))
        (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand)))))
   (icicle-candidates-alist
    (if (not (featurep 'bookmark+))
        (mapcar (lambda (cand)
                  (list (icicle-candidate-short-help (icicle-bookmark-help-string cand)
                                                     (icicle-bookmark-propertize-candidate cand))))
                (bookmark-all-names))   <span class="linecomment">; Loads bookmarks file, defining `bookmark-alist'.</span>
      (bookmark-maybe-load-default-file) <span class="linecomment">; Loads bookmarks file, defining `bookmark-alist'.</span>
      (mapcar #'icicle-make-bookmark-candidate
              (or (and (or (and (not icicle-bookmark-refresh-cache-flag)
                                (not (consp current-prefix-arg)))
                           (and icicle-bookmark-refresh-cache-flag (consp current-prefix-arg)))
                       bmkp-sorted-alist)
                  (setq bmkp-sorted-alist  (bmkp-sort-omit bookmark-alist)))))))
  (progn                                <span class="linecomment">; First code</span>
    (require 'bookmark)
    (when (featurep 'bookmark+)
      <span class="linecomment">;; Bind keys to narrow bookmark candidates by type.  Lax is for multi-completion case.</span>
      (dolist (map  '(minibuffer-local-must-match-map minibuffer-local-completion-map))
        (icicle-bookmark-bind-narrow-commands map))))
  (icicle-bookmark-cleanup-on-quit)     <span class="linecomment">; Undo code</span>
  (icicle-bookmark-cleanup))            <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-other-window "icicles")</span>
(icicle-define-command icicle-bookmark-other-window
                                        <span class="linecomment">; Bound to `C-x 4 j j', `C-x p j', `C-x p o', `C-x p q'.</span>
  "<span class="quote">Jump to a bookmark in another window.
Same as `icicle-bookmark', but uses another window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (cand) (icicle-bookmark-jump-other-window (icicle-transform-multi-completion cand)))
  prompt icicle-candidates-alist nil (not icicle-show-multi-completion-flag) <span class="linecomment">; `completing-read' args</span>
  nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history)
  (and (boundp 'bookmark-current-bookmark)  bookmark-current-bookmark) nil
  ((enable-recursive-minibuffers           t) <span class="linecomment">; In case we read input, e.g. File changed on disk...</span>
   (completion-ignore-case                 bookmark-completion-ignore-case)
   (prompt                                 "<span class="quote">Bookmark: </span>")
   (icicle-multi-completing-p              icicle-show-multi-completion-flag)
   (icicle-list-use-nth-parts              '(1))
   (icicle-candidate-properties-alist      (if (not icicle-show-multi-completion-flag)
                                               ()
                                             (if (facep 'file-name-shadow)
                                                 '((2 (face file-name-shadow))
                                                   (3 (face bookmark-menu-heading)))
                                               '((3 (face bookmark-menu-heading))))))
   (icicle-transform-function              (if (interactive-p) nil icicle-transform-function))
   (icicle-whole-candidate-as-text-prop-p  t)
   (icicle-transform-before-sort-p         t)
   (icicle-delete-candidate-object         'icicle-bookmark-delete-action)
   (icicle-sort-orders-alist
    (append '(("<span class="quote">in *Bookmark List* order</span>") <span class="linecomment">; Renamed from "turned OFF'.</span>
              ("<span class="quote">by bookmark name</span>" . icicle-alpha-p))
            (and (featurep 'bookmark+)
                 '(("<span class="quote">by last bookmark access</span>" (bmkp-bookmark-last-access-cp) icicle-alpha-p)
                   ("<span class="quote">by bookmark visit frequency</span>" (bmkp-visited-more-cp) icicle-alpha-p)
                   ("<span class="quote">by last buffer or file access</span>" (bmkp-buffer-last-access-cp
                                                     bmkp-local-file-accessed-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">marked before unmarked (in *Bookmark List*)</span>" (bmkp-marked-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by local file type</span>" (bmkp-local-file-type-cp) icicle-alpha-p)
                   ("<span class="quote">by file name</span>" (bmkp-file-alpha-cp) icicle-alpha-p)
                   ("<span class="quote">by local file size</span>" (bmkp-local-file-size-cp) icicle-alpha-p)
                   ("<span class="quote">by last local file access</span>" (bmkp-local-file-accessed-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by last local file update</span>" (bmkp-local-file-updated-more-recently-cp)
                    icicle-alpha-p)
                   ("<span class="quote">by Info location</span>" (bmkp-info-cp) icicle-alpha-p)
                   ("<span class="quote">by Gnus thread</span>" (bmkp-gnus-cp) icicle-alpha-p)
                   ("<span class="quote">by URL</span>" (bmkp-url-cp) icicle-alpha-p)
                   ("<span class="quote">by bookmark type</span>" (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp
                                        bmkp-local-file-type-cp bmkp-handler-cp)
                    icicle-alpha-p)))
            '(("<span class="quote">by previous use alphabetically</span>" . icicle-historical-alphabetic-p)
              ("<span class="quote">case insensitive</span>" . icicle-case-insensitive-string-less-p))))
   (icicle-candidate-help-fn
    <span class="linecomment">;; FREE here: CURRENT-PREFIX-ARG, ICICLE-GET-ALIST-CANDIDATE-FUNCTION,</span>
    <span class="linecomment">;;            ICICLE-SHOW-MULTI-COMPLETION-FLAG.</span>
    (lambda (cand)
      (when (and (featurep 'bookmark+)  icicle-show-multi-completion-flag)
        (setq cand  (funcall icicle-get-alist-candidate-function cand))
        (setq cand  (cons (caar cand) (cdr cand))))
      (if (featurep 'bookmark+)
          (if current-prefix-arg
              (bmkp-describe-bookmark-internals cand)
            (bmkp-describe-bookmark cand))
        (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand)))))
   (icicle-candidates-alist
    (if (not (featurep 'bookmark+))
        (mapcar (lambda (cand)
                  (list (icicle-candidate-short-help (icicle-bookmark-help-string cand)
                                                     (icicle-bookmark-propertize-candidate cand))))
                (bookmark-all-names))   <span class="linecomment">; Loads bookmarks file, defining `bookmark-alist'.</span>
      (bookmark-maybe-load-default-file) <span class="linecomment">; Loads bookmarks file, defining `bookmark-alist'.</span>
      (mapcar #'icicle-make-bookmark-candidate
              (or (and (or (and (not icicle-bookmark-refresh-cache-flag)
                                (not (consp current-prefix-arg)))
                           (and icicle-bookmark-refresh-cache-flag  (consp current-prefix-arg)))
                       bmkp-sorted-alist)
                  (setq bmkp-sorted-alist  (bmkp-sort-omit bookmark-alist)))))))
  (progn                                <span class="linecomment">; First code</span>
    (require 'bookmark)
    (when (featurep 'bookmark+)
      <span class="linecomment">;; Bind keys to narrow bookmark candidates by type.  Lax is for multi-completion case.</span>
      (dolist (map  '(minibuffer-local-must-match-map minibuffer-local-completion-map))
        (icicle-bookmark-bind-narrow-commands map))))
  (icicle-bookmark-cleanup-on-quit)     <span class="linecomment">; Undo code</span>
  (icicle-bookmark-cleanup))            <span class="linecomment">; Last code</span>

(defun icicle-bookmark-bind-narrow-commands (map)
  "<span class="quote">Bind keys to narrow bookmark candidates by type.</span>"
  (when (featurep 'bookmark+)
    <span class="linecomment">;; Lax completion is for multi-completion case.</span>
    (dolist (map  '(minibuffer-local-must-match-map  minibuffer-local-completion-map))
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j #</span>") <span class="linecomment">; `C-x j #'</span>
        'icicle-bookmark-autonamed-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j , #</span>") <span class="linecomment">; `C-x j , #'</span>
        'icicle-bookmark-autonamed-this-buffer-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j a</span>") <span class="linecomment">; `C-x j a'</span>
        'icicle-bookmark-autofile-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j b</span>") <span class="linecomment">; `C-x j b'</span>
        'icicle-bookmark-non-file-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j B</span>") <span class="linecomment">; `C-x j B'</span>
        'icicle-bookmark-bookmark-list-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j d</span>") <span class="linecomment">; `C-x j d'</span>
        'icicle-bookmark-dired-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j f</span>") <span class="linecomment">; `C-x j f'</span>
        'icicle-bookmark-file-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j . f</span>") <span class="linecomment">; `C-x j . f'</span>
        'icicle-bookmark-file-this-dir-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j g</span>") <span class="linecomment">; `C-x j g'</span>
        'icicle-bookmark-gnus-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j i</span>") <span class="linecomment">; `C-x j i'</span>
        'icicle-bookmark-info-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j M-i</span>") <span class="linecomment">; `C-x j M-i'</span>
        'icicle-bookmark-image-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j K</span>") <span class="linecomment">; `C-x j K'</span>
        'icicle-bookmark-desktop-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j l</span>") <span class="linecomment">; `C-x j l'</span>
        'icicle-bookmark-local-file-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j m</span>") <span class="linecomment">; `C-x j m'</span>
        'icicle-bookmark-man-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j n</span>") <span class="linecomment">; `C-x j n'</span>
        'icicle-bookmark-remote-file-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j r</span>") <span class="linecomment">; `C-x j r'</span>
        'icicle-bookmark-region-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j u</span>") <span class="linecomment">; `C-x j u'</span>
        'icicle-bookmark-url-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j w</span>") <span class="linecomment">; `C-x j w'</span>
        'icicle-bookmark-w3m-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j x</span>") <span class="linecomment">; `C-x j x'</span>
        'icicle-bookmark-temporary-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j y</span>") <span class="linecomment">; `C-x j y'</span>
        'icicle-bookmark-bookmark-file-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j , ,</span>") <span class="linecomment">; `C-x j , ,'</span>
        'icicle-bookmark-this-buffer-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j = b</span>") <span class="linecomment">; `C-x j = b'</span>
        'icicle-bookmark-specific-buffers-narrow)
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-x j = f</span>") <span class="linecomment">; `C-x j = f'</span>
        'icicle-bookmark-specific-files-narrow))))

(defun icicle-bookmark-delete-action (cand)
  "<span class="quote">Delete bookmark candidate CAND, then update `bmkp-sorted-alist'.</span>"
  (bookmark-delete (icicle-transform-multi-completion cand))
  (when (or (and (not icicle-bookmark-refresh-cache-flag)
                 (not (consp current-prefix-arg)))
            (and icicle-bookmark-refresh-cache-flag  (consp current-prefix-arg)))
    (setq bmkp-sorted-alist  (bmkp-sort-omit bookmark-alist))))

(defun icicle-bookmark-propertize-candidate (cand)
  "<span class="quote">Return bookmark name CAND, with a face indicating its type.</span>"
  (when (featurep 'bookmark+)
    (put-text-property
     0 (length cand) 'face
     (cond ((bmkp-sequence-bookmark-p cand)        'bmkp-sequence)
           ((bmkp-function-bookmark-p cand)        'bmkp-function)
           ((bmkp-bookmark-list-bookmark-p cand)   'bmkp-bookmark-list)
           ((bmkp-desktop-bookmark-p cand)         'bmkp-desktop)
           ((bmkp-info-bookmark-p cand)            'bmkp-info)
           ((bmkp-man-bookmark-p cand)             'bmkp-man)
           ((bmkp-gnus-bookmark-p cand)            'bmkp-gnus)
           ((bmkp-url-bookmark-p cand)             'bmkp-url)
           ((bmkp-remote-file-bookmark-p cand)     'bmkp-remote-file)
           ((and (bmkp-file-bookmark-p cand)
                 (file-directory-p
                  (bookmark-get-filename cand)))   'bmkp-local-directory)
           ((and (bmkp-local-file-bookmark-p cand)
                 (bmkp-region-bookmark-p cand))    'bmkp-local-file-with-region)
           ((bmkp-local-file-bookmark-p cand)      'bmkp-local-file-without-region)
           ((and (bmkp-get-buffer-name cand)
                 (get-buffer (bmkp-get-buffer-name cand))
                 (equal (bookmark-get-filename cand)
                        bmkp-non-file-filename))   'bmkp-buffer)
           ((not (bmkp-file-bookmark-p cand))      'bmkp-non-file)
           (t                                           'bmkp-bad-bookmark))
     cand))
  cand)

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-jump "icicles")</span>
(defun icicle-bookmark-jump (bookmark)
  "<span class="quote">Jump to BOOKMARK.
If `crosshairs.el' is loaded, then highlight the target position.
You probably don't want to use this.  Use `icicle-bookmark' instead.</span>"
  (interactive (list (bookmark-completing-read "<span class="quote">Jump to bookmark</span>" bookmark-current-bookmark)))
  (icicle-bookmark-jump-1 bookmark))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-jump-other-window "icicles")</span>
(defun icicle-bookmark-jump-other-window (bookmark)
  "<span class="quote">Jump to BOOKMARK in another window.
If `crosshairs.el' is loaded, then highlight the target position.
You probably don't want to use this.  Use
`icicle-bookmark-other-window' instead.</span>"
  (interactive (list (bookmark-completing-read "<span class="quote">Jump to bookmark (other window)</span>"
                                               bookmark-current-bookmark)))
  (icicle-bookmark-jump-1 bookmark 'other-window))

(defun icicle-bookmark-jump-1 (bookmark &optional other-window-p)
  "<span class="quote">Helper function for `icicle-bookmark-jump(-other-window)'.</span>"
  (unless bookmark (error "<span class="quote">No bookmark specified</span>"))
  (bookmark-maybe-historicize-string bookmark)
  <span class="linecomment">;; In case the jump renames it (as for an autonamed bookmark).</span>
  (setq bookmark  (bookmark-get-bookmark bookmark 'NOERROR))
  (if (fboundp 'bookmark--jump-via)
      (bookmark--jump-via bookmark (if other-window-p 'pop-to-buffer 'switch-to-buffer))
    (let ((cell  (bookmark-jump-noselect bookmark))) <span class="linecomment">; Emacs &lt; 23 and without `Bookmark+'.</span>
      (when cell
        (if other-window-p
            (pop-to-buffer (car cell) 'other-window)
          (switch-to-buffer (car cell)))
        (goto-char (cdr cell))
        (unless (pos-visible-in-window-p) (recenter icicle-recenter))
        (progn (run-hooks 'bookmark-after-jump-hook) t)
        <span class="linecomment">;; If there is an annotation for this bookmark, show it in a buffer.</span>
        (when bookmark-automatically-show-annotations (bookmark-show-annotation bookmark)))))
  <span class="linecomment">;; Unless `bmkp-use-region' and bookmark has a region, show position using crosshairs.</span>
  (unless (and (boundp 'bmkp-use-region)  bmkp-use-region
               (fboundp 'bmkp-get-end-position) (bmkp-get-end-position bookmark)
               (/= (bookmark-get-position bookmark) (bmkp-get-end-position bookmark)))
    (when (fboundp 'crosshairs-highlight) (crosshairs-highlight))))
<span class="linecomment">;; $$$$$$   (select-window (minibuffer-window))</span>
<span class="linecomment">;; $$$$$$   (select-frame-set-input-focus (selected-frame)))</span>

(defun icicle-bookmark-help-string (bookmark-name)
  "<span class="quote">Return a help string for BOOKMARK-NAME.</span>" <span class="linecomment">; `bmkp-*' functions are defined in `Bookmark+'.</span>
  <span class="linecomment">;; Use BOOKMARK-NAME, not full bookmark BMK, as arg to vanilla bookmark functions, for Emacs &lt; 23.</span>
  (let* ((bmk            (bookmark-get-bookmark bookmark-name))
         (buf            (and (fboundp 'bmkp-get-buffer-name)  (bmkp-get-buffer-name bmk)))
         (file           (bookmark-get-filename bookmark-name))
         (start          (bookmark-get-position bookmark-name))
         (no-position-p  (not start))
         (end            (and (fboundp 'bmkp-get-end-position)  (bmkp-get-end-position bmk)))
         (annot          (bookmark-get-annotation bookmark-name))
         (sequence-p     (and (fboundp 'bmkp-sequence-bookmark-p)
                              (bmkp-sequence-bookmark-p bmk)))
         (function-p     (and (fboundp 'bmkp-function-bookmark-p)
                              (bmkp-function-bookmark-p bmk)))
         (blist-p        (and (fboundp 'bmkp-bookmark-list-bookmark-p)
                              (bmkp-bookmark-list-bookmark-p bmk)))
         (desktop-p      (and (fboundp 'bmkp-desktop-bookmark-p)
                              (bmkp-desktop-bookmark-p bmk)))
         (dired-p        (and (fboundp 'bmkp-dired-bookmark-p)  (bmkp-dired-bookmark-p bmk)))
         (gnus-p         (and (fboundp 'bmkp-gnus-bookmark-p)  (bmkp-gnus-bookmark-p bmk)))
         (info-p         (and (fboundp 'bmkp-info-bookmark-p)  (bmkp-info-bookmark-p bmk)))
         (man-p          (and (fboundp 'bmkp-man-bookmark-p)  (bmkp-man-bookmark-p bmk)))
         (url-p          (and (fboundp 'bmkp-url-bookmark-p)  (bmkp-url-bookmark-p bmk)))
         type-info-p)
    (when (or sequence-p  function-p) (setq no-position-p  t))
    (concat (setq type-info-p
                  (cond (sequence-p (format "<span class="quote">Sequence: %S</span>" (bookmark-prop-get bmk 'sequence)))
                        (function-p (let ((fn  (bookmark-prop-get bmk 'function)))
                                      (if (symbolp fn) (format "<span class="quote">Function: `%s'</span>" fn) "<span class="quote">Function</span>")))
                        (desktop-p  "<span class="quote">Desktop, </span>")
                        (dired-p    (format "<span class="quote">Dired %s, </span>" file))
                        (gnus-p     "<span class="quote">Gnus, </span>")
                        (info-p     "<span class="quote">Info, </span>")
                        (man-p      (let ((man-args  (bookmark-prop-get bmk 'man-args)))
                                      (if man-args
                                          (format "<span class="quote">`man %s', </span>" man-args)
                                        <span class="linecomment">;; WoMan has no variable for the cmd name.</span>
                                        (format "<span class="quote">%s, </span>" (bookmark-prop-get bmk 'buffer-name)))))
                        (url-p      "<span class="quote">URL, </span>")
                        (t nil)))
            (and (not dired-p)
                 (or (and file  (or (not (boundp 'bmkp-non-file-filename))
                                    (not (equal file bmkp-non-file-filename)))
                          (format (if type-info-p "<span class="quote">file `%s', </span>" "<span class="quote">File `%s', </span>") file))
                     (and buf  (format (if type-info-p "<span class="quote">buffer `%s', </span>" "<span class="quote">Buffer `%s', </span>") buf))))
            (and (not no-position-p)
                 (if (and end  (&gt; (- end start) 0))
                     (format "<span class="quote">from %d to %d (%d chars)</span>" start end (- end start))
                   (format "<span class="quote">position %d</span>" start)))
            (and annot  (format "<span class="quote">, %s</span>" annot)))))

<span class="linecomment">;;; MUST keep this synchronized with any general Icicle-mode `C-M-' bindings in `icicles-mode.el'.</span>
<span class="linecomment">;;  That includes things like `icicle-read+insert-file-name-keys'.</span>
(defun icicle-bookmark-cleanup ()
  "<span class="quote">Cleanup code for `icicle-bookmark'.
Remove crosshairs highlighting and unbind filtering keys.</span>"
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))
  (when (featurep 'bookmark+)
    (dolist (map  '(minibuffer-local-must-match-map minibuffer-local-completion-map))
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-b</span>") nil) <span class="linecomment">; `C-M-b'</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-B</span>") nil) <span class="linecomment">; `C-M-B'</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-d</span>") nil) <span class="linecomment">; `C-M-d'</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-f</span>") nil) <span class="linecomment">; `C-M-f'</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-F</span>") nil) <span class="linecomment">; `C-M-F'</span>
      (dolist (key  icicle-read+insert-file-name-keys) <span class="linecomment">; `C-M-F' - overrides previous.</span>
        (define-key (symbol-value map) key 'icicle-read+insert-file-name))
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-g</span>") nil) <span class="linecomment">; `C-M-g'</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-I</span>") nil) <span class="linecomment">; `C-M-I' (`C-M-i' is `ESC TAB')</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-K</span>") nil) <span class="linecomment">; `C-M-K'</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-m</span>") nil) <span class="linecomment">; `C-M-m'</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-r</span>") nil) <span class="linecomment">; `C-M-r'</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-w</span>") nil) <span class="linecomment">; `C-M-w'</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-@</span>") nil) <span class="linecomment">; `C-M-@'</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-.</span>") <span class="linecomment">; `C-M-.'</span>
        'icicle-toggle-dot)             <span class="linecomment">; `icicles-mode.el'.</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-= b</span>") nil) <span class="linecomment">; `C-M-= b'</span>
      (define-key (symbol-value map) (icicle-kbd "<span class="quote">C-M-= f</span>") nil)))) <span class="linecomment">; `C-M-= f'</span>

(defun icicle-bookmark-cleanup-on-quit ()
  "<span class="quote">Do `icicle-bookmark-cleanup', then return to original window.</span>"
  (icicle-bookmark-cleanup)
  (when (window-live-p icicle-orig-window)
    (select-window icicle-orig-window)
    (select-frame-set-input-focus (selected-frame))))

<span class="linecomment">;;; These are minibuffer commands, but we define them here instead of in `icicles-mcmd.el'.</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autofile-narrow "icicles")</span>
(defun icicle-bookmark-autofile-narrow () <span class="linecomment">; Bound to `C-x j a' in minibuffer for completion.</span>
  "<span class="quote">Narrow the bookmark candidates to autofile bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-autofile-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autonamed-narrow "icicles")</span>
(defun icicle-bookmark-autonamed-narrow () <span class="linecomment">; Bound to `C-x j #' in minibuffer for completion.</span>
  "<span class="quote">Narrow the bookmark candidates to autonamed bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x)
       (bmkp-autonamed-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autonamed-this-buffer-narrow "icicles")</span>
(defun icicle-bookmark-autonamed-this-buffer-narrow ()
                                        <span class="linecomment">; Bound to `C-x j , #' in minibuffer for completion.</span>
  "<span class="quote">Narrow bookmark candidates to autonamed bookmarks in current buffer.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x)                          <span class="linecomment">; FREE here: ICICLE-ORIG-BUFF.</span>
       (with-current-buffer icicle-orig-buff
         (bmkp-autonamed-this-buffer-bookmark-p (icicle-transform-multi-completion (car x))))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-bookmark-file-narrow "icicles")</span>
(defun icicle-bookmark-bookmark-file-narrow () <span class="linecomment">; Bound to `C-x j y' in minibuffer for completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmark-file bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-bookmark-file-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-bookmark-list-narrow "icicles")</span>
(defun icicle-bookmark-bookmark-list-narrow () <span class="linecomment">; Bound to `C-x j B' in minibuffer for completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmark-list bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-bookmark-list-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-desktop-narrow "icicles")</span>
(defun icicle-bookmark-desktop-narrow ()   <span class="linecomment">; Bound to `C-x j K' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to desktop bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-desktop-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-dired-narrow "icicles")</span>
(defun icicle-bookmark-dired-narrow ()   <span class="linecomment">; Bound to `C-x j d' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to Dired bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-dired-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-narrow "icicles")</span>
(defun icicle-bookmark-file-narrow ()   <span class="linecomment">; Bound to `C-x j f' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to file bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-file-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-narrow "icicles")</span>
(defun icicle-bookmark-file-this-dir-narrow () <span class="linecomment">; Bound to `C-x j . f' in minibuffer for completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmarked files in `default-directory'.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-file-this-dir-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-gnus-narrow "icicles")</span>
(defun icicle-bookmark-gnus-narrow ()   <span class="linecomment">; Bound to `C-x j g' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to Gnus bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-gnus-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-image-narrow "icicles")</span>
(defun icicle-bookmark-image-narrow ()   <span class="linecomment">; Bound to `C-x j M-i' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to image bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-image-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-info-narrow "icicles")</span>
(defun icicle-bookmark-info-narrow ()   <span class="linecomment">; Bound to `C-x j i' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to Info bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-info-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-local-file-narrow "icicles")</span>
(defun icicle-bookmark-local-file-narrow () <span class="linecomment">; Bound to `C-x j l' for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to local-file bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-local-file-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-man-narrow "icicles")</span>
(defun icicle-bookmark-man-narrow () <span class="linecomment">; Bound to `C-x j m' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to `man'-page bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-man-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-non-file-narrow "icicles")</span>
(defun icicle-bookmark-non-file-narrow () <span class="linecomment">; Bound to `C-x j b' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to non-file (buffer-only) bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-non-file-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-region-narrow "icicles")</span>
(defun icicle-bookmark-region-narrow () <span class="linecomment">; Bound to `C-x j r' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmarks with regions.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-region-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-remote-file-narrow "icicles")</span>
(defun icicle-bookmark-remote-file-narrow () <span class="linecomment">; Bound to `C-x j n' in minibuf for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to remote-file bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-remote-file-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-specific-buffers-narrow "icicles")</span>
(defun icicle-bookmark-specific-buffers-narrow (buffers) <span class="linecomment">; `C-x j = b' for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmarks for specific BUFFERS.
You are prompted for the BUFFERS.</span>"
  (interactive (let ((icicle-completion-candidates  icicle-completion-candidates))
                 (list (icicle-bookmarked-buffer-list))))
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     `(lambda (x)
       (member (bmkp-get-buffer-name (icicle-transform-multi-completion (car x))) ',buffers)))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-specific-files-narrow "icicles")</span>
(defun icicle-bookmark-specific-files-narrow (files) <span class="linecomment">; `C-x j = f' in minibuf for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmarks for specific FILES.
You are prompted for the FILES.</span>"
  (interactive (list (icicle-bookmarked-file-list)))
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     `(lambda (x)
       (member (bookmark-get-filename (icicle-transform-multi-completion (car x))) ',files)))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-temporary-narrow "icicles")</span>
(defun icicle-bookmark-temporary-narrow () <span class="linecomment">; Bound to `C-x j x' in minibuffer for completion.</span>
  "<span class="quote">Narrow the bookmark candidates to temporary bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-temporary-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-this-buffer-narrow "icicles")</span>
(defun icicle-bookmark-this-buffer-narrow () <span class="linecomment">; `C-x j , ,' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to bookmarks for the current buffer.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x)                          <span class="linecomment">; FREE here: ICICLE-ORIG-BUFF.</span>
       (with-current-buffer icicle-orig-buff
         (bmkp-this-buffer-p (icicle-transform-multi-completion (car x))))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-url-narrow "icicles")</span>
(defun icicle-bookmark-url-narrow ()    <span class="linecomment">; Bound to `C-x j u' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to URL bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-url-bookmark-p (icicle-transform-multi-completion (car x)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-w3m-narrow "icicles")</span>
(defun icicle-bookmark-w3m-narrow ()    <span class="linecomment">; Bound to `C-x j w' in minibuffer for bookmark completion.</span>
  "<span class="quote">Narrow the bookmark candidates to W3M (URL) bookmarks.</span>"
  (interactive)
  (when (featurep 'bookmark+)
    (icicle-narrow-candidates-with-predicate
     (lambda (x) (bmkp-w3m-bookmark-p (icicle-transform-multi-completion (car x)))))))


<span class="linecomment">;; The following sexps macro-expand to define these commands:</span>
<span class="linecomment">;;  `icicle-bookmark-autofile'                   `icicle-bookmark-autofile-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-autofile-all-tags',         `icicle-bookmark-autofile-all-tags-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-autofile-all-tags-regexp',  `icicle-bookmark-autofile-all-tags-regexp-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-autofile-some-tags',        `icicle-bookmark-autofile-some-tags-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-autofile-some-tags-regexp', `icicle-bookmark-autofile-some-tags-regexp-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-autonamed'                  `icicle-bookmark-autonamed-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-autonamed-this-buffer'      `icicle-bookmark-autonamed-this-buffer-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-bookmark-file',</span>
<span class="linecomment">;;  `icicle-bookmark-bookmark-list',</span>
<span class="linecomment">;;  `icicle-bookmark-desktop',</span>
<span class="linecomment">;;  `icicle-bookmark-dired',                     `icicle-bookmark-dired-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file',                      `icicle-bookmark-file-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-all-tags',             `icicle-bookmark-file-all-tags-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-all-tags-regexp',      `icicle-bookmark-file-all-tags-regexp-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-some-tags',            `icicle-bookmark-file-some-tags-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-some-tags-regexp',     `icicle-bookmark-file-some-tags-regexp-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir',             `icicle-bookmark-file-this-dir-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-all-tags',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-all-tags-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-all-tags-regexp',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-all-tags-regexp-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-some-tags',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-some-tags-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-some-tags-regexp',</span>
<span class="linecomment">;;  `icicle-bookmark-file-this-dir-some-tags-regexp-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-gnus',                      `icicle-bookmark-gnus-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-image',                     `icicle-bookmark-image-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-info',                      `icicle-bookmark-info-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-local-file',                `icicle-bookmark-local-file-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-man',                       `icicle-bookmark-man-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-non-file',                  `icicle-bookmark-non-file-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-region',                    `icicle-bookmark-region-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-remote-file',               `icicle-bookmark-remote-file-other-window',</span>
<span class="linecomment">;;  `icicle-bookmark-specific-buffers',          `icicle-bookmark-specific-buffers-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-specific-files',            `icicle-bookmark-specific-files-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-all-tags',                  `icicle-bookmark-all-tags-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-all-tags-regexp',           `icicle-bookmark-all-tags-regexp-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-some-tags',                 `icicle-bookmark-some-tags-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-some-tags-regexp',          `icicle-bookmark-some-tags-regexp-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-temporary'                  `icicle-bookmark-temporary-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-this-buffer',               `icicle-bookmark-this-buffer-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-url',                       `icicle-bookmark-url-other-window'</span>
<span class="linecomment">;;  `icicle-bookmark-w3m',                       `icicle-bookmark-w3m-other-window'</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-this-buffer "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">this-buffer</span>")                               <span class="linecomment">; `C-x j , ,'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-this-buffer-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">this-buffer</span>")                               <span class="linecomment">; `C-x 4 j , ,'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-specific-buffers "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">specific-buffers</span>" nil                       <span class="linecomment">; `C-x j = b'</span>
                                             (icicle-bookmarked-buffer-list))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-specific-buffers-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">specific-buffers</span>" nil                       <span class="linecomment">; `C-x 4 j = b'</span>
                                             (icicle-bookmarked-buffer-list))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-specific-files "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">specific-files</span>" nil                         <span class="linecomment">; `C-x j = f'</span>
                                             (icicle-bookmarked-file-list))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-specific-files-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">specific-files</span>" nil                         <span class="linecomment">; `C-x 4 j = f'</span>
                                             (icicle-bookmarked-file-list))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autofile "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">autofile</span>")                                  <span class="linecomment">; `C-x j a'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autofile-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">autofile</span>")                                  <span class="linecomment">; `C-x 4 j a'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autofile-all-tags "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">autofile-all-tags</span>" nil                      <span class="linecomment">; `C-x j t a *'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autofile-all-tags-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">autofile-all-tags</span>" nil                      <span class="linecomment">; `C-x 4 j t a *'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autofile-all-tags-regexp "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">autofile-all-tags-regexp</span>" nil               <span class="linecomment">; `C-x j t a % *'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autofile-all-tags-regexp-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">autofile-all-tags-regexp</span>" nil               <span class="linecomment">; `C-x 4 j t a % *'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autofile-some-tags "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">autofile-some-tags</span>" nil                     <span class="linecomment">; `C-x j t a +'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autofile-some-tags-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">autofile-some-tags</span>" nil                     <span class="linecomment">; `C-x 4 j t a +'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autofile-some-tags-regexp "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">autofile-some-tags-regexp</span>" nil              <span class="linecomment">; `C-x j t a % +'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autofile-some-tags-regexp-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">autofile-some-tags-regexp</span>" nil              <span class="linecomment">; `C-x 4 j t a % +'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autonamed "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">autonamed</span>")                                 <span class="linecomment">; `C-x j #'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autonamed-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">autonamed</span>")                                 <span class="linecomment">; `C-x 4 j # #'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autonamed-this-buffer "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">autonamed-this-buffer</span>")                     <span class="linecomment">; `C-x j , #'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-autonamed-this-buffer-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">autonamed-this-buffer</span>")                     <span class="linecomment">; `C-x 4 j # .'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-non-file "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">non-file</span>")                                  <span class="linecomment">; `C-x j b'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-non-file-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">non-file</span>")                                  <span class="linecomment">; `C-x 4 j b'</span>

<span class="linecomment">;; Other-window means nothing for a bookmark list.</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-bookmark-list "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">bookmark-list</span>")                             <span class="linecomment">; `C-x j B'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-dired "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">dired</span>")                                     <span class="linecomment">; `C-x j d'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-dired-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">dired</span>")                                     <span class="linecomment">; `C-x 4 j d'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">file</span>")                                      <span class="linecomment">; `C-x j f'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file</span>")                                      <span class="linecomment">; `C-x 4 j f'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">file-this-dir</span>")                             <span class="linecomment">; `C-x j . f'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-this-dir</span>")                             <span class="linecomment">; `C-x 4 j . f'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-gnus "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">gnus</span>")                                      <span class="linecomment">; `C-x j g'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-gnus-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">gnus</span>")                                      <span class="linecomment">; `C-x 4 j g'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-image "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">image</span>")                                     <span class="linecomment">; `C-x j M-i'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-image-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">image</span>")                                     <span class="linecomment">; `C-x 4 j M-i'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-info "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">info</span>")                                      <span class="linecomment">; `C-x j i'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-info-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">info</span>")                                      <span class="linecomment">; `C-x 4 j i'</span>

<span class="linecomment">;; Other-window means nothing for a desktop.</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-desktop "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">desktop</span>")                                   <span class="linecomment">; `C-x j K'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-local-file "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">local-file</span>")                                <span class="linecomment">; `C-x j l'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-local-file-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">local-file</span>")                                <span class="linecomment">; `C-x 4 j l'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-man "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">man</span>") <span class="linecomment">; `C-x j m'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-man-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">man</span>")                                       <span class="linecomment">; `C-x 4 j m'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-remote-file "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">remote-file</span>")                               <span class="linecomment">; `C-x j n'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-remote-file-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">remote-file</span>")                               <span class="linecomment">; `C-x 4 j n'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-region "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">region</span>" "<span class="quote">Select region: </span>")                  <span class="linecomment">; `C-x j r'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-region-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">region</span>" "<span class="quote">Select region: </span>")                  <span class="linecomment">; `C-x 4 j r'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-all-tags "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">all-tags</span>" nil                               <span class="linecomment">; `C-x j t *'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-all-tags-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">all-tags</span>" nil                               <span class="linecomment">; `C-x 4 j t *'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-some-tags "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">some-tags</span>" nil                              <span class="linecomment">; `C-x j t +'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-some-tags-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">some-tags</span>" nil                              <span class="linecomment">; `C-x 4 j t +'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-all-tags-regexp "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">all-tags-regexp</span>" nil                        <span class="linecomment">; `C-x j t % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-all-tags-regexp-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">all-tags-regexp</span>" nil                        <span class="linecomment">; `C-x 4 j t % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-some-tags-regexp "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">some-tags-regexp</span>" nil                       <span class="linecomment">; `C-x j t % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-some-tags-regexp-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">some-tags-regexp</span>" nil                       <span class="linecomment">; `C-x 4 j t % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-all-tags "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">file-all-tags</span>" nil                          <span class="linecomment">; `C-x j t f *'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-all-tags-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-all-tags</span>" nil                          <span class="linecomment">; `C-x 4 j t f *'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-some-tags "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">file-some-tags</span>" nil                         <span class="linecomment">; `C-x j t f +'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-some-tags-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-some-tags</span>" nil                         <span class="linecomment">; `C-x 4 j t f +'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-all-tags-regexp "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">file-all-tags-regexp</span>" nil                   <span class="linecomment">; `C-x j t f % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-all-tags-regexp-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-all-tags-regexp</span>" nil                   <span class="linecomment">; `C-x 4 j t f % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-some-tags-regexp "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">file-some-tags-regexp</span>" nil                  <span class="linecomment">; `C-x j t f % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-some-tags-regexp-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-some-tags-regexp</span>" nil                  <span class="linecomment">; `C-x 4 j t f % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-all-tags "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">file-this-dir-all-tags</span>" nil                 <span class="linecomment">; `C-x j t . f *'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-all-tags-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-this-dir-all-tags</span>" nil                 <span class="linecomment">; `C-x 4 j t . f *'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-some-tags "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">file-this-dir-some-tags</span>" nil                <span class="linecomment">; `C-x j t . f +'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-some-tags-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-this-dir-some-tags</span>" nil                <span class="linecomment">; `C-x 4 j t . f +'</span>
                                             (bmkp-read-tags-completing nil nil current-prefix-arg))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-all-tags-regexp "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">file-this-dir-all-tags-regexp</span>" nil          <span class="linecomment">; `C-x j t . f % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-all-tags-regexp-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-this-dir-all-tags-regexp</span>" nil          <span class="linecomment">; `C-x 4 j t . f % *'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-some-tags-regexp "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">file-this-dir-some-tags-regexp</span>" nil         <span class="linecomment">; `C-x j t . f % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-file-this-dir-some-tags-regexp-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">file-this-dir-some-tags-regexp</span>" nil         <span class="linecomment">; `C-x 4 j t . f % +'</span>
                                             (read-string "<span class="quote">Regexp for tags: </span>"))
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-url "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">url</span>")                                       <span class="linecomment">; `C-x j u'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-url-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">url</span>")                                       <span class="linecomment">; `C-x 4 j u'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-w3m "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">w3m</span>")                                       <span class="linecomment">; `C-x j w'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-w3m-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">w3m</span>")                                       <span class="linecomment">; `C-x 4 j w'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-temporary "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">temporary</span>")                                 <span class="linecomment">; `C-x j x'</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-temporary-other-window "icicles")</span>
(icicle-define-bookmark-other-window-command "<span class="quote">temporary</span>")                                 <span class="linecomment">; `C-x 4 j x'</span>

<span class="linecomment">;; Other-window means nothing for a bookmark file.</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-bookmark-file "icicles")</span>
(icicle-define-bookmark-command              "<span class="quote">bookmark-file</span>")                             <span class="linecomment">; `C-x j y'</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-select-bookmarked-region "icicles")</span>
(defalias 'icicle-select-bookmarked-region 'icicle-bookmark-region-other-window)

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmarked-buffer-list "icicles")</span>
(defun icicle-bookmarked-buffer-list ()
  "<span class="quote">`icicle-buffer-list', but only for bookmarked buffers.</span>"
  (interactive)
  (let ((icicle-buffer-predicate  (lambda (buf) (member buf (bmkp-buffer-names))))
        (icicle-prompt            "<span class="quote">Choose bookmarked buffer (`RET' when done): </span>"))
    (icicle-buffer-list)))
  
<span class="linecomment">;;;###autoload (autoload 'icicle-bookmarked-file-list "icicles")</span>
(defun icicle-bookmarked-file-list ()
  "<span class="quote">`icicle-file-list', but only for bookmarked files.</span>"
  (interactive)
  (bookmark-maybe-load-default-file)
  (let ((use-file-dialog        nil)
        (icicle-file-predicate  (lambda (file) (member (expand-file-name file) (bmkp-file-names))))
        (icicle-prompt          "<span class="quote">Choose bookmarked file (`RET' when done): </span>"))
    (icicle-file-list)))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-first-tag "icicles")</span>
(icicle-define-command icicle-find-first-tag <span class="linecomment">; Command name</span>
  "<span class="quote">Find first tag in current tags table whose name matches your input.
This is similar to standard command `find-tag', with these
differences:

* This is a multi-command, so you can visit any number of tags.

* Only the first tag of several identical tags is a candidate, so you
  cannot visit the others.  That is, there is no equivalent to using
  `M-,' (`tags-loop-continue') after `find-tag' to find additional,
  identical tags.

* If `crosshairs.el' is loaded, the target position is highlighted.

To browse all tags (including duplicates) in all tags tables, use the
more powerful Icicles multi-command `icicle-find-tag'.

By default, Icicle mode remaps all key sequences that are normally
bound to `find-tag-other-window' to `icicle-find-first-tag'.  If you
do not want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"       <span class="linecomment">; Doc string</span>
  icicle-find-first-tag-action          <span class="linecomment">; Action function</span>
  "<span class="quote">Find tag: </span>"                          <span class="linecomment">; `completing-read' args</span>
  (if (fboundp 'tags-lazy-completion-table) (tags-lazy-completion-table) 'tags-complete-tag)
  nil nil nil nil (funcall (or find-tag-default-function  (get major-mode 'find-tag-default-function)
                               'find-tag-default))
  nil
  ((completion-ignore-case    (progn (require 'etags) <span class="linecomment">; Bindings</span>
                                     (if (and (boundp 'tags-case-fold-search)
                                              (memq tags-case-fold-search '(t nil)))
                                         tags-case-fold-search
                                       case-fold-search)))
   (case-fold-search          completion-ignore-case))
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))) <span class="linecomment">; Last code</span>

(defun icicle-find-first-tag-action (cand)
  "<span class="quote">Action function for `icicle-find-first-tag'.</span>"
  (find-tag cand)
  (when (fboundp 'crosshairs-highlight) (crosshairs-highlight)))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-first-tag-other-window "icicles")</span>
(icicle-define-command icicle-find-first-tag-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Find first tag in current tags table whose name matches your input.
Same as `icicle-find-first-tag' except it uses a different window.</span>" <span class="linecomment">; Doc string</span>
  icicle-find-first-tag-other-window-action <span class="linecomment">; Action function</span>
  "<span class="quote">Find tag other window: </span>"             <span class="linecomment">; `completing-read' args</span>
  (if (fboundp 'tags-lazy-completion-table) (tags-lazy-completion-table) 'tags-complete-tag)
  nil nil nil nil (funcall (or find-tag-default-function  (get major-mode 'find-tag-default-function)
                               'find-tag-default))
  nil
  ((completion-ignore-case  (progn (require 'etags)
                                   (if (and (boundp 'tags-case-fold-search) <span class="linecomment">; Bindings</span>
                                            (memq tags-case-fold-search '(t nil)))
                                       tags-case-fold-search
                                     case-fold-search)))
   (case-fold-search        completion-ignore-case))
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))) <span class="linecomment">; Last code</span>

(defun icicle-find-first-tag-other-window-action (cand)
  "<span class="quote">Action function for `icicle-find-first-tag-other-window'.</span>"
  (find-tag-other-window cand)
  (when (fboundp 'crosshairs-highlight) (crosshairs-highlight)))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-tag "icicles")</span>
(defun icicle-find-tag (regexp &optional arg)
  "<span class="quote">Navigate among all tags that match REGEXP.
You are prompted for the REGEXP to match.  Enter REGEXP with `RET'.
You can use completion to choose a tag in the current tags table as
REGEXP.  You can use `\\[icicle-pop-tag-mark]' to return to your starting point.

All matching tags are shown, including duplicate tags from the same or
different source files.  This means that you do not need `M-,' - you
see all tags as candidates to visit.

By default:

* Tags from all tags files are candidates.
* In `*Completions*', the source file name is shown after each tag.

A prefix argument changes this default behavior, as follows:

* ARG = 0 or ARG &gt; 0: only the current tag table is used
* ARG = 0 or ARG &lt; 0: source file names are not shown

By default, Icicle mode remaps all key sequences that are normally
bound to `find-tag' to `icicle-find-tag'.  If you do not want this
remapping, then customize option `icicle-top-level-key-bindings'.

If `crosshairs.el' is loaded, then the target position is highlighted.</span>"
  (interactive
   (let* ((completion-ignore-case  (if (and (boundp 'tags-case-fold-search)
                                            (memq tags-case-fold-search '(t nil)))
                                       tags-case-fold-search
                                     case-fold-search))
          (case-fold-search        completion-ignore-case))
     (require 'etags)
     (list (completing-read "<span class="quote">Find tag matching regexp: </span>"
                            <span class="linecomment">;; $$$ Or should we just read a regexp against `regexp-history'?</span>
                            (if (fboundp 'tags-lazy-completion-table)
                                (tags-lazy-completion-table) <span class="linecomment">; Emacs 23+</span>
                              'tags-complete-tag) <span class="linecomment">; Emacs &lt; 23</span>
                            nil nil nil 'find-tag-history
                            (funcall (or find-tag-default-function
                                         (get major-mode 'find-tag-default-function)
                                         'find-tag-default)))
           current-prefix-arg)))

  (unwind-protect
       (let* ((icicle-whole-candidate-as-text-prop-p  t)
              (icicle-sort-comparer                   nil)
              (icicle-inhibit-sort-p                  t)
              (icicle-candidate-action-fn             'icicle-find-tag-action)
              (icicle-candidate-help-fn               'icicle-find-tag-help)
              (completion-ignore-case                 (if (and (boundp 'tags-case-fold-search)
                                                               (memq tags-case-fold-search '(t nil)))
                                                          tags-case-fold-search
                                                        case-fold-search))
              (case-fold-search                       completion-ignore-case)
              (orig-pt-find-tag                       (point-marker)))

         (ring-insert find-tag-marker-ring orig-pt-find-tag) <span class="linecomment">; Record starting point.</span>
         (icicle-explore `(lambda () (icicle-find-tag-define-candidates ',regexp ',arg))
                         #'icicle-find-tag-final-act #'icicle-find-tag-quit-or-error
                         #'icicle-find-tag-quit-or-error nil
                         "<span class="quote">Choose a tag: </span>" nil nil nil 'find-tag-history))
    (when (fboundp 'crosshairs-unhighlight) (crosshairs-unhighlight 'even-if-frame-switch))))

<span class="linecomment">;;;###autoload (autoload 'icicle-pop-tag-mark "icicles")</span>
(defun icicle-pop-tag-mark ()
  "<span class="quote">Like `pop-tag-mark', but uses `pop-to-buffer', not `switch-to-buffer'.
By default, Icicle mode remaps all key sequences that are normally
bound to `pop-tag-mark' to `icicle-pop-tag-mark'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive)
  (require 'etags)
  (when (ring-empty-p find-tag-marker-ring) (error "<span class="quote">No previous locations for find-tag invocation</span>"))
  (let ((marker  (ring-remove find-tag-marker-ring 0)))
    (pop-to-buffer (or (marker-buffer marker)  (error "<span class="quote">The marked buffer has been deleted</span>")))
    (goto-char (marker-position marker))
    (unless (pos-visible-in-window-p) (recenter icicle-recenter))
    (set-marker marker nil nil)))

(defun icicle-find-tag-define-candidates (regexp arg)
  "<span class="quote">Define candidates for `icicle-find-tag'.
See `icicle-explore', argument DEFINE-CANDIDATES-FN.</span>"
  (save-excursion
    (let ((first-time  t)
          (morep       t))
      (setq icicle-candidates-alist  ())
      (while (and morep  (visit-tags-table-buffer (not first-time)))
        (when (and arg  (wholenump (prefix-numeric-value arg))) (setq morep  nil))
        (setq first-time               nil
              icicle-candidates-alist  (append icicle-candidates-alist
                                               (nreverse (icicle-find-tag-define-candidates-1
                                                          regexp (&gt; (prefix-numeric-value arg) 0)))))))))

(defun icicle-find-tag-define-candidates-1 (regexp show-file-p)
  "<span class="quote">Helper function for `icicle-find-tag-define-candidates'.
Returns completion alist of tag information for tags matching REGEXP.
Include file name (label) if SHOW-FILE-P is non-nil.

If SHOW-FILE-P is nil, then alist items look like this:

 (TAG TAG-INFO FILE-PATH GOTO-FUNC)

If SHOW-FILE-P is non-nil, then alist items look like this:

 ((TAG FILE-LABEL) TAG-INFO FILE-PATH GOTO-FUNC) or

 (FILE-LABEL TAG-INFO FILE-PATH GOTO-FUNC) if no matching TAG.

TAG-INFO is what `snarf-tag-function' (e.g. `etags-snarf-tag')
returns.  It is a cons (TEXT LINE . POSITION).

TEXT is the initial part of a line containing the tag.
LINE is the line number.
POSITION is the (one-based) char position of TEXT within the file.

If TEXT is t, it means the tag refers to exactly LINE or POSITION,
whichever is present, LINE having preference, no searching.
Either LINE or POSITION can be nil.  POSITION is used if present.</span>"
  (icicle-highlight-lighter)
  (message "<span class="quote">Gathering tags for `%s'...</span>" regexp)
  (goto-char (point-min))
  (let ((temp-list  ()))
    (while (re-search-forward (concat regexp "<span class="quote">.*\177*</span>") nil t) <span class="linecomment">; Look before the DEL character.</span>
      (beginning-of-line)
      (let* ((goto-func  goto-tag-location-function) <span class="linecomment">; e.g. `etags-goto-tag-location'.</span>
             <span class="linecomment">;; TAG-INFO: If no specific tag, (t nil (point-min)). Else, (TEXT LINE . STARTPOS).</span>
             <span class="linecomment">;; e.g. TEXT = "(defun foo ()" or just "foo" (if explicit),</span>
             <span class="linecomment">;;      LINE = "148", STARTPOS = "1723"</span>
             (tag-info (save-excursion (funcall snarf-tag-function))) <span class="linecomment">; e.g. `etags-snarf-tag'.</span>
             (tag (if (eq t (car tag-info)) nil (car tag-info)))
             <span class="linecomment">;; FILE-PATH is absolute. FILE-LABEL is relative to `default-directory'.</span>
             (file-path (save-excursion
                          (if tag (file-of-tag) (save-excursion (next-line 1) (file-of-tag)))))
             (file-label (expand-file-name file-path (file-truename default-directory))))
        (when (and tag  (not (string= "<span class="quote"></span>" tag))  (= (aref tag 0) ?\( ))
          (setq tag  (concat tag "<span class="quote"> ...)</span>")))
        (when (file-readable-p file-path)
          <span class="linecomment">;; Add item to alist.</span>
          <span class="linecomment">;;   Item looks like this:         ((TAG FILE-LABEL) TAG-INFO FILE-PATH GOTO-FUNC)</span>
          <span class="linecomment">;;   or like this, if no matching tag: ((FILE-LABEL) TAG-INFO FILE-PATH GOTO-FUNC)</span>
          (cond (tag
                 (push `(,(if show-file-p
                              (list tag <span class="linecomment">; Make multi-completion cons: add file name to candidate.</span>
                                    (progn (put-text-property 0 (length file-label) 'face
                                                              'icicle-candidate-part file-label)
                                           file-label))
                              tag)
                         ,tag-info ,file-path ,goto-func)
                       temp-list))
                (show-file-p            <span class="linecomment">; No tag.  Use only the FILE-LABEL.</span>
                 (push `((,(progn (put-text-property 0 (length file-label) 'face
                                                     'icicle-candidate-part file-label)
                                  file-label))
                         ,tag-info ,file-path ,goto-func)
                       temp-list)))))
      (forward-line))
    temp-list))                         <span class="linecomment">; Return the alist for this TAGS file.</span>

(defun icicle-find-tag-action (ignored-string)
  "<span class="quote">Action function for `icicle-find-tag'.</span>"
  <span class="linecomment">;; Ignore (TAG FILE-LABEL) part.  Use only (TAG-INFO FILE-PATH GOTO-FUNC) part.</span>
  (let* ((cand       (cdr (elt (icicle-filter-alist icicle-candidates-alist icicle-completion-candidates)
                               icicle-candidate-nb)))
         (tag-info   (nth 0 cand))
         (goto-func  (nth 2 cand)))
    (switch-to-buffer-other-window      <span class="linecomment">; Go to source file at FILE-PATH.</span>
     (if (fboundp 'tag-find-file-of-tag-noselect)
         (tag-find-file-of-tag-noselect (nth 1 cand))
       (find-file-noselect (nth 1 cand))))
    (widen)
    (icicle-condition-case-no-debug err
        (funcall goto-func tag-info)    <span class="linecomment">; Go to text at TAG-INFO.</span>
      (error (message "<span class="quote">%s</span>" (error-message-string err)) (sit-for 2) nil)))
  (when (fboundp 'crosshairs-highlight) (crosshairs-highlight))
  (select-window (minibuffer-window))
  (select-frame-set-input-focus (selected-frame)))

(defun icicle-find-tag-help (cand)
  "<span class="quote">Use as `icicle-candidate-help-fn' for `icicle-find-tag'.</span>"
  (let* ((cand      (cdr (elt (icicle-filter-alist icicle-candidates-alist icicle-completion-candidates)
                              icicle-candidate-nb)))
         (tag-info  (nth 0 cand)))
    (message (if (eq t (car tag-info))
                 "<span class="quote">No tag - file name itself matches</span>"
               (format "<span class="quote">Line: %s, Position: %s, File: %s</span>"
                       (icicle-propertize (cadr tag-info) 'face 'icicle-msg-emphasis)
                       (icicle-propertize (cddr tag-info) 'face 'icicle-msg-emphasis)
                       (icicle-propertize (nth 1 cand)    'face 'icicle-msg-emphasis))))
    (sit-for 4)))

(defun icicle-find-tag-final-act ()
  "<span class="quote">Go to the final tag choice.</span>"
  (let ((cand  (cdr icicle-explore-final-choice-full)))
    (unless cand (error "<span class="quote">No such occurrence: %s</span>" cand))
    (switch-to-buffer-other-window      <span class="linecomment">; Go to source file at FILE-PATH.</span>
     (if (fboundp 'tag-find-file-of-tag-noselect)
         (tag-find-file-of-tag-noselect (nth 1 cand))
       (find-file-noselect (nth 1 cand))))
    (widen)
    (funcall (nth 2 cand) (nth 0 cand)))) <span class="linecomment">; Go to text at TAG-INFO.</span>

(defun icicle-find-tag-quit-or-error ()
  "<span class="quote">Pop back to the last tag visited.</span>"
  (icicle-pop-tag-mark)
  (raise-frame))

<span class="linecomment">;;;###autoload (autoload 'icicle-other-window-or-frame "icicles")</span>
(defun icicle-other-window-or-frame (arg) <span class="linecomment">; Bound to `C-x o' in Icicle mode.</span>
  "<span class="quote">Select a window or frame, by name or by order.
This command combines Emacs commands `other-window' and `other-frame',
together with Icicles multi-commands `icicle-select-window', and
`icicle-select-frame'.  Use the prefix argument to choose, as follows:

 With no prefix arg or a non-zero numeric prefix arg:
  If the selected frame has multiple windows, then this is
  `other-window'.  Otherwise, it is `other-frame'.

 With a zero prefix arg (e.g. `C-0'):
  If the selected frame has multiple windows, then this is
  `icicle-select-window' with windows in the frame as candidates.
  Otherwise (single-window frame), this is `icicle-select-frame'.

 With plain `C-u':
  If the selected frame has multiple windows, then this is
  `icicle-select-window' with windows from all visible frames as
  candidates.  Otherwise, this is `icicle-select-frame'.

If you use library `oneonone.el' with a standalone minibuffer frame,
and if option `1on1-remap-other-frame-command-flag' is non-nil, then
frame selection can include the standalone minibuffer frame.

By default, Icicle mode remaps all key sequences that are normally
bound to `other-window' to `icicle-other-window-or-frame'.  If you do
not want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((numarg  (prefix-numeric-value arg)))
    (cond ((consp arg)
           (if (one-window-p) (icicle-select-frame) (icicle-select-window)))
          ((zerop numarg)
           (if (one-window-p)
               (icicle-select-frame)
             (let ((current-prefix-arg  nil)) (icicle-select-window))))
          (t
           (if (one-window-p)
               (if (and (fboundp '1on1-other-frame)
                        1on1-minibuffer-frame
                        1on1-remap-other-frame-command-flag)
                   (1on1-other-frame numarg)
                 (other-frame numarg))
             (other-window numarg))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-select-frame "icicles")</span>
(icicle-define-command icicle-select-frame <span class="linecomment">; Bound to `C-x 5 o' in Icicle mode.</span>
  "<span class="quote">Select frame by its name and raise it.
A frame name in this context is suffixed as needed by [NUMBER], to
make it unique.  For example, in a context where frames are named for
their buffers and you have two frames showing buffer *Help*, one of
the frames will be called `*Help*[2]' for use with this command.</span>" <span class="linecomment">; Doc string</span>
  icicle-select-frame-by-name           <span class="linecomment">; Action function</span>
  "<span class="quote">Select frame: </span>"                      <span class="linecomment">; `completing-read' args</span>
  icicle-frame-alist nil t nil
  (if (boundp 'frame-name-history) 'frame-name-history 'icicle-frame-name-history)
  (cdr (assq 'name (frame-parameters (next-frame (selected-frame))))) nil
  ((icicle-frame-alist  (icicle-make-frame-alist)) <span class="linecomment">; Bindings</span>
   (alt-fn              nil)
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn  (setq alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">frame</span>"))))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  alt-fn  (icicle-alt-act-fn-for-type "<span class="quote">frame</span>")))))

<span class="linecomment">;;;###autoload (autoload 'icicle-select-frame-by-name "icicles")</span>
(defun icicle-select-frame-by-name (name &optional frame-alist)
  "<span class="quote">Select the frame named NAME, and raise it.
Optional argument FRAME-ALIST is an alist of frames to choose from.
Each element has the form (FNAME . FRAME), where FNAME names FRAME.
See `icicle-make-frame-alist' for more about FNAME.</span>"
  (interactive (let* ((alist    (icicle-make-frame-alist))
                      (default  (car (rassoc (selected-frame) alist)))
                      (input    (completing-read "<span class="quote">Select Frame: </span>" alist nil t nil
                                                 'frame-name-history default)))
                 (list (if (= (length input) 0) default input)
                       alist)))
  (unless frame-alist (setq frame-alist  (or (and (boundp 'icicle-frame-alist)  icicle-frame-alist)
                                             (icicle-make-frame-alist))))
  (let ((frame  (cdr (assoc name frame-alist))))
    (unless frame (error "<span class="quote">No such frame: `%s'</span>" name))
    (make-frame-visible frame)
    (select-frame-set-input-focus frame)))

(defun icicle-make-frame-alist ()
  "<span class="quote">Return an alist of entries (FNAME . FRAME), where FNAME names FRAME.
Frame parameter `name' is used as FNAME, unless there is more than one
frame with the same name.  In that case, FNAME includes a suffix
\[NUMBER], to make it a unique name.  The NUMBER order among frame
names that differ only by their [NUMBER] is arbitrary.</span>"
  (let ((fr-alist  ())
        (count     2)
        fname new-name)
    (dolist (fr  (frame-list))
      (setq fname  (frame-parameter fr 'name))
      (if (not (assoc fname fr-alist))
          (push (cons fname fr) fr-alist)
        (setq new-name  fname)
        (while (assoc new-name fr-alist)
          (setq new-name  (format "<span class="quote">%s[%d]</span>" fname count)
                count     (1+ count)))
        (push (cons new-name fr) fr-alist))
      (setq count  2))
    fr-alist))

<span class="linecomment">;;;###autoload (autoload 'icicle-select-window "icicles")</span>
(icicle-define-command icicle-select-window <span class="linecomment">; Command name</span>
  <span class="linecomment">;; Free vars here: `icicle-window-alist' is bound in Bindings form.</span>
  "<span class="quote">Select window by its name.
With no prefix arg, candidate windows are those of the selected frame.
With a prefix arg, windows of all visible frames are candidates.

A window name is the name of its displayed buffer, but suffixed as
needed by [NUMBER], to make the name unique.  For example, if you have
two windows showing buffer *Help*, one of the windows will be called
`*Help*[2]' for use with this command.</span>" <span class="linecomment">; Doc string</span>
  icicle-select-window-by-name          <span class="linecomment">; Action function</span>
  "<span class="quote">Select window: </span>" icicle-window-alist nil t nil nil <span class="linecomment">; `completing-read' args</span>
  (buffer-name (window-buffer (other-window 1))) nil
  ((icicle-window-alist  (icicle-make-window-alist current-prefix-arg)))) <span class="linecomment">; Bindings</span>

<span class="linecomment">;; Free vars here: `icicle-window-alist' is bound in `icicle-select-window'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-select-window-by-name "icicles")</span>
(defun icicle-select-window-by-name (name &optional window-alist)
  "<span class="quote">Select the window named NAME.
Optional argument WINDOW-ALIST is an alist of windows to choose from.

Interactively:
 A prefix arg means windows from all visible frames are candidates.
 No prefix arg means windows from the selected frame are candidates.

Each alist element has the form (WNAME . WINDOW), where WNAME names
WINDOW.  See `icicle-make-window-alist' for more about WNAME.

If `crosshairs.el' is loaded, then the target position is highlighted.</span>"
  (interactive (let* ((alist    (icicle-make-window-alist current-prefix-arg))
                      (default  (car (rassoc (selected-window) alist)))
                      (input    (completing-read "<span class="quote">Select Window: </span>" alist nil t nil nil default)))
                 (list (if (= (length input) 0) default input) alist)))
  (unless window-alist
    (setq window-alist  (or (and (boundp 'icicle-window-alist)  icicle-window-alist)
                            (icicle-make-window-alist))))
  (let ((window  (cdr (assoc name window-alist))))
    (unless window (error "<span class="quote">No such window: `%s'</span>" name))
    (select-window window)
    (when (fboundp 'crosshairs-highlight) (crosshairs-highlight))
    (select-frame-set-input-focus (selected-frame))))

(defun icicle-make-window-alist (&optional all-p)
  "<span class="quote">Return an alist of entries (WNAME . WINDOW), where WNAME names WINDOW.
The name of the buffer in a window is used as its name, unless there
is more than one window displaying the same buffer.  In that case,
WNAME includes a suffix [NUMBER], to make it a unique name.  The
NUMBER order among window names that differ only by their [NUMBER] is
arbitrary.

Non-nil argument ALL-P means use windows from all visible frames.
Otherwise, use only windows from the selected frame.</span>"
  (lexical-let ((win-alist  ())
                (count      2)
                wname new-name)
    (walk-windows (lambda (w)           <span class="linecomment">; FREE here: COUNT, NEW-NAME, WIN-ALIST, WNAME.</span>
                    (setq wname  (buffer-name (window-buffer w)))
                    (if (not (assoc wname win-alist))
                        (push (cons wname w) win-alist)
                      (setq new-name  wname)
                      (while (assoc new-name win-alist)
                        (setq new-name  (format "<span class="quote">%s[%d]</span>" wname count)
                              count     (1+ count)))
                      (push (cons new-name w) win-alist))
                    (setq count  2))
                  'no-mini
                  (if all-p 'visible 'this-frame))
    win-alist))

<span class="linecomment">;;;###autoload (autoload 'icicle-delete-windows "icicles")</span>
(icicle-define-command icicle-delete-windows <span class="linecomment">; Command name</span>
  "<span class="quote">Delete windows showing a buffer, anywhere.</span>" <span class="linecomment">; Doc string</span>
  delete-windows-on                     <span class="linecomment">; Action function</span>
  "<span class="quote">Delete windows on buffer: </span>"          <span class="linecomment">; `completing-read' args</span>
  (let ((cand-bufs  ()))
    (dolist (buf  (buffer-list))
      (when (get-buffer-window buf 0) (push (list (buffer-name buf)) cand-bufs)))
    cand-bufs)
  nil t nil 'buffer-name-history (buffer-name (current-buffer)) nil
  ((icicle-use-candidates-only-once-flag  t) <span class="linecomment">; Bindings</span>
   (icicle-inhibit-try-switch-buffer      t)
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn  (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))))

<span class="linecomment">;;;###autoload (autoload 'icicle-delete-window "icicles")</span>
(defun icicle-delete-window (bufferp)   <span class="linecomment">; Bound to `C-x 0' in Icicle mode.</span>
  "<span class="quote">`delete-window' or prompt for buffer and delete all its windows.
When called from the minibuffer, remove the `*Completions*' window.

Otherwise:
 With no prefix argument, delete the selected window.
 With a prefix argument, prompt for a buffer and delete all windows,
   on any frame, that show that buffer.

 With a prefix argument, this is an Icicles multi-command - see
 command `icicle-mode'.  Input-candidate completion and cycling are
 available.  While cycling, these keys with prefix `C-' are active\\&lt;minibuffer-local-completion-map&gt;:

 `C-RET'   - Act on current completion candidate only
 `C-down'  - Move to next completion candidate and act
 `C-up'    - Move to previous completion candidate and act
 `C-next'  - Move to next apropos-completion candidate and act
 `C-prior' - Move to previous apropos-completion candidate and act
 `C-end'   - Move to next prefix-completion candidate and act
 `C-home'  - Move to previous prefix-completion candidate and act
 `\\[icicle-all-candidates-action]'     - Act on *all* candidates (or all that are saved),
             successively (careful!)

 With prefix `C-M-' instead of `C-', the same keys (`C-M-mouse-2',
 `C-M-return', `C-M-down', and so on) provide help about candidates.

 Use `mouse-2', `RET', or `S-RET' to finally choose a candidate,
 or `C-g' to quit.

By default, Icicle mode remaps all key sequences that are normally
bound to `delete-window' to `icicle-delete-window'.  If you do not
want this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if (window-minibuffer-p (selected-window))
      (icicle-remove-Completions-window)
    (if bufferp (icicle-delete-windows) (delete-window))))

<span class="linecomment">;;;###autoload (autoload 'icicle-kill-buffer "icicles")</span>
(icicle-define-command icicle-kill-buffer <span class="linecomment">; Bound to `C-x k' in Icicle mode.</span>
  "<span class="quote">Kill a buffer.
See `icicle-buffer' for more information, including about buffer-name
completion candidates, default values, and additional key bindings.

By default, Icicle mode remaps all key sequences that are normally
bound to `kill-buffer' to `icicle-kill-buffer'.  If you do not want
this remapping, then customize option
`icicle-top-level-key-bindings'.</span>"       <span class="linecomment">; Doc string</span>
  icicle-kill-a-buffer-and-update-completions <span class="linecomment">; Action function</span>
  (icicle-buffer-name-prompt "<span class="quote">Kill</span>")    <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (buf) (list (buffer-name buf))) icicle-bufflist) nil <span class="linecomment">; `icicle-bufflist' is free.</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs 23.</span>
  nil 'buffer-name-history (buffer-name (current-buffer)) nil
  (icicle-buffer-bindings)              <span class="linecomment">; Bindings</span>
  <span class="linecomment">;; Actually, there is no reason to bind `C-x m' to `icicle-bookmark-non-file-other-window' here,</span>
  <span class="linecomment">;; but to keep things simple we do it anyway.</span>
  (icicle-bind-buffer-candidate-keys)   <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-buffer-candidate-keys)) <span class="linecomment">; Last code</span>

(defun icicle-buffer-name-prompt (action &optional other-window-p)
  "<span class="quote">Return prompt for buffer-name completion.
ACTION is the command action, a string.  It starts the prompt.</span>"
  (concat  (cond ((null current-prefix-arg)
                  (format "<span class="quote">%s buffer</span>" action)) <span class="linecomment">; `completing-read' args</span>
                 ((and (consp current-prefix-arg)  (fboundp 'derived-mode-p)) <span class="linecomment">; `C-u'</span>
                  (format "<span class="quote">%s buffer with same or ancestor mode</span>" action))
                 ((zerop (prefix-numeric-value current-prefix-arg)) <span class="linecomment">; `C-0'</span>
                  (format "<span class="quote">%s buffer with same mode</span>" action))
                 ((&lt; (prefix-numeric-value current-prefix-arg) 0) <span class="linecomment">; `C--'</span>
                  (format "<span class="quote">%s buffer for same frame</span>" action))
                 (t                     <span class="linecomment">; `C-1'</span>
                  (format "<span class="quote">%s file buffer</span>" action)))
           (and other-window-p  "<span class="quote"> in other window</span>")
           "<span class="quote">: </span>"))

(defun icicle-kill-a-buffer-and-update-completions (buf)
  "<span class="quote">Kill buffer BUF and update the set of completions.</span>"
  (setq buf  (get-buffer buf))
  (if buf
      (icicle-condition-case-no-debug err
          (if (not (buffer-live-p buf))
              (message "<span class="quote">Buffer already deleted: `%s'</span>" buf)
            (if (fboundp 'kill-buffer-and-its-windows)
                (kill-buffer-and-its-windows buf) <span class="linecomment">; Defined in `misc-cmds.el'.</span>
              (kill-buffer buf))
            <span class="linecomment">;; Update the set of completions, then update `*Completions*'.</span>
            (setq minibuffer-completion-table  (mapcar (lambda (buf) (list (buffer-name buf))) (buffer-list)))
            (icicle-complete-again-update))
        (error nil))
    (message "<span class="quote">No such live buffer: `%s'</span>" buf)))


(put 'icicle-buffer 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-buffer "icicles")</span>
(icicle-define-command icicle-buffer    <span class="linecomment">; Bound to `C-x b' in Icicle mode.</span>
  "<span class="quote">Switch to a different buffer, whose content contains a regexp match.
By default, Icicle mode remaps all key sequences that are normally
bound to `switch-to-buffer' to `icicle-buffer'.  If you do not want
this remapping, then customize option `icicle-top-level-key-bindings'.

Completion candidates are two-part multi-completions, with the second
part optional.  If both parts are present they are separated by
`icicle-list-join-string' (\"^G^J\", by default).

The first part is matched as a regexp against a buffer name.
The second part is matched as a regexp against buffer content.
Candidates that do not match are filtered out.

Your minibuffer input can match a buffer name or buffer content, or
both.  Use \\&lt;minibuffer-local-completion-map&gt;`C-M-j' (equivalent here to `C-q C-g C-j') to input the
default separator.

For example:

To match `foo' against buffer names, use input `foo'.
To match `bar' against buffer contents, use input `C-M-j bar'.
To match both, use input `foo C-M-j bar'.

Only the matching buffer names are shown in `*Completions*', and only
the chosen buffer name is returned.  The actual content matches are
unimportant anyway: content matching is used only to filter
candidates.

This is a buffer-switching command.  If you instead want to navigate
to text searched for in buffers then use `icicle-search'.

The buffer-name portion of completion candidates is as follows,
depending on the prefix arg:

* No prefix arg: all buffers
* Numeric arg &gt; 0: buffers visiting files or directories (Dired)
* Numeric arg &lt; 0: buffers associated with the selected frame
* Numeric arg = 0: buffers with the same mode as the current buffer
* Plain prefix arg (`C-u'): buffers with the same mode as current, or
  with a mode that the current mode is derived from

For Emacs 23 and later, the default values (via `M-n') are the
\(buffer-name components of the) first four completion candidates
\(respecting the prefix argument).

You can use these additional keys during completion:

* `C-x F'     Toggle including cached file names as candidates (option
              `icicle-buffer-include-cached-files-nflag').
* `C-x R'     Toggle including recent file names as candidates (option
              `icicle-buffer-include-recent-files-nflag').
* `C-x m'     Visit a bookmarked buffer (only if you use Bookmark+).
* `C-x C-m -' Remove candidate buffers whose mode is derived from a
              given mode.  Repeatable.  (`C-m' = `RET'.)
* `C-x M -'   Remove buffers in a given mode.  Repeatable.
* `C-x C-m +' Keep only buffers in a mode derived from a given mode.
* `C-x M +'   Keep only buffers in a given mode.
* `\\[icicle-delete-candidate-object]'  Kill the buffer named by a completion candidate.

These options, when non-nil, control candidate matching and filtering:

 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-include-cached-files-nflag' - Include cached files
 `icicle-buffer-include-recent-files-nflag' - Include recent files
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer names satisfy
 `icicle-buffer-sort'               - Sort function for candidates
 `icicle-buffer-skip-hook'          - Exclude from content searching
 `icicle-find-file-of-content-skip-hook' - Same, cached/recent files

For example, to change the default behavior to show only buffers that
are associated with files, set `icicle-buffer-predicate' to this:

 (lambda (buf) (buffer-file-name buf))

Option `icicle-buffer-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-buffers-ido-like' non-nil gives this command a more
Ido-like behavior.

See also command `icicle-buffer-no-search', which is `icicle-buffer'
without the multi-completion behavior that searches buffer content.

See also command `icicle-buffer-config', which lets you choose a
configuration of user options for commands such as `icicle-buffer'.

Note: The prefix arg is tested, even when this is called
noninteractively.  Lisp code can bind `current-prefix-arg' to control
the behavior.</span>"                          <span class="linecomment">; Doc string</span>
  (lambda (buf)                         <span class="linecomment">; Action function</span>
    (when (and (not (get-buffer buf))  (member buf icicle-buffer-easy-files))
      (setq buf  (find-file-noselect buf)))
    (switch-to-buffer buf))        
  prompt 'icicle-buffer-multi-complete nil <span class="linecomment">;  `completing-read' args</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs 23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names current-prefix-arg) nil
  (icicle-buffer-bindings               <span class="linecomment">; Bindings</span>
   ((prompt                                 (icicle-buffer-name-prompt "<span class="quote">Switch to</span>"))
    (icicle-show-multi-completion-flag      t) <span class="linecomment">; Override user setting.</span>
    (icicle-multi-completing-p              t)
    (icicle-list-use-nth-parts              '(1))

    (icicle-candidate-help-fn               (lambda (cand)
                                              (setq cand  (icicle-transform-multi-completion cand))
                                              (when (and (bufferp (get-buffer cand))
                                                         (with-current-buffer cand
                                                           (if (fboundp 'describe-buffer) <span class="linecomment">; In `help-fns+.el'.</span>
                                                               (describe-buffer)
                                                             (describe-mode)) t)))))
    (icicle-buffer-easy-files               ()))
   ((icicle-buffer-complete-fn              'icicle-buffer-multi-complete)
    <span class="linecomment">;; Bind `icicle-apropos-complete-match-fn' to nil to prevent automatic input matching in</span>
    <span class="linecomment">;; `icicle-unsorted-apropos-candidates' etc., because `icicle-buffer-multi-complete' does everything.</span>
    (icicle-apropos-complete-match-fn       nil)
    (icicle-last-apropos-complete-match-fn  'icicle-buffer-apropos-complete-match)
    <span class="linecomment">;; `icicle-bufflist' is FREE here.</span>
    (icicle-bufflist                        (setq icicle-bufflist
                                                  (delete icicle-orig-buff icicle-bufflist)))))
  (progn (icicle-bind-buffer-candidate-keys)
         (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
         (icicle-highlight-lighter)
         (message "<span class="quote">Matching buffer contents...</span>"))
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-buffer-candidate-keys)) <span class="linecomment">; Last code</span>

<span class="linecomment">;; Free var here: `icicle-bufflist' is bound by `icicle-buffer-bindings'.</span>
(defun icicle-default-buffer-names (&optional arg)
  "<span class="quote">Default buffer names (Emacs 23+) or name (&lt; Emacs 23).
For Emacs 23+, up to four names are returned.

Optional ARG is used only for Emacs 23+.  Its meaning is the same as
the prefix argument in Icicles buffer commands:
 * nil       :  all buffers
 * Number &gt; 0: buffers visiting files or directories (Dired)
 * Number &lt; 0: buffers associated with the selected frame
 * Number = 0: buffers with the same mode as the current buffer
 * Cons      : buffers with the same mode as current, or with
               a mode that the current mode is derived from</span>"
  (if (&lt; emacs-major-version 23)
      (let ((bname  (buffer-name (if (fboundp 'another-buffer) <span class="linecomment">; In `misc-fns.el'.</span>
                                     (another-buffer nil t)
                                   (other-buffer (current-buffer))))))
        (if (and icicle-bufflist  (not (member bname icicle-bufflist)))
            (car icicle-bufflist)
          bname))
    <span class="linecomment">;; Emacs 23 accepts a list of default values.  ; Just keep the first 4.  (This could be an option.)</span>
    (let* ((bfnames  (mapcar #'buffer-name (delete (current-buffer) (or icicle-bufflist  (buffer-list))))))
      (when icicle-buffer-ignore-space-prefix-flag
        (setq bfnames  (icicle-remove-if (lambda (bfname) (icicle-string-match-p "<span class="quote">^ </span>" bfname)) bfnames)))
      (icicle-first-N 4 bfnames))))


(put 'icicle-buffer-other-window 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-buffer-other-window "icicles")</span>
(icicle-define-command icicle-buffer-other-window <span class="linecomment">; Bound to `C-x 4 b' in Icicle mode.</span>
  "<span class="quote">Switch to a buffer whose content matches a regexp, in another window.
Same as `icicle-buffer' except it uses a different window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (buf)                         <span class="linecomment">; Action function</span>
    (when (and (not (get-buffer buf))  (member buf icicle-buffer-easy-files))
      (setq buf  (find-file-noselect buf)))
    (switch-to-buffer-other-window buf))        
  prompt 'icicle-buffer-multi-complete nil <span class="linecomment">; `completing-read' args</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs 23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names current-prefix-arg) nil
  (icicle-buffer-bindings               <span class="linecomment">; Bindings</span>
   ((prompt                                 (icicle-buffer-name-prompt "<span class="quote">Switch to</span>"))
    (icicle-show-multi-completion-flag      t) <span class="linecomment">; Override user setting.</span>
    (icicle-multi-completing-p              t)
    (icicle-list-use-nth-parts              '(1))
    (icicle-candidate-help-fn               (lambda (cand)
                                              (setq cand  (icicle-transform-multi-completion cand))
                                              (when (and (bufferp (get-buffer cand))
                                                         (with-current-buffer cand
                                                           (if (fboundp 'describe-buffer) <span class="linecomment">; In `help-fns+.el'.</span>
                                                               (describe-buffer)
                                                             (describe-mode)) t)))))
    (icicle-buffer-easy-files               ()))
   ((icicle-buffer-complete-fn              'icicle-buffer-multi-complete)
    <span class="linecomment">;; Bind `icicle-apropos-complete-match-fn' to nil to prevent automatic input matching in</span>
    <span class="linecomment">;; `icicle-unsorted-apropos-candidates' etc., because `icicle-buffer-multi-complete' does everything.</span>
    (icicle-apropos-complete-match-fn       nil)
    (icicle-last-apropos-complete-match-fn  'icicle-buffer-apropos-complete-match)
    <span class="linecomment">;; `icicle-bufflist' is FREE here.</span>
    (icicle-bufflist                        (setq icicle-bufflist
                                                  (delete icicle-orig-buff icicle-bufflist)))))
  (progn (icicle-bind-buffer-candidate-keys)
         (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
         (icicle-highlight-lighter)
         (message "<span class="quote">Matching buffer contents...</span>"))
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-buffer-candidate-keys)) <span class="linecomment">; Last code</span>

(defun icicle-buffer-multi-complete (strg pred completion-mode)
  "<span class="quote">Completion function for `icicle-buffer'.
Used as the value of `icicle-buffer-complete-fn' and hence as
`minibuffer-completion-table'.</span>"
  (setq strg  icicle-current-input)
  (lexical-let* ((name-pat     (let ((icicle-list-use-nth-parts  '(1)))
                                 (icicle-transform-multi-completion strg)))
                 (name-pat     (if (memq icicle-current-completion-mode '(nil apropos))
                                   name-pat
                                 (concat "<span class="quote">^</span>" name-pat)))
                 (content-pat  (let ((icicle-list-use-nth-parts  '(2)))
                                 (icicle-transform-multi-completion strg)))
                 (bufs         (mapcar (lambda (buf) (buffer-name buf)) icicle-bufflist))
                 (bufs         (if icicle-buffer-ignore-space-prefix-flag
                                   (icicle-remove-if (lambda (buf) (icicle-string-match-p "<span class="quote">^ </span>" buf)) bufs)
                                 bufs))
                 (bufs         (icicle-remove-if (lambda (buf)
                                                   (or (not (icicle-string-match-p name-pat buf))
                                                       (run-hook-with-args-until-success
                                                        'icicle-buffer-skip-hook buf)))
                                                 bufs))
                 (bufs         (cond ((equal "<span class="quote"></span>" content-pat)
                                      (dolist (buf  bufs)
                                        <span class="linecomment">;; Free vars here: EXISTING-BUFFERS, NEW-BUFS--TO-KILL</span>
                                        (when (and (boundp 'existing-bufs)  (boundp 'new-bufs--to-kill)
                                                   (not (memq (setq buf  (get-buffer buf)) existing-bufs)))
                                          (add-to-list 'new-bufs--to-kill buf)))
                                      bufs)
                                     (t
                                      (icicle-remove-if-not
                                       (lambda (buf)
                                         (prog1 (with-current-buffer buf
                                                  (save-excursion (goto-char (point-min))
                                                                  (re-search-forward content-pat nil t)))
                                           <span class="linecomment">;; Free vars here: EXISTING-BUFFERS, NEW-BUFS--TO-KILL</span>
                                           (when (and (boundp 'existing-bufs)  (boundp 'new-bufs--to-kill)
                                                      (not (memq (setq buf  (get-buffer buf)) existing-bufs)))
                                             (add-to-list 'new-bufs--to-kill buf))))
                                       bufs))))
                 (filnames    (and (&gt; icicle-buffer-include-recent-files-nflag 0)
                                   (require 'recentf nil t)
                                   (or recentf-list  (recentf-load-list))
                                   (icicle-recent-files-without-buffers bufs)))
                 (filnames     (append filnames (and (&gt; icicle-buffer-include-cached-files-nflag 0)
                                                     (icicle-cached-files-without-buffers bufs))))
                 (filnames     (icicle-remove-if (lambda (fil)
                                                   (or (not (icicle-string-match-p name-pat fil))
                                                       (run-hook-with-args-until-success
                                                        'icicle-find-file-of-content-skip-hook fil)))
                                                 filnames))
                 (filnames     (if (equal "<span class="quote"></span>" content-pat)
                                   filnames
                                 (icicle-remove-if-not
                                  (lambda (filname)
                                    <span class="linecomment">;; Avoid the error raised by calling `find-file-noselect' on a directory</span>
                                    <span class="linecomment">;; when `find-file-run-dired' is nil.</span>
                                    (and (or find-file-run-dired  (not (file-directory-p filname)))
                                         (let* ((buf    (find-file-noselect filname))
                                                (found  (with-current-buffer buf
                                                          (message "<span class="quote">Matching buffer contents...</span>")
                                                          (save-excursion
                                                            (goto-char (point-min))
                                                            (re-search-forward content-pat nil t)))))
                                           <span class="linecomment">;; Free vars here: EXISTING-BUFFERS, NEW-BUFS--TO-KILL</span>
                                           (when (and (boundp 'existing-bufs)  (boundp 'new-bufs--to-kill)
                                                      (not (memq buf existing-bufs)))
                                             (add-to-list 'new-bufs--to-kill buf))
                                           found)))
                                  filnames))))
    <span class="linecomment">;; `icicle-buffer-easy-files' is FREE here - bound in `icicle-buffer(-other-window)'.</span>
    (setq bufs  (append bufs (setq icicle-buffer-easy-files  filnames)))
    (cond ((and (eq 'metadata completion-mode)  (&gt; emacs-major-version 23))
           '(metadata (category . buffer)))
          (completion-mode
           bufs) <span class="linecomment">; `all-completions', `test-completion'</span>
          (t
           (try-completion              <span class="linecomment">; `try-completion'</span>
            strg (mapcar #'list bufs) (and pred  (lambda (ss) (funcall pred ss))))))))

(defun icicle-buffer-apropos-complete-match (input buffer)
  "<span class="quote">Match function for progressive completion with `icicle-buffer'.
Return non-nil if the current multi-completion INPUT matches BUFFER.
BUFFER is a buffer name.</span>"
  (lexical-let* ((name-pat     (let ((icicle-list-use-nth-parts  '(1)))
                                 (icicle-transform-multi-completion input)))
                 (content-pat  (let ((icicle-list-use-nth-parts  '(2)))
                                 (icicle-transform-multi-completion input))))
    (and (icicle-string-match-p name-pat buffer)
         (or (equal "<span class="quote"></span>" content-pat)
             (with-current-buffer buffer
               (save-excursion (goto-char (point-min))
                               (re-search-forward content-pat nil t)))))))

(defun icicle-cached-files-without-buffers (buffers)
  "<span class="quote">Return absolute file-name list represented by `file-cache-alist'.
Do not include any files that are already visited in BUFFERS, which is
a list of buffer names.  Return only the first
`icicle-buffer-include-cached-files-nflag' names.</span>"
  (and (boundp 'file-cache-alist)
       file-cache-alist
       (catch 'icicle-cached-files-without-buffers
         (let ((result     ())
               (buf-files  (mapcar #'buffer-file-name (mapcar #'get-buffer buffers)))
               file)
           (dolist (file+dirs  file-cache-alist)
             (setq file  (car file+dirs))
             (dolist (dir  (cdr file+dirs))
               (setq file  (concat (or dir  default-directory) file))
               (unless (member file buf-files) (push file result))
               (when (&gt;= (length result) icicle-buffer-include-cached-files-nflag)
                 (throw 'icicle-cached-files-without-buffers result))))
           result))))

(defun icicle-recent-files-without-buffers (buffers)
  "<span class="quote">Return absolute file-name list represented by `recentf-list'.
Do not include any files that are already visited in BUFFERS, which is
a list of buffer names.  Return only the first
`icicle-buffer-include-recent-files-nflag' names.</span>"
  (and (boundp 'recentf-list)
       recentf-list
       (catch 'icicle-recent-files-without-buffers
         (let ((result     ())
               (buf-files  (mapcar #'buffer-file-name (mapcar #'get-buffer buffers)))
               file)
           (dolist (file  recentf-list)
             (unless (member file buf-files) (push file result))
             (when (&gt;= (length result) icicle-buffer-include-recent-files-nflag)
               (throw 'icicle-recent-files-without-buffers result)))
           result))))


(put 'icicle-buffer-no-search 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-buffer-no-search "icicles")</span>
(icicle-define-command icicle-buffer-no-search <span class="linecomment">; Not bound by default</span>
  "<span class="quote">Switch to a different buffer.
This is like command `icicle-buffer', but without the possibility of
searching buffer contents.  That is, completion candidates are just
buffer names, not multi-completions - they contain no buffer-content
part.</span>"                                  <span class="linecomment">; Doc string</span>
  switch-to-buffer                      <span class="linecomment">; Action function</span>
  (icicle-buffer-name-prompt "<span class="quote">Switch to</span>") <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (buf) (list (buffer-name buf))) icicle-bufflist) nil <span class="linecomment">; `icicle-bufflist' is free.</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs 23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names current-prefix-arg) nil
  (icicle-buffer-bindings               <span class="linecomment">; Bindings</span>
   ()
   ((icicle-bufflist  (setq icicle-bufflist  (delete icicle-orig-buff icicle-bufflist)))))
  (icicle-bind-buffer-candidate-keys)   <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-buffer-candidate-keys)) <span class="linecomment">; Last code</span>


(put 'icicle-buffer-no-search-other-window 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-buffer-no-search-other-window "icicles")</span>
(icicle-define-command icicle-buffer-no-search-other-window <span class="linecomment">; Not bound by default</span>
  "<span class="quote">Switch to a different buffer in another window.
Same as `icicle-buffer' except it uses a different window.</span>" <span class="linecomment">; Doc string</span>
  switch-to-buffer-other-window         <span class="linecomment">; Action function</span>
  (icicle-buffer-name-prompt "<span class="quote">Switch to</span>" t) <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (buf) (list (buffer-name buf))) icicle-bufflist) nil <span class="linecomment">; `icicle-bufflist' is free.</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs 23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names current-prefix-arg) nil
  (icicle-buffer-bindings               <span class="linecomment">; Bindings</span>
   ()
   ((icicle-bufflist  (setq icicle-bufflist  (delete icicle-orig-buff icicle-bufflist)))))
  (icicle-bind-buffer-candidate-keys)   <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-buffer-candidate-keys)) <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-visit-marked-file-of-content "icicles")</span>
(icicle-define-command icicle-visit-marked-file-of-content <span class="linecomment">; Command name</span>
  "<span class="quote">Visit a marked file whose content matches a regexp.
The marked files are examined, and those whose file names and/or
contents match your multi-completion input are available as candidate
buffers to visit.  This command is like `icicle-buffer'.
See that command for more information.
You must be in Dired to use this command.

When this command is finished, any unused buffers that were created
for content matching are killed, if option
`icicle-kill-visited-buffers-flag' is non-nil.  But a prefix argument
flips the behavior specified by that option.</span>" <span class="linecomment">; Doc string</span>
  (lambda (buf)                         <span class="linecomment">; Action function.  Free var here: NEW-BUFS--TO-KEEP.</span>
    (push (switch-to-buffer (icicle-transform-multi-completion buf))
          new-bufs--to-keep))           <span class="linecomment">; Add the visited buffer to those we will keep (not kill).</span>
  prompt 'icicle-buffer-multi-complete nil <span class="linecomment">; `completing-read' args</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs 23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names current-prefix-arg) nil
  (icicle-buffer-bindings               <span class="linecomment">; Bindings</span>
   ((prompt                             (icicle-buffer-name-prompt "<span class="quote">Visit file</span>"))
    (icicle-show-multi-completion-flag  t) <span class="linecomment">; Override user setting.</span>
    (icicle-multi-completing-p          t)
    (icicle-list-use-nth-parts          '(1))
    <span class="linecomment">;; Bind `icicle-apropos-complete-match-fn' to nil to prevent automatic input matching in</span>
    <span class="linecomment">;; `icicle-unsorted-apropos-candidates' etc., because `icicle-buffer-multi-complete' does everything.</span>
    (icicle-apropos-complete-match-fn   nil)
    (init-pref-arg                      current-prefix-arg)
    (existing-bufs                      (buffer-list))
    (new-bufs--to-kill                  ())
    (new-bufs--to-keep                  ())
    (icicle-candidate-help-fn           (lambda (cand)
                                          (setq cand  (icicle-transform-multi-completion cand))
                                          (when (and (bufferp (get-buffer cand))
                                                     (with-current-buffer cand
                                                       (if (fboundp 'describe-buffer) <span class="linecomment">; In `help-fns+.el'.</span>
                                                           (describe-buffer)
                                                         (describe-mode)) t))))))
   ((icicle-buffer-complete-fn          'icicle-buffer-multi-complete)
    <span class="linecomment">;; `icicle-bufflist' is free here.</span>
    (icicle-bufflist                    (save-excursion
                                          (let* ((files  (dired-get-marked-files
                                                          nil nil
                                                          (lambda (file) (not (file-directory-p file)))))
                                                 (bufs   ()))
                                            (dolist (file  files) (push (find-file-noselect file) bufs))
                                            bufs)))))
  (progn (unless (eq major-mode 'dired-mode) (error "<span class="quote">Use this command only in Dired mode</span>"))
         (icicle-bind-buffer-candidate-keys)
         (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
         (icicle-highlight-lighter)
         (message "<span class="quote">Matching file contents...</span>"))
  nil                                   <span class="linecomment">; Undo code</span>
  (progn (icicle-unbind-buffer-candidate-keys) <span class="linecomment">; Last code</span>
         (when (or (and init-pref-arg        (not icicle-kill-visited-buffers-flag))
                   (and (not init-pref-arg)  icicle-kill-visited-buffers-flag))
           (dolist (buf  new-bufs--to-kill)
             (unless (memq buf new-bufs--to-keep) (kill-buffer buf))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-visit-marked-file-of-content-other-window "icicles")</span>
(icicle-define-command icicle-visit-marked-file-of-content-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Visit a marked file whose content matches a regexp, in another window.
Same as `icicle-visit-marked-file-of-content' except it uses a
different window.  You must be in Dired to use this command.</span>" <span class="linecomment">; Doc string</span>
  (lambda (buf)                         <span class="linecomment">; Action function.  Free var here: NEW-BUFS--TO-KEEP.</span>
    (push (switch-to-buffer-other-window (icicle-transform-multi-completion buf))
          new-bufs--to-keep))           <span class="linecomment">; Add the visited buffer to those we will keep (not kill).</span>
  prompt 'icicle-buffer-multi-complete nil <span class="linecomment">; `completing-read' args</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs 23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names current-prefix-arg) nil
  (icicle-buffer-bindings               <span class="linecomment">; Bindings</span>
   ((prompt                             (icicle-buffer-name-prompt "<span class="quote">Visit file</span>"))
    (icicle-show-multi-completion-flag  t) <span class="linecomment">; Override user setting.</span>
    (icicle-multi-completing-p          t)
    (icicle-list-use-nth-parts          '(1))
    <span class="linecomment">;; Bind `icicle-apropos-complete-match-fn' to nil to prevent automatic input matching in</span>
    <span class="linecomment">;; `icicle-unsorted-apropos-candidates' etc., because `icicle-buffer-multi-complete' does everything.</span>
    (icicle-apropos-complete-match-fn   nil)
    (init-pref-arg                      current-prefix-arg)
    (existing-bufs                      (buffer-list))
    (new-bufs--to-kill                  ())
    (new-bufs--to-keep                  ())
    (icicle-candidate-help-fn           (lambda (cand)
                                          (setq cand  (icicle-transform-multi-completion cand))
                                          (when (and (bufferp (get-buffer cand))
                                                     (with-current-buffer cand
                                                       (if (fboundp 'describe-buffer) <span class="linecomment">; In `help-fns+.el'.</span>
                                                           (describe-buffer)
                                                         (describe-mode)) t))))))
   ((icicle-buffer-complete-fn          'icicle-buffer-multi-complete)
    <span class="linecomment">;; `icicle-bufflist' is free here.</span>
    (icicle-bufflist                    (save-excursion
                                          (let* ((files  (dired-get-marked-files
                                                          nil nil
                                                          (lambda (file) (not (file-directory-p file)))))
                                                 (bufs   ()))
                                            (dolist (file  files) (push (find-file-noselect file) bufs))
                                            bufs)))))
  (progn (unless (eq major-mode 'dired-mode) (error "<span class="quote">Use this command only in Dired mode</span>"))
         (icicle-bind-buffer-candidate-keys)
         (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
         (icicle-highlight-lighter)
         (message "<span class="quote">Matching file contents...</span>"))
  nil                                   <span class="linecomment">; Undo code</span>
  (progn (icicle-unbind-buffer-candidate-keys) <span class="linecomment">; Last code</span>
         (when (or (and init-pref-arg        (not icicle-kill-visited-buffers-flag))
                   (and (not init-pref-arg)  icicle-kill-visited-buffers-flag))
           (dolist (buf  new-bufs--to-kill)
             (unless (memq buf new-bufs--to-keep) (kill-buffer buf))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-insert-buffer "icicles")</span>
(icicle-define-command icicle-insert-buffer
  "<span class="quote">Multi-command version of `insert-buffer'.
See `icicle-buffer' for more information, including about buffer-name
completion candidates, default values, and additional key bindings.</span>" <span class="linecomment">; Doc string</span>
  insert-buffer                         <span class="linecomment">; Action function</span>
  (icicle-buffer-name-prompt "<span class="quote">Insert</span>")  <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (buf) (list (buffer-name buf))) icicle-bufflist) nil <span class="linecomment">; `icicle-bufflist' is free.</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs 23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names current-prefix-arg) nil
  (icicle-buffer-bindings)              <span class="linecomment">; Bindings</span>
  <span class="linecomment">;; Actually, there is no reason to bind `C-x m' to `icicle-bookmark-non-file-other-window' here,</span>
  <span class="linecomment">;; but to keep things simple we do it anyway.</span>
  (icicle-bind-buffer-candidate-keys)   <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-buffer-candidate-keys)) <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-add-buffer-candidate "icicles")</span>
(icicle-define-command icicle-add-buffer-candidate <span class="linecomment">; Command name</span>
  "<span class="quote">Add buffer as an always-show completion candidate.
Add the buffer to `icicle-buffer-extras'.  Save the updated option.
See `icicle-buffer' for more information, including about buffer-name
completion candidates, default values, and additional key bindings.</span>" <span class="linecomment">; Doc string</span>
  <span class="linecomment">;; FREE here: ICICLE-BUFFER-EXTRAS, ICICLE-CUSTOMIZE-SAVE-VARIABLE-FUNCTION.</span>
  (lambda (buf)
    (add-to-list 'icicle-buffer-extras buf) <span class="linecomment">; Action function</span>
    (funcall icicle-customize-save-variable-function 'icicle-buffer-extras icicle-buffer-extras)
    (message "<span class="quote">Buffer `%s' added to always-show buffers</span>"
             (icicle-propertize buf 'face 'icicle-msg-emphasis)))
  (icicle-buffer-name-prompt "<span class="quote">Show always</span>") <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (buf) (list (buffer-name buf))) icicle-bufflist) nil <span class="linecomment">; `icicle-bufflist' is free.</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">; Emacs 23.</span>
  nil 'buffer-name-history (icicle-default-buffer-names current-prefix-arg) nil
  (icicle-buffer-bindings               <span class="linecomment">; Bindings</span>
   ((icicle-delete-candidate-object        'icicle-remove-buffer-candidate-action) <span class="linecomment">; Override default (kill).</span>
    (icicle-use-candidates-only-once-flag  t)))
  <span class="linecomment">;; Actually, there is no reason to bind `C-x m' to `icicle-bookmark-non-file-other-window' here,</span>
  <span class="linecomment">;; but to keep things simple we do it anyway.</span>
  (icicle-bind-buffer-candidate-keys)   <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-buffer-candidate-keys)) <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-remove-buffer-candidate "icicles")</span>
(icicle-define-command icicle-remove-buffer-candidate <span class="linecomment">; Command name</span>
  "<span class="quote">Remove buffer as an always-show completion candidate.
Remove the buffer from `icicle-buffer-extras'.
Save the updated option.</span>"               <span class="linecomment">; Doc string</span>
  icicle-remove-buffer-candidate-action <span class="linecomment">; Action function</span>
  "<span class="quote">Remove buffer from always-show list: </span>" <span class="linecomment">; `completing-read' args</span>
  (mapcar #'list icicle-buffer-extras) nil t nil 'buffer-name-history (car icicle-buffer-extras) nil
  ((icicle-use-candidates-only-once-flag  t) <span class="linecomment">; Bindings</span>
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn  (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>"))))
  (unless icicle-buffer-extras (error "<span class="quote">`icicle-extra-buffers' is empty</span>"))) <span class="linecomment">; First code</span>

(defun icicle-remove-buffer-candidate-action (buf)
  "<span class="quote">Action function for command `icicle-remove-buffer-candidate'.</span>"
  (setq icicle-buffer-extras  (delete buf icicle-buffer-extras))
  (funcall icicle-customize-save-variable-function 'icicle-buffer-extras icicle-buffer-extras)
  (message "<span class="quote">Buffer `%s' removed from always-show buffers</span>"
           (icicle-propertize buf 'face 'icicle-msg-emphasis)))

<span class="linecomment">;;;###autoload (autoload 'icicle-buffer-config "icicles")</span>
(icicle-define-command icicle-buffer-config <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a configuration of user options for `icicle-buffer'.
You can use \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-delete-candidate-object]' on any configuration during completion to
remove it.  See user option `icicle-buffer-configs'.
See also commands `icicle-add-buffer-config' and
`icicle-remove-buffer-config'.</span>"         <span class="linecomment">; Doc string</span>
  <span class="linecomment">;; FREE here: ICICLE-BUFFER-CONFIGS, ICICLE-BUFFER-EXTRAS, ICICLE-BUFFER-MATCH-REGEXP,</span>
  <span class="linecomment">;;            ICICLE-BUFFER-NO-MATCH-REGEXP, ICICLE-BUFFER-PREDICATE, ICICLE-BUFFER-SORT.</span>
  (lambda (config-name)                 <span class="linecomment">; Action function</span>
    (let ((config  (assoc config-name icicle-buffer-configs)))
      (setq icicle-buffer-match-regexp     (elt config 1)
            icicle-buffer-no-match-regexp  (elt config 2)
            icicle-buffer-predicate        (elt config 3)
            icicle-buffer-extras           (elt config 4)
            icicle-buffer-sort             (elt config 5))))
  "<span class="quote">Configuration: </span>" icicle-buffer-configs nil t nil <span class="linecomment">; `completing-read' args</span>
  'icicle-buffer-config-history nil nil
  ((icicle-delete-candidate-object  'icicle-remove-buffer-config-action))) <span class="linecomment">; Bindings</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-add-buffer-config "icicles")</span>
(icicle-define-add-to-alist-command icicle-add-buffer-config <span class="linecomment">; Command name</span>
  "<span class="quote">Add buffer configuration to `icicle-buffer-configs'.
You are prompted for the buffer configuration components.
For the list of extra buffers to always display, you can choose them
using `C-mouse-2', `C-RET', and so on, just as you would make any
Icicles multiple choice.</span>"
  <span class="linecomment">;; FREE here: FUNCTION-NAME-HISTORY, ICICLE-BUFFER-NO-MATCH-REGEXP, ICICLE-BUFFER-PREDICATE,</span>
  <span class="linecomment">;;            ICICLE-BUFFER-SORT.</span>
  (lambda ()
    (let ((name            (read-from-minibuffer "<span class="quote">Add buffer configuration.  Name: </span>"))
          (match-regexp    (icicle-read-from-minibuf-nil-default
                            "<span class="quote">Regexp to match: </span>" nil nil nil 'regexp-history
                            icicle-buffer-match-regexp))
          (nomatch-regexp  (icicle-read-from-minibuf-nil-default
                            "<span class="quote">Regexp not to match: </span>" nil nil nil 'regexp-history
                            icicle-buffer-no-match-regexp))
          (pred            (icicle-read-from-minibuf-nil-default
                            "<span class="quote">Predicate to satify: </span>" nil nil nil
                            (if (boundp 'function-name-history)
                                'function-name-history
                              'icicle-function-name-history)
                            icicle-buffer-predicate))
          (sort-fn         (icicle-read-from-minibuf-nil-default
                            "<span class="quote">Sort function: </span>" nil nil t
                            (if (boundp 'function-name-history)
                                'function-name-history
                              'icicle-function-name-history)
                            (and icicle-buffer-sort  (symbol-name icicle-buffer-sort))))
          (extras          (let ((icicle-prompt   "<span class="quote">Choose extra buffers to show (`RET' when done): </span>"))
                             (icicle-buffer-list)))) <span class="linecomment">; Do last, for convenience.</span>
      (list name match-regexp nomatch-regexp pred extras sort-fn)))
  icicle-buffer-configs)

<span class="linecomment">;;;###autoload (autoload 'icicle-remove-buffer-config "icicles")</span>
(icicle-define-command icicle-remove-buffer-config <span class="linecomment">; Command name</span>
  "<span class="quote">Remove buffer configuration from `icicle-buffer-configs'.
Save the updated option.</span>"               <span class="linecomment">; Doc string</span>
  icicle-remove-buffer-config-action    <span class="linecomment">; Action function</span>
  "<span class="quote">Remove buffer configuration: </span>"       <span class="linecomment">; `completing-read' args</span>
  (mapcar (lambda (config) (list (car config))) icicle-buffer-configs)
  nil t nil 'icicle-buffer-config-history (caar icicle-buffer-configs) nil
  ((icicle-use-candidates-only-once-flag  t))) <span class="linecomment">; Bindings</span>

(defun icicle-remove-buffer-config-action (config-name)
  "<span class="quote">Action function for command `icicle-remove-buffer-config'.</span>"
  (setq icicle-buffer-configs  (icicle-assoc-delete-all config-name icicle-buffer-configs))
  (funcall icicle-customize-save-variable-function 'icicle-buffer-configs icicle-buffer-configs)
  (message "<span class="quote">Buffer configuration `%s' removed</span>"
           (icicle-propertize config-name 'face 'icicle-msg-emphasis)))

<span class="linecomment">;;;###autoload (autoload 'icicle-color-theme "icicles")</span>
(icicle-define-command icicle-color-theme <span class="linecomment">; Command name</span>
  "<span class="quote">Change color theme.
You can use \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-delete-candidate-object]' during completion to remove the current
candidate from the list of color themes.

If you use `C-g' during this command, the previous color-theme
snapshot is used to restore that color theme.

Remember too that you can use the pseudo-theme [Reset] to restore the
last theme: `M-x color-theme-select [Reset]'.

By default, each time you invoke this command, a snapshot is first
made of the current color theme (or current colors, if no theme is
used).  Thus, by default, if you use `C-g', the colors restored are
those used before you changed themes using this command.

However, if you use a prefix arg, then this command takes no new
snapshot, unless no snapshot has ever been taken during this Emacs
session.  This can be useful when experimenting, to restore not to the
state just before this command invocation, but to some previous
snapshot.

To use this command, you must have loaded library `color-theme.el',
available from http://www.emacswiki.org/cgi-bin/wiki.pl?ColorTheme.</span>" <span class="linecomment">; Doc string</span>
  (lambda (theme)
    (when (string= "<span class="quote"></span>" theme) (error "<span class="quote">No theme name entered (empty input)</span>"))
    (funcall  (intern theme)))          <span class="linecomment">; Action function: just call the theme.</span>
  "<span class="quote">Theme: </span>" icicle-color-themes nil t nil <span class="linecomment">; `completing-read' args</span>
  (if (boundp 'color-theme-history) 'color-theme-history 'icicle-color-theme-history)
  nil nil
  ((icicle-delete-candidate-object  'icicle-color-themes) <span class="linecomment">; Bindings</span>
   (prefix-arg                      current-prefix-arg))
  (progn (unless (prog1 (require 'color-theme nil t) <span class="linecomment">; First code</span>
                   (when (and (fboundp 'color-theme-initialize)  (not color-theme-initialized))
                     <span class="linecomment">;; NOTE: We need the `icicle-condition-case-no-debug' because of a BUG in</span>
                     <span class="linecomment">;; `directory-files' for Emacs 20.  Bug reported to `color-theme.el'</span>
                     <span class="linecomment">;; maintainer 2009-11-22.  The problem is that the default value of</span>
                     <span class="linecomment">;; `color-theme-libraries' concats `file-name-directory', which ends in `/',</span>
                     <span class="linecomment">;; with `/themes', not with `themes'.  So the result is `...//themes'.</span>
                     <span class="linecomment">;; That is tolerated by Emacs 21+ `directory-files', but not for Emacs 20.</span>
                     <span class="linecomment">;; Until this `color-theme.el' bug is fixed, Emacs 20 users will need to</span>
                     <span class="linecomment">;; manually load `color-theme-libraries.el'.</span>
                     (icicle-condition-case-no-debug nil
                         (let ((color-theme-load-all-themes  t))
                           (color-theme-initialize)
                           (setq color-theme-initialized  t))
                       (error nil))))
           (error "<span class="quote">This command requires library `color-theme.el'</span>"))
         (unless icicle-color-themes
           (setq icicle-color-themes
                 (delete '("<span class="quote">bury-buffer</span>")
                         (mapcar (lambda (entry) (list (symbol-name (car entry))))
                                 color-themes)))) <span class="linecomment">; Free here, defined in `color-theme.el'.</span>
         <span class="linecomment">;; Create the snapshot, if not available.  Do this so users can also undo using</span>
         <span class="linecomment">;; pseudo-theme `[Reset]'.</span>
         (when (or (not prefix-arg)
                   (not (assq 'color-theme-snapshot color-themes))
                   (not (commandp 'color-theme-snapshot)))
           (fset 'color-theme-snapshot (color-theme-make-snapshot))
           (setq color-themes  (delq (assq 'color-theme-snapshot color-themes) color-themes)
                 color-themes  (delq (assq 'bury-buffer color-themes) color-themes)
                 color-themes  (append '((color-theme-snapshot
                                          "<span class="quote">[Reset]</span>" "<span class="quote">Undo changes, if possible.</span>")
                                         (bury-buffer "<span class="quote">[Quit]</span>" "<span class="quote">Bury this buffer.</span>"))
                                       color-themes))))
  (color-theme-snapshot))               <span class="linecomment">; Undo code</span>


<span class="linecomment">;; Make delete-selection mode recognize yanking, so it replaces region text.</span>
(put 'icicle-yank-pop-commands 'delete-selection 'yank)

(defun icicle-yank-pop-commands (&optional arg) <span class="linecomment">; Bound to `M-y'.</span>
  "<span class="quote">`yank-pop', `yank-pop-secondary', or `icicle-completing-yank'.
Which of these is used depends on the previous command, as follows:

 * If the previous command was a yank-secondary command, then
   `yank-pop-secondary'.

 * Else if the previous command was a yank command (i.e. using the
   kill ring), then `yank-pop'.

 * Else `icicle-completing-yank'.

In the last case (`icicle-completing-yank'), during completion you can
use:

 * \\&lt;minibuffer-local-completion-map&gt;`\\[icicle-change-sort-order]' to sort the \
candidates to yank in different ways (repeat)
 * `\\[icicle-delete-candidate-object]' to remove a candidate entry from the selection ring
 * `\\[icicle-candidate-alt-action]' to copy a candidate to the other selection ring

You need library `second-sel.el' for this command.</span>"
  (interactive "<span class="quote">p</span>")
  (unless (featurep 'second-sel) (error "<span class="quote">You need library `second-sel.el' for this command</span>"))
  <span class="linecomment">;; Disable `browse-kill-ring's advice, since we handle such things here instead.</span>
  (when (fboundp 'browse-kill-ring)
    (condition-case nil
        (ad-disable-advice 'yank-pop 'around 'kill-ring-browse-maybe)
      (error nil)))
  (cond ((memq last-command secondary-selection-yank-secondary-commands)
         (when buffer-read-only (error "<span class="quote">Buffer is read-only: %S</span>" (current-buffer)))
         (yank-pop-secondary arg))
        ((memq last-command secondary-selection-yank-commands)
         (when buffer-read-only (error "<span class="quote">Buffer is read-only: %S</span>" (current-buffer)))
         (yank-pop arg))
        (t
         (icicle-completing-yank)
         <span class="linecomment">;; Need to do this because `icicle-completing-yank' sets it to `yank'.</span>
         (setq this-command  'icicle-yank-pop-commands))))


<span class="linecomment">;; Make delete-selection mode recognize yanking, so it replaces region text.</span>
(put 'icicle-completing-yank 'delete-selection 'yank)
<span class="linecomment">;; Bound to `C-- C-y' via `icicle-yank-maybe-completing'.</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-completing-yank "icicles")</span>
(icicle-define-command icicle-completing-yank <span class="linecomment">; Bound to `M-y' unless previous command was a yank.</span>
  "<span class="quote">Yank an entry from a selection ring, choosing it using completion.
By default, the selection ring used is the kill ring.

If you also use library `browse-kill-ring+.el' or library
`second-sel.el' then an alternative selection ring is used if you
provide a prefix argument: `browse-kill-ring-alternative-ring' or
`secondary-selection-ring'.  This gives you a way to yank chosen items
from two different sets of selections.

When the kill ring is used, this is similar to `yank', but this does
not rotate the ring.  The mark is pushed first, so the yanked text
becomes the region.

During completion, you can use:

 * \\&lt;minibuffer-local-completion-map&gt;`\\[icicle-change-sort-order]' to sort the \
candidates to yank in different ways (repeat)
 * `\\[icicle-delete-candidate-object]' to remove a candidate entry from the selection ring
 * `\\[icicle-candidate-alt-action]' to copy a candidate to the other selection ring
   (requires `second-sel.el' or `browse-kill-ring+.el')</span>" <span class="linecomment">; Doc string</span>
  icicle-insert-for-yank                <span class="linecomment">; Action function</span>
  "<span class="quote">Insert: </span>" (mapcar #'list kills-in-order) nil t nil 'icicle-kill-history <span class="linecomment">; `completing-read' args</span>
  (car kills-in-order) nil
  ((icicle-transform-function       'icicle-remove-duplicates) <span class="linecomment">; Bindings</span>
   (icicle-sort-comparer            nil)
   (selection-ring                  (if (not current-prefix-arg)
                                        'kill-ring
                                      (if (boundp 'browse-kill-ring-alternative-ring)
                                          browse-kill-ring-alternative-ring
                                        (if (boundp 'secondary-selection-ring)
                                            'secondary-selection-ring)
                                        'kill-ring)))
   (icicle-candidate-alt-action-fn  `(lambda (seln) <span class="linecomment">; Add selection to the front of the other ring.</span>
                                      <span class="linecomment">;; FREE here: BROWSE-KILL-RING-ALTERNATIVE-PUSH-FUNCTION,</span>
                                      <span class="linecomment">;;            BROWSE-KILL-RING-ALTERNATIVE-RING.</span>
                                      (let ((other-ring  (if (eq 'kill-ring ',selection-ring)
                                                             (if (fboundp 'browse-kill-ring)
                                                                 browse-kill-ring-alternative-ring
                                                               (if (boundp 'secondary-selection-ring)
                                                                   'secondary-selection-ring
                                                                 nil))
                                                           'kill-ring)))
                                        (if (eq 'kill-ring ',selection-ring)
                                            (if (fboundp 'browse-kill-ring-alternative-push-function)
                                                (funcall browse-kill-ring-alternative-push-function
                                                         seln)
                                              (when (boundp 'secondary-selection-ring)
                                                (add-secondary-to-ring seln)))
                                          (kill-new seln))
                                        (icicle-msg-maybe-in-minibuffer
                                         (if (null other-ring)
                                             "<span class="quote">No other selection ring</span>"
                                           (format "<span class="quote">Copied to `%s'</span>" other-ring))))))
   (icicle-delete-candidate-object  selection-ring)
   (kills-in-order                  (if (eq selection-ring 'kill-ring)
                                        (append kill-ring-yank-pointer kill-ring ())
                                      (copy-sequence (symbol-value selection-ring))))))

(defun icicle-insert-for-yank (string)
  "<span class="quote">`insert-for-yank', if defined; else, `insert' with `read-only' removed.
Pushes the mark first, so the inserted text becomes the region.</span>"
  (setq this-command  'yank)
  (push-mark)
  (if (fboundp 'insert-for-yank)        <span class="linecomment">; Defined in `subr.el' (not required).</span>
      (insert-for-yank string)
    (let ((opoint  (point)))
      (insert string)
      (let ((inhibit-read-only  t)) (remove-text-properties opoint (point) '(read-only nil))))))


<span class="linecomment">;; Make delete-selection mode recognize yanking, so it replaces region text.</span>
(put 'icicle-yank-maybe-completing 'delete-selection 'yank)

<span class="linecomment">;;;###autoload (autoload 'icicle-yank-maybe-completing "icicles")</span>
(defun icicle-yank-maybe-completing (&optional arg) <span class="linecomment">;  Bound to `C-y' (or what `yank' was bound to).</span>
  "<span class="quote">`icicle-completing-yank', `icicle-yank', or `icicle-yank-function'.
If called from the minibuffer, call `icicle-yank'.
Otherwise:
 With a negative prefix argument, call `icicle-completing-yank'.
 Otherwise, call the value of user option `icicle-yank-function' (by
 default, `yank').</span>"
  (interactive "<span class="quote">*P</span>")
  (if (window-minibuffer-p (selected-window))
      (icicle-yank arg)
    (if (wholenump (prefix-numeric-value arg))
        (funcall icicle-yank-function arg)
      (let ((current-prefix-arg  nil))  (icicle-completing-yank)))))

<span class="linecomment">;;;###autoload (when (locate-library "proced") (autoload 'icicle-send-signal-to-process "icicles"))</span>
(when (locate-library "<span class="quote">proced</span>")         <span class="linecomment">; Emacs 23+.</span>
  (icicle-define-command icicle-send-signal-to-process
    "<span class="quote">Send a signal to a system process.
Each candidate is a multi-completion with parts COMMAND, USER, and
PID, separated by `icicle-list-join-string' (\"^G^J\", by default).
 COMMAND is the system command associated with the process.
 USER is the user who issued COMMAND.
 PID is the process identifier.
You can match an input regexp against any combination of the parts.
You can use `C-M-j' (equivalent here to `C-q C-g C-j') to input the
default separator.</span>"
    (lambda (cand)                      <span class="linecomment">; ; FREE here: GET-ATTR, GET-PID, PROCED-SIGNAL-LIST.</span>
      (let* ((process       (funcall get-pid cand))
             (process-name  (funcall get-attr cand 'comm))
             (sigcode       (let ((enable-recursive-minibuffers  t))
                              (completing-read
                               (format "<span class="quote">Send signal to process %s: </span>" process-name)
                               <span class="linecomment">;; `proced-signal-list' is free here.</span>
                               proced-signal-list nil nil nil nil "<span class="quote">TERM</span>"))))
        (setq sigcode  (and (stringp sigcode)  (if (string-match "<span class="quote">\\`[0-9]+\\'</span>" sigcode)
                                                   (string-to-number sigcode)
                                                 (make-symbol sigcode))))
        (when sigcode (signal-process process sigcode))))
    prompt (mapcar (lambda (pid)
                     (let ((ats  (process-attributes pid)))
                       `((,(cdr (assoc 'comm ats)) ,(cdr (assoc 'user ats)) ,(number-to-string pid)))))
                   (list-system-processes))
    nil 'FORCE-MATCH-TO-PREVENT-ACCIDENTS nil nil nil nil
    ((prompt                             "<span class="quote">COMMAND `C-M-j' USER `C-M-j' PID: </span>") <span class="linecomment">; Bindings</span>
     (completion-ignore-case             t) <span class="linecomment">; For sorting.</span>
     (icicle-candidate-properties-alist  ())
     (icicle-multi-completing-p          t)
     (icicle-list-use-nth-parts          '(3))
     (get-pid                            (lambda (cand) (string-to-number cand)))
     (get-attr                           (lambda (cand attr) <span class="linecomment">; FREE here: GET-PID.</span>
                                           (cdr-safe (assoc attr (process-attributes
                                                                  (funcall get-pid cand))))))
     (get-user                           (lambda (cand) <span class="linecomment">; FREE here: GET-ATTR.</span>
                                           (funcall get-attr cand 'user)))
     (icicle-candidate-help-fn           (lambda (cand) <span class="linecomment">; FREE here: GET-PID.</span>
                                           (icicle-describe-process (funcall get-pid cand))))
     (icicle-transform-before-sort-p     t)
     (icicle-last-transform-function     nil) <span class="linecomment">; Because we bind `icicle-transform-function'.</span>
     (icicle-transform-function          (lambda (cands)
                                           (let ((user-name  (user-login-name)))
                                             (loop for cand in cands
                                                   for user = (funcall <span class="linecomment">; FREE here: GET-USER.</span>
                                                               get-user
                                                               (icicle-transform-multi-completion cand)) 
                                                   if (equal user-name user)
                                                   collect cand))))
     (icicle-sort-orders-alist           '(("<span class="quote">by pid</span>" .
                                            (lambda (s1 s2) <span class="linecomment">; FREE here: GET-PID.</span>
                                              (&lt; (funcall get-pid s1) (funcall get-pid s2))))
                                           ("<span class="quote">by command name</span>" .
                                            (lambda (s1 s2) <span class="linecomment">; FREE here: GET-ATTR.</span>
                                              (string-lessp (upcase (funcall get-attr s1 'comm))
                                                            (upcase (funcall get-attr s2 'comm)))))
                                           ("<span class="quote">by age</span>" .
                                            (lambda (s1 s2) <span class="linecomment">; FREE here: GET-ATTR.</span>
                                              (&gt; (float-time (funcall get-attr s1 'start))
                                                 (float-time (funcall get-attr s2 'start)))))))
     (icicle-sort-comparer               (cdar icicle-sort-orders-alist)))
    (progn (unless (require 'proced nil t) (error "<span class="quote">This command requires library `proced.el'</span>")) <span class="linecomment">; First code</span>
           (put-text-property 0 1 'icicle-fancy-candidates t prompt)
           (icicle-highlight-lighter)))

  (defun icicle-describe-process (pid)
    "<span class="quote">Describe the system process that has process id PID.</span>"
    (interactive "<span class="quote">nPID: </span>")
    (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
      (let* ((attributes  (process-attributes pid))
             (comm        (cdr-safe (assoc 'comm attributes)))
             (args        (cdr-safe (assoc 'args attributes)))
             (start       (cdr-safe (assoc 'start attributes)))
             (user        (cdr-safe (assoc 'user attributes)))
             (state       (cdr-safe (assoc 'state attributes))))
        (princ (format "<span class="quote">PID:\t\t%s\n</span>" pid))
        (when comm  (princ (format "<span class="quote">Command name:\t%s\n</span>" comm)))
        (when args  (princ (format "<span class="quote">Command line:\t%s\n</span>" args)))
        (when user  (princ (format "<span class="quote">User:\t\t%s\n</span>"         user)))
        (when state  (princ (format "<span class="quote">State:\t%s\n</span>"       state)))
        (when start (princ (format-time-string "<span class="quote">Started:\t%a %b %e %T %Y (%z)\n</span>" start)))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-delete-file "icicles")</span>
(icicle-define-file-command icicle-delete-file <span class="linecomment">; Command name</span>
  "<span class="quote">Delete a file or directory.
During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)</span>" <span class="linecomment">; Doc string</span>
  (lambda (file)                        <span class="linecomment">; Function to perform the action</span>
    (icicle-delete-file-or-directory file)
    (icicle-remove-candidate-display-others 'ALL))
  "<span class="quote">Delete file or directory: </span>" default-directory nil t nil nil <span class="linecomment">; `read-file-name' args</span>
  (icicle-file-bindings)                <span class="linecomment">; Bindings</span>
  (icicle-bind-file-candidate-keys)     <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-file-candidate-keys))  <span class="linecomment">; Last code</span>

(defun icicle-delete-file-or-directory (file)
  "<span class="quote">Delete file or (empty) directory FILE.</span>"
  (icicle-condition-case-no-debug i-delete-file
      (if (eq t (car (file-attributes file)))
          (delete-directory file)
        (delete-file file))
    (error (message "<span class="quote">%s</span>" (error-message-string i-delete-file))
           (error "<span class="quote">%s</span>" (error-message-string i-delete-file)))))

<span class="linecomment">;;;###autoload (autoload 'icicle-dired "icicles")</span>
(icicle-define-file-command icicle-dired
  "<span class="quote">Multi-command version of `dired'.
During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
   \\[icicle-delete-candidate-object]     - delete candidate file or (empty) dir
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)</span>" <span class="linecomment">; Doc string</span>
  (lambda (dir) (dired dir switches))   <span class="linecomment">; FREE here: SWITCHES.</span>
  "<span class="quote">Dired (directory): </span>" nil default-directory nil nil nil <span class="linecomment">; `read-file-name' args</span>
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((switches               (and current-prefix-arg
                                 (read-string "<span class="quote">Dired listing switches: </span>" dired-listing-switches)))
    (icicle-file-sort       (or icicle-file-sort  'icicle-dirs-first-p))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (icicle-bind-file-candidate-keys)     <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-file-candidate-keys))  <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-dired-other-window "icicles")</span>
(icicle-define-file-command icicle-dired-other-window
  "<span class="quote">Same as `icicle-dired', except uses another window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (dir) (dired-other-window dir switches)) <span class="linecomment">; FREE here: SWITCHES.</span>
  "<span class="quote">Dired in other window (directory): </span>" nil default-directory nil nil nil <span class="linecomment">; `read-file-name' args</span>
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((switches               (and current-prefix-arg
                                 (read-string "<span class="quote">Dired listing switches: </span>" dired-listing-switches)))
    (icicle-file-sort       (or icicle-file-sort  'icicle-dirs-first-p))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (icicle-bind-file-candidate-keys)     <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-file-candidate-keys))  <span class="linecomment">; Last code</span>


(put 'icicle-file 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-file "icicles")</span>
(defun icicle-file (arg)                <span class="linecomment">; Bound to `C-x C-f' in Icicle mode.</span>
  "<span class="quote">Visit a file or directory.
With no prefix argument, use relative file names
 (`icicle-find-file').
With a prefix argument, use absolute file names
 (`icicle-find-file-absolute').
With a negative prefix argument, you can choose also by date:
 Completion candidates include the last modification date.

Note that when you use a prefix arg, completion matches candidates as
ordinary strings.  It knows nothing of file names per se.  In
particular, you cannot use remote file-name syntax if you use a prefix
argument.

During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
   \\[icicle-delete-candidate-object]     - delete candidate file or (empty) dir
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)

By default, Icicle mode remaps all key sequences that are normally bound
to `find-file' to `icicle-file'.  If you do not want this remapping,
then customize option `icicle-top-level-key-bindings'.</span>"
  (interactive "<span class="quote">P</span>")
  (if arg
      (if (wholenump (prefix-numeric-value arg))
          (let ((current-prefix-arg  nil)) (icicle-find-file-absolute))
        (icicle-find-file-absolute))
    (icicle-find-file)))


(put 'icicle-file-other-window 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-file-other-window "icicles")</span>
(defun icicle-file-other-window (arg)   <span class="linecomment">; Bound to `C-x 4 f' in Icicle mode.</span>
  "<span class="quote">Same as `icicle-file', except uses another window.</span>"
  (interactive "<span class="quote">P</span>")
  (if arg
      (if (wholenump (prefix-numeric-value arg))
          (let ((current-prefix-arg  nil)) (icicle-find-file-absolute-other-window))
        (icicle-find-file-absolute-other-window))
    (icicle-find-file-other-window)))


(put 'icicle-find-file-absolute 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-absolute "icicles")</span>
(icicle-define-command icicle-find-file-absolute <span class="linecomment">; Bound to `C-u C-x f' in Icicle mode.</span>
  "<span class="quote">Visit a file or directory, given its absolute name.
Unlike `icicle-find-file', the completion candidates are absolute, not
relative, file names.

By default, the completion candidates are files in the current
directory, but you can substitute other candidates by retrieving a
saved candidate set.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

Also, you cannot move up and down the file hierarchy the same way you
can for ordinary (non-absolute) file-name completion.  To change to a
different directory, with its files as candidates, use \\&lt;minibuffer-local-completion-map&gt;`C-c C-d' from
the minibuffer - it prompts you for the new directory.

Remember that you can use `C-x .' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

With a prefix argument, you can choose also by date: Completion
candidates include the last modification date.

During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c C-d      - change the `default-directory' (a la `cd')
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
   \\[icicle-delete-candidate-object]     - delete candidate file or (empty) dir
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (and (numberp (nth 7 (file-attributes file)))
                      (&gt; (nth 7 (file-attributes file)) 5000)))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file (icicle-transform-multi-completion f) 'WILDCARDS)) <span class="linecomment">; Action function</span>
  prompt icicle-abs-file-candidates nil <span class="linecomment">; `completing-read' args</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs 23.</span>
  nil 'file-name-history default-directory nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             "<span class="quote">File or dir (absolute): </span>")
    (icicle-full-cand-fn                `(lambda (file)
                                          (setq file  (if (file-directory-p file)
                                                          (file-name-as-directory file)
                                                        file))
                                          ,(if current-prefix-arg
                                               '(icicle-make-file+date-candidate file)
                                               '(list file))))
    (icicle-abs-file-candidates         (mapcar icicle-full-cand-fn
                                                (directory-files default-directory 'FULL nil 'NOSORT)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))
    (icicle-special-candidate-regexp    (or icicle-special-candidate-regexp  "<span class="quote">.+/$</span>"))
    (icicle-candidate-properties-alist  (and current-prefix-arg  '((1 (face icicle-candidate-part)))))
    (icicle-multi-completing-p          current-prefix-arg)
    (icicle-list-use-nth-parts          (and current-prefix-arg  '(1)))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (icicle-highlight-lighter)
    (message "<span class="quote">Gathering files...</span>")
    (icicle-bind-file-candidate-keys)
    (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>" 'icicle-cd-for-abs-files)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>" 'icicle-cd-for-abs-files))
  nil                                   <span class="linecomment">; Undo code</span>
  (progn (icicle-unbind-file-candidate-keys) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>" nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>" nil)))


(put 'icicle-find-file-absolute-other-window 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-absolute-other-window "icicles")</span>
(icicle-define-command icicle-find-file-absolute-other-window <span class="linecomment">; Bound to `C-u C-x 4 f'</span>
  "<span class="quote">Same as `icicle-find-file-absolute' except uses another window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file-other-window (icicle-transform-multi-completion f) 'WILDCARDS)) <span class="linecomment">; Action</span>
  prompt icicle-abs-file-candidates nil <span class="linecomment">; `completing-read' args</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs 23.</span>
  nil 'file-name-history default-directory nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             "<span class="quote">File or dir (absolute): </span>")
    (icicle-full-cand-fn                `(lambda (file)
                                          (setq file  (if (file-directory-p file)
                                                          (file-name-as-directory file)
                                                        file))
                                          ,(if current-prefix-arg
                                               '(icicle-make-file+date-candidate file)
                                               '(list file))))
    (icicle-abs-file-candidates         (mapcar icicle-full-cand-fn
                                                (directory-files default-directory 'FULL nil 'NOSORT)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))
    (icicle-special-candidate-regexp    (or icicle-special-candidate-regexp  "<span class="quote">.+/$</span>"))
    (icicle-candidate-properties-alist  (and current-prefix-arg  '((1 (face icicle-candidate-part)))))
    (icicle-multi-completing-p          current-prefix-arg)
    (icicle-list-use-nth-parts          (and current-prefix-arg  '(1)))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (icicle-highlight-lighter)
    (message "<span class="quote">Gathering files...</span>")
    (icicle-bind-file-candidate-keys)
    (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>" 'icicle-cd-for-abs-files)
    (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>" 'icicle-cd-for-abs-files))
  nil                                   <span class="linecomment">; Undo code</span>
  (progn (icicle-unbind-file-candidate-keys) <span class="linecomment">; Last code</span>
         (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>" nil)
         (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>" nil)))

<span class="linecomment">;; This is a minibuffer command.  It is in this file because it is used only here.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-cd-for-abs-files "icicles")</span>
(defun icicle-cd-for-abs-files (dir)    <span class="linecomment">; Bound to `C-c C-d' in minibuffer for abs file completion.</span>
  "<span class="quote">Change `default-directory' during `icicle-find-file-absolute'.</span>"
  (interactive
   <span class="linecomment">;; Should not need to bind `minibuffer-completion-predicate'.  Emacs 23.2 bug, per Stefan.</span>
   (let ((enable-recursive-minibuffers     t)
         (minibuffer-completion-predicate  minibuffer-completion-predicate))
     (list (funcall (if (fboundp 'read-directory-name)
                        #'read-directory-name
                      #'read-file-name)
                    "<span class="quote">Change default directory: </span>" default-directory (icicle-file-name-directory-w-default
                                                                    (icicle-input-from-minibuffer))
                    (and (member cd-path '(nil ("<span class="quote">./</span>")))  (null (getenv "<span class="quote">CDPATH</span>")))))))
  (cd dir)
  (let ((icicle-abs-file-candidates
         (mapcar (lambda (file)
                   (setq file  (if (file-directory-p file) (file-name-as-directory file) file))
                   (if icicle-multi-completing-p (icicle-make-file+date-candidate file) (list file)))
                 (directory-files default-directory 'full nil 'nosort))))
    (setq minibuffer-completion-table
          (car (icicle-mctize-all icicle-abs-file-candidates minibuffer-completion-predicate)))))


(put 'icicle-find-file 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file "icicles")</span>
(icicle-define-file-command icicle-find-file
  "<span class="quote">Visit a file or directory.
\(Option `find-file-run-dired' determines whether you can actually
visit a directory candidate that you choose.)

If you use a prefix argument when you act on a completion candidate,
then you visit the file or dir in read-only mode.  This includes when
you act on all candidates using \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-all-candidates-action]': precede the `\\[icicle-all-candidates-action]' with a prefix
arg.

If you use a prefix arg for the command itself, this reverses the
effect of using a prefix arg on individual candidates.  That is, with
a prefix arg for the command, files are visited in read-only mode by
default and a prefix arg for an individual file visits it without
read-only mode.

During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
   \\[icicle-delete-candidate-object]     - delete candidate file or (empty) dir
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra absolute file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (and (numberp (nth 7 (file-attributes file)))
                      (&gt; (nth 7 (file-attributes file)) 5000)))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (file)                        <span class="linecomment">; FREE here: CURRENT-PREFIX-ARG, INIT-PREF-ARG, THIS-COMMAND.</span>
    (let* ((r-o  (if (memq this-command '(icicle-candidate-action icicle-all-candidates-action))
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only 'find-file)))
      (funcall fn file 'WILDCARDS)))
  (concat "<span class="quote">File or directory</span>" (and init-pref-arg  "<span class="quote"> (read-only)</span>") "<span class="quote">: </span>") <span class="linecomment">; `read-file-name' args</span>
  nil (if (and (eq major-mode 'dired-mode)  (fboundp 'dired-get-file-for-visit)) <span class="linecomment">; Emacs 22+.</span>
          (condition-case nil           <span class="linecomment">; E.g. error because not on file line (ignore)</span>
              (abbreviate-file-name (dired-get-file-for-visit))
            (error nil))
        default-directory)
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs 23.</span>
  nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg)
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (icicle-bind-file-candidate-keys)     <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-file-candidate-keys))  <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-other-window "icicles")</span>
(icicle-define-file-command icicle-find-file-other-window
  "<span class="quote">Same as `icicle-find-file', except uses another window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (file)                        <span class="linecomment">; FREE here: CURRENT-PREFIX-ARG, INIT-PREF-ARG, THIS-COMMAND.</span>
    (let* ((r-o  (if (memq this-command '(icicle-candidate-action icicle-all-candidates-action))
                     (or (and init-pref-arg        (not current-prefix-arg))
                         (and (not init-pref-arg)  current-prefix-arg))
                   init-pref-arg))
           (fn   (if r-o 'find-file-read-only-other-window 'find-file-other-window)))
      (funcall fn file 'WILDCARDS)))
  (concat "<span class="quote">File or directory</span>" (and init-pref-arg  "<span class="quote"> (read-only)</span>") "<span class="quote">: </span>") <span class="linecomment">; `read-file-name' args</span>
  nil (if (and (eq major-mode 'dired-mode)  (fboundp 'dired-get-file-for-visit)) <span class="linecomment">; Emacs 22+.</span>
          (condition-case nil           <span class="linecomment">; E.g. error because not on file line (ignore)</span>
              (abbreviate-file-name (dired-get-file-for-visit))
            (error nil))
        default-directory)
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs 23.</span>
  nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((init-pref-arg  current-prefix-arg)
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (icicle-bind-file-candidate-keys)     <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-file-candidate-keys))  <span class="linecomment">; Last code</span>


(put 'icicle-find-file-read-only 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-read-only "icicles")</span>
(defun icicle-find-file-read-only ()    <span class="linecomment">; Bound to `C-x C-r' in Icicle mode.</span>
  "<span class="quote">Visit a file or directory in read-only mode.
If you use a prefix argument when you act on a candidate file name,
then visit the file without read-only mode.

If you use a prefix arg for the command itself, this reverses the
effect of using a prefix arg on individual candidates.  That is, with
a prefix arg for the command, files are not visited in read-only mode
by default and a prefix arg for an individual file visits it in
read-only mode.

During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;:

 *You can use `C-x a +' or `C-x a -' to add or remove tags from the
   current-candidate file.  You are prompted for the tags.
 *You can use `C-x m' to access file bookmarks (not just autofiles).
  You can use `C-c +' to create a new directory.
  You can use `\\[icicle-all-candidates-list-alt-action]' to open Dired on currently matching file names.
  You can use `\\[icicle-delete-candidate-object]' to delete a candidate file or (empty) dir.</span>"
  (interactive)
  (let ((current-prefix-arg  (not current-prefix-arg)))
    (icicle-find-file)))

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-read-only-other-window "icicles")</span>
(defun icicle-find-file-read-only-other-window () <span class="linecomment">; Bound to `C-x 4 r' in Icicle mode.</span>
  "<span class="quote">Same as `icicle-find-file-read-only' except uses another window.</span>"
  (interactive)
  (let ((current-prefix-arg  (not current-prefix-arg)))
    (icicle-find-file-other-window)))


<span class="linecomment">;;;###autoload (when (&gt; emacs-major-version 22) (autoload 'icicle-find-file-of-content "icicles"))</span>
<span class="linecomment">;;;###autoload (when (&gt; emacs-major-version 22) (autoload 'icicle-find-file-of-content-other-window "icicles"))</span>
(when (&gt; emacs-major-version 22)

  (put 'icicle-find-file-of-content 'icicle-Completions-window-max-height 200)

  (icicle-define-file-command icicle-find-file-of-content <span class="linecomment">; Not bound by default.</span>
    "<span class="quote">Visit a file or dir whose name and/or content matches.
Candidate files and directories for completion are examined, and those
whose names and/or contents match your multi-completion input are
available to visit.

\(Option `find-file-run-dired' determines whether you can actually
visit a directory candidate that you choose.)

If you use a prefix argument when you act on a completion candidate,
then you visit the file or dir in read-only mode.  This includes when
you act on all candidates using \\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-all-candidates-action]': precede the `\\[icicle-all-candidates-action]' with a prefix
arg.  (See below for the use of a prefix arg for the command itself.)

Completion candidates are two-part multi-completions, with the second
part optional.  If both parts are present they are separated by
`icicle-list-join-string' (\"^G^J\", by default).

The first part is matched as a regexp against a file or directory
name.  The second part is matched as a regexp against the file or
directory content.  Candidates that do not match are filtered out.

Your minibuffer input can match a name or content, or both.  Use
`C-M-j' (equivalent here to `C-q C-g C-j') to input the default
separator.

For example:

 To match `foo' against file and dir names, use input `foo'.
 To match `bar' against file and dir contents, use input `C-M-j bar'.
 To match both names and content, use input `foo C-M-j bar'.

Only the matching file and directory names are shown in buffer
`*Completions*', and only the chosen name is returned.  The actual
content matches are unimportant anyway: content matching is used only
to filter the candidates.

If your input does not include a content-matching part then this
command acts similar to `icicle-find-file' (but with a different use
of the prefix argument).

If your input includes a content-matching part then all files and
directories matching the name part of your input (or all, if no name
part) are visited.  This creates buffers visiting each matching
candidate.

For a directory, a Dired buffer is used - that is the content that is
searched.  (Actually, this is determined by option
`find-directory-functions'.)

As you would expect, content matching can be costly in time, even
though it can be quite helpful.  Use name matching to narrow the set
of files that must be visited to search their contents.

When this command is finished, any unused buffers that were created
for content matching are killed, if option
`icicle-kill-visited-buffers-flag' is non-nil.  But a prefix argument
flips the behavior specified by that option.

During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
   \\[icicle-delete-candidate-object]     - delete candidate file or (empty) dir
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)</span>" <span class="linecomment">; Doc string</span>
    (lambda (file)                      <span class="linecomment">; Action function</span>
      <span class="linecomment">;; Free vars here: CURRENT-PREFIX-ARG, INIT-PREF-ARG, THIS-COMMAND, NEW-BUFS--TO-KEEP.</span>
      (let* ((r-o  (and (memq this-command '(icicle-candidate-action icicle-mouse-candidate-action
                                             icicle-all-candidates-action))
                        current-prefix-arg))
             (fn   (if r-o 'find-file-read-only 'find-file)))
        (setq file  (icicle-transform-multi-completion file))
        (funcall fn file 'WILDCARDS)
        (when (and (file-readable-p file)  (buffer-file-name)) (revert-buffer nil t)) <span class="linecomment">; Else in fund. mode.</span>
        <span class="linecomment">;; Add the visited buffer to those we will keep (not kill).</span>
        <span class="linecomment">;; If FILE uses wildcards then there will be multiple such buffers.</span>
        <span class="linecomment">;; For a directory, get the Dired buffer instead of using `get-file-buffer'.</span>
        (let ((fil2  (if (string= "<span class="quote"></span>" (file-name-nondirectory file))  (directory-file-name file)  file)))
          (dolist (fil  (file-expand-wildcards fil2))
            (when (setq fil  (if (file-directory-p fil)
                                 (get-buffer (file-name-nondirectory fil))
                               (get-file-buffer fil)))
              (push fil new-bufs--to-keep))))))
    prompt nil (if (eq major-mode 'dired-mode) <span class="linecomment">; `read-file-name' args</span>
                   (condition-case nil  <span class="linecomment">; E.g. error because not on file line (ignore)</span>
                       (abbreviate-file-name (dired-get-file-for-visit))
                     (error nil))
                 default-directory)
    (confirm-nonexistent-file-or-buffer) nil nil
    (icicle-file-bindings               <span class="linecomment">; Bindings</span>
     ((init-pref-arg                          current-prefix-arg)
      (prompt                             "<span class="quote">File or directory: </span>")
      (icicle-compute-narrowing-regexp-p      t) <span class="linecomment">; For progressive completion.</span>
      (icicle-apropos-complete-match-fn       'icicle-file-of-content-apropos-complete-match)
      (icicle-last-apropos-complete-match-fn  'icicle-file-of-content-apropos-complete-match)
      (icicle-show-multi-completion-flag      t) <span class="linecomment">; Override user setting.</span>
      (icicle-multi-completing-p              t)
      (icicle-list-use-nth-parts              '(1))
      (icicle-transform-before-sort-p         t)
      (existing-bufs                          (buffer-list))
      (new-bufs--to-kill                      ())
      (new-bufs--to-keep                      ())
      (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
       (lambda (files) (let ((enable-recursive-minibuffers  t))
                         (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
    (progn (icicle-bind-file-candidate-keys) <span class="linecomment">; First code</span>
           (put-text-property 0 1 'icicle-fancy-candidates t prompt)
           (icicle-highlight-lighter))
    nil                                 <span class="linecomment">; Undo code</span>
    (progn (icicle-unbind-file-candidate-keys) <span class="linecomment">; Last code</span>
           (when (or (and init-pref-arg        (not icicle-kill-visited-buffers-flag))
                     (and (not init-pref-arg)  icicle-kill-visited-buffers-flag))
             (dolist (buf  new-bufs--to-kill)
               (unless (memq buf new-bufs--to-keep)
                 (with-current-buffer buf
                   (restore-buffer-modified-p nil) <span class="linecomment">; Just visiting can sometimes modify the buffer</span>
                   (kill-buffer buf)))))))


  (put 'icicle-find-file-of-content-other-window 'icicle-Completions-window-max-height 200)

  (icicle-define-file-command icicle-find-file-of-content-other-window <span class="linecomment">; Not bound by default.</span>
    "<span class="quote">Visit a file or dir whose name and/or content matches, in another window.
Same as `icicle-find-file-of-content' except it uses a different window.</span>" <span class="linecomment">; Doc string</span>
    (lambda (file)                      <span class="linecomment">; Action function</span>
      <span class="linecomment">;; Free vars here: CURRENT-PREFIX-ARG, INIT-PREF-ARG, THIS-COMMAND, NEW-BUFS--TO-KEEP.</span>
      (let* ((r-o  (and (memq this-command '(icicle-candidate-action icicle-mouse-candidate-action
                                             icicle-all-candidates-action))
                        current-prefix-arg))
             (fn   (if r-o 'find-file-read-only-other-window 'find-file-other-window)))
        (setq file  (icicle-transform-multi-completion file))
        (funcall fn file 'WILDCARDS)
        (when (and (file-readable-p file)  (buffer-file-name)) (revert-buffer nil t)) <span class="linecomment">; Else in fund. mode.</span>

        <span class="linecomment">;; Add the visited buffer to those we will keep (not kill).</span>
        <span class="linecomment">;; If FILE uses wildcards then there will be multiple such buffers.</span>
        <span class="linecomment">;; For a directory, get the Dired buffer instead of using `get-file-buffer'.</span>
        (let ((fil2  (if (string= "<span class="quote"></span>" (file-name-nondirectory file))  (directory-file-name file)  file)))
          (dolist (fil  (file-expand-wildcards fil2))
            (when (setq fil  (if (file-directory-p fil)
                                 (get-buffer (file-name-nondirectory fil))
                               (get-file-buffer fil)))
              (push fil new-bufs--to-keep))))))
    prompt nil (if (eq major-mode 'dired-mode) <span class="linecomment">; `read-file-name' args</span>
                   (condition-case nil  <span class="linecomment">; E.g. error because not on file line (ignore)</span>
                       (abbreviate-file-name (dired-get-file-for-visit))
                     (error nil))
                 default-directory)
    (confirm-nonexistent-file-or-buffer) nil nil
    (icicle-file-bindings               <span class="linecomment">; Bindings</span>
     ((init-pref-arg                          current-prefix-arg)
      (prompt                                 "<span class="quote">File or directory: </span>")
      (icicle-compute-narrowing-regexp-p      t) <span class="linecomment">; For progressive completion.</span>
      (icicle-apropos-complete-match-fn       'icicle-file-of-content-apropos-complete-match)
      (icicle-last-apropos-complete-match-fn  'icicle-file-of-content-apropos-complete-match)
      (icicle-show-multi-completion-flag      t) <span class="linecomment">; Override user setting.</span>
      (icicle-multi-completing-p              t)
      (icicle-list-use-nth-parts              '(1))
      (icicle-transform-before-sort-p         t)
      (existing-bufs                          (buffer-list))
      (new-bufs--to-kill                      ())
      (new-bufs--to-keep                      ())
      (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; `M-|'</span>
       (lambda (files) (let ((enable-recursive-minibuffers  t))
                         (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
    (progn (icicle-bind-file-candidate-keys)
           (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
           (icicle-highlight-lighter))
    nil                                 <span class="linecomment">; Undo code</span>
    (progn (icicle-unbind-file-candidate-keys) <span class="linecomment">; Last code</span>
           (when (or (and init-pref-arg        (not icicle-kill-visited-buffers-flag))
                     (and (not init-pref-arg)  icicle-kill-visited-buffers-flag))
             (dolist (buf  new-bufs--to-kill)
               (unless (memq buf new-bufs--to-keep)
                 (with-current-buffer buf
                   (restore-buffer-modified-p nil) <span class="linecomment">; Just visiting can sometimes modify the buffer</span>
                   (kill-buffer buf)))))))

<span class="linecomment">;;;   (defun icicle-find-file-of-content-multi-complete (strg predicate completion-mode)</span>
<span class="linecomment">;;;     "Completion function for `icicle-find-file-of-content'.</span>
<span class="linecomment">;;; Used as the value of `minibuffer-completion-table'."</span>
<span class="linecomment">;;;     (lexical-let* ((file-pat      (let ((icicle-list-use-nth-parts  '(1)))</span>
<span class="linecomment">;;;                                     (icicle-transform-multi-completion strg)))</span>
<span class="linecomment">;;;                    (content-pat   (let ((icicle-list-use-nth-parts  '(2)))</span>
<span class="linecomment">;;;                                     (icicle-transform-multi-completion strg)))</span>
<span class="linecomment">;;;                    (content-pred  (if (equal "" content-pat)</span>
<span class="linecomment">;;;                                       predicate</span>
<span class="linecomment">;;;                                     (lambda (filname)</span>
<span class="linecomment">;;;                                       ;; Avoid the error raised by calling `find-file-noselect'</span>
<span class="linecomment">;;;                                       ;; on a directory when `find-file-run-dired' is nil.</span>
<span class="linecomment">;;;                                       (and (funcall `,predicate filname)</span>
<span class="linecomment">;;;                                            (or find-file-run-dired  (not (file-directory-p filname)))</span>
<span class="linecomment">;;;                                            (not (run-hook-with-args-until-success</span>
<span class="linecomment">;;;                                                  'icicle-find-file-of-content-skip-hook filname))</span>
<span class="linecomment">;;;                                            (let* ((buf    (find-file-noselect filname))</span>
<span class="linecomment">;;;                                                   (found  (with-current-buffer buf</span>
<span class="linecomment">;;;                                                             (message "Matching file contents...")</span>
<span class="linecomment">;;;                                                             (save-excursion</span>
<span class="linecomment">;;;                                                               (goto-char (point-min))</span>
<span class="linecomment">;;;                                                               (re-search-forward content-pat nil t)))))</span>
<span class="linecomment">;;;                                              ;; Free vars here: EXISTING-BUFFERS, NEW-BUFS--TO-KILL</span>
<span class="linecomment">;;;                                              (when (and (boundp 'existing-bufs)</span>
<span class="linecomment">;;;                                                         (boundp 'new-bufs--to-kill)</span>
<span class="linecomment">;;;                                                         (not (memq buf existing-bufs)))</span>
<span class="linecomment">;;;                                                (add-to-list 'new-bufs--to-kill buf))</span>
<span class="linecomment">;;;                                              found))))))</span>
<span class="linecomment">;;;       (funcall (completion-table-in-turn #'icicle-completion--embedded-envvar-table</span>
<span class="linecomment">;;;                                          #'completion-file-name-table)</span>
<span class="linecomment">;;;                file-pat content-pred completion-mode)))</span>

  (defun icicle-file-of-content-apropos-complete-match (input file-name)
    "<span class="quote">Match function for progressive completion with `icicle-find-file-of-content'.
Return non-nil if the current multi-completion INPUT matches FILE-NAME.</span>"
    (lexical-let* ((name-pat     (let ((icicle-list-use-nth-parts  '(1)))
                                   (icicle-transform-multi-completion input)))
                   (content-pat  (let ((icicle-list-use-nth-parts  '(2)))
                                   (icicle-transform-multi-completion input))))
      <span class="linecomment">;; $$$$$$$$ Should we do this?  `find-file-noselect' does it.</span>
      <span class="linecomment">;; (setq file-name  (abbreviate-file-name (expand-file-name file-name)))</span>
      (and (icicle-string-match-p name-pat file-name)
           <span class="linecomment">;; `icicle-narrow-regexp' is FREE here.  It is bound in `icicle-narrow-candidates'.</span>
           <span class="linecomment">;; Do this to ensure we visit only the `icicle-completion-candidates' already determined so far.</span>
           (or (not icicle-narrow-regexp)  (icicle-string-match-p icicle-narrow-regexp file-name))
           (or find-file-run-dired  (not (file-directory-p file-name)))
           (or (equal "<span class="quote"></span>" content-pat)
               (and (not (run-hook-with-args-until-success 'icicle-find-file-of-content-skip-hook file-name))
                    (let* ((dir-p   (file-directory-p file-name))
                           (exists  nil)
                           (buf     (if dir-p
                                        (find-file-noselect file-name)
                                      <span class="linecomment">;; Avoid letting `create-file-buffer' create multiple bufs for same file,</span>
                                      <span class="linecomment">;; e.g., when using progressive completion: foo.el, foo.el&lt;2&gt;,...</span>
                                      (or (setq exists  (find-buffer-visiting file-name))
                                          (create-file-buffer file-name))))
                           (found   (with-current-buffer buf
                                      (message "<span class="quote">Matching file contents...</span>")
                                      (unless (or dir-p  exists) <span class="linecomment">; EXISTS prevents inserting it more than once.</span>
                                        <span class="linecomment">;; `mm-insert-file-contents' works too, but apparently is not needed.</span>
                                        <span class="linecomment">;; $$$$$ (require 'mm-util) (mm-insert-file-contents file-name 'VISIT))</span>
                                        (insert-file-contents file-name 'VISIT))
                                      (save-excursion (goto-char (point-min))
                                                      (re-search-forward content-pat nil t)))))
                      <span class="linecomment">;; Free vars here: EXISTING-BUFFERS, NEW-BUFS--TO-KILL.</span>
                      (when (and (boundp 'existing-bufs)  (boundp 'new-bufs--to-kill)
                                 (not (memq buf existing-bufs)))
                        (add-to-list 'new-bufs--to-kill buf))
                      found))))))
  )


(put 'icicle-recent-file 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-recent-file "icicles")</span>
(icicle-define-command icicle-recent-file <span class="linecomment">; Command name</span>
  "<span class="quote">Open a recently used file.
With a prefix argument, you can choose also by date: Completion
candidates include the last modification date.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

Remember that you can use \\&lt;minibuffer-local-completion-map&gt;`C-x .' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
   \\[icicle-delete-candidate-object]     - delete candidate file or (empty) dir
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)

You can use any of the alternative-action keys, such as `\\[icicle-candidate-alt-action]', to
remove a candidate file from the recent files list, `recentf-list'.
\(The file itself is not deleted.)

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra absolute file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (and (numberp (nth 7 (file-attributes file)))
                      (&gt; (nth 7 (file-attributes file)) 5000)))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file (icicle-transform-multi-completion f) 'WILDCARDS)) <span class="linecomment">; Action function</span>
  prompt icicle-abs-file-candidates nil <span class="linecomment">; `completing-read' args</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs 23.</span>
  nil 'file-name-history (car recentf-list) nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                                 "<span class="quote">Recent file (absolute): </span>")
    (icicle-full-cand-fn                `(lambda (file)
                                          (setq file  (if (file-directory-p file)
                                                          (file-name-as-directory file)
                                                        file))
                                          ,(if current-prefix-arg
                                               '(icicle-make-file+date-candidate file)
                                               '(list file))))
    (icicle-transform-before-sort-p         t)
    (icicle-sort-comparer                   'icicle-last-accessed-first-p)
    (icicle-abs-file-candidates
     (progn (unless (boundp 'recentf-list) (require 'recentf))
            (when (fboundp 'recentf-mode) (recentf-mode 99))
            (unless (consp recentf-list)
              (error "<span class="quote">No recently accessed files</span>"))
            (mapcar (lambda (file)      <span class="linecomment">; FREE here: CURRENT-PREFIX-ARG.</span>
                      (if current-prefix-arg (icicle-make-file+date-candidate file) (list file)))
                    recentf-list)))
    (icicle-candidate-alt-action-fn         'icicle-remove-from-recentf-candidate-action)
    (icicle-use-candidates-only-once-alt-p  t)
    (icicle-candidate-properties-alist      (and current-prefix-arg  '((1 (face icicle-candidate-part)))))
    (icicle-multi-completing-p              current-prefix-arg)
    (icicle-list-use-nth-parts              (and current-prefix-arg  '(1)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>")
                                                 (mapcar #'icicle-transform-multi-completion files))))))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (icicle-highlight-lighter)
    (message "<span class="quote">Gathering files...</span>")
    (icicle-bind-file-candidate-keys))
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-file-candidate-keys))  <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-recent-file-other-window "icicles")</span>
(icicle-define-command icicle-recent-file-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Same as `icicle-recent-file' except uses another window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (f) (find-file-other-window (icicle-transform-multi-completion f) 'WILDCARDS)) <span class="linecomment">; Action</span>
  prompt icicle-abs-file-candidates nil <span class="linecomment">; `completing-read' args</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs 23.</span>
  nil 'file-name-history (car recentf-list) nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                                 "<span class="quote">Recent file (absolute): </span>")
    (icicle-full-cand-fn                    `(lambda (file)
                                              (setq file  (if (file-directory-p file)
                                                              (file-name-as-directory file)
                                                            file))
                                              ,(if current-prefix-arg
                                                   '(icicle-make-file+date-candidate file)
                                                   '(list file))))
    (icicle-transform-before-sort-p         t)
    (icicle-sort-comparer                   'icicle-last-accessed-first-p)
    (icicle-abs-file-candidates
     (progn (unless (boundp 'recentf-list) (require 'recentf))
            (when (fboundp 'recentf-mode) (recentf-mode 99))
            (unless (consp recentf-list)
              (error "<span class="quote">No recently accessed files</span>"))
            (mapcar (lambda (file)      <span class="linecomment">; FREE here: CURRENT-PREFIX-ARG.</span>
                      (if current-prefix-arg (icicle-make-file+date-candidate file) (list file)))
                    recentf-list)))
    (icicle-candidate-alt-action-fn         'icicle-remove-from-recentf-candidate-action)
    (icicle-use-candidates-only-once-alt-p  t)
    (icicle-candidate-properties-alist      (and current-prefix-arg  '((1 (face icicle-candidate-part)))))
    (icicle-multi-completing-p              current-prefix-arg)
    (icicle-list-use-nth-parts              (and current-prefix-arg  '(1)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>")
                                                 (mapcar #'icicle-transform-multi-completion files))))))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (icicle-highlight-lighter)
    (message "<span class="quote">Gathering files...</span>")
    (icicle-bind-file-candidate-keys))
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-file-candidate-keys))  <span class="linecomment">; Last code</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-remove-file-from-recentf-list "icicles")</span>
(icicle-define-command icicle-remove-file-from-recentf-list
  "<span class="quote">Remove file from `recentf-list' - the list of recently used files.</span>"
  icicle-remove-from-recentf-candidate-action
  "<span class="quote">Remove from recent files list, `recentf-list': </span>"
  (mapcar #'list (progn (unless (boundp 'recentf-list) (require 'recentf))
                        (when (fboundp 'recentf-mode) (recentf-mode 99))
                        (unless (consp recentf-list) (error "<span class="quote">No recently accessed files</span>"))
                        recentf-list))
  nil (and (fboundp 'confirm-nonexistent-file-or-buffer) <span class="linecomment">; Emacs 23.</span>
           (confirm-nonexistent-file-or-buffer))
  nil 'file-name-history (car recentf-list) nil
  ((icicle-use-candidates-only-once-flag  t)))

(defun icicle-remove-from-recentf-candidate-action (file)
  "<span class="quote">Action function for command `icicle-remove-file-from-recentf-list'.</span>"
  (setq recentf-list  (delete file recentf-list))
  (message "<span class="quote">`%s' removed from `recentf-list'</span>" (icicle-propertize file 'face 'icicle-msg-emphasis)))


(defvar icicle-locate-file-action-fn nil
  "<span class="quote">Action function used in `icicle-locate-file-1'.</span>")

(defvar icicle-locate-file-no-symlinks-p nil
  "<span class="quote">Flag bound in `icicle-locate-file* for use by `icicle-files-within'.</span>")

(defvar icicle-locate-file-use-locate-p nil
  "<span class="quote">Flag bound to non-nil in `icicle-locate(-other-window)'.
Non-nil means `icicle-locate-file-1' uses external command `locate'.</span>")


(put 'icicle-locate-file 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-locate-file "icicles")</span>
(defun icicle-locate-file ()
  "<span class="quote">Visit a file within one or more directories or their subdirectories.
A prefix argument determines the behavior, as follows:

* None: The default (i.e., current) directory is used.

* Plain (`C-u'): You are prompted for the directories, using
  multi-command `icicle-directory-list'.

* Non-negative (&gt;= 0): You are prompted for the directory.

* Non-positive (&lt;= 0): You can choose files also by date: A completion
  candidate includes the last modification date of the file.

* Double plain (`C-u C-u'): You are prompted for the directories and
  candidates include last-modification dates.

The absolute names of all files within a directory and all of its
subdirectories are targets for completion.  Regexp input is matched
against all parts of the absolute name, not just the file-name part.

Remember that you can use `C-x .' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

You can use this command to find all files within your file system
that match a regexp, but be aware that gathering and matching the file
names will take some time.

See also command `icicle-locate-file-no-symlinks', which does the same
thing but without following symbolic links.

If you use Emacs on a platform that has an external program `locate',
then consider using `icicle-locate' instead of `icicle-locate-file'.

Remember that you can save the set of files matching your input using
\\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-candidate-set-save]' or \
`\\[icicle-candidate-set-save-persistently]'.  You can then retrieve quickly them later using
`\\[icicle-candidate-set-retrieve]' or \
`\\[icicle-candidate-set-retrieve-persistent]'.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

You cannot move up and down the file hierarchy the same way you can
for ordinary (non-absolute) file-name completion.  To change to a
different directory, with its files as candidates, use \\&lt;minibuffer-local-completion-map&gt;`C-c C-d' from
the minibuffer - it prompts you for the new directory.

During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c C-d      - change the `default-directory' (a la `cd')
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
   \\[icicle-delete-candidate-object]     - delete candidate file or (empty) dir
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)

Directories in `icicle-ignored-directories' are ignored (skipped).  In
addition, these options control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-require-match-flag' - See `icicle-require-match-flag'
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (and (numberp (nth 7 (file-attributes file)))
                      (&gt; (nth 7 (file-attributes file)) 5000)))</span>"
  (interactive)
  (let ((icicle-locate-file-action-fn      'icicle-locate-file-action)
        (icicle-locate-file-no-symlinks-p  nil))
    (icicle-locate-file-1)))

<span class="linecomment">;;;###autoload (autoload 'icicle-locate-file-other-window "icicles")</span>
(defun icicle-locate-file-other-window ()
  "<span class="quote">Same as `icicle-locate-file' except uses another window.
See also command `icicle-locate-file-no-symlinks-other-window', which
does not follow symbolic links.</span>"
  (interactive)
  (let ((icicle-locate-file-action-fn      'icicle-locate-file-other-window-action)
        (icicle-locate-file-no-symlinks-p  nil))
    (icicle-locate-file-1)))


(put 'icicle-locate 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-locate "icicles")</span>
(defun icicle-locate ()
  "<span class="quote">Run the external program `locate', then visit files.
Unlike `icicle-locate-file' this is a wrapper for the external program
`locate', which searches an index of files in your file system, which
is normally created by external program `updatedb'.  Because of this
indexing, this command can be much faster than `icicle-locate-file'.

`icicle-locate' first prompts for a search pattern for program
`locate', which it passes to that program.  The absolute file names
that match this pattern are targets for Icicles completion.

`icicle-locate' uses settings from library `locate.el' where
appropriate.  In particular, you can customize
`locate-make-command-line' to use either regexp matching or file-name
globbing.  Here is an example of a setup to use regexp matching:

\(setq locate-make-command-line
      (lambda (ss) (list locate-command \"--regex\" ss)))

Which particular options the external program `locate' accepts, and
how matching is performed, depend on your operating system and its
implementation of that program.

A prefix argument has the same meaning as for vanilla Emacs command
`locate': prompt for a shell command to run instead of program
`locate'.  A prefix arg has the effect of flipping the value of user
option `locate-prompt-for-command' for the duration of the command
invocation.

After you input the search pattern for program `locate', normal
Icicles input pattern matching is available for completion.  This is
absolute file-name completion, so your input can match any parts of
the name, including directory components.

Remember that you can use \\&lt;minibuffer-local-completion-map&gt;`C-x .' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

Remember that you can save the set of files matching your input using
\\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-candidate-set-save]' or \
`\\[icicle-candidate-set-save-persistently]'.  You can then retrieve quickly them later using
`\\[icicle-candidate-set-retrieve]' or \
`\\[icicle-candidate-set-retrieve-persistent]'.

Note that completion here matches candidates as ordinary strings.  It
knows nothing of file names per se.  In particular, you cannot use
remote file-name syntax.

During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
   \\[icicle-delete-candidate-object]     - delete candidate file or (empty) dir
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)

These Icicles options control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-require-match-flag' - See `icicle-require-match-flag'
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, you
could temporarily set `icicle-file-predicate' to:

  (lambda (file) (and (numberp (nth 7 (file-attributes file)))
                      (&gt; (nth 7 (file-attributes file)) 5000)))</span>"
  (interactive)
  (let ((icicle-locate-file-action-fn     'icicle-locate-file-action)
        (icicle-locate-file-use-locate-p  t))
    (icicle-locate-file-1)))

<span class="linecomment">;;;###autoload (autoload 'icicle-locate-other-window "icicles")</span>
(defun icicle-locate-other-window ()
  "<span class="quote">Same as `icicle-locate' except uses another window.</span>"
  (interactive)
  (let ((icicle-locate-file-action-fn     'icicle-locate-file-other-window-action)
        (icicle-locate-file-use-locate-p  t))
    (icicle-locate-file-1)))


(put 'icicle-locate-file-no-symlinks 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-locate-file-no-symlinks "icicles")</span>
(defun icicle-locate-file-no-symlinks ()
  "<span class="quote">Same as `icicle-locate-file', except do not follow symlinks.</span>"
  (interactive)
  (let ((icicle-locate-file-action-fn      'icicle-locate-file-other-window-action)
        (icicle-locate-file-no-symlinks-p  t))
    (icicle-locate-file-1)))

<span class="linecomment">;;;###autoload (autoload 'icicle-locate-file-no-symlinks-other-window "icicles")</span>
(defun icicle-locate-file-no-symlinks-other-window ()
  "<span class="quote">Same as `icicle-locate-file-no-symlinks', except uses another window.</span>"
  (interactive)
  (let ((icicle-locate-file-action-fn      'icicle-locate-file-other-window-action)
        (icicle-locate-file-no-symlinks-p  t))
    (icicle-locate-file-1)))

(defun icicle-locate-file-action (file)
  "<span class="quote">Action function for `icicle-locate-file'.</span>"
  (find-file (icicle-transform-multi-completion file) 'WILDCARDS))

(defun icicle-locate-file-other-window-action (file)
  "<span class="quote">Action function for `icicle-locate-file-other-window'.</span>"
  (find-file-other-window (icicle-transform-multi-completion file) 'WILDCARDS))

<span class="linecomment">;;;###autoload (autoload 'icicle-locate-file-1 "icicles")</span>
(icicle-define-command icicle-locate-file-1
  "<span class="quote">Helper for `icicle-locate(-file(-no-symlinks))(-other-window)'.</span>" <span class="linecomment">; Doc string</span>
  <span class="linecomment">;; `icicle-locate-file-action-fn' and `icicle-locate-file-use-locate-p' are free here.</span>
  (lambda (f) (funcall icicle-locate-file-action-fn f)) <span class="linecomment">; FREE here: ICICLE-LOCATE-FILE-ACTION-FN.</span>
  prompt icicle-abs-file-candidates nil <span class="linecomment">; `completing-read' args</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs 23.</span>
  nil 'file-name-history nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             "<span class="quote">File (absolute): </span>")
    (dirs                               (and (not icicle-locate-file-use-locate-p)
                                             (cond ((and current-prefix-arg  (consp current-prefix-arg))
                                                    (icicle-directory-list))
                                                   ((and current-prefix-arg
                                                         (wholenump (prefix-numeric-value current-prefix-arg)))
                                                    (read-file-name "<span class="quote">Locate under which directory: </span>"
                                                                    nil default-directory nil))
                                                   (t  default-directory))))
    (icicle-multi-completing-p          (and (not icicle-locate-file-use-locate-p)
                                             <span class="linecomment">;; FREE here: CURRENT-PREFIX-ARG.</span>
                                             (or (&lt;= (prefix-numeric-value current-prefix-arg) 0)
                                                 (and current-prefix-arg  (consp current-prefix-arg)
                                                      (= (car current-prefix-arg) 16)))))
    (icicle-full-cand-fn                (if icicle-multi-completing-p
                                            (lambda (file)
                                              (setq file  (if (file-directory-p file)
                                                              (file-name-as-directory file)
                                                            file))
                                              (icicle-make-file+date-candidate file))
                                          (lambda (file)
                                            (setq file  (if (file-directory-p file)
                                                            (file-name-as-directory file)
                                                          file))
                                            (list file))))
    (use-dialog-box                     nil)
    (icicle-candidate-properties-alist  (and icicle-multi-completing-p  '((1 (face icicle-candidate-part)))))
    (icicle-list-use-nth-parts          (and icicle-multi-completing-p  '(1)))
    (IGNORED--FOR-SIDE-EFFECT
     (progn (icicle-highlight-lighter)
            (if icicle-locate-file-use-locate-p
                (require 'locate)       <span class="linecomment">; Hard-require: error if not there.</span>
              (message "<span class="quote">Gathering files %s (this could take a while)...</span>"
                       (if (or (symbolp dirs)  (consp dirs))
                           (format "<span class="quote">in `%s'</span>" (icicle-propertize dirs 'face 'icicle-msg-emphasis))
                         (format "<span class="quote">within `%s'</span>" (icicle-propertize dirs 'face 'icicle-msg-emphasis)))))))
    (icicle-abs-file-candidates
     (mapcar (if icicle-multi-completing-p #'icicle-make-file+date-candidate #'list)
             (if icicle-locate-file-use-locate-p
                 (let* ((locate-buffer-name  "<span class="quote"> *Icicles Locate*</span>")
                        (temp-locate-buffer  (get-buffer-create locate-buffer-name)))
                   (unwind-protect
                        (with-current-buffer temp-locate-buffer
                          (let ((cands  ()))
                            (call-interactively #'locate) <span class="linecomment">; Gets `current-prefix-arg'.</span>
                            (dired-repeat-over-lines
                             (count-lines (point-min) (point-max))
                             (lambda () (push (dired-get-filename nil t) cands))) <span class="linecomment">; FREE here: CANDS.</span>
                            (nreverse cands)))
                     (kill-buffer temp-locate-buffer)))
               (if (not (or (symbolp dirs)  (consp dirs)))
                   (icicle-files-within (directory-files dirs 'full icicle-re-no-dot)
                                        nil icicle-locate-file-no-symlinks-p)
                 (apply #'append
                        (mapcar (if icicle-locate-file-no-symlinks-p
                                    (lambda (dir) 
                                      (icicle-remove-if #'file-symlink-p
                                                        (directory-files dir 'full icicle-re-no-dot 'NOSORT)))
                                  (lambda (dir) (directory-files dir 'full icicle-re-no-dot 'NOSORT)))
                                dirs))))))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>")
                                                 (mapcar #'icicle-transform-multi-completion files))))))))
  (progn                                <span class="linecomment">; First code</span>
    (when icicle-multi-completing-p (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (icicle-bind-file-candidate-keys)
    (unless icicle-locate-file-use-locate-p
      (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>" 'icicle-cd-for-loc-files)
      (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>" 'icicle-cd-for-loc-files)))
  nil                                   <span class="linecomment">; Undo code</span>
  (progn (icicle-unbind-file-candidate-keys) <span class="linecomment">; Last code</span>
         (unless icicle-locate-file-use-locate-p
           (define-key minibuffer-local-completion-map "<span class="quote">\C-c\C-d</span>" nil)
           (define-key minibuffer-local-must-match-map "<span class="quote">\C-c\C-d</span>" nil)))
  'NON-INTERACTIVE)                     <span class="linecomment">; This is not a real command.</span>

<span class="linecomment">;; This is a minibuffer command.  It is in this file because it is used only here.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload (autoload 'icicle-cd-for-loc-files "icicles")</span>
(defun icicle-cd-for-loc-files (dir &optional no-symlinks-p) <span class="linecomment">; Bound to `C-c C-d' in minibuf locate-*.</span>
  "<span class="quote">Change `default-directory' during `icicle-locate-file'.
Optional arg NO-SYMLINKS-P non-nil means do not follow symbolic links.</span>"
  (interactive
   (save-selected-window
     <span class="linecomment">;; Should not need to bind `minibuffer-completion-predicate'.  Emacs 23.2 bug, per Stefan.</span>
     (let ((minibuffer-completion-predicate  minibuffer-completion-predicate))
       (list (funcall (if (fboundp 'read-directory-name)
                          #'read-directory-name
                        #'read-file-name)
                      "<span class="quote">Change default directory: </span>" default-directory (icicle-file-name-directory-w-default
                                                                      (icicle-input-from-minibuffer))
                      (and (member cd-path '(nil ("<span class="quote">./</span>")))  (null (getenv "<span class="quote">CDPATH</span>"))))))))
  (cd dir)
  (let ((icicle-abs-file-candidates
         (mapcar (lambda (file)         <span class="linecomment">; FREE here: ICICLE-LIST-USE-NTH-PARTS.</span>
                   (if icicle-multi-completing-p (icicle-make-file+date-candidate file) (list file)))
                 (icicle-files-within (directory-files dir 'full icicle-re-no-dot) nil no-symlinks-p))))
    (setq minibuffer-completion-table
          (car (icicle-mctize-all icicle-abs-file-candidates minibuffer-completion-predicate)))))


(put 'icicle-find-file-in-tags-table 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-in-tags-table "icicles")</span>
(icicle-define-command icicle-find-file-in-tags-table <span class="linecomment">; Command name</span>
  "<span class="quote">Visit a file listed in a tags table.
By default, the completion candidates are the file names listed in the
current tags table, but you can substitute other candidates by
retrieving a saved candidate set.  The default candidates appear as
they did in the `etags' command that created the tags table, which
typically means without directory names.

Completion here matches candidates as ordinary strings.  It knows
nothing of file names per se.  In particular, you cannot use remote
file-name syntax.  If a candidate is an absolute file name then you
can complete against any and all parts of the name (including
directory components).

`find-file' is called for the candidate(s) you choose, with the
directory of the tags file as `default-directory'.

Remember that you can use \\&lt;minibuffer-local-completion-map&gt;`C-x .' to hide the common match portion of
each candidate.  That can be particularly helpful for files that are
in a common directory.

With a prefix argument, you can choose also by date: Completion
candidates include the last modification date.

During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
   \\[icicle-delete-candidate-object]     - delete candidate file or (empty) dir
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, you
could temporarily set `icicle-file-predicate' to:

  (lambda (file) (and (numberp (nth 7 (file-attributes file)))
                      (&gt; (nth 7 (file-attributes file)) 5000)))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (ff)
    (visit-tags-table-buffer 'same)     <span class="linecomment">; To pick up `default-directory' of TAGS table.</span>
    (find-file (icicle-transform-multi-completion ff) 'WILDCARDS)) <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          (save-excursion (let ((enable-recursive-minibuffers  t)) (visit-tags-table-buffer))
                          (tags-table-files)))
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs 23.</span>
  nil 'file-name-history nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             "<span class="quote">File (in tags table): </span>")
    (icicle-full-cand-fn                `(lambda (file)
                                          (setq file  (if (file-directory-p file)
                                                          (file-name-as-directory file)
                                                        file))
                                          ,(if current-prefix-arg
                                               '(icicle-make-file+date-candidate file)
                                               '(list file))))
    (icicle-special-candidate-regexp    (or icicle-special-candidate-regexp  "<span class="quote">.+/$</span>"))
    (icicle-candidate-properties-alist  (and current-prefix-arg  '((1 (face icicle-candidate-part)))))
    (icicle-multi-completing-p          current-prefix-arg)
    (icicle-list-use-nth-parts          (and current-prefix-arg  '(1)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (unless (require 'etags nil t) (error "<span class="quote">`etags.el' is required</span>"))
    (icicle-bind-file-candidate-keys))
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-file-candidate-keys))  <span class="linecomment">; Last code</span>


(put 'icicle-find-file-in-tags-table-other-window 'icicle-Completions-window-max-height 200)

<span class="linecomment">;;;###autoload (autoload 'icicle-find-file-in-tags-table-other-window "icicles")</span>
(icicle-define-command icicle-find-file-in-tags-table-other-window <span class="linecomment">; Command name</span>
  "<span class="quote">Same as `icicle-find-file-in-tags-table', but uses another window.</span>" <span class="linecomment">; Doc string</span>
  (lambda (ff)
    (visit-tags-table-buffer 'same)     <span class="linecomment">; To pick up `default-directory' of TAGS table.</span>
    (find-file (icicle-transform-multi-completion ff) 'WILDCARDS)) <span class="linecomment">; Action function</span>
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar (if current-prefix-arg #'icicle-make-file+date-candidate #'list)
          (save-excursion (let ((enable-recursive-minibuffers  t)) (visit-tags-table-buffer))
                          (tags-table-files)))
  nil
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs 23.</span>
  nil 'file-name-history nil nil
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             "<span class="quote">File (in tags table): </span>")
    (icicle-full-cand-fn                `(lambda (file)
                                          (setq file  (if (file-directory-p file)
                                                          (file-name-as-directory file)
                                                        file))
                                          ,(if current-prefix-arg
                                               '(icicle-make-file+date-candidate file)
                                               '(list file))))
    (icicle-special-candidate-regexp    (or icicle-special-candidate-regexp  "<span class="quote">.+/$</span>"))
    (icicle-candidate-properties-alist  (and current-prefix-arg  '((1 (face icicle-candidate-part)))))
    (icicle-multi-completing-p          current-prefix-arg)
    (icicle-list-use-nth-parts          (and current-prefix-arg  '(1)))
    (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
     (lambda (files) (let ((enable-recursive-minibuffers  t))
                       (dired-other-window (cons (read-string "<span class="quote">Dired buffer name: </span>") files)))))))
  (progn                                <span class="linecomment">; First code</span>
    (when current-prefix-arg (put-text-property 0 1 'icicle-fancy-candidates t prompt))
    (unless (require 'etags nil t) (error "<span class="quote">`etags.el' is required</span>"))
    (icicle-bind-file-candidate-keys))
  nil                                   <span class="linecomment">; Undo code</span>
  (icicle-unbind-file-candidate-keys))  <span class="linecomment">; Last code</span>

(defun icicle-make-file+date-candidate (file)
  "<span class="quote">Return a multi-completion candidate: FILE + last modification date.</span>"
  (list (list file (format-time-string "<span class="quote">%Y %m %d %T </span>" (nth 5 (file-attributes file))))))

<span class="linecomment">;;;###autoload (autoload 'icicle-string-list "icicles")</span>
(icicle-define-command icicle-string-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of strings.  The list is returned.
You can choose from strings used previously or enter new strings.
Use multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.

If option `icicle-add-proxy-candidates-flag' is non-nil (toggle using
`\\&lt;minibuffer-local-completion-map&gt;\\[icicle-toggle-proxy-candidates]'), you can also choose the \
name of a string variable - its value
is returned.  A string variable is a variable whose value or whose
custom type is compatible with type `string'.</span>" <span class="linecomment">; Doc string</span>
  (lambda (string)                      <span class="linecomment">; FREE here: ICICLE-PROXY-CANDIDATES, STRINGS.</span>
    (let (temp)
      (push (if (setq temp  (member string icicle-proxy-candidates))
                (setq temp  (symbol-value (intern (car temp))))
              (setq temp  string))
            strings)
      (when (interactive-p)
        (message "<span class="quote">Added string \"%s\"</span>" (icicle-propertize temp 'face 'icicle-msg-emphasis))
        (sit-for 1))))
  prompt (mapcar #'list (icicle-remove-duplicates comp-strings)) <span class="linecomment">; `completing-read' args</span>
  nil nil nil 'regexp-history nil nil
  ((icicle-proxy-candidates             <span class="linecomment">; Bindings</span>
    (and icicle-add-proxy-candidates-flag
         (let ((ipc  ()))
           (mapatoms (lambda (cand)     <span class="linecomment">; FREE here: IPC.</span>
                       (when (and (user-variable-p cand)
                                  (condition-case nil
                                      (icicle-var-is-of-type-p cand '(string color regexp))
                                    (error nil)))
                         (push (symbol-name cand) ipc))))
           ipc)))
   (comp-strings                          (append regexp-history regexp-search-ring search-ring
                                                  icicle-search-history kill-ring))
   (strings                               ())
   (icicle-use-candidates-only-once-flag  t)
   (prompt                                (or icicle-prompt  "<span class="quote">Choose string (`RET' when done): </span>")))
  (when icicle-proxy-candidates (put-text-property 0 1 'icicle-fancy-candidates t prompt)) <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (prog1 (setq strings  (nreverse (delete "<span class="quote"></span>" strings))) <span class="linecomment">; Last code - return the list of strings.</span>
    (setq icicle-proxy-candidates  ())
    (when (interactive-p) (message "<span class="quote">Strings: %S</span>" strings))))

(when (fboundp 'read-char-by-name)
  (defun icicle-zap-to-char (arg char &optional names)
    "<span class="quote">Kill up to and including ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Go backward if ARG is negative.  Raise an error if CHAR is not found.

This is the same as `zap-to-char', except if you hit a completing key
such as `TAB' then you can complete against the char names in NAMES.

If you need to zap up to a completing-key char such as `TAB', escape
the char with `C-q'.  E.g., use `C-q TAB' instead of `TAB'.

NAMES has the same form as `ucs-names'.  Interactively, NAMES is
determined by option `icicle-zap-to-char-candidates'.  By default, it
is the subset of `ucs-names' that corresponds to the characters that
have been read previously (`icicle-read-char-history'), that is, the
Unicode names you entered.  If you want to complete against all
Unicode chars, then customize option `icicle-zap-to-char-candidates'.</span>"
    (interactive
     (list (prefix-numeric-value current-prefix-arg)
           (icicle-read-char-maybe-completing "<span class="quote">Zap to char: </span>"
                                              (and (functionp icicle-zap-to-char-candidates)
                                                   (funcall icicle-zap-to-char-candidates)))))
    (unless names (setq names  (or (icicle-char-cands-from-charlist)  (icicle-ucs-names))))
    (with-no-warnings                   <span class="linecomment">; Avoid "obsolete" warning for `translation-table-for-input'.</span>
        (when (char-table-p translation-table-for-input) <span class="linecomment">; Free var here.</span>
          (setq char  (or (aref translation-table-for-input char)  char))))
    (kill-region (point) (progn (search-forward (string char) nil nil arg)
                                <span class="linecomment">;; (goto-char (if (&gt; arg 0)</span>
                                <span class="linecomment">;;                (max (point-min) (1- (point)))</span>
                                <span class="linecomment">;;              (min (point-max) (1+ (point))))) ; (vanilla)</span>
                                (point)))))

<span class="linecomment">;;;###autoload (autoload 'icicle-sexp-list "icicles")</span>
(icicle-define-command icicle-sexp-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of sexps.  The list is returned.
The list entries are Lisp objects, not strings (unless you use \"...\").

You can choose from sexps entered previously or enter new sexps.
Use multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.</span>" <span class="linecomment">; Doc string</span>
  (lambda (sexp)                        <span class="linecomment">; FREE here: SEXPS.</span>
    (push sexp sexps)
    (when (interactive-p)
      (message "<span class="quote">Added sexp `%s'</span>" (icicle-propertize sexp 'face 'icicle-msg-emphasis)) (sit-for 1)))
  prompt                                <span class="linecomment">; `completing-read' args</span>
  (mapcar #'list (icicle-remove-duplicates (symbol-value history)))
  nil nil nil history nil nil
  ((sexps                                 ()) <span class="linecomment">; Bindings</span>
   (icicle-use-candidates-only-once-flag  t)
   (prompt                                (or icicle-prompt  "<span class="quote">Choose sexp (`RET' when done): </span>"))
   (history                               (or icicle-hist-var  'read-expression-history)))
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (prog1 (setq sexps  (nreverse (delete "<span class="quote"></span>" sexps)) <span class="linecomment">; Last code - return the list of sexps.</span>
               sexps  (mapcar (lambda (sx) (car (read-from-string sx))) sexps))
    (when (interactive-p) (message "<span class="quote">Sexps: %S</span>" sexps))))

<span class="linecomment">;;;###autoload (autoload 'icicle-regexp-list "icicles")</span>
(defalias 'icicle-regexp-list 'icicle-keyword-list)
<span class="linecomment">;;;###autoload (autoload 'icicle-keyword-list "icicles")</span>
(icicle-define-command icicle-keyword-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of keywords. The list of keywords (strings) is returned.
Each keyword is a regexp.  The regexps are OR'd, and the resulting
regexp is usable for `icicle-search'.

You can choose from keywords entered previously or enter new keywords.
Use multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.</span>" <span class="linecomment">; Doc string</span>
  (lambda (name)                        <span class="linecomment">; FREE here: KEYWORDS.</span>
    (push name keywords)
    (when (interactive-p)
      (message "<span class="quote">Added keyword `%s'</span>" (icicle-propertize name 'face 'icicle-msg-emphasis)) (sit-for 1)))
  prompt (mapcar #'list (icicle-remove-duplicates regexp-history)) <span class="linecomment">; `completing-read' args</span>
  nil nil nil 'regexp-history nil nil
  ((keywords                              ()) <span class="linecomment">; Bindings</span>
   (icicle-use-candidates-only-once-flag  t)
   (prompt                                (or icicle-prompt
                                              "<span class="quote">Choose keyword (regexp) (`RET' when done): </span>")))
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (prog1 (setq keywords  (nreverse (delete "<span class="quote"></span>" keywords))) <span class="linecomment">; Last code - return the list of keywords.</span>
    (when (interactive-p) (message "<span class="quote">Keywords (regexps): %S</span>" keywords))))

<span class="linecomment">;;;###autoload (autoload 'icicle-face-list "icicles")</span>
(icicle-define-command icicle-face-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of face names.  The list of names (strings) is returned.
Use multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.</span>" <span class="linecomment">; Doc string</span>
  (lambda (name)                        <span class="linecomment">; FREE here: FACE-NAMES.</span>
    (let ((temp  (icicle-transform-multi-completion name)))
      (push temp face-names)
      (when (interactive-p)
        (message "<span class="quote">Added face `%s'</span>" (icicle-propertize temp 'face 'icicle-msg-emphasis)) (sit-for 1))))
  prompt (mapcar #'icicle-make-face-candidate (face-list)) <span class="linecomment">; `completing-read' args</span>
  nil (not (stringp icicle-WYSIWYG-Completions-flag)) nil
  (if (boundp 'face-name-history) 'face-name-history 'icicle-face-name-history)
  nil nil
  ((prompt                                (or icicle-prompt <span class="linecomment">; Allow override.</span>
                                              "<span class="quote">Choose face (`RET' when done): </span>")) <span class="linecomment">; Bindings</span>
   (icicle-list-nth-parts-join-string     "<span class="quote">: </span>")
   (icicle-list-join-string               "<span class="quote">: </span>")
   <span class="linecomment">;; $$$$$$ (icicle-list-end-string      "")</span>
   (icicle-multi-completing-p             t)
   (icicle-list-use-nth-parts             '(1))
   (icicle-use-candidates-only-once-flag  t)
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn  (icicle-alt-act-fn-for-type "<span class="quote">face</span>")))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  (icicle-alt-act-fn-for-type "<span class="quote">face</span>")))
   (face-names                            ()))
  (put-text-property 0 1 'icicle-fancy-candidates t prompt) <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (prog1 (setq face-names  (nreverse (delete "<span class="quote"></span>" face-names))) <span class="linecomment">; Last code - return list of faces</span>
    (when (interactive-p) (message "<span class="quote">Faces: %S</span>" face-names))))

<span class="linecomment">;;;###autoload (autoload 'icicle-buffer-list "icicles")</span>
(icicle-define-command icicle-buffer-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of buffer names.
With a positive prefix arg, only buffers visiting files or directories
\(Dired) are candidates.

With a negative prefix arg, only buffers associated with the selected
frame are candidates.

Use multi-command action keys (e.g. \\&lt;minibuffer-local-completion-map&gt;`C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.

You can use `\\[icicle-delete-candidate-object]' during completion to kill a candidate buffer.
The list of names (strings) is returned.

These options, when non-nil, control candidate matching and filtering:

 `icicle-buffer-ignore-space-prefix-flag' - Ignore space-prefix names
 `icicle-buffer-extras'             - Extra buffers to display
 `icicle-buffer-match-regexp'       - Regexp that buffers must match
 `icicle-buffer-no-match-regexp'    - Regexp buffers must not match
 `icicle-buffer-predicate'          - Predicate buffer names satisfy
 `icicle-buffer-sort'               - Sort function for candidates

Note: The prefix arg is tested, even when this is called
noninteractively.  Lisp code can bind `current-prefix-arg' to control
the behavior.</span>"                          <span class="linecomment">; Doc string</span>
  (lambda (name)                        <span class="linecomment">; Action function.  FREE here: BUF-NAMES.</span>
    (push name buf-names)
    (when (interactive-p)
      (message "<span class="quote">Added buffer name `%s'</span>" (icicle-propertize name 'face 'icicle-msg-emphasis))
      (sit-for 1)))
  prompt (mapcar (lambda (buf) (list (buffer-name buf))) <span class="linecomment">; `completing-read' args</span>
                 (if current-prefix-arg
                     (if (wholenump (prefix-numeric-value current-prefix-arg))
                         (icicle-remove-if-not (lambda (bf)
                                                 (or (buffer-file-name bf)
                                                     (with-current-buffer bf (eq major-mode 'dired-mode))))
                                               (buffer-list))
                       (cdr (assq 'buffer-list (frame-parameters))))
                   (buffer-list)))
  (and icompletep  icicle-buffer-predicate
       (lambda (buf) (funcall icicle-buffer-predicate (car buf)))) <span class="linecomment">; FREE here: ICICLE-BUFFER-PREDICATE.</span>
  (and (fboundp 'confirm-nonexistent-file-or-buffer)  (confirm-nonexistent-file-or-buffer)) <span class="linecomment">;Emacs23.</span>
  nil 'buffer-name-history nil nil
  ((buf-names                               ()) <span class="linecomment">; Bindings</span>
   (prompt                                  (or icicle-prompt <span class="linecomment">; Allow override.</span>
                                                "<span class="quote">Choose buffer name (`RET' when done): </span>"))
   (completion-ignore-case                  (or (and (boundp 'read-buffer-completion-ignore-case)
                                                     read-buffer-completion-ignore-case)
                                                completion-ignore-case))
   (icicle-must-match-regexp                icicle-buffer-match-regexp)
   (icicle-must-not-match-regexp            icicle-buffer-no-match-regexp)
   (icompletep                              (and (boundp 'icomplete-mode)  icomplete-mode))
   (icicle-must-pass-after-match-predicate  (and (not icompletep)  icicle-buffer-predicate))
   (icicle-require-match-flag               icicle-buffer-require-match-flag)
   (icicle-extra-candidates                 icicle-buffer-extras)
   (icicle-delete-candidate-object          'icicle-kill-a-buffer) <span class="linecomment">; `S-delete' kills current buf</span>
   (icicle-transform-function               'icicle-remove-dups-if-extras)
   (icicle-sort-comparer                    (or icicle-buffer-sort  icicle-sort-comparer))
   (icicle-sort-orders-alist
    (append (list '("<span class="quote">by last access</span>")   <span class="linecomment">; Renamed from "turned OFF'.</span>
                  '("<span class="quote">*...* last</span>" . icicle-buffer-sort-*...*-last)
                  '("<span class="quote">by buffer size</span>" . icicle-buffer-smaller-p)
                  '("<span class="quote">by major mode name</span>" . icicle-major-mode-name-less-p)
                  (and (fboundp 'icicle-mode-line-name-less-p)
                       '("<span class="quote">by mode-line mode name</span>" . icicle-mode-line-name-less-p))
                  '("<span class="quote">by file/process name</span>" . icicle-buffer-file/process-name-less-p))
            (delete '("<span class="quote">turned OFF</span>") icicle-sort-orders-alist)))
   (icicle-candidate-alt-action-fn
    (or icicle-candidate-alt-action-fn  (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
   (icicle-all-candidates-list-alt-action-fn <span class="linecomment">; M-|'</span>
    (or icicle-all-candidates-list-alt-action-fn  (icicle-alt-act-fn-for-type "<span class="quote">buffer</span>")))
   (icicle-use-candidates-only-once-flag  t))
  nil nil                               <span class="linecomment">; First code, undo code</span>
  (prog1 (setq buf-names  (nreverse (delete "<span class="quote"></span>" buf-names))) <span class="linecomment">; Last code - return the list of buffers</span>
    (when (interactive-p) (message "<span class="quote">Buffer names: %S</span>" buf-names))))

<span class="linecomment">;;;###autoload (autoload 'icicle-bookmark-list "icicles")</span>
(icicle-define-command icicle-bookmark-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of bookmarks.
This is an alist whose entries are bookmark entries.  The entries have
the bookmark names as their key.  You can use the return value as a
bookmark alist or as a COLLECTION argument for `completing-read'.

With a prefix argument, this is a list of the bookmark names, not an
alist of the full bookmarks.

If `icicle-show-multi-completion-flag' is non-nil, then completion
candidates are multi-completions, with the first part being the
bookmark name and the second part being the bookmark's file or buffer
name.  Otherwise, the candidates are just the bookmark names.

If you also use library Bookmark+ (`bookmark+.el') then\\&lt;minibuffer-local-completion-map&gt;:

 * Candidates displayed in `*Completions*' are color-coded by type.
 * You can sort the candidates (e.g. `C-,') in many more ways.
 * When you ask for help on a candidate (e.g. `C-M-return'), detailed
   information about the bookmark is shown in `*Help*'.  If you use a
   prefix arg for this (e.g. `C-u C-M-return') then the full, internal
   form of the bookmark is shown.

Use multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.

You can use `\\[icicle-delete-candidate-object]' during completion to delete a candidate bookmark.
The list of bookmark names (strings) is returned.

Non-interactively:

 * If `icicle-bookmark-list-names-only-p' is non-nil, then return a
   list of the bookmark names (just as if a prefix arg were used).
 * If `icicle-bookmark-types' is non-nil, and you use Bookmark+,
   then only bookmarks of those types are used.  You can thus bind
   this variable around the function call to specialize the behavior
   to only certain types.</span>"              <span class="linecomment">; Doc string</span>
  (lambda (name)                        <span class="linecomment">; FREE here: CHOSEN-BMKS, NAMES-ONLY-P.</span>
    (let ((temp  (icicle-transform-multi-completion name)))
      (push (if names-only-p
                (icicle-unpropertize-completion temp)
              (bookmark-get-bookmark (icicle-unpropertize-completion temp)))
            chosen-bmks)
      (when (interactive-p)
        (message "<span class="quote">Added bookmark `%s'</span>" (icicle-propertize temp 'face 'icicle-msg-emphasis))
        (sit-for 1))))
  prompt icicle-candidates-alist nil (not icicle-show-multi-completion-flag) <span class="linecomment">; `completing-read' args</span>
  nil (if (boundp 'bookmark-history) 'bookmark-history 'icicle-bookmark-history)
  (and (boundp 'bookmark-current-bookmark)  bookmark-current-bookmark) nil
  ((prompt                                      (or icicle-prompt <span class="linecomment">; Allow override.</span>
                                                    "<span class="quote">Choose bookmark (`RET' when done): </span>"))
   (enable-recursive-minibuffers                t) <span class="linecomment">; In case we read input, e.g. File changed on disk...</span>
   (completion-ignore-case                      bookmark-completion-ignore-case)
   (icicle-multi-completing-p                   icicle-show-multi-completion-flag)
   (icicle-list-use-nth-parts                   '(1))
   (icicle-candidate-properties-alist           (if (not icicle-show-multi-completion-flag)
                                                    ()
                                                  (if (facep 'file-name-shadow)
                                                      '((2 (face file-name-shadow))
                                                        (3 (face bookmark-menu-heading)))
                                                    '((3 (face bookmark-menu-heading))))))
   (icicle-transform-function                   (if (interactive-p) nil icicle-transform-function))
   (icicle-whole-candidate-as-text-prop-p       t)
   (icicle-transform-before-sort-p              t)
   (icicle-delete-candidate-object              'icicle-bookmark-delete-action)
   (types                                       icicle-bookmark-types)
   (names-only-p                                (if (interactive-p)
                                                    current-prefix-arg
                                                  icicle-bookmark-list-names-only-p))
   (icicle-candidates-alist                     ())
   (chosen-bmks                                 ())
   (icicle-unpropertize-completion-result-flag  nil) <span class="linecomment">; Remove only Icicles internal text properties.</span>
   (icicle-sort-orders-alist
    (append '(("<span class="quote">in *Bookmark List* order</span>") <span class="linecomment">; Renamed from "turned OFF'.</span>
              ("<span class="quote">by bookmark name</span>" . icicle-alpha-p))
            (and (featurep 'bookmark+)
                 (append
                  '(("<span class="quote">by last bookmark access</span>" (bmkp-bookmark-last-access-cp) icicle-alpha-p)
                    ("<span class="quote">by bookmark visit frequency</span>" (bmkp-visited-more-cp) icicle-alpha-p))
                  (and (icicle-set-intersection types '("<span class="quote">info</span>" "<span class="quote">region</span>"))
                       '(("<span class="quote">by Info location</span>" (bmkp-info-cp) icicle-alpha-p)))
                  (and (icicle-set-intersection types '("<span class="quote">gnus</span>" "<span class="quote">region</span>"))
                       '(("<span class="quote">by Gnus thread</span>" (bmkp-gnus-cp) icicle-alpha-p)))
                  (and (icicle-set-intersection types '("<span class="quote">url</span>" "<span class="quote">region</span>"))
                       '(("<span class="quote">by URL</span>" (bmkp-url-cp) icicle-alpha-p)))
                  (and (icicle-set-difference types
                                              '("<span class="quote">bookmark-list</span>" "<span class="quote">desktop</span>" "<span class="quote">gnus</span>" "<span class="quote">info</span>" "<span class="quote">man</span>" "<span class="quote">url</span>"))
                       '(("<span class="quote">by bookmark type</span>" (bmkp-info-cp bmkp-url-cp bmkp-gnus-cp
                                              bmkp-local-file-type-cp bmkp-handler-cp)
                          icicle-alpha-p)))
                  (and (icicle-set-difference
                        types '("<span class="quote">bookmark-list</span>" "<span class="quote">desktop</span>" "<span class="quote">dired</span>" "<span class="quote">non-file</span>"))
                       '(("<span class="quote">by file name</span>" (bmkp-file-alpha-cp) icicle-alpha-p)))
                  (and (icicle-set-intersection types
                                                '("<span class="quote">local-file</span>" "<span class="quote">file</span>" "<span class="quote">dired</span>" "<span class="quote">region</span>"))
                       '(("<span class="quote">by local file type</span>" (bmkp-local-file-type-cp) icicle-alpha-p)
                         ("<span class="quote">by local file size</span>" (bmkp-local-file-size-cp) icicle-alpha-p)
                         ("<span class="quote">by last local file access</span>"
                          (bmkp-local-file-accessed-more-recently-cp)
                          icicle-alpha-p)
                         ("<span class="quote">by last local file update</span>" (bmkp-local-file-updated-more-recently-cp)
                          icicle-alpha-p)))
                  (and (not (equal types '("<span class="quote">desktop</span>")))
                       '(("<span class="quote">by last buffer or file access</span>"
                          (bmkp-buffer-last-access-cp
                           bmkp-local-file-accessed-more-recently-cp)
                          icicle-alpha-p)))
                  (and (get-buffer "<span class="quote">*Bookmark List*</span>")
                       '(("<span class="quote">marked before unmarked (in *Bookmark List*)</span>" (bmkp-marked-cp)
                          icicle-alpha-p)))))
            '(("<span class="quote">by previous use alphabetically</span>" . icicle-historical-alphabetic-p)
              ("<span class="quote">case insensitive</span>" . icicle-case-insensitive-string-less-p))))         
   (icicle-candidate-help-fn
    <span class="linecomment">;; FREE here: CURRENT-PREFIX-ARG, ICICLE-GET-ALIST-CANDIDATE-FUNCTION, ICICLE-SHOW-MULTI-COMPLETION-FLAG.</span>
    (lambda (cand)
      (when (and (featurep 'bookmark+)  icicle-show-multi-completion-flag)
        (setq cand  (funcall icicle-get-alist-candidate-function cand))
        (setq cand  (cons (caar cand) (cdr cand))))
      (if (featurep 'bookmark+)
          (if current-prefix-arg
              (bmkp-describe-bookmark-internals cand)
            (bmkp-describe-bookmark cand))
        (icicle-msg-maybe-in-minibuffer (icicle-bookmark-help-string cand))))))
  (progn                                <span class="linecomment">; First code</span>
    (message "<span class="quote">Gathering bookmarks...</span>")
    (bookmark-maybe-load-default-file)  <span class="linecomment">; Load bookmarks, define `bookmark-alist'.</span>
    (if (not (featurep 'bookmark+))
        (mapcar (lambda (cand) (list (icicle-candidate-short-help
                                      (icicle-bookmark-help-string cand)
                                      (icicle-bookmark-propertize-candidate cand))))
                bookmark-alist)
      (unless types  (setq types '(all)))
      (dolist (type  types)
        (setq icicle-candidates-alist  (nconc icicle-candidates-alist
                                              (mapcar #'icicle-make-bookmark-candidate
                                                      (bmkp-sort-omit
                                                       (if (eq type 'all)
                                                           bookmark-alist
                                                         (funcall (intern (format "<span class="quote">bmkp-%s-alist-only</span>"
                                                                                  type)))))))))))
  (icicle-bookmark-cleanup-on-quit)     <span class="linecomment">; Undo code</span>
  (prog1 (setq chosen-bmks  (nreverse (delete "<span class="quote"></span>" chosen-bmks))) <span class="linecomment">; Last code - return the list.</span>
    (icicle-bookmark-cleanup)
    (when (interactive-p)
      (message "<span class="quote">Bookmarks: %S</span>" (if names-only-p chosen-bmks (mapcar #'car chosen-bmks))))))

<span class="linecomment">;; $$$$$ (icicle-define-command icicle-file-list ; Command name</span>
<span class="linecomment">;;   "Choose a list of file names.</span>
<span class="linecomment">;; You can use \\&lt;minibuffer-local-completion-map&gt;\</span>
<span class="linecomment">;;`\\[icicle-delete-candidate-object]' during completion to delete a candidate file.</span>
<span class="linecomment">;; The list of names (strings) is returned." ; Doc string</span>
<span class="linecomment">;;   (lambda (name) (push name file-names)) ; Function to perform the action</span>
<span class="linecomment">;;   "Choose file (`RET' when done): "     ; `completing-read' args</span>
<span class="linecomment">;;   (mapcar #'list (directory-files default-directory nil icicle-re-no-dot))</span>
<span class="linecomment">;;   nil nil nil 'file-name-history nil nil</span>
<span class="linecomment">;;   ((file-names ())                      ; Additional bindings</span>
<span class="linecomment">;;    (icicle-delete-candidate-object  'icicle-delete-file-or-directory) ; `S-delete' deletes file.</span>
<span class="linecomment">;;    (icicle-use-candidates-only-once-flag  t))</span>
<span class="linecomment">;;   nil nil                               ; First code, undo code</span>
<span class="linecomment">;;   (prog1 (setq file-names  (nreverse (delete "" file-names))) ; Last code - return files list</span>
<span class="linecomment">;;     (when (interactive-p) (message "Files: %S" file-names))))</span>

<span class="linecomment">;;;###autoload (autoload 'icicle-file-list "icicles")</span>
(icicle-define-file-command icicle-file-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of file and directory names (strings), and return it.
Use multi-command action keys (e.g. \\&lt;minibuffer-local-completion-map&gt;`C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.

You can navigate the directory tree, picking files and directories
anywhere in the tree.

Remember too that you can use `\\[icicle-all-candidates-action]' to gather all of the file names
matching your current input.  For example, apropos-completing with
input `foo.*bar' and hitting `\\[icicle-all-candidates-action]' adds all file names matching that
regexp.

You can use either `RET' or `C-g' to finish adding file names to the
list.

During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
   \\[icicle-delete-candidate-object]     - delete candidate file or (empty) dir
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra file names to display
 `icicle-file-match-regexp'     - Regexp that file names must match
 `icicle-file-no-match-regexp'  - Regexp file names must not match
 `icicle-file-predicate'        - Predicate file names must satisfy
 `icicle-file-sort'             - Sort function for candidates

For example, to show only names of files larger than 5000 bytes, set
`icicle-file-predicate' to:

  (lambda (file) (and (numberp (nth 7 (file-attributes file)))
                      (&gt; (nth 7 (file-attributes file)) 5000)))

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (name)                        <span class="linecomment">; FREE here: FILE-NAMES.</span>
    (push name file-names)
    (when (interactive-p)
      (message "<span class="quote">Added file name `%s'</span>" (icicle-propertize name 'face 'icicle-msg-emphasis)) (sit-for 1)))
  prompt nil nil t nil nil              <span class="linecomment">; `read-file-name' args</span>
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             (or icicle-prompt <span class="linecomment">; Allow override.</span>
                                            "<span class="quote">Choose file (`RET' when done): </span>"))
    (file-names                         ())
    (icicle-comp-base-is-default-dir-p  t)
    <span class="linecomment">;; $$$$$ (icicle-dir-candidate-can-exit-p (not current-prefix-arg))</span>
    ))
  (icicle-bind-file-candidate-keys)     <span class="linecomment">; First code</span>
  nil                                   <span class="linecomment">; Undo code</span>
  (prog1 (setq file-names  (nreverse (delete "<span class="quote"></span>" file-names))) <span class="linecomment">; Last code - return list of files</span>
    (icicle-unbind-file-candidate-keys)
    (when (interactive-p) (message "<span class="quote">Files: %S</span>" file-names))))

<span class="linecomment">;;;###autoload (autoload 'icicle-directory-list "icicles")</span>
(icicle-define-file-command icicle-directory-list <span class="linecomment">; Command name</span>
  "<span class="quote">Choose a list of directory names (strings), and return it.
You must include a slash (`/') at the end of each directory name.
Use multi-command action keys (e.g. `C-RET', `C-mouse-2') to choose,
and a final-choice key (e.g. `RET', `mouse-2') to choose the last one.

You can navigate the directory tree, picking directories anywhere in
the tree.

If `icicle-add-proxy-candidates-flag' is non-nil, then certain Emacs
variables whose values are lists of directories are available as proxy
candidates.  This includes variables such as `load-path' and
`exec-path'.  You can toggle `icicle-add-proxy-candidates-flag' using
\\&lt;minibuffer-local-completion-map&gt;\
`\\[icicle-toggle-proxy-candidates]'in the minibuffer.

When you choose a proxy candidate all of its directories are added to
the result list.  Non-directory elements in the variable value are
ignored - only string elements are retained.  And none of the string
elements are checked to see whether they actually correspond to an
existing directory.

Keep in mind that only those proxy candidates that match your current
input are available.  In particular, if `insert-default-directory' is
non-nil then you will want to use `\\[icicle-erase-minibuffer-or-history-element]' to remove the default
directory from the minibuffer when you want to match proxy candidates.

During completion (`*' means this requires library `Bookmark+')\\&lt;minibuffer-local-completion-map&gt;, you
can use the following keys:
   C-c +        - create a new directory
   \\[icicle-all-candidates-list-alt-action]          - open Dired on the currently matching file names
   \\[icicle-delete-candidate-object]     - delete candidate file or (empty) dir
 * C-x C-t *    - narrow to files with all of the tags you specify
 * C-x C-t +    - narrow to files with some of the tags you specify
 * C-x C-t % *  - narrow to files with all tags matching a regexp
 * C-x C-t % +  - narrow to files with some tags  matching a regexp
 * C-x a +      - add tags to current candidate
 * C-x a -      - remove tags from current candidate
 * C-x m        - access file bookmarks (not just autofiles)

These options, when non-nil, control candidate matching and filtering:

 `icicle-file-extras'           - Extra directory names to display
 `icicle-file-match-regexp'     - Regexp directory names must match
 `icicle-file-no-match-regexp'  - Regexp dir names must not match
 `icicle-file-predicate'        - Predicate the dir names must satisfy
 `icicle-file-sort'             - Sort function for candidates

Option `icicle-file-require-match-flag' can be used to override
option `icicle-require-match-flag'.

Option `icicle-files-ido-like' non-nil gives this command a more
Ido-like behavior.</span>"                     <span class="linecomment">; Doc string</span>
  (lambda (name)                        <span class="linecomment">; FREE here: DIR-NAMES.</span>
    (if (member (file-name-nondirectory name) <span class="linecomment">; Do this because choosing candidate adds default dir to it.</span>
                keep-proxy-cands)
        (setq name       (symbol-value (intern (file-name-nondirectory name)))
              dir-names  (append (icicle-remove-if-not #'stringp name) dir-names))
      (push name dir-names))
    (when (interactive-p)
      (message "<span class="quote">Added directory name `%s'</span>" (icicle-propertize name 'face 'icicle-msg-emphasis))
      (sit-for 1)))
  prompt nil nil t nil nil              <span class="linecomment">; `read-file-name' args</span>
  (icicle-file-bindings                 <span class="linecomment">; Bindings</span>
   ((prompt                             (or icicle-prompt <span class="linecomment">; Allow override.</span>
                                            "<span class="quote">Choose directory (`RET' when done): </span>"))
    (dir-names                          ())
    (icicle-exclude-default-proxies     t) <span class="linecomment">; Exclude non-dir file-name proxy candidates.</span>
    (icicle-proxy-candidates            <span class="linecomment">; Remove vars whose vals are not lists or are lists with no strings.</span>
     (let ((ipc  ()))
       (when icicle-add-proxy-candidates-flag
         (setq ipc  (mapcar #'symbol-name
                            (icicle-remove-if-not
                             (lambda (symb)
                               (and (boundp symb)  (consp (symbol-value symb))
                                    (let ((dirs  (symbol-value symb)))
                                      (catch 'icicle-directory-list
                                        (dolist (dir  dirs)
                                          (when (stringp dir) (throw 'icicle-directory-list t)))
                                        nil))))                         
                             icicle-path-variables))))
       ipc))
    (keep-proxy-cands                   icicle-proxy-candidates) <span class="linecomment">; Needed after `read-file-name' resets to nil.</span>
    (user-file-pred                     icicle-file-predicate)
    (icicle-file-predicate              (if user-file-pred
                                            (lambda (f) <span class="linecomment">; FREE here: USER-FILE-PRED.</span>
                                              (and (file-directory-p f)  (funcall user-file-pred f)))
                                          #'file-directory-p))
    (icicle-comp-base-is-default-dir-p  t)
    <span class="linecomment">;; $$$$$ (icicle-dir-candidate-can-exit-p (not current-prefix-arg))</span>
    ))
  (progn (icicle-bind-file-candidate-keys) <span class="linecomment">; First code</span>
         (when icicle-proxy-candidates (put-text-property 0 1 'icicle-fancy-candidates t prompt)))
  nil                                   <span class="linecomment">; Undo code</span>
  (prog1 (setq dir-names  (nreverse (delete "<span class="quote"></span>" dir-names))) <span class="linecomment">; Last code - return the list of dirs</span>
    (icicle-unbind-file-candidate-keys)
    (setq icicle-proxy-candidates  ())
    (when (interactive-p) (message "<span class="quote">Directories: %S</span>" dir-names))))


<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'icicles-cmd1)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; icicles-cmd1.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=icicles-cmd1.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_icicles-cmd1.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=icicles-cmd1.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=icicles-cmd1.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=icicles-cmd1.el">Administration</a></span><!-- test --><span class="time"><br /> Last edited 2013-01-06 23:39 UTC by <a class="author" title="from c-71-202-147-44.hsd1.ca.comcast.net" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=icicles-cmd1.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
