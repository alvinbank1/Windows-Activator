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
title Windows Activator Version 0.1
echo WINDOWS ACTIVATOR Version 0.1
echo.
echo 계속하려면 "y"를 입력하세요
set /p "enter=>"
if %enter%== y goto continue
if not "%enter%"==y goto no

:no
cls
echo Alright.
echo 아무키를 누르면 종료됩니다.
pause>nul
exit

:continue
cls
echo 이용약관
echo.
echo 이용약관에는 중요한 정보가 포함되어 있습니다. 이를 인지하지 못하여 발생하는 불이익에 대해서는 저희는 책임을 지지 않습니다.
echo.
echo 이용약관에 동의합니까?
echo "y"를 입력하면 이용약관에 동의하는 것으로 간주합니다.
echo 이용 약관을 표시하려면 "t"를 입력하세요.
set /p "termsofuse=>"
if %termsofuse%== y goto select
if %termsofuse%== t goto termsofuse
if not "%termsofuse%"==y goto no

:select
cls
echo Windows 에디션을 선택하세요.
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
echo "5. Pro"를 적극 권장합니다..
echo 자신만의 키를 사용하고 싶다면 "11. Custom Activation"를 선택하세요.
echo 아니면 "0" 을 입력해 종료하세요.
set /p "edition=>"
if %edition%== 0 goto no
if %edition%== 1 goto home
if %edition%== 11 goto custom

:unknown
cls
echo 알 수 없는 에디션이거나 아직 지원되지 않는 에디션입니다.
echo.
echo 아무키나 눌러 다시 시도하세요.
pause>nul
goto select

:termsofuse
cls
echo ----------------------------------------------------------------------------------
echo 이용약관
echo Windows Activator를 사용하는 모든 사용자는 본 이용 약관에 동의해야 합니다.
echo 동의를 거부하실 수 있으나, 이 경우, 서비스 이용이 제한될 수 있습니다.
echo 이러한 이용 약관은 다운로드 사이트(깃 허브)에도 명시되어 있습니다.
echo 저희는 이용약관을 읽지 않은 것에 대해 책임을 지지 않습니다.
echo 본 이용약관은 여러 언어로 번역될 수 있습니다. 이 경우 언어별 식별 문제가 발생할 수 있으므로 영문 번역을 기준으로 사용합니다.
echo 본 프로그램을 사용하여 발생한 문제에 대해서는 당사에서는 책임을 지지 않습니다. (예시: 이 프로그램을 사용하여 기존 정품 인증이 해제되었습니다.)
echo.
echo * 알림: 본 이용약관은 아직 완성되지 않았습니다. 나중에 추가될 예정입니다.
echo ----------------------------------------------------------------------------------


echo.
pause
goto continue

:complete
cls
echo Windows 정품인증 성공!
echo. 
echo Windows 정품인증이 완료되었습니다.
echo 만약 Windows가 정품인증되지 않았다면 프로그램을 다시 켜서 다시 실행해 주세요.
echo Windows가 정품인증되었는지 모르겠다면 "i"를 입력하세요.
echo "y"를 눌러 계속합니다.
set /p "activate=>"
if %activate%== y goto done
if %activate%== i goto check

:error
cls
color 4f
echo 오류 발생!
echo.
echo 오류 로그:
echo %output%
echo.
echo 나중에 다시 시도해 주세요.
echo 계속 이 문제가 발생한다면 Github에 신고해 주세요.
echo.
echo 아무키를 누르면 종료됩니다.
pause>nul
exit

:done
cls
echo Windows Activator을 사용해주셔서 감사합니다.
echo 아무키를 누르면 종료됩니다.
pause>nul
exit

:check
cls
echo 정보 불러오는 중...
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /xpr')Do Set "info2=%%A"
cls
cscript //nologo "%windir%\system32\slmgr.vbs" /dlv
echo.
echo %info2%
echo.
echo 계속하려면 아무키나 누르세요.
pause>nul
goto 완료


:home
cls
echo Windows Home Edition
echo ------------Logs------------
echo 
echo "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99" 키 사용 중...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
goto error
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo Windows Home Edition
echo ------------Logs------------
echo 정품인증이 시작되었습니다
echo "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99" 키 사용 중... (완료)
echo 인증 서버를 KMS(kms8.msguides.com) 로 설정 중...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /skms kms8.msguides.com')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /skms kms8.msguides.com
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo Windows Home Edition
echo ------------Logs------------
echo 정품인증이 시작되었습니다
echo "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99" 키 사용중... (완료)
echo 인증 서버를 KMS(kms8.msguides.com) 로 설정 중... (완료)
echo Activating Windows...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /ato')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /ato
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo ------------Logs------------
echo 정품인증이 시작되었습니다
echo "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99" 키 사용 중... (완료)
echo 인증 서버를 KMS(kms8.msguides.com) 로 설정 중... (완료)
echo Activating Windows... (완료)
echo 완료!
echo -----------------------------
echo 계속하려면 아무 키나 누르세요...
pause>nul
goto 완료

:custom
cls
echo 정품인증 키를 입력하세요...
set /p "key=>"
cls
echo 인증 서버를 입력하세요...
echo 인증 서버를 모르거나, 기본 KMS 서버를 이용하고 싶으면 "kms8.msguides.com" 를 입력하세요.
set /p "server=>"
cls
echo Custom Key
echo ------------Logs------------
echo 정품인증이 시작되었습니다
echo "%key%" 키 사용 중...
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
echo 정품인증이 시작되었습니다
echo "%key%" 키 사용 중... (완료)
echo 인증 서버를 %server% 로 설정중...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /skms %server%')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /skms %server%
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo Custom Key
echo ------------Logs------------
echo 정품인증이 시작되었습니다
echo "%key%" 키 사용 중... (완료)
echo 인증 서버를 %server% 로 설정중... (완료)
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
echo 정품인증이 시작되었습니다
echo "%key%" 키 사용 중... (완료)
echo 인증 서버를 %server% 로 설정중... (완료)
echo Activating Windows... (완료)
echo 완료!
echo -----------------------------
echo 계속하려면 아무 키나 누르세요...
pause>nul
goto complete
