;;;;���������� ������
Global $Corp_flag = 0x4B0000 ;;;���� �� ����� �����
Global $undock = 0xE6B800 ;;;���� ������� ������
Global $disp = 5 ;;; ������ ������� �� ��������� ������
Opt("CaretCoordMode", 2)
Opt("MouseCoordMode", 2)
Opt("PixelCoordMode", 2)
#include "variable.au3" ;;;����� ���������� ����������
#include "mgmt.au3" ;;;������� ���������� �����
#include "start.au3" ;;;������� ������ ���
#include "login.au3" ;;;������� ������ � ����
#include "undock.au3" ;;;������� ������
#include "laser.au3" ;;;������� ������ � ��������
#include "lock.au3" ;;;������� ���� �����
#include "cargo.au3" ;;;;������� ��������� �����
#include "pause_mine.au3" ;;;
#include "drone.au3" ;;;������� ������ � �������
#include "hangar.au3" ;;;������� ������ � ������� ����
#include "station.au3" ;;;������� ������ �� ��������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;���������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
While 1
	sleep(100)
WEnd

Func Main()
	While 1
		WinActivate("EVE")
		MouseMove(0,0)
		Sleep(500)
		$hangar_state = Check_hangar()
		If $hangar_state == 0 Then
			hangar($hangar_state)
		Else
			cargo()
			$belt_state = check_avalible_target()
			If $belt_state[0] == 1 Then
				$res = lock_1($belt_state)
			Else
				$res = 0
			EndIf
			if $res == 111 Then
				laser() ;;;Pfge
		 ;Drone($res)
				If $belt_state[2] == 1 Then
					Check_dubl()
				EndIf

			EndIf

		EndIf
	WEnd
EndFunc