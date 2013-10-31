Func chlasst()
   $disp = 5
   $x1 = 612
   $y1 = 607
   $ret = 0
   $z110 = 0
   $z210 = 0
   $z310 = 0
   $i = 0
   While $i < 20 ;;;їїїїїїїїї їїїїїїїї їїї їїїїїїїї 50, її їїїїїїїїї їїїїїїїїї їїїїїїїї її 20
	  $z11 = PixelGetColor( $x1, $y1)
	  $z21 = PixelGetColor( $x1+50, $y1+3)
	  $z31 = PixelGetColor( $x1+100-5, $y1)
	  If $z110 == 0 Then
		 $z110 = $z11
		 $z210 = $z21
		 $z310 = $z31
	  Else
		 If ($z110 <> $z11 ) and ($ret == 0 Or $ret == 10 Or $ret == 100 Or $ret == 110 ) Then ;;; Or $z120 <> $z12
			$ret = $ret + 1
		 EndIf
		 If ($z210 <> $z21 ) and ($ret == 0 Or $ret == 1 Or $ret == 100 Or $ret == 101) Then ;;;Or $z220 <> $z22
			$ret = $ret + 10
		 EndIf
		 If ($z310 <> $z31 ) and ($ret == 0 Or $ret == 10 Or $ret == 1 or $ret == 11) Then ;;;;Or $z320 <> $z32
			$ret = $ret + 100
		 EndIf
	  EndIf
	  If $ret == 111 Then
	    ExitLoop
	  EndIf
	  $i = $i + 1
	  sleep(1)
   WEnd


   Return $ret
EndFunc

;;;Проверка на 2 лазера на кирпиче
Func Check_dubl()
	Dim $c = 0xffffff
	Dim $area[7] = [422, 453, 530, 560, 641, 673, 143]
	$i = 0
		$z1 = PixelSearch($area[0]-5,$area[6]-20,$area[0]+5,$area[6]+20,$c)
		$z2 = PixelSearch($area[1]-5,$area[6]-20,$area[1]+5,$area[6]+20,$c)
		$z3 = PixelSearch($area[2]-5,$area[6]-20,$area[2]+5,$area[6]+20,$c)
		$z4 = PixelSearch($area[3]-5,$area[6]-20,$area[3]+5,$area[6]+20,$c)
		$z5 = PixelSearch($area[4]-5,$area[6]-20,$area[4]+5,$area[6]+20,$c)
		$z6 = PixelSearch($area[5]-5,$area[6]-20,$area[5]+5,$area[6]+20,$c)
		If IsArray($z1) And IsArray($z2) Then
			MouseClick("left", $z2[0], $z2[1])
			Sleep(1000)
		EndIf
		If IsArray($z3) And IsArray($z4) Then
			MouseClick("left", $z4[0], $z4[1])
			Sleep(1000)
		EndIf
		If IsArray($z5) And IsArray($z6) Then
			MouseClick("left", $z6[0], $z6[1])
		EndIf
		Sleep(1000)
		MouseMove(0,0)
EndFunc

Func laser_act($ret)
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
   Switch $ret
   Case 0, 10, 110, 100
	  Sleep(1000)
	  If NOT IsArray($z1) Or IsArray($z11) Then
		 MouseClick("left", $target_x, $target_y)
	  ElseIf NOT IsArray($z2) Or IsArray($z21) Then
		 MouseClick("left", $target_x - $dist_x, $target_y)
	  ElseIf NOT IsArray($z3) Or IsArray($z31) Then
		 MouseClick("left", $target_x - 2*$dist_x, $target_y)
	  EndIf
	  Send("{F1}")
	  MouseMove(0,0)
   Case 0, 1, 100, 101
	  sleep(1000)
	  If NOT IsArray($z1) Or IsArray($z11) Then
		 MouseClick("left", $target_x, $target_y)
	  ElseIf NOT IsArray($z2) Or IsArray($z21) Then
		 MouseClick("left", $target_x - $dist_x, $target_y)
	  ElseIf NOT IsArray($z3) Or IsArray($z31) Then
		 MouseClick("left", $target_x - 2*$dist_x, $target_y)
	  EndIf
	  Send("{F2}")
	  MouseMove(0,0)
   Case 0, 1, 10, 11
	  sleep(1000)
	  If NOT IsArray($z1) Or IsArray($z11) Then
		 MouseClick("left", $target_x, $target_y)
	  ElseIf NOT IsArray($z2) Or IsArray($z21) Then
		 MouseClick("left", $target_x - $dist_x, $target_y)
	  ElseIf NOT IsArray($z3) Or IsArray($z31) Then
		 MouseClick("left", $target_x - 2*$dist_x, $target_y)
	  EndIf
	  Send("{F3}")
	  MouseMove(0,0)
   ;Case Else
	  ;MsgBox(0, "EVE", "Wrong check Value" & $ret)
EndSwitch
EndFunc

Func laser()
   ;MsgBox(0,"1","1")
   $t = 0
   $res = 0
   While $res <> 111 And $t < 5
	  $res = chlasst()
	  laser_act($res)
	  sleep(1000)
	  $t = $t + 1
	  if $t == 5 Then
		 $kol_tar = $kol_tar + 1
		 sleep(3000)
		 unlock()
	  EndIf
   WEnd
EndFunc
