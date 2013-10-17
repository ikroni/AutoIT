;;;Функция проверки, есть ли что лочить
Func check_avalible_target()
   ;;Переменные
   $color1 = 0xcacbcb
   $color2 = 0xbdbebe
   $color3 = 0xc8c8c8
   $x = 737
   $y = 163
   $dist_x = 154
   $dist_y = 17
   
   $state = 0
   ;; Проверка
   For $i = 0 to 4
	  $z1 = PixelSearch($x, $y+$i*$dist_y, $x+$dist_x, $y+$i*$dist_y+$dist_y, $color1)
	  $z2 = PixelSearch($x, $y+$i*$dist_y, $x+$dist_x, $y+$i*$dist_y+$dist_y, $color2)
	  $z3 = PixelSearch($x, $y+$i*$dist_y, $x+$dist_x, $y+$i*$dist_y+$dist_y, $color3)
	  If IsArray($z1) or IsArray($z2) or IsArray($z3) Then
		 $state = $state + 10 ^ $i
	  EndIf
   Next
   Return $state
EndFunc

;;;Функция проверки залочены ли таргеты
Func check_lock()
   ;;; Переменные
   ;;; Окно поиска таргетов
   $target_x = 715
   $target_y = 163
   $dist_y = 19
   $dist_x = 20
   ;;;Цвета таргетов
   $tar_col1 = 0xFFFFFF
   $tar_col2 = 0xC6C6C6
   $tar_col3 = 0xB3B3B3
   $tar_col4 = 0xB4B4B4
   $tar_col5 = 0xC8C8C8
   $tar_col6 = 0xC5C5C5
   $disp = 0
   $check_res = 0
   ;;;Ищем цвета на месте первого таргета
   For $i = 0 to 4
	  $z1 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1) -2, $tar_col1)
	  $z2 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1)-2, $tar_col2)
	  $z3 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1)-2, $tar_col3)
	  $z4 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1)-2, $tar_col4)
	  $z5 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1)-2, $tar_col5)
	  $z6 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1)-2, $tar_col6)
	  
	  if IsArray( $z1) Or IsArray($z2) or IsArray($z3) or IsArray($z4) or IsArray($z5) or IsArray($z6) Then ;;Or IsArray($z2) 
		 $check_res = $check_res + 10^$i
	  Else
		 ;MsgBox(0, "EVE", "No One targeted")
	  EndIf
   Next
   ;MsgBox(0, "EVE", $check_res)
   Return $check_res
EndFunc

;;;;Функция лока таргета
Func lock($check_lock)
   ;;; Переменные
   ;;; Окно поиска таргетов
   $target_x = 785
   $target_y = 171
   $dist_y = 19
   $dist_x = 20
   $belt_state = check_avalible_target()
   ;;Лок
   ;MsgBox(0, "EVE", $check_lock)
   Switch $check_lock
	  Case 0, 10, 100, 110, 1110, 11110
		 Send("{CTRLDOWN}")
		 MouseClick("left", $target_x +5, $target_y + 5)
		 Send("{CTRLUP}")
		 MouseMove(0, 0)
	  Case 1, 100, 101, 1101, 11101
		 Send("{CTRLDOWN}")
		 $y = $target_y+$dist_y+5
		 ;MsgBox(0, "EVE", $y)
		 MouseClick("left", $target_x +5, $y)
		 Send("{CTRLUP}")
		 MouseMove(0, 0)
	  Case 11, 1011, 11011
		 Send("{CTRLDOWN}")
		 $y = $target_y+5+$dist_y*2
		 ;MsgBox(0, "EVE", $y)
		 MouseClick("left", $target_x+5, $y)
		 Send("{CTRLUP}")
		 MouseMove(0, 0)
	  Case 111, 10111
		 ;;if $belt_state == 1111 Then
			Send("{CTRLDOWN}")
			$y = $target_y+5+$dist_y*3
			MouseClick("left", $target_x+5, $y)
			Send("{CTRLUP}")
			MouseMove(0, 0)
		 ;;EndIf
	Case 1111
		 ;;if $belt_state == 11111 Then
			Send("{CTRLDOWN}")
			$y = $target_y+5+$dist_y*4
			MouseClick("left", $target_x+5, $y)
			Send("{CTRLUP}")
			MouseMove(0, 0)
		 ;;EndIf
   EndSwitch
EndFunc

Func lock_1($belt_state)
   $res = 0
   while $res <> $belt_state
	  $res = check_lock()
	  lock($res)
	  sleep(3000)
   WEnd
   Return 111
EndFunc