# tmsu4spacefm
Plugins for SpaceFM to add TMSU support

Summary
========

tmsu4spacefm collects various plugins that make it easier to use TMSU with SpaceFM.

* The most important one is **Paste**. This is an action that you can replace SpaceFM's default 'Paste' action with.
Installing this plugin makes Cut/Copy/Paste TMSU-aware : when files are transferred, so are their tags.

* There is no need to replace Copy or Cut actions; the default Copy and Cut actions just set variables that are later read by **Paste**.

* Note that while Paste for TMSU is derived from IG's Paste Into plugin, the 'paste into' functionality was removed,
so pasted files always go into the current directory, just like vanilla Paste. If you want this functionality,
it is fairly simple to add it back in -- see the link to Paste Into below.


Installing plugins
===================

Plugins are provided in both packed (pkg/) and unpacked (src/) form.
Typically, you will install a plugin using the `Plugins->Import->File` action in SpaceFM's main menu bar.

Currently released plugins
===========================

* Paste Tags

See below for details of plugins.


Details on individual plugins
------------------------------

Tag
====
Add and/or remove tags. Works on the currently selected files and directories.
Requires [lhtag](http://github.com/0ion9/lhtag

Re-tag
=======
Re-apply the last tagset applied using Tag. Note that last-tagset is stored per TMSU database, not globally.

Paste
======

**Suggested location**: Top level of context menu, replacing standard 'Paste' item.

TMSU-aware Paste action, suitable for replacing the built-in Paste. If you opt to replace the built-in Paste, remember
to hide the built-in Paste from the menus (via a context rule that is never true, such as 'show if directory == ""')

Paste Tags
===========

**Suggested location**: Actions/, under other 'Paste ' actions

Applies either:

 * the tags of the cut/copied files, if there are any, or
 * any *pre-defined* tags present in the clipboard text
   * for example, if your tmsu database already includes tags 'foo bar', but not 'baz',
     applying 'Paste Tags' with 'foo baz bar' on the clipboard will only apply the tags 'foo bar'.


Rename
=======

TMSU-aware Rename function.
I found this a suitable replacement for the built-in Rename,
but be aware that the built-in Rename has [a lot of extra functionality](http://ignorantguru.github.io/spacefm/spacefm-manual-en.html#gui-rename).

Batch Rename
=============

Wrapper for `thunar -B` (batch renamer) that autodetects what renames were done, and updates the TMSU database accordingly.


Delete
=======

TMSU-aware Delete function


License
========

All plugins except Paste and Paste Tags are licensed under [MIT License](LICENSE). Paste and Paste Tags are licensed as [GPLv2](LICENSE_GPL2), as they are derived from [IgnorantGuru's
"Paste Into" plugin](https://github.com/IgnorantGuru/spacefm-plugins/wiki#ig-paste-into).