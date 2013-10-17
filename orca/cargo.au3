;;;Функция проверок
Func Check($x,$y)
   Dim $cargo[3] = [$x, $y, 5]
   $color_1 = 0x000000
   $color_2 = 0x010101
   $color_3 = 0x020202
   $color_4 = 0x020101
   $color_5 = 0x020201
   $state = 0
   $z1 = PixelSearch($cargo[0], $cargo[1], $cargo[0]+$cargo[2], $cargo[1]+$cargo[2], $color_1)
   $z2 = PixelSearch($cargo[0], $cargo[1], $cargo[0]+$cargo[2], $cargo[1]+$cargo[2], $color_2)
   $z3 = PixelSearch($cargo[0], $cargo[1], $cargo[0]+$cargo[2], $cargo[1]+$cargo[2], $color_3)
   $z4 = PixelSearch($cargo[0], $cargo[1], $cargo[0]+$cargo[2], $cargo[1]+$cargo[2], $color_4)
   $z5 = PixelSearch($cargo[0], $cargo[1], $cargo[0]+$cargo[2], $cargo[1]+$cargo[2], $color_5)
   
   if  IsArray($z1) Or IsArray($z2) Or IsArray($z3) Or IsArray($z4) Or IsArray($z5) Then
	  $state = 0
   Else
	  $state = 1
   EndIf
   Return $state
EndFunc


;;;Проверка при перетаскивании на полностью заполненное карго
Func Check_cargo_msg()
   $c = 0xd0d0d0
   Dim $msg[4] = [402,417,438,430]
   $state = 0
   $z = PixelSearch($msg[0], $msg[1], $msg[2], $msg[3], $c)
   If IsArray($z) Then
	  $state = 1 
   EndIf
   Return $state
EndFunc

;;;Проверка на остатки в ангаре
Func Check_rests()
    Dim $cargo[2] = [387, 45]
   $state = Check($cargo[0],$cargo[1])
   Return $state
EndFunc

;;;Проверка флит ангара
Func Check_hangar()
   Dim $cargo[2] = [561, 45]
   $state = Check($cargo[0],$cargo[1])
   Return $state
EndFunc

;;;Проверка заполнености ORE ангара
Func Check_ore()
   Dim $cargo[2] = [584, 249]
   $state = Check($cargo[0],$cargo[1])
   Return $state
EndFunc


;;;Проверка заполненности карго
Func Check_cargo()
   Dim $cargo[2] = [608, 418]
   $state = Check($cargo[0],$cargo[1])
   Return $state
EndFunc

Func Move_ore()
	$c = 0x010101
   Dim $1[4] = [370,67, 750,160]
   Dim $ore[2] = [366,306]
   WinActivate("EVE")
   $res = Check_rests()
	if $res == 1 Then
	  MouseClick("right", 327, 152)
	  Sleep(500)
	  MouseClick("left", 327+30, 152+55)
	  Sleep(500)
	  MouseMove(0,0)
	  Sleep(500)
	  $z = PixelSearch($1[0],$1[1],$1[2],$1[3],$c)
	  While IsArray($z)
		 MouseMove($z[0], $z[1])
		 MouseDown("left")
		 Sleep(500)
		 MouseMove($ore[0],$ore[1])
		 Sleep(500)
		 MouseUp("left")
		 Sleep(1000)
		 $res = Check_cargo_msg()
		 If $res == 1 Then
			Send("{ENTER}")
			Sleep(1000)
			ExitLoop
		 EndIf
		 $z = PixelSearch($1[0],$1[1],$1[2],$1[3],$c)
	  Wend
   EndIf

   MouseMove(0,0)
EndFunc

Func Move_cargo()
	$c = 0x010101
   Dim $1[4] = [370,67, 750,160]
   Dim $ore[2] = [395,483]
   WinActivate("EVE")    
	$res = Check_rests()
	if $res == 1 Then
	  MouseClick("right", 327, 152)
	  Sleep(500)
	  MouseClick("left", 327+30, 152+55)
	  Sleep(500)
	  MouseMove(0,0)
	  Sleep(500)
	  $z = PixelSearch($1[0],$1[1],$1[2],$1[3],$c)
	  While IsArray($z)
		 MouseMove($z[0], $z[1])
		 MouseDown("left")
		 Sleep(500)
		 MouseMove($ore[0],$ore[1])
		 Sleep(500)
		 MouseUp("left")
		 Sleep(1000)
		 $res = Check_cargo_msg()
		 If $res == 1 Then
			Send("{ENTER}")
			Sleep(1000)
			ExitLoop
		 EndIf
		 $z = PixelSearch($1[0],$1[1],$1[2],$1[3],$c)
	  Wend
   EndIf

   MouseMove(0,0)
EndFunc
