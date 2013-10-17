Opt("CaretCoordMode", 2)
Opt("MouseCoordMode", 2)
Opt("PixelCoordMode", 2)
HotKeySet("{ESC}","Terminate")
WinActivate("EVE")
#include "cargo.au3"
#include "menu.au3"
#include "station.au3"
while 1
   WinActivate("EVE")
$res_cargo = Check_cargo()
$res_ore = Check_ore()
$res_hangar = Check_hangar()
;MsgBox(0,"1", $res_cargo & " " & $res_ore & " " &  $res_hangar)
$res_st = Check_st()
   if $res_st <> 1 Then
	  If $res_hangar == 1 Then
		 If $res_ore == 0 Then
			Move_ore()
		 ElseIf $res_cargo == 0 Then
			Move_cargo()
		 EndIf
	  EndIf
	  If $res_hangar == 1 And $res_ore == 1 And $res_cargo == 1 Then
		 $res = Check_st()
		 if $res == 0 Then
			Menu(2)
			Dock()
		 EndIf
		 Sleep(5000)
		 $res = Check_st()
		 While $res <> 1
			Sleep(5000)
			$res = Check_st()
		 WEnd
		 if $res == 1 Then
			Undep()
		 EndIf
	  EndIf
   Else
	  Undep()
   EndIf
   Sleep(5000)
WEnd


Func Terminate()
   Exit 0
EndFunc
