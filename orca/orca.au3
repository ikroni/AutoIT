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
#include "module.au3"
Global $a = 0
Global $oraca_state = 0
ToolTip("������ �������, ��� ������ ������� 1", 0, 0)

While 1
   Sleep(100)
WEnd

Func Main()
   MouseMove(0,0)
   Sleep(500)
   while 1		 
	  ;;���������� �� ������� �� ��
	  $res_st = Check_st()
	  $cargo_clear = Check_clear_cargo()
	  IF $res_st == 1 Then
		 If $cargo_clear == 0 Then
			$orca_state = 3
		 Else
			$orca_state = 4
		 EndIf
	  ElseIf $res_st == 0 Then
		 if $a <> 1 Then
			;;;����������� �� �������
			$a = Menu(1)
		 EndIf
		 $fleet = FleetShipNear()
		 $res_cargo = Check_cargo()
		 $res_ore = Check_ore()
		 $res_hangar = Check_hangar()
		 $inWarp = InWarp()
		 If $inWarp == 0 Then
			$orca_state = 6
		 Else
			If $res_hangar == 1 And $res_ore == 1 And $res_cargo == 1  Then
			   $orca_state = 8
			Else
			   If $fleet == 0 Then
				  $orca_state = 5
			   Else
				  $orca_state = 7
			   EndIf
			EndIf
		 EndIf
	  EndIf
	  
	  Switch $orca_state
		 case 0
			ToolTip("������ �������, �� ����� ���� ����� ��� ���� �� ������", 0, 0)
		 Case 1
			ToolTip('������ �������',0,0)
		 Case 2
			ToolTip('����� ����� ���� ���� �� ������',0,0)
		 Case 3
			ToolTip('��� �� �������, ���� � �����',0,0)
			Undep()
		 Case 4
			ToolTip('��� �� �������, ���� � ����� ����',0,0)
			Undock()
		 Case 5
			ToolTip('��� � �������, ����� ������,����� ������,� �� �������, �� �� ���?',0,0)
			Warp()
		 Case 6
			ToolTip('��� � ������� � ��� � ����� ����-��, ��������, ����� 2',0,0)
			Sleep(10000)
		 Case 7
			ToolTip('��� � �������, ����� ��� ������� �� ������, ���� ���� ���� ������',0,0)
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
			   link()			   
			EndIf
		 Case 8
			ToolTip('��� � �������, ���� ������ ������',0,0)
			$a = Menu(2)
			Dock()
	  EndSwitch
		 
	  ;If $res_st == 1 Then
		 ;;���� �� �������, ���������� ������ �� �����
;		 $cargo_clear = Check_clear_cargo()
;		 If $cargo_clear == 0 Then
			;;; ���� � �����, ���-�� ���� ����������
;			Undep()
;		 Else
;			;;;���� ����� ������ ����������
;			Undock()
;		 EndIf
;	  Else
;		 ;;;���� �� � �������, ���������� �� ����� �� �������� ����
;		 If $a <> 1 Then
;			;;;����������� �� �������
;			$a = Menu(1)
;		 EndIf
;		 ;;;���������� ���� �� ����� ���� �������
;		 $fleet = FleetShipNear()
;		 If $fleet == 0 Then
;			;;;;���� ����� ��������� ���, ���������� �� � ����� �� ��
;			$warp = InWarp()
;			If $warp == 0 Then
;			   ;;;;���� �� � �� � ����� �������
;			   Warp()
;			Else
;			   Sleep(5000)
;			EndIf
;		 Else
;			;;;���������� ������
;			;;;� ����������
;			;;;������������ �����
;			$res_cargo = Check_cargo()
;			$res_ore = Check_ore()
;			$res_hangar = Check_hangar()
;			;;;���� ���� ����� ������
;			If $res_hangar == 1 Then
;			   ;;;���� ��� ����� �� ������
;			   If $res_ore == 0 Then
;				  ;;;;���������� � ���
;				  Move_ore()
;				  ;;;;���� �� ��� ������ �� �� ��������� �����
;			   ElseIf $res_cargo == 0 Then
;				  ;;;;���������� � �����
;				  Move_cargo()
;			   EndIf
;			EndIf
;			;;;���� ��� ������� �� �����
;			If $res_hangar == 1 And $res_ore == 1 And $res_cargo == 1 Then
;			   ;;;������������ � ������ � ������� ���
;			   $a = Menu(2)
;			   Dock()
;			EndIf 
;		 EndIf
;	  EndIf
   WEnd
EndFunc


