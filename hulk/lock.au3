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
   ;Dim $state[5] = [0,0,0,0,0]
   $state = 0
   ;$j = $kol_tar - 4
   ;; Проверка
   For $i = 0 to 20
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
		 $state = $state + 1
	  EndIf
	  ;$j = $j + 1
	  ;MsgBox(0, "1", $state[$i])
   Next
   Return $state
EndFunc

;;;Функция проверки залочены ли таргеты
Func check_lock($target_x, $target_y, $dist_x, $dist_y)
   $tar_col1 = 0xFFFFFF
   $tar_col2 = 0xC6C6C6
   $tar_col3 = 0xB3B3B3
   $tar_col4 = 0xB4B4B4
   $tar_col5 = 0xC8C8C8
   $tar_col6 = 0xC5C5C5
   $disp = 0
   $state = 0
	  $z1 = PixelSearch($target_x+2, $target_y, $target_x + $dist_x-2, $target_y + $dist_y, $tar_col1)
	  $z2 = PixelSearch($target_x+2, $target_y, $target_x + $dist_x-2, $target_y + $dist_y, $tar_col2)
	  $z3 = PixelSearch($target_x+2, $target_y, $target_x + $dist_x-2, $target_y + $dist_y, $tar_col3)
	  $z4 = PixelSearch($target_x+2, $target_y, $target_x + $dist_x-2, $target_y + $dist_y, $tar_col4)
	  $z5 = PixelSearch($target_x+2, $target_y, $target_x + $dist_x-2, $target_y + $dist_y, $tar_col5)
	  $z6 = PixelSearch($target_x+2, $target_y, $target_x + $dist_x-2, $target_y + $dist_y, $tar_col6)

	  if IsArray($z1) Or IsArray($z2) or IsArray($z3) or IsArray($z4) or IsArray($z5) or IsArray($z6) Then ;;Or IsArray($z2)
		 ;if $j >= 0 Then
		 $state = 1
			;$j = $j -1
		 ;EndIf

	  EndIf
   Return $state
EndFunc

;;;;Функция лока таргета
Func lock($target_x, $target_y)
   ;;; Переменные
   ;;; Окно поиска таргетов
  Sleep(1000)
  Send("{CTRLDOWN}")
  MouseClick("left", $target_x +5, $target_y + 5)
  Send("{CTRLUP}")
   sleep(3000)
		 MouseMove(0, 0)
EndFunc

