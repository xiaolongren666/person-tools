@echo off
::输出explorer.exe进程信息
　　tasklist /fi "imagename eq explorer.exe" > E:\xlr.txt
::获取第3行数据
      	 for /f "skip=3 delims=" %%a in (E:\xlr.txt) do (
       	set txt=%%~a
	goto :Show
	)
	:Show
	echo %txt%
::开启延迟变量
	setlocal enabledelayedexpansion
::定义延迟变量
	set /a v=0
::获取PID
	for %%i in (%txt%) do (
		if !v! equ 1 (
		set PID=%%i
		goto :end
		)
		
		set /a v+=1
	echo %%i
	)
	:end
::强制杀死进程
	taskkill /pid %PID% -t -f
　　pause