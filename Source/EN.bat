@echo off
title Loading...
 :: BatchGotAdmin
 :-------------------------------------
 REM  --> Check for permissions
 >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
 if '%errorlevel%' NEQ '0' (
     echo Requesting admin permission... Please Press "Yes".
     goto UACPrompt
 ) else ( goto gotAdmin )

:UACPrompt
     echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
     echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
     exit /B

:gotAdmin
     if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
     pushd "%CD%"
     CD /D "%~dp0"
 :--------------------------------------
color 1f
title Windows Activator Version 0.2
echo WINDOWS ACTIVATOR Version 0.2
echo.
echo Enter "y" to continue.
set /p "enter=>"
if %enter%== y goto continue
if not "%enter%"==y goto no

:no
cls
echo Press any key to exit.
pause>nul
exit

:continue
cls
echo Terms of Use
echo.
echo The Terms of Use contain important information. We are not responsible for any disadvantages arising from not being aware of this.
echo.
echo Do you agree to the Terms of Use?
echo By entering "y" you agree to our Terms of Use.
echo Enter "t" to show Terms of Use.
set /p "termsofuse=>"
if %termsofuse%== y goto mode
if %termsofuse%== t goto termsofuse

:mode
color 1f
cls
echo Select Mode
echo.
echo 1. Install Key
echo 2. Revoke Key
echo 3. Activation Information
echo.
echo If you want to activate windows, input "1".
echo If you want to deactivate windows, input "2".
echo If you want to show information, input "3".
echo.
set /p "mode=>"
if %mode%== 1 goto select
if %mode%== 2 goto deactivate
if %mode%== 3 goto info
goto mode

:info
cls
echo Loading Information...
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /xpr')Do Set "info2=%%A"
cls
cscript //nologo "%windir%\system32\slmgr.vbs" /dlv
echo.
echo %info2%
echo.
echo Press any key to continue.
pause>nul
goto mode

:deactivate
cls
echo Do you want to revoke Windows?
echo.
echo Input y to continue.
echo Input n to cancel.
echo.
set /p "revoke=>"
if %revoke%== y goto deactivatey
if not %revoke%== y goto mode

:deactivatey
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /cpky')Do Set "output=%%A"
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo Revoke Success! (You need to restart your computer to save your information)
echo.
echo Input "y" to exit, Input "i" to show information.
set /p "info=>"
if %info%== i goto deinfo
if not %info%== i exit

:deinfo
cls
echo Loading Information...
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /xpr')Do Set "info2=%%A"
cls
cscript //nologo "%windir%\system32\slmgr.vbs" /dlv
echo.
echo %info2%
echo.
echo Press any key to continue.
pause>nul
goto deactivatey

:select
cls
echo Select Windows Edition.
echo.
echo 1. Home
echo 2. Home N
echo 3. Home Single Language
echo 4. Home Country Specific
echo 5. Pro
echo 6. Pro N
echo 7. Education
echo 8. Education N
echo 9. Enterprise
echo 10. Enterprise N
echo 11. Custom Activation
echo.
echo We highly Recommend using "5. Pro".
echo If you want to use your own KMS key, Please use "11. Custom Activation".
echo or enter "0" to go to menu.
set /p "edition=>"
if %edition%== 0 goto menu
if %edition%== 1 goto home
if %edition%== 5 goto pro
if %edition%== 7 goto education
if %edition%== 11 goto custom

:unknown
cls
echo Unknown Edition or Unsupported. Please try again.
echo.
echo Press any key to select again...
pause>nul
goto select

:termsofuse
cls
echo ----------------------------------------------------------------------------------
echo Terms of Use
echo All users using Windows Activator must agree to these Terms of Use.
echo You may refuse consent, but your use of the service may be restricted.
echo These terms and conditions are also stated on the download site.
echo We are not responsible for not reading the Terms of Use.
echo These Terms of Use may be translated into several languages. In this case, language-specific identification problems may occur, so the English translation is used as the standard.
echo.
echo We are not responsible for any problems caused by using this program. (Example: Existing Windows activation was unlocked using a program.)
echo.
echo * Notice: These Terms of Use are not yet complete. It will be added later.
echo ----------------------------------------------------------------------------------
echo.
pause
goto continue

:complete
cls
echo Windows activate Done.
echo. 
echo Windows activate has been completed.
echo If the Windows is not activated, please run the program again and try again.
echo If you are not sure whether the Windows has been activated, please enter "i".
echo Press "y" to continue.
set /p "activate=>"
if %activate%== y goto done
if %activate%== i goto check

:error
cls
color 4f
echo An error occurred!
echo.
echo Error Log:
echo %output%
echo.
echo Please try again later.
echo If you continue to see this message, please report it to Github.
echo.
echo Press any key to start again.
pause>nul
goto mode

:done
cls
echo Thank you for using Windows Activator.
echo Press any key to go to menu.
pause>nul
goto menu

:check
cls
echo Loading Information...
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /xpr')Do Set "info2=%%A"
cls
cscript //nologo "%windir%\system32\slmgr.vbs" /dlv
echo.
echo %info2%
echo.
echo Press any key to continue.
pause>nul
goto complete

:home
set skey=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
set sedition=Windows Home Edition
goto activate

:pro
set skey=W269N-WFGWX-YVC9B-4J6C9-T83GX
set sedition=Windows Pro Edition
goto activate

:education
set skey=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
set sedition=Windows Education Edition
goto activate

:activate
cls
echo %sedition%
echo ------------Logs------------
echo Activate Started
echo Using key "%skey%"...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /ipk %skey%')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /ipk %skey%
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo %sedition%
echo ------------Logs------------
echo Activate Started
echo Using key "%skey%"... (Complete)
echo Setting activation server to KMS(kms8.msguides.com)...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /skms kms8.msguides.com')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /skms kms8.msguides.com
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo %sedition%
echo ------------Logs------------
echo Activate Started
echo Using key "%skey%"... (Complete)
echo Setting activation server to KMS(kms8.msguides.com)... (Complete)
echo Activating Windows...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /ato')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /ato
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo %sedition%
echo ------------Logs------------
echo Activate Started
echo Using key "%skey%"... (Complete)
echo Setting activation server to KMS(kms8.msguides.com)... (Complete)
echo Activating Windows... (Complete)
echo Complete!
echo -----------------------------
echo Press Any key to continue...
pause>nul
goto complete

:custom
cls
echo Please enter the product key...
set /p "key=>"
cls
echo Please enter the activation server...
echo If you don't know the activation server or If you want to use Default KMS server, type "kms8.msguides.com".
set /p "server=>"
cls
echo Custom Key
echo ------------Logs------------
echo Activate Started
echo Using key "%key%"...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /ipk %key%')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /ipk %key%
echo %errorlevel%
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo Custom Key
echo ------------Logs------------
echo Activate Started
echo Using key "%key%"... (Complete)
echo Setting activation server to %server%...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /skms %server%')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /skms %server%
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo Custom Key
echo ------------Logs------------
echo Activate Started
echo Using key "%key%"... (Complete)
echo Setting activation server to %server%... (Complete)
echo Activating Windows...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /ato')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /ato
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo Custom Key
echo ------------Logs------------
echo Activate Started
echo Using key "%key%"... (Complete)
echo Setting activation server to %server%... (Complete)
echo Activating Windows... (Complete)
echo Complete!
echo -----------------------------
echo Press Any key to continue...
pause>nul
goto complete
