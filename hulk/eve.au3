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
	$hangar_state = Check_hangar()
	If $hangar_state == 0 Then
	   hangar($hangar_state)
	Else
	   cargo()
	  ;;;sleep(3000)
	  $belt_state = check_avalible_target()
	  If $belt_state <> 0 Then
		 $res = lock_1($belt_state)
	  Else
		 $res = 0
	  EndIf
	  if $res == 111 Then
		 laser() ;;;Pfge
		 Drone($res)
		 Check_dubl()
	  EndIf

   EndIf
WEnd
