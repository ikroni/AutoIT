;;;;���������� ������
Global $Corp_flag = 0x4B0000 ;;;���� �� ����� �����
Global $undock = 0xE6B800 ;;;���� ������� ������
Global $disp = 5 ;;; ������ ������� �� ��������� ������
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
Opt("CaretCoordMode", 2)
Opt("MouseCoordMode", 2)
Opt("PixelCoordMode", 2)
HotKeySet("{ESC}","Terminate")

#include "start.au3" ;;;������� ������ ���
#include "login.au3" ;;;������� ������
#include "undock.au3" ;;;������� ������
#include "laser.au3"
#include "lock.au3"
#include "cargo.au3"
#include "pause_mine.au3"
#include "drone.au3"
#include "hangar.au3"
#include "station.au3"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;���������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func Terminate()
   Exit 0
EndFunc

While 1
	WinActivate("EVE")
	MouseMove(0,0)
	Sleep(500)
	$hangar_state = Check_hangar()
	If $hangar_state == 0 Then
	   hangar($hangar_state)
	Else
	   cargo()
	  ;;;sleep(3000)
	  $belt_state = check_avalible_target()
	  ;MsgBox(0,"q", $belt_state[0] & " " & $belt_state[1] & " " & $belt_state[2] & " " & $belt_state[3] & " " &	 $belt_state[4])
	  If $belt_state[0] == 1 Then
		 $res = lock_1($belt_state)
	  Else
		 $res = 0
	  EndIf
	  ;MsgBox(0,"q", $res[0] & " " & $res[1] & " " & $res[2] & " " & $res[3] & " " &	 $res[4])
	  if $res == 111 Then
		 laser() ;;;Pfge
		 ;Drone($res)
		 Check_dubl()
	  EndIf

   EndIf
WEnd
