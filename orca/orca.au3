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
ToolTip("Скрипт запущен, для старта нажмите 1", 0, 0)

While 1
   Sleep(100)
WEnd

Func Main()
   MouseMove(0,0)
   Sleep(500)
   while 1		 
	  ;;определяем на станции ли мы
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
			;;;переключаем на корабли
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
			ToolTip("Скрипт запущен, но здесь этой хрени уже быть не должно", 0, 0)
		 Case 1
			ToolTip('Скрипт запущен',0,0)
		 Case 2
			ToolTip('Опять хрень коей быть не должно',0,0)
		 Case 3
			ToolTip('Бот на станции, руда в карго',0,0)
			Undep()
		 Case 4
			ToolTip('Бот на станции, руды в карго нема',0,0)
			Undock()
		 Case 5
			ToolTip('Бот в космосе, рядом никого,карго пустое,и не варпаем, че за хня?',0,0)
			Warp()
		 Case 6
			ToolTip('Бот в космосе и еще и летит куда-то, охренеть, дайте 2',0,0)
			Sleep(10000)
		 Case 7
			ToolTip('Бот в космосе, рядом эти кретины на халках, руду есть куда пихать',0,0)
			If $res_hangar == 1 Then
			   ;;;Если ОРЕ ангар не полный
			   If $res_ore == 0 Then
				  ;;;;перемещаем в ОРЕ
				  Move_ore()
				  ;;;;Если же ОРЕ полное но не заполнено карго
			   ElseIf $res_cargo == 0 Then
				  ;;;;Перемещаем в карго
				  Move_cargo()
			   EndIf
			   link()			   
			EndIf
		 Case 8
			ToolTip('Бот в космосе, руду пихать некуда',0,0)
			$a = Menu(2)
			Dock()
	  EndSwitch
		 
	  ;If $res_st == 1 Then
		 ;;Если на станции, определяем чистое ли карго
;		 $cargo_clear = Check_clear_cargo()
;		 If $cargo_clear == 0 Then
			;;; Если в карго, что-то есть разгружаем
;			Undep()
;		 Else
;			;;;Если карго пустое андокаемся
;			Undock()
;		 EndIf
;	  Else
;		 ;;;если мы в космосе, определяем на какой мы закладке меню
;		 If $a <> 1 Then
;			;;;переключаем на корабли
;			$a = Menu(1)
;		 EndIf
;		 ;;;Определяем есть ли рядом наши карабли
;		 $fleet = FleetShipNear()
;		 If $fleet == 0 Then
;			;;;;Если рядом союзников нет, определяем не в варпе ли мы
;			$warp = InWarp()
;			If $warp == 0 Then
;			   ;;;;Если мы в не в варпе варпаем
;			   Warp()
;			Else
;			   Sleep(5000)
;			EndIf
;		 Else
;			;;;Активируем модули
;			;;;В разработке
;			;;;Обрабатываем карго
;			$res_cargo = Check_cargo()
;			$res_ore = Check_ore()
;			$res_hangar = Check_hangar()
;			;;;если флит ангар полный
;			If $res_hangar == 1 Then
;			   ;;;Если ОРЕ ангар не полный
;			   If $res_ore == 0 Then
;				  ;;;;перемещаем в ОРЕ
;				  Move_ore()
;				  ;;;;Если же ОРЕ полное но не заполнено карго
;			   ElseIf $res_cargo == 0 Then
;				  ;;;;Перемещаем в карго
;				  Move_cargo()
;			   EndIf
;			EndIf
;			;;;если все емкости до краев
;			If $res_hangar == 1 And $res_ore == 1 And $res_cargo == 1 Then
;			   ;;;Отправляемся в туалет и сливаем все
;			   $a = Menu(2)
;			   Dock()
;			EndIf 
;		 EndIf
;	  EndIf
   WEnd
EndFunc


