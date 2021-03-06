// ====================================================================
// Allan CORNET
// DIGITEO 2008 - 2010
// ====================================================================
// <-- TEST WITH GRAPHIC --> 
// ====================================================================


r = xls_NewExcel();
assert_checktrue(r);

r = xls_AddWorkbook();
assert_checktrue(r);

r = xls_SetWorksheet(1);
assert_checktrue(r);

r = xls_SelectRange("A1");
assert_checktrue(r);

scf(0);
plot2d();
xs2bmp(0, TMPDIR + '/foo.bmp');
close();

assert_checktrue(isfile(TMPDIR + '/foo.bmp'));

r = xls_SetVisible(%t);
assert_checktrue(r);;

r = xls_SetPic(TMPDIR + '/foo.bmp', [10 10 200 200]);
assert_checktrue(r);

r = xls_SetVisible(%f);
assert_checktrue(r);;

r = xls_SetSave(%t);
assert_checktrue(r);;
r = xls_Close();
assert_checktrue(r);;

r = xls_Quit();
assert_checktrue(r);;