Func lock_1($belt_state)
   ;;Создаем массивы $res - для хранения результатов проверки на залоченность
   ;;$i для счетчика попыток лока
   Dim $res[5] = [0,0,0,0,0]
   Dim $i[5] = [0,0,0,0,0]
   $res[0] = check_lock($target_area_0[0],$target_area_0[1]+$target_area_0[3]*$target_area_0[4],$target_area_0[2],$target_area_0[3])
	$res[1] = check_lock($target_area_1[0],$target_area_1[1]+$target_area_1[3]*$target_area_1[4],$target_area_1[2],$target_area_1[3])
	$res[2] = check_lock($target_area_2[0],$target_area_2[1]+$target_area_2[3]*$target_area_2[4],$target_area_2[2],$target_area_2[3])
	$res[3] = check_lock($target_area_3[0],$target_area_3[1]+$target_area_3[3]*$target_area_3[4],$target_area_3[2],$target_area_3[3])
	$res[4] = check_lock($target_area_4[0],$target_area_4[1]+$target_area_4[3]*$target_area_4[4],$target_area_4[2],$target_area_4[3])
   ;while $res[0] <> $belt_state[4] Or $res[1] <> $belt_state[3] Or $res[2] <> $belt_state[2] Or $res[3] <> $belt_state[1] Or $res[4] <> $belt_state[0]
   ;;; Сложение количества залоченных целей
   $res_o = $res[0]+$res[1]+$res[2]+$res[3]+$res[4]
   ;;;Цикл лока выход если залочено целей столько же сколько всего целей на белте и если залочено 5 целей
   while $res_o < $belt_state And $res_o < 5
	  ;;;Проверяем не сдвинулись ли таргеты
	  If $target_area_0[1] + $target_area_0[4]*$target_area_0[3] == $target_area_1[1]+$target_area_1[4]*$target_area_1[3]  Then
			$target_area_1[4] = $target_area_1[4] + 1
			$i[1] = 0
		 EndIf
		 If $target_area_1[1] + $target_area_1[4]*$target_area_1[3] == $target_area_2[1]+$target_area_2[4]*$target_area_2[3]  Then
			$target_area_2[4] = $target_area_2[4] + 1
			$i[2] = 0
		 EndIf
		  If $target_area_2[1] + $target_area_2[4]*$target_area_2[3] == $target_area_3[1]+$target_area_3[4]*$target_area_3[3]  Then
			$target_area_3[4] = $target_area_3[4] + 1
			$i[3] = 0
		 EndIf
		 If $target_area_3[1] + $target_area_3[4]*$target_area_3[3] == $target_area_4[1]+$target_area_4[4]*$target_area_4[3] Then
			$target_area_4[4] = $target_area_4[4] + 1
			$i[4] = 0
		 EndIf
		 ;If $target_area_3[1] + $target_area_3[4]*$target_area_3[3] == $target_area_4[1] Then
			;$target_area_4[4] = $target_area_4[4] + 1
		 ;EndIf
	  ;;Получение данных о залоченности таргетов
	  $res[0] = check_lock($target_area_0[0],$target_area_0[1]+$target_area_0[3]*$target_area_0[4],$target_area_0[2],$target_area_0[3])
	  $res[1] = check_lock($target_area_1[0],$target_area_1[1]+$target_area_1[3]*$target_area_1[4],$target_area_1[2],$target_area_1[3])
	  $res[2] = check_lock($target_area_2[0],$target_area_2[1]+$target_area_2[3]*$target_area_2[4],$target_area_2[2],$target_area_2[3])
	  $res[3] = check_lock($target_area_3[0],$target_area_3[1]+$target_area_3[3]*$target_area_3[4],$target_area_3[2],$target_area_3[3])
	  $res[4] = check_lock($target_area_4[0],$target_area_4[1]+$target_area_4[3]*$target_area_4[4],$target_area_4[2],$target_area_4[3])
	  ;;;Обновление данных о количстве таргетов на белте
	  $belt_state = check_avalible_target()
	  ;;; Сложение количества залоченных целей
	  $res_o = $res[0]+$res[1]+$res[2]+$res[3]+$res[4]
	  ;;;Если цель не залочена, то лочим ее, если она не залочилась 5-ть раз значит далеко, переходим к следующей ячейке таргета
	  if $res[0] == 0 Then
		 lock($target_area_0[0],$target_area_0[1]+$target_area_0[3]*$target_area_0[4])
		 $i[0] = $i[0]+1
		 if $i[0] == 3 Then
			$target_area_0[4] = $target_area_0[4] + 1
			$i[0] = 0
		 EndIf
	  EndIf
	  ;;;Проверка второго таргета
	  if $res[1] == 0 Then
		 ;;;проверяем не сметился ли вервый таргет на данную позицию, если сместился - то смещаем область
		 ;If $target_area_0[2] + $target_area_0[4]*$target_area_0[3] == $target_area_1[1] Then
			;$target_area_1[4] = $target_area_1[4] + 1
		 ;EndIf
		 lock($target_area_1[0],$target_area_1[1]+$target_area_1[3]*$target_area_1[4])
		 $i[1] = $i[1]+1
		 if $i[1] == 3 Then
			$target_area_1[4] = $target_area_1[4] + 1
			$i[1] = 0
		 EndIf
	  EndIf
	  if $res[2] == 0 Then
		; If $target_area_1[2] + $target_area_1[4]*$target_area_1[3] == $target_area_2[1] Then
		;	$target_area_2[4] = $target_area_2[4] + 1
		 ;EndIf
		 lock($target_area_2[0],$target_area_2[1]+$target_area_2[3]*$target_area_2[4])
		 $i[2] = $i[2]+1
		 if $i[2] == 3 Then
			$target_area_2[4] = $target_area_2[4] + 1
			$i[2] = 0
		 EndIf
	  EndIf
	  if $res[3] == 0 Then
		 ;If $target_area_2[2] + $target_area_2[4]*$target_area_2[3] == $target_area_3[1] Then
			;$target_area_3[4] = $target_area_3[4] + 1
		 ;EndIf
		 lock($target_area_3[0],$target_area_3[1]+$target_area_3[3]*$target_area_3[4])
		 $i[3] = $i[3]+1
		 if $i[3] == 3 Then
			$target_area_3[4] = $target_area_3[4] + 1
			$i[3] = 0
		 EndIf
	  EndIf
	  if $res[4] == 0 Then
		 ;If $target_area_3[2] + $target_area_3[4]*$target_area_3[3] == $target_area_4[1] Then
			;$target_area_4[4] = $target_area_4[4] + 1
		 ;EndIf
		 lock($target_area_4[0],$target_area_4[1]+$target_area_4[3]*$target_area_4[4])
		 $i[4] = $i[4]+1
		 if $i[4] == 3 Then
			$target_area_4[4] = $target_area_4[4] + 1
			$i[4]=0
		 EndIf
	  EndIf
	  ToolTip(" tar 1 =" & $res[0] & " tar 2 =" & $res[1] & " tar 3 =" & $res[2] & " tar 4 =" & $res[3] & " tar 5 =" & $res[4] & " belt = " & $belt_state & " res_o = " & $res_o & " 0 = " & $i[0] & " 1 = " & $i[1] & " 2 = " & $i[2] & " 3 = " & $i[3] & " 4 = " & $i[4] , 0, 30)
	  ;ToolTip("kol_tar = " & $kol_tar &" "& $res[0] &"="& $belt_state[4] &" "& $res[1]  &"="&  $belt_state[3] &" "& $res[2]  &"="&  $belt_state[2] &" "& $res[3]  &"="&  $belt_state[1] &" "& $res[4]  &"="&  $belt_state[0] & " $i = "& $i , 0, 20)
   WEnd
   Return 111
