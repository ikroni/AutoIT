;;;Функция проверки, есть ли что лочить
Func check_avalible_target()
   ;;Переменные
   $color1 = 0xcacbcb
   $color2 = 0xd5d5d5
   $color3 = 0xc7c7c7
   $color4 = 0xc0c0c0c
   $color5 = 0x2d2d2d
   $x = 737
   $y = 170
   $dist_x = 280
   $dist_y = 19
   
   Dim $state[5] = [0,0,0,0,0]
   ;; Проверка
   For $i = 0 to 4
	  $z1 = PixelSearch($x, $y+$i*$dist_y, $x+$dist_x, $y+$i*$dist_y+$dist_y, $color1)
	  ;MsgBox(0,'1', $z1[0])
	  $z2 = PixelSearch($x, $y+$i*$dist_y, $x+$dist_x, $y+$i*$dist_y+$dist_y, $color2)
	  ;MsgBox(0,'1', $z2[0])
	  $z3 = PixelSearch($x, $y+$i*$dist_y, $x+$dist_x, $y+$i*$dist_y+$dist_y, $color3)
	  ;MsgBox(0,'1', $z3[0])
	  $z4 = PixelSearch($x, $y+$i*$dist_y, $x+$dist_x, $y+$i*$dist_y+$dist_y, $color4)
	  ;MsgBox(0,'1', $z4[0])
	  $z5 = PixelSearch($x, $y+$i*$dist_y, $x+$dist_x, $y+$i*$dist_y+$dist_y, $color5)
	  ;MsgBox(0,'1', $z5[0])
	  If IsArray($z1) or IsArray($z2) or IsArray($z3) or IsArray($z4) or IsArray($z5) Then
		 $state[$i] = 1
	  EndIf
	  ;MsgBox(0, "1", $state[$i])
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
   $j = 0
   Dim $check_res[5] = [0,0,0,0,0]
   ;;;Ищем цвета на месте первого таргета
   For $i = 0 to $kol_tar
	  $z1 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1) -2, $tar_col1)
	  $z2 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1)-2, $tar_col2)
	  $z3 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1)-2, $tar_col3)
	  $z4 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1)-2, $tar_col4)
	  $z5 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1)-2, $tar_col5)
	  $z6 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i+1)-2, $tar_col6)
	  
	  if IsArray($z1) Or IsArray($z2) or IsArray($z3) or IsArray($z4) or IsArray($z5) or IsArray($z6) Then ;;Or IsArray($z2) 
		 $check_res[$j] = 1
		 $j = $j + 1
	  EndIf
	  If $j == 5 Then
		 ExitLoop
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
   ;$belt_state = check_avalible_target()
   ;;Лок
   ;MsgBox(0, "EVE", $belt_state)
   If $check_lock[0] == 0 Then
	  $y = $target_y+$dist_y*$kol_tar
	  Sleep(500)
	  Send("{CTRLDOWN}")
	  MouseClick("left", $target_x +5, $y)
	  Send("{CTRLUP}")
   EndIf
   If $check_lock[1] == 0 Then
	  sleep(500)
	  $y = $target_y+$dist_y*($kol_tar-1)
	  Send("{CTRLDOWN}")
	  MouseClick("left", $target_x +5, $y)
	  Send("{CTRLUP}")
   EndIf
   If $check_lock[2] == 0 Then
	  sleep(500)
	  $y = $target_y+5+$dist_y*($kol_tar-2)
	  Send("{CTRLDOWN}")
	  MouseClick("left", $target_x +5, $y)
	  Send("{CTRLUP}")
   EndIf
   If $check_lock[3] == 0 Then
	  sleep(500)
	  $y = $target_y+5+$dist_y*($kol_tar-3)+5
	  Send("{CTRLDOWN}")
	  MouseClick("left", $target_x +5, $y)
	  Send("{CTRLUP}")
   EndIf
   If $check_lock[4] == 0 Then
	  sleep(500)
	  $y = $target_y+5+$dist_y*($kol_tar-4)+5
	  Send("{CTRLDOWN}")
	  MouseClick("left", $target_x +5, $y)
	  Send("{CTRLUP}")
   EndIf
   sleep(500)
		 MouseMove(0, 0)
EndFunc

Func lock_1($belt_state)
   Dim $res[5] = [0,0,0,0,0]
   $i = 0
   while ($res[0] <> $belt_state[0] And $res[1] <> $belt_state[1] And $res[2] <> $belt_state[2] And $res[3] <> $belt_state[3] And $res[4] <> $belt_state[4]) Or $i < 5
	  $res = check_lock()
	  ;MsgBox(0,"l", $res[0] & " " & $res[1] & " " & $res[2] & " " & $res[3] & " " &	 $res[4])
	  ;MsgBox(0,"a", $belt_state[0] & " " & $belt_state[1] & " " & $belt_state[2] & " " & $belt_state[3] & " " &	 $belt_state[4])
	  lock($res)
	  $i = $i + 1
	  sleep(3000)
	  If $i == 5 Then
		 $kol_tar = $kol_tar + 1
	  EndIf
   WEnd
   Return 111
EndFunc