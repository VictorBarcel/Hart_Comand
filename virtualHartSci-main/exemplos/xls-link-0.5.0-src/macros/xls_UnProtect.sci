// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function ret = xls_UnProtect(password)
    ret = xls_callMethod("Worksheet", "Unprotect", list(password));
    if ret == %f then
        error(999, msprintf(_("%s: Unable to upprotect current worksheet"), "xls_UnProtect"));
    end
endfunction
// =============================================================================
