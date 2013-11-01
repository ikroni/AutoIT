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
	  $z1 = PixelSearch($x, $y+$j*$dist_y, $x+$dist_x, $y+$j*$dist_y+$dist_y, $color1)
	  ;MsgBox(0,'1', $z1[0])
	  $z2 = PixelSearch($x, $y+$j*$dist_y, $x+$dist_x, $y+$j*$dist_y+$dist_y, $color2)
	  ;MsgBox(0,'1', $z2[0])
	  $z3 = PixelSearch($x, $y+$j*$dist_y, $x+$dist_x, $y+$j*$dist_y+$dist_y, $color3)
	  ;MsgBox(0,'1', $z3[0])
	  $z4 = PixelSearch($x, $y+$j*$dist_y, $x+$dist_x, $y+$j*$dist_y+$dist_y, $color4)
	  ;MsgBox(0,'1', $z4[0])
	  $z5 = PixelSearch($x, $y+$j*$dist_y, $x+$dist_x, $y+$j*$dist_y+$dist_y, $color5)
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
   ;;; Переменные
   ;;; Окно поиска таргетов
   ;$target_x = 715
   ;$target_y = 163
   ;$dist_y = 19
   ;$dist_x = 20
   ;;;Цвета таргетов
   $tar_col1 = 0xFFFFFF
   $tar_col2 = 0xC6C6C6
   $tar_col3 = 0xB3B3B3
   $tar_col4 = 0xB4B4B4
   $tar_col5 = 0xC8C8C8
   $tar_col6 = 0xC5C5C5
   $disp = 0
   $state = 0
   ;$j = 4
   ;$i = $kol_tar+1
   ;Dim $check_res[5] = [0,0,0,0,0]
   ;;;Ищем цвета на месте первого таргета
   ;While $i >= 0
	  $z1 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i-1) -2, $tar_col1)
	  $z2 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i-1)-2, $tar_col2)
	  $z3 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i-1)-2, $tar_col3)
	  $z4 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i-1)-2, $tar_col4)
	  $z5 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i-1)-2, $tar_col5)
	  $z6 = PixelSearch($target_x+2, $target_y  + $i * $dist_y+2, $target_x + $dist_x-2, $target_y + $dist_y *($i-1)-2, $tar_col6)

	  if IsArray($z1) Or IsArray($z2) or IsArray($z3) or IsArray($z4) or IsArray($z5) or IsArray($z6) Then ;;Or IsArray($z2)
		 ;if $j >= 0 Then
		 $state = 1		 
			;$j = $j -1
		 ;EndIf
		 
	  EndIf
	  ;If $j == 0 Then
		; ExitLoop
	 ;EndIf
	 ;$i = $i - 1
  ;Wend
  ;ToolTip( $check_res[0] & $check_res[1] & $check_res[2] & $check_res[3] & $check_res[4], 0, 0)
   ;MsgBox(0, "EVE", $check_res)
   ;Return $check_res
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
   ;$target_x = 785
   ;$target_y = 171
   ;$dist_y = 19
   ;$dist_x = 20
   ;$belt_state = check_avalible_target()
   ;;Лок
   ;MsgBox(0, "EVE", $belt_state)
   ;If $check_lock[4] == 0 Then
	;  $y = $target_y+$dist_y*$kol_tar
	 ; Sleep(1000)
;	  Send("{CTRLDOWN}")
;	  MouseClick("left", $target_x +5, $y)
;	  Send("{CTRLUP}")
 ;  EndIf
 ;  If $check_lock[3] == 0 Then
;	  sleep(1000)
;	  $y = $target_y+$dist_y*($kol_tar-1)
;	  Send("{CTRLDOWN}")
;	  MouseClick("left", $target_x +5, $y)
;	  Send("{CTRLUP}")
 ;  EndIf
  ; If $check_lock[2] == 0 Then
;	  sleep(1000)
;	  $y = $target_y+5+$dist_y*($kol_tar-2)
;	  Send("{CTRLDOWN}")
;	  MouseClick("left", $target_x +5, $y)
;	  Send("{CTRLUP}")
 ;  EndIf
  ; If $check_lock[1] == 0 Then
;	  sleep(1000)
;	  $y = $target_y+5+$dist_y*($kol_tar-3)+5
;	  Send("{CTRLDOWN}")
;	  MouseClick("left", $target_x +5, $y)
;	  Send("{CTRLUP}")
 ;  EndIf
