@echo off
title 로딩...
 :: BatchGotAdmin
 :-------------------------------------
 REM  --> Check for permissions
 >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
 if '%errorlevel%' NEQ '0' (
     echo 관리자 권한을 요청하는 중입니다... "예" 를 눌러주세요.
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
echo 계속하려면 "y"를 입력하세요.
set /p "enter=>"
if %enter%== y goto continue
if not "%enter%"==y goto no

:no
cls
echo 종료하려면 아무 키나 누르세요.
pause>nul
exit

:continue
cls
echo 이용 약관
echo.
echo 이용약관에는 중요한 정보가 포함되어 있습니다. 이를 인지하지 못하여 발생하는 불이익에 대해서는 저희는 책임을 지지 않습니 다.
echo.
echo 이용약관에 동의합니까?
echo "y"를 입력하면 이용약관에 동의하는 것으로 간주합니다.
echo 이용 약관을 표시하려면 "t"를 입력하세요.
set /p "termsofuse=>"
if %termsofuse%== y goto mode
if %termsofuse%== t goto termsofuse

:mode
color 1f
cls
echo 모드를 선택하세요.
echo.
echo 1. 키 설치
echo 2. 정품인증 취소
echo 3. 정품인증 정보
echo.
echo Windows를 정품인증하려면 "1"을 입력하세요.
echo 정품인증을 취소하려면 "2"를 입력하세요.
echo 정보를 표시하려면, "3"을 입력하세요.
echo.
set /p "mode=>"
if %mode%== 1 goto select
if %mode%== 2 goto deactivate
if %mode%== 3 goto info
goto mode

:info
cls
echo 정보 불러오는 중...
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /xpr')Do Set "info2=%%A"
cls
cscript //nologo "%windir%\system32\slmgr.vbs" /dlv
echo.
echo %info2%
echo.
echo 계속하려면 아무 키나 누르세요.
pause>nul
goto mode

:deactivate
cls
echo Windows 정품인증을 취소하겠습니까?
echo.
echo "y"를 입력하여 계속하세요.
echo "n"을 입력하여 취소합니다.
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
echo 정품인증 취소 성공! (정보를 저장하려면 컴퓨터를 다시시작 해야 합니다)
echo.
echo "y"를 누르면 종료합니다, "i"를 누르면 정보를 표시합니다.
set /p "info=>"
if %info%== i goto deinfo
if not %info%== i exit

:deinfo
cls
echo 정보 불러오는 중...
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /xpr')Do Set "info2=%%A"
cls
cscript //nologo "%windir%\system32\slmgr.vbs" /dlv
echo.
echo %info2%
echo.
echo 계속하려면 아무 키나 누르세요.
pause>nul
goto deactivatey

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
echo "5. Pro"를 사용하는것을 적극 권장합니다.
echo 자신만의 키를 사용하고 싶다면 "11. Custom Activation"을 입력하세요.
echo 또는 "0"을 입력하여 메뉴로 돌아갑니다.
set /p "edition=>"
if %edition%== 0 goto menu
if %edition%== 1 goto home
if %edition%== 5 goto pro
if %edition%== 7 goto education
if %edition%== 11 goto custom

:unknown
cls
echo 알 수 없는 에디션이거나 지원되지 않습니다. 다시 시도 하십시오.
echo.
echo 다시 선택하려면 아무 키나 누르세요...
pause>nul
goto select

:termsofuse
cls
echo ----------------------------------------------------------------------------------
echo 이용 약관
echo Windows Activator를 사용하는 모든 사용자는 본 이용 약관에 동의해야 합니다.
echo 동의를 거부하실 수 있으나, 이 경우, 서비스 이용이 제한될 수 있습니다.
echo 이러한 이용 약관은 다운로드 사이트(깃 허브)에도 명시되어 있습니다.
echo 저희는 이용약관을 읽지 않은 것에 대해 책임을 지지 않습니다.
echo 본 이용약관은 여러 언어로 번역될 수 있습니다. 이 경우 언어별 식별 문제가 발생할 수 있으므로 영문 번역을 기준으로 사용합니다.
echo.
echo 본 프로그램을 사용하여 발생한 문제에 대해서는 당사에서는 책임을 지지 않습니다. (예시: 이 프로그램을 사용하여 기존 정품  인증이 해제되었습니다.)
echo.
echo * 알림: 본 이용약관은 아직 완성되지 않았습니다. 나중에 추가될 예정입니다.
echo ----------------------------------------------------------------------------------
echo.
pause
goto continue

:complete
cls
echo Windows 정품인증 완료.
echo. 
echo Windows 정품인증이 완료되었습니다.
echo 만약 Windows가 정품인증이 되지 않았다면, 프로그램을 재실행해서 다시 시도하세요.
echo 만약 Windows가 정품인증되었는지 잘 모르겠다면 "i"를 입력해 주세요.
echo 계속하려면 "y"를 입력하세요.
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
echo 나중에 다시 시도 해주세요.
echo 계속 이 문제가 발생한다면, Github에 신고하세요.
echo.
echo 다시 시작하려면 아무 키나 누르세요.
pause>nul
goto mode

:done
cls
echo Windows Activator를 사용해주셔서 감사합니다.
echo 메뉴로 돌아가려면 아무 키나 누르세요.
pause>nul
goto menu

:check
cls
echo 정보 불러오는 중...
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /xpr')Do Set "info2=%%A"
cls
cscript //nologo "%windir%\system32\slmgr.vbs" /dlv
echo.
echo %info2%
echo.
echo 계속하려면 아무 키나 누르세요.
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
echo ------------로그------------
echo 정품인증 시작됨
echo "%skey%" 키 사용중...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /ipk %skey%')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /ipk %skey%
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo %sedition%
echo ------------로그------------
echo 정품인증 시작됨
echo "%skey%" 키 사용중... (완료)
echo 정품인증 서버를 KMS(kms8.msguides.com)로 설정 중...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /skms kms8.msguides.com')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /skms kms8.msguides.com
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo %sedition%
echo ------------로그------------
echo 정품인증 시작됨
echo "%skey%" 키 사용중... (완료)
echo 정품인증 서버를 KMS(kms8.msguides.com)로 설정 중... (완료)
echo Windows 정품인증 중...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /ato')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /ato
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo %sedition%
echo ------------로그------------
echo 정품인증 시작됨
echo "%skey%" 키 사용중... (완료)
echo 정품인증 서버를 KMS(kms8.msguides.com)로 설정 중... (완료)
echo Windows 정품인증 중... (완료)
echo 완료!
echo -----------------------------
echo 계속하려면 아무 키나 누르세요...
pause>nul
goto complete

:custom
cls
echo 정품인증 키를 입력하세요...
set /p "key=>"
cls
echo 정품인증 서버를 입력하세요...
echo 정품인증 서버를 모르거나, 기본 KMS 서버를 사용하고 싶다면, "kms8.msguides.com"을 입력하세요.
set /p "server=>"
cls
echo 커스텀 키
echo ------------로그------------
echo 정품인증 시작됨
echo "%key%" 키 사용중...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /ipk %key%')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /ipk %key%
echo %errorlevel%
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo 커스텀 키
echo ------------로그------------
echo 정품인증 시작됨
echo "%key%" 키 사용중... (완료)
echo 정품인증 서버를 %server%로 설정 중...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /skms %server%')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /skms %server%
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo 커스텀 키
echo ------------로그------------
echo 정품인증 시작됨
echo "%key%" 키 사용중... (완료)
echo 정품인증 서버를 %server%로 설정 중... (완료)
echo Windows 정품인증 중...
echo -----------------------------
For /F Delims^=^ EOL^= %%A In ('cscript //nologo "%windir%\system32\slmgr.vbs" /ato')Do Set "output=%%A"
cscript //nologo "%windir%\system32\slmgr.vbs" /ato
if not "%errorlevel%" == "0" (
	goto error
)
cls
echo 커스텀 키
echo ------------로그------------
echo 정품인증 시작됨
echo "%key%" 키 사용중... (완료)
echo 정품인증 서버를 %server%로 설정 중... (완료)
echo Windows 정품인증 중... (완료)
echo 완료!
echo -----------------------------
echo 계속하려면 아무 키나 누르세요...
pause>nul
goto complete
