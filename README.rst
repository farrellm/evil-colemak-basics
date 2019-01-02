======================
evil-colemak-basics.el
======================

This Emacs package provides basic key bindings for evil-mode_
optimized for the Colemak_ keyboard layout.

.. _evil-mode: https://bitbucket.org/lyro/evil/
.. _Colemak: https://colemak.com/

This packages modifies the original evil-colemak-basics.el to
match vim-colemak.  For bindings, see https://github.com/jooize/vim-colemak

Installation
============

Put the Elisp file somewhere in your loading path and load it explicitly::

  (require 'evil-colemak-basics)

Usage
=====

To enable globally, use::

  M-x global-evil-colemak-basics-mode RET

To enable for just a single buffer, use::

  M-x evil-colemak-basics-mod RET

To enable permanently, put this in your ``init.el``::

  (global-evil-colemak-basics-mode)

When enabled, a lighter showing ``hnei`` will appear in your mode
line. If you don't like it, use ``rich-minority`` or ``diminish`` to
hide it.

Note that this package assumes that your operating system is properly
configured for the Colemak keyboard layout. It does not implement the
Colemak layout on top of a Qwerty layout.

Credits
=======

These bindings were inspired by a similar configuration for Vim and
other software by James Pike, available from
https://github.com/ohjames/colemak

Framework from
https://github.com/wbolster/evil-colemak-basics

Keybindings from
https://github.com/jooize/vim-colemak
