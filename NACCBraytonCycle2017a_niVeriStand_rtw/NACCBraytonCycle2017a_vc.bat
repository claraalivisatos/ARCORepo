:: --------------------------------------------------------
:: This file was generated by NI VeriStand Model Framework
:: Version : 2017.0.1.0 (2017 f1)
:: Generated on : 06-Mar-2019 17:31:11
:: --------------------------------------------------------

set MATLAB=C:\Program Files\MATLAB\R2017a
set VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\
call "C:\VeriStand\2017\ModelInterface\tmw\toolchain\nivs_vcvars32_100.bat"
@if errorlevel 1 goto error_exit


:make
cd /d %~dp0
nmake -f NACCBraytonCycle2017a.mk  ISPROTECTINGMODEL=NOTPROTECTING NIDEBUG=0 NIOPT="Default" OPTS="" /I

 
@if errorlevel 1 goto error_exit
exit /B 0

:error_exit
echo The make command returned an error of %errorlevel%
An_error_occurred_during_the_call_to_make