EndFunc

Func unlock()
   ;;; Область таргетов
   $target_x = 652
   $target_y = 51
   $dist_x = 110
   $dist_t = 85
   ;;; Переменные для определения на каком кирпече уже активен лазер
   $color = 0xffffff
   $c = 0x511206 ;;drone's color
   $tar_area_1_x = 629
   $tar_area_y = 121
   $tar_area_2_x = 527
   $tar_area_3_x = 413
   $dist_tar_x = 50
   $dist_tar_y = 50
   $z1 = PixelSearch($tar_area_1_x, $tar_area_y, $tar_area_1_x+$dist_tar_x, $tar_area_y+$dist_tar_y, $color)
   $z11 = PixelSearch($tar_area_1_x, $tar_area_y, $tar_area_1_x+$dist_tar_x, $tar_area_y+$dist_tar_y, $c)
   $z2 = PixelSearch($tar_area_2_x, $tar_area_y, $tar_area_2_x+$dist_tar_x, $tar_area_y+$dist_tar_y, $color)
   $z21 = PixelSearch($tar_area_2_x, $tar_area_y, $tar_area_2_x+$dist_tar_x, $tar_area_y+$dist_tar_y, $c)
   $z3 = PixelSearch($tar_area_3_x, $tar_area_y, $tar_area_3_x+$dist_tar_x, $tar_area_y+$dist_tar_y, $color)
   $z31 = PixelSearch($tar_area_3_x, $tar_area_y, $tar_area_3_x+$dist_tar_x, $tar_area_y+$dist_tar_y, $c)
   Send("{CTRLDOWN}")
   Send("{SHIFTDOWN}")
   If NOT IsArray($z1) Then
	  MouseClick("left", $target_x, $target_y)
   ElseIf NOT IsArray($z2) Then
	  MouseClick("left", $target_x - $dist_x, $target_y)
   ElseIf NOT IsArray($z3) Then
	  MouseClick("left", $target_x - 2*$dist_x, $target_y)
   EndIf
   Send("{CTRLUP}")
   Send("{SHIFTUP}")
   MouseMove(0,0)
EndFunc
