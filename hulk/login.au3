;;Логин
Func login()
   WinActivate("EVE")
   IF WinActive("EVE") Then
	  Sleep(5000)
	  $wnd = WinGetPos("EVE")
	  ;MsgBox( 0, "EVE", $windows_size[0] & $windows_size[1] & $windows_size[2] & $windows_size[3])
	  ;Send("{Ljvbyfnjh08}")
	  Send("Ljvbyfnjh08")
	  Send("{ENTER}")
	  While 1
		 $z = PixelSearch( $wnd[0], $wnd[1], $wnd[0]+$wnd[2], $wnd[1]+$wnd[3], $Corp_flag, $disp)
		 If IsArray( $z ) Then
			ExitLoop
			;MsgBox( 0, "EVE", "Color Exist")
		 EndIf
		 sleep(500)
	  WEnd
	  Send("{ENTER}")
   ENDIF
EndFunc