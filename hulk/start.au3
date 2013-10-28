;;; Запуск EVE
Func start_eve()
   If Not WinExists("EVE") Then
	  Run("D:\gms\EVE\bin\exefile.exe")
	  ;MsgBox( 0, "EVE", "EVE STARTED SUCCESSFUL")
	  WinWaitActive("EVE")
	  Sleep(1000)
   Else
	  $a = WinGetTitle("EVE")
	  If $a <> "EVE" Then
		 Run("D:\gms\EVE\bin\exefile.exe")
		 WinWaitActive("EVE")
		 Sleep(1000)
		 ;;MsgBox( 0, "EVE", "EVE STARTED SUCCESSFUL")
	  EndIf
   ;;MsgBox( 0, "EVE", "EVE NOT STARTED, BECOSE THEY STARTED EARLY " & $a)
   EndIf
EndFunc