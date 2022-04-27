// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Antoine ELIAS
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
function ret = xls_GetFont(fontProperty)
    if ~exists("fontProperty") then
        fontProperty = "name"
    end

    ret = xls_getProperty("Range", "Font", fontProperty);
    if convstr(fontProperty,"l") == "underline" then
        if ret == 2 then
            ret = %t;
        elseif ret == -4142 then
            ret = %f;
        end
    end
endfunction
// =============================================================================
