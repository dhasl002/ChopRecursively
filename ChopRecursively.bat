@echo off
call :treeProcess
goto :eof

:treeProcess
for %%f in (*.mrc) do (
	for %%g in (*.pdb) do (
		if %%~nf == %%~ng (
			echo %%~ff
			Z:\CBL-master\CBL-master\Debug\cropMRCFromPDB.exe  %%~ff %%~fg "5" %%~ff "Z:\test.mrc"
		)
	)
)
for /D %%d in (*) do (
    cd %%d
    call :treeProcess
    cd ..
)
exit /b