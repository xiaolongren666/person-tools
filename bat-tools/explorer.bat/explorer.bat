@echo off
::���explorer.exe������Ϣ
����tasklist /fi "imagename eq explorer.exe" > E:\xlr.txt
::��ȡ��3������
      	 for /f "skip=3 delims=" %%a in (E:\xlr.txt) do (
       	set txt=%%~a
	goto :Show
	)
	:Show
	echo %txt%
::�����ӳٱ���
	setlocal enabledelayedexpansion
::�����ӳٱ���
	set /a v=0
::��ȡPID
	for %%i in (%txt%) do (
		if !v! equ 1 (
		set PID=%%i
		goto :end
		)
		
		set /a v+=1
	echo %%i
	)
	:end
::ǿ��ɱ������
	taskkill /pid %PID% -t -f
����pause