;   If $check_lock[0] == 0 Then
;	  sleep(1000)
;	  $y = $target_y+5+$dist_y*($kol_tar-4)+5
;	  Send("{CTRLDOWN}")
;	  MouseClick("left", $target_x +5, $y)
;;	  Send("{CTRLUP}")
 ;  EndIf
   sleep(500)
		 MouseMove(0, 0)
EndFunc

Func lock_1($belt_state)
   Dim $res[5] = [0,0,0,0,0]
   Dim $i[0] = [0,0,0,0,0]
   ;while $res[0] <> $belt_state[4] Or $res[1] <> $belt_state[3] Or $res[2] <> $belt_state[2] Or $res[3] <> $belt_state[1] Or $res[4] <> $belt_state[0]
   while $res[0]+$res[1]+$res[2]+$res[3]+$res[4] < $belt_state
	  $res[0] = check_lock($target_area_0[0],$target_area_0[1]+$target_area_0[3]*$target_area_0[4],$target_area_0[2],$target_area_0[3])
	  $res[1] = check_lock($target_area_1[0],$target_area_1[1]+$target_area_1[3]*$target_area_1[4],$target_area_1[2],$target_area_1[3])
	  $res[2] = check_lock($target_area_2[0],$target_area_2[1]+$target_area_2[3]*$target_area_2[4],$target_area_2[2],$target_area_2[3])
	  $res[3] = check_lock($target_area_3[0],$target_area_3[1]+$target_area_3[3]*$target_area_3[4],$target_area_3[2],$target_area_3[3])
	  $res[4] = check_lock($target_area_4[0],$target_area_4[1]+$target_area_4[3]*$target_area_4[4],$target_area_4[2],$target_area_4[3])
	  if $res[0] == 0 Then
		 lock($target_area_0[0],$target_area_0[1]+$target_area_0[3]*$target_area_0[4])
		 $i[0] = $i[0]+1
		 if $i[0] == 3 Then
			$target_area_0[4] = $target_area_0[4] + 1
		 EndIf
	  EndIf
	  if $res[1] == 0 Then
		 If $target_area_0[2] + $target_area_0[4]*$target_area_0[3] == $target_area_1[1] Then
			$target_area_1[4] = $target_area_1[4] + 1
		 EndIf
		 lock($target_area_1[0],$target_area_1[1]+$target_area_1[3]*$target_area_1[4])
		 $i[1] = $i[1]+1
		 if $i[1] == 3 Then
			$target_area_1[4] = $target_area_1[4] + 1
		 EndIf
	  EndIf
	  if $res[2] == 0 Then
		 If $target_area_1[2] + $target_area_1[4]*$target_area_1[3] == $target_area_2[1] Then
			$target_area_2[4] = $target_area_2[4] + 1
		 EndIf
		 lock($target_area_2[0],$target_area_2[1]+$target_area_2[3]*$target_area_2[4])
		 $i[2] = $i[2]+1
		 if $i[2] == 3 Then
			$target_area_2[4] = $target_area_2[4] + 1
		 EndIf
	  EndIf
	  if $res[3] == 0 Then
		 If $target_area_2[2] + $target_area_2[4]*$target_area_2[3] == $target_area_3[1] Then
			$target_area_3[4] = $target_area_3[4] + 1
		 EndIf
		 lock($target_area_3[0],$target_area_3[1]+$target_area_3[3]*$target_area_3[4])
		 $i[3] = $i[3]+1
		 if $i[3] == 3 Then
			$target_area_3[4] = $target_area_3[4] + 1
		 EndIf
	  EndIf
	  if $res[4] == 0 Then
		 If $target_area_3[2] + $target_area_3[4]*$target_area_3[3] == $target_area_4[1] Then
			$target_area_4[4] = $target_area_4[4] + 1
		 EndIf
		 lock($target_area_4[0],$target_area_4[1]+$target_area_4[3]*$target_area_4[4])
		 $i[4] = $i[4]+1
		 if $i[4] == 3 Then
			$target_area_4[4] = $target_area_4[4] + 1
		 EndIf
	  EndIf
	  ToolTip(" tar 1 =" & $res[0] & " tar 2 =" & $res[1] & " tar 3 =" & $res[2] & " tar 4 =" & $res[3] & " tar 5 =" & $res[4], 0, 0)
	  ;if $res[0] <> $belt_state[4] Or $res[1] <> $belt_state[3] Or $res[2] <> $belt_state[2] Or $res[3] <> $belt_state[1] Or $res[4] <> $belt_state[0] Then
		; lock($res)
	  ;EndIf
	  ;$i = $i + 1
	  ;sleep(3000)
	  ;If $i == 5 Then
		; $kol_tar = $kol_tar + 1
		; ExitLoop
	  ;EndIf
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
