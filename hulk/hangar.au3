Func Check_hangar()
   ;;����������
   $color = 0x9e6101 ;;; ���� ������� �2
   dim $area[2][2] =[ [103, 76], [363 ,171]] ;;; ������� ������ ������� �2
   $state = 0
   ;; ��������
   $z = PixelSearch($area[0][0], $area[0][1], $area[1][0],$area[1][1],$color)
   If IsArray($z) Then
	  $state = 1 
   EndIf
   Return $state
EndFunc

Func Check_orka()
   Dim $menu[2] = [738,133] ;;;����� ���� 1-� ���� ��������
   $color = 0x6a3191 ;;; ���� ��������� �������
   $color2 = 0x834aaa ;;;���� ����������� ��������� �������
   Dim $area1[2] = [715,165] ;;;������� ������ ����
   Dim $area2[2] = [1016,574] ;;;������� ������ ����
   $state = 0
   MouseClick("left", $menu[0], $menu[1])
   Sleep(500)
   $z = PixelSearch($area1[0], $area1[1], $area2[0], $area2[1],$color, 5)
   $z2 = PixelSearch($area1[0], $area1[1], $area2[0], $area2[1],$color2, 5)
   If IsArray($z) Or IsArray($z2) Then
	  $state = 1
   EndIf
   ;MouseClick("left", $menu[1][0], $menu[1][1])
   Return $state
EndFunc


Func Hangar_open()
   Dim $menu[2] = [782,133] ;;;����� ���� 1-� ���� �����
   Dim $area1[2] = [715,165] ;;;������� ������ ����
   Dim $area2[2] = [1016,574] ;;;������� ������ ����
   $color = 0x6a3192 ;;; ���� ��������� �������
   $color2 = 0x834aaa ;;;���� ����������� ��������� �������
   $color3 = 0x8f65ad
   Dim $keep[2] = [858, 80] ;;;������ ���� �� ������
   $dist = 50 ;;;��������� � ����, �� ������ ���� �����
   ;;;���� ���� � ����� � ���
   $z = PixelSearch($area1[0], $area1[1], $area2[0], $area2[1],$color, 5)
   $z2 = PixelSearch($area1[0], $area1[1], $area2[0], $area2[1],$color2, 5)
   $z3 = PixelSearch($area1[0], $area1[1], $area2[0], $area2[1],$color3, 5)
   If IsArray($z) Or IsArray($z2) Or IsArray($z3) Then
	  If IsArray($z2) Then
		 $z = $z2
	  EndIf
	  If IsArray($z3) Then
		 $z = $z3
	  EndIf
	  MouseClick("left", $z[0], $z[1]+5)
	  Sleep(500)
	  MouseClick("left", $keep[0], $keep[1])
	  Sleep(3000)
	  MouseClick("right", $z[0], $z[1]+5)
	  Sleep(500)
	  MouseClick("left", $z[0]+30, $z[1]+150)
	  Sleep(1000)
	  MouseClick("left", $menu[0], $menu[1])
   EndIf
   
EndFunc

Func hangar($res)
   ;$res = Check_hangar()
   if $res == 0 Then
	  $res = Check_orka()
	  If $res > 0 Then
		 Hangar_open()
	  Else
		 sleep(10000)
	  EndIf
   EndIf
   
EndFunc
