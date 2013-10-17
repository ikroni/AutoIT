Func undock()
   IF NOT WinActive("EVE") Then
	  WinActivate("EVE")
   Else
	  $wnd = WinGetPos("EVE")
	  While 1
		 $z = PixelSearch( $wnd[0], $wnd[1], $wnd[0]+$wnd[2], $wnd[1]+$wnd[3], $Undock, $disp)
		 If IsArray( $z ) Then
			MouseClick("left", $z[0], $z[1])
			ExitLoop
			;MsgBox( 0, "EVE", "Color Exist")
		 EndIf
		 sleep(500)
	  WEnd
   EndIf
EndFunc