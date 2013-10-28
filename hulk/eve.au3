;;;;переменные цветов
Global $Corp_flag = 0x4B0000 ;;;Цвет на флаге корпы
Global $undock = 0xE6B800 ;;;Цвет галочек андока
Global $disp = 5 ;;; Вводим разброс по возможным цветам
Opt("CaretCoordMode", 2)
Opt("MouseCoordMode", 2)
Opt("PixelCoordMode", 2)
#include "variable.au3" ;;;їїїїї їїїїїїїїїї їїїїїїїїїї
#include "mgmt.au3" ;;;їїїїїїї їїїїїїїїїї їїїїї
#include "start.au3" ;;;їїїїїїї їїїїїї їїї
#include "login.au3" ;;;їїїїїїї їїїїїї ї їїїї
#include "undock.au3" ;;;їїїїїїї їїїїїї
#include "laser.au3" ;;;їїїїїїї їїїїїї ї їїїїїїїї
#include "lock.au3" ;;;їїїїїїї їїїї їїїїї
#include "cargo.au3" ;;;;їїїїїїї їїїїїїїїї їїїїї
#include "pause_mine.au3" ;;;
#include "drone.au3" ;;;їїїїїїї їїїїїї ї їїїїїїї
#include "hangar.au3" ;;;їїїїїїї їїїїїї ї їїїїїїї їїїї
#include "station.au3" ;;;їїїїїїї їїїїїї її їїїїїїїї
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;їїїїїїїїї;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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