// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- CLI SHELL MODE -->
// ====================================================================

assert_checktrue(xls_NewExcel());

assert_checktrue(xls_AddWorkbook());
assert_checktrue(xls_SetWorksheet(1));
assert_checktrue(xls_SetData("A2:B3", 1.3));

assert_checktrue(xls_SetSave(%t));

xls_path = TMPDIR + "/xls_SaveAs.xls";
assert_checktrue(xls_SaveAs(xls_path));
assert_checktrue(isfile(xls_path));

protected_xls_path = TMPDIR + "/xls_SaveAs_password.xls";
assert_checktrue(xls_SaveAs(protected_xls_path, "123"));
assert_checktrue(isfile(protected_xls_path));

assert_checktrue(xls_Close());

// this throw an excel popup error
// assert_checkfalse(execstr('xls_Open(protected_xls_path)', 'errcatch') == 0);
//assert_checktrue(xls_Close());

assert_checktrue(xls_Open(protected_xls_path, "123"));
assert_checktrue(xls_Close());

assert_checktrue(xls_Quit());

