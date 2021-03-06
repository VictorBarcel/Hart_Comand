// Copyright (C) 2008 - 2010 - Michael Baudin
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//
// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

// Update the help of this module.

helpdir = fullfile(TMPDIR, "help", "en_US");
mkdir(helpdir);

funmat = [
    "helptbx_helpupdate"
    "helptbx_iscontentupdte"
    "helptbx_updtifneeded"
];

path = helptbx_getpath ();
macrosdir = fullfile(path, "macros");
modulename = "helptbx";

mputl("", fullfile(helpdir, "helptbx_helpupdate.xml"));
mputl("", fullfile(helpdir, "helptbx_iscontentupdte.xml"));
mputl("", fullfile(helpdir, "helptbx_updtifneeded.xml"));
[nbxmlfiles, isdemgwutd] = helptbx_helpupdate(funmat, helpdir, macrosdir, [], modulename, %t);
assert_checkequal(nbxmlfiles, 3);
assert_checkequal(isdemgwutd, []);

[nbxmlfiles, isdemgwutd] = helptbx_helpupdate(funmat, helpdir, macrosdir, [], modulename);
assert_checkequal(nbxmlfiles, 0);
assert_checkequal(isdemgwutd, []);


demosdir = fullfile(path, "demos");
[nbxmlfiles, isdemgwutd] = helptbx_helpupdate(funmat, helpdir, macrosdir, demosdir, modulename);
assert_checkequal(nbxmlfiles, 0);
assert_checkequal(isdemgwutd, %t);

