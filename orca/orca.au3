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
;while 1
;   WinActivate("EVE")
   ;Menu(1)
   ;$res_cargo = Check_cargo()
   ;$res_ore = Check_ore()
   ;$res_hangar = Check_hangar()
   
;MsgBox(0,"1", $res_cargo & " " & $res_ore & " " &  $res_hangar)
 ;  $res_st = Check_st()
  ; if $res_st <> 1 Then
	;  If $res_hangar == 1 Then
	;	 If $res_ore == 0 Then
	;		Move_ore()
	;	 ElseIf $res_cargo == 0 Then
	;		Move_cargo()
	;	 EndIf
	 ; EndIf
	  ;If $res_hangar == 1 And $res_ore == 1 And $res_cargo == 1 Then
		; $res = Check_st()
		 ;if $res == 0 Then
			;Menu(2)
			;Dock()
			;Menu(1)
		 ;EndIf
		 ;Sleep(5000)
		 ;$res = Check_st()
		 ;While $res <> 1
		;	Sleep(5000)
	;		$res = Check_st()
;		 WEnd
		 ;if $res == 1 Then
			;Undep()
			;Undock()
			;$fleet = FleetShipNear()
			;if $fleet == 0 Then
			;   $warp = InWarp()
			;   If $warp == 0 Then
		;		  Warp()
	;		   EndIf
	;		   Sleep(10000)
	;		EndIf
			
			;Exit 0
		 ;EndIf
;	  EndIf
;   Else
	  ;MsgBox(0, "1","В доке")
	  ;$cargo = Check_clear_cargo()
	  ;If $cargo == 0 Then
	;	 Undep()
	;  EndIf
	;  Undock()
	;  $fleet = FleetShipNear()
	;  if $fleet == 0 Then
;		 $warp = InWarp();
		 ;If $warp == 0 Then
		;	Warp()
		; EndIf
		; Sleep(10000)
	  ;EndIf
	  ;Undep()
	  ;Exit 0
  ; EndIf
   ;Sleep(5000)
;WEnd
While 1
   Sleep(100)
WEnd

Func Main()
   MouseMove(0,0)
   Sleep(500)
   while 1
	  ;;определяем на станции ли мы
	  $res_st = Check_st()
	  If $res_st == 1 Then
		 ;;Если на станции, определяем чистое ли карго
		 $cargo_clear = Check_clear_cargo()
		 If $cargo_clear == 0 Then
			;;; Если в карго, что-то есть разгружаем
			Undep()
		 Else
			;;;Если карго пустое андокаемся
			Undock()
		 EndIf
	  Else
		 ;;;если мы в космосе, определяем на какой мы закладке меню
		 If $a <> 1 Then
			;;;переключаем на корабли
			$a = Menu(1)
		 EndIf
		 ;;;Определяем есть ли рядом наши карабли
		 $fleet = FleetShipNear()
		 If $fleet == 0 Then
			;;;;Если рядом союзников нет, определяем не в варпе ли мы
			$warp = InWarp()
			If $warp == 0 Then
			   ;;;;Если мы в не в варпе варпаем
			   Warp()
			Else
			   Sleep(5000)
			EndIf
		 Else
			;;;Активируем модули
			;;;В разработке
			;;;Обрабатываем карго
			$res_cargo = Check_cargo()
			$res_ore = Check_ore()
			$res_hangar = Check_hangar()
			;;;если флит ангар полный
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
			EndIf
			;;;если все емкости до краев
			If $res_hangar == 1 And $res_ore == 1 And $res_cargo == 1 Then
			   ;;;Отправляемся в туалет и сливаем все
			   $a = Menu(2)
			   Dock()
			EndIf 
		 EndIf
	  EndIf
   WEnd
EndFunc


