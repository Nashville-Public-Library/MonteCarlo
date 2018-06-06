; CARLX.au3
; James Staub, Nashville Public Library

; INCLUDES
#include <config.pwd.au3>

; FUNCTIONS

Func ClickAt( $x, $y )
	MouseClick( "left", $x, $y, 1, 0 )
	Sleep(400)  ;add pause after clicking mouse
EndFunc

Func CarlXStaffOpen($sCarlUserBranchByte)
	; Staff.exe ARGV: username password instbit branchbyte [envnumber is listed in shell help, but ain't actually taken]
	Run("C:\Program Files\CarlX\Live\Staff.exe " & $sCarlUser & " " & $sCarlUserPassword & " " & $sCarlUserInstbit & " " & $sCarlUserBranchByte)
	WinWait("Error", "Staff App already running", 5)
	If WinExists("Error", "Staff App already running") Then
		MsgBox(0,"WARNING","WARNING: Carl.X Staff Workstation is already running on this computer. Finish your work there, close the Staff client, and try running this script again.")
		Exit
	EndIf
	WinWait("Staff Workstation")
	WinActivate("Staff Workstation")
EndFunc

Func CarlXStaffClose()
	WinActivate("Staff Workstation")
	Send("!f"); Menu > File
	Send("x"); Exit
	WinWaitClose("Staff WorkStation")
EndFunc

Func RemoteDesktopOpen( $computer )
	Run("mstsc /v:" & $computer)
EndFunc

; JAVA windows don't play nice with AutoIT... might be best to avoid SQLDeveloper in favor of another SQL client...
;~ or maybe https://www.autoitscript.com/forum/topic/37381-connect-oracle/
;~ or https://www.autoitscript.com/forum/topic/191124-need-help-for-db-connection/?do=findComment&comment=1372464
;~ or https://www.autoitscript.com/wiki/User_Defined_Functions#Databases_and_web_connections
Func SQLDeveloperOpen()
	Run("C:\oracle\product\11.2.0\client_1\sqldeveloper\sqldeveloper\bin\sqldeveloperW.exe")
	; User Access Control response required?
	WinWait("Oracle SQL Developer")
EndFunc