;;;;—осто€ние дронов
;;;0 - нет целей дл€ копки и дроны в дронбее, ничего не делаем
;;;1 - дроны в бее, есть цели, выпускаем дронов
;;;2 - дроны в космосе, не копают, есть цели, пускаем копать
;;;3 - дроны копают, есть цели, ничего не делаем
;;;4 - дроны в космосе, нет целей, собираем в дрон бей
;;;5 - дроны лет€т, ничего не делать

Func Drone_check($res)
   ;;; ƒроновые переменные
   ;$drone_folder_color = 0x4fbaf1
   $drone_passive_color = 0x01f501
   $drone_mine_color = 0xf10101
   $drone_fly_color = 0xf5f501
   $drone_path_x = 843
   $drone_path_y = 645
   $drone_path_dist = 100
   $disp = 5
   ;$drone_folder_path_x = 1044
   ;$drone_folder_path_y = 784
   ;$drone_folder_path_dist = 10
   $drone_state = 0
   ;;;ѕроверка и отправка статуса
   if($res > 0) Then
	  $z1 = PixelSearch($drone_path_x, $drone_path_y, $drone_path_x+50, $drone_path_y+$drone_path_dist,$drone_passive_color, $disp)
	  $z2 = PixelSearch($drone_path_x, $drone_path_y, $drone_path_x+50, $drone_path_y+$drone_path_dist,$drone_mine_color, $disp)
	  $z3 = PixelSearch($drone_path_x, $drone_path_y, $drone_path_x+50, $drone_path_y+$drone_path_dist,$drone_fly_color, $disp)
	  If Not IsArray($z1) And Not IsArray($z2) And Not IsArray($z3) Then
		 $drone_state = 1
	  ElseIf IsArray($z1) Then
		 $drone_state = 2
	  ElseIf IsArray($z2) Then
		 $drone_state = 3
	  ElseIf IsArray($z3) Then
		 $drone_state = 5
	  EndIf
   EndIf
   if($res = 0) Then
	  $z1 = PixelSearch($drone_path_x, $drone_path_y, $drone_path_x+50, $drone_path_y+$drone_path_dist,$drone_passive_color)
	  $z2 = PixelSearch($drone_path_x, $drone_path_y, $drone_path_x+50, $drone_path_y+$drone_path_dist,$drone_mine_color)
	  $z3 = PixelSearch($drone_path_x, $drone_path_y, $drone_path_x+50, $drone_path_y+$drone_path_dist,$drone_fly_color, $disp)
	  If IsArray($z1) Or IsArray($z2) Or IsArray($z3) Then
		 $drone_state = 4
	  EndIf
   EndIf
   ;MsgBox(0,"1", $drone_state)
   Return $drone_state
   
EndFunc

Func Drone_mine($res)
   ;;ѕеременные
   $drone_bay_x = 785
   $drone_bay_y = 613
   $drone_folder_path_x = 785
   $drone_folder_path_y = 632
   ;; опаем
   Switch $res
	  Case 1
		 MouseClick("right" , $drone_bay_x, $drone_bay_y)
		 Sleep(1000)
		 MouseClick("left", $drone_bay_x+30, $drone_bay_y+10)
		 Sleep(1000)
		 MouseMove(0,0)
	  Case 2
		 MouseClick("right" , $drone_folder_path_x, $drone_folder_path_y)
		 Sleep(1000)
		 MouseClick("left", $drone_folder_path_x+30, $drone_folder_path_y+80)
		 Sleep(1000)
		 MouseMove(0,0)
	  Case 4
		 Send("d")
   EndSwitch
EndFunc

Func Drone($res_target)
   $res = Drone_check($res_target)
   Switch $res
	  Case 1, 2, 4
		 Drone_mine($res)		 
   EndSwitch
EndFunc
