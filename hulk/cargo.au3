Func check_cargo()
   ;;;Пиксель и цвета
   $x = 155
   $y = 263
   $dist = 5
   $color_1 = 0x000000
   $color_2 = 0x010101
   $color_3 = 0x020202
   $color_4 = 0x020101
   $color_5 = 0x020201
   ;$disp =5
   ;;поиск
   ;$z = 0
   $z1 = PixelSearch( $x, $y, $x + $dist, $y + $dist, $color_1)
   $z2 = PixelSearch( $x, $y, $x + $dist, $y + $dist, $color_1)
   $z3 = PixelSearch( $x, $y, $x + $dist, $y + $dist, $color_1)
   $z4 = PixelSearch( $x, $y, $x + $dist, $y + $dist, $color_1)
   $z5 = PixelSearch( $x, $y, $x + $dist, $y + $dist, $color_1)
   if IsArray($z1) or IsArray($z2) or IsArray($z3) or IsArray($z4) Or IsArray($z5) Then
	  $res = 0
   Else
	  $res = 1
   EndIf
   Return $res
EndFunc

Func clear_cargo()
   $c = 0x010101
   Dim $1[4] = [95,280, 366,397]
   Dim $ore[2] = [213,103]
   ;MsgBox(0,"2","2")
   WinActivate("EVE")
    $z = PixelSearch($1[0],$1[1],$1[2],$1[3],$c)
   While IsArray($z)
	   MouseMove($z[0], $z[1])
	  MouseDown("left")
	  Sleep(500)
	  MouseMove($ore[0],$ore[1])
	  Sleep(500)
	  MouseUp("left")
	  Sleep(1000)
	  $z = PixelSearch($1[0],$1[1],$1[2],$1[3],$c)
   Wend
   MouseMove(0,0)

EndFunc

func cargo()
   $res = 0

   $res = check_cargo()
   ;MsgBox(0,"1", $res)
   Switch $res
	  Case 1
		 clear_cargo()
	  Case 2
		 pause_mine()
   EndSwitch
EndFunc
