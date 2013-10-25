Opt("CaretCoordMode", 2)
Opt("MouseCoordMode", 2)
Opt("PixelCoordMode", 2)
WinActivate("EVE")
#include "mgmt.au3"
#include "cargo.au3"
#include "menu.au3"
#include "station.au3"
#include "fleet.au3"
#include "space.au3"
Global $a = 0

While 1
   Sleep(100)
WEnd

Func Main()
   MouseMove(0,0)
   Sleep(500)
   while 1
	  ;;���������� �� ������� �� ��
	  $res_st = Check_st()
	  If $res_st == 1 Then
		 ;;���� �� �������, ���������� ������ �� �����
		 $cargo_clear = Check_clear_cargo()
		 If $cargo_clear == 0 Then
			;;; ���� � �����, ���-�� ���� ����������
			Undep()
		 Else
			;;;���� ����� ������ ����������
			Undock()
		 EndIf
	  Else
		 ;;;���� �� � �������, ���������� �� ����� �� �������� ����
		 If $a <> 1 Then
			;;;����������� �� �������
			$a = Menu(1)
		 EndIf
		 ;;;���������� ���� �� ����� ���� �������
		 $fleet = FleetShipNear()
		 If $fleet == 0 Then
			;;;;���� ����� ��������� ���, ���������� �� � ����� �� ��
			$warp = InWarp()
			If $warp == 0 Then
			   ;;;;���� �� � �� � ����� �������
			   Warp()
			Else
			   Sleep(5000)
			EndIf
		 Else
			;;;���������� ������
			;;;� ����������
			;;;������������ �����
			$res_cargo = Check_cargo()
			$res_ore = Check_ore()
			$res_hangar = Check_hangar()
			;;;���� ���� ����� ������
			If $res_hangar == 1 Then
			   ;;;���� ��� ����� �� ������
			   If $res_ore == 0 Then
				  ;;;;���������� � ���
				  Move_ore()
				  ;;;;���� �� ��� ������ �� �� ��������� �����
			   ElseIf $res_cargo == 0 Then
				  ;;;;���������� � �����
				  Move_cargo()
			   EndIf
			EndIf
			;;;���� ��� ������� �� �����
			If $res_hangar == 1 And $res_ore == 1 And $res_cargo == 1 Then
			   ;;;������������ � ������ � ������� ���
			   $a = Menu(2)
			   Dock()
			EndIf 
		 EndIf
	  EndIf
   WEnd
EndFunc


