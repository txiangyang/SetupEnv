#Space:: Run "B:\Apps\Everything\Everything.exe"
Return

#P:: 
Run "B:\Apps\Shortcuts\PowerShell 6.lnk"
Return

^#F:: Run "B:\Apps\Mozilla Firefox\firefox.exe"
Return

^+J::
tempFile = %A_Temp%\preFormat.json
formatedFile = %A_Temp%\postFormat.json
clipboard = 
Send ^c
ClipWait
FileDelete, %tempFile%
FileAppend, %clipboard%, %tempFile%
RunWait, %ComSpec% /c py -m json.tool %tempFile% > %formatedFile%, , hide
RUN "C:\tools\vim\vim82\gvim.exe" --remote-tab-silent %formatedFile%, ,MAX
FileRead, clipboard, %formatedFile% 
return