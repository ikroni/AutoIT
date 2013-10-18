Func FleetShipNear()
   Dim $area[5] = [775,185,1018,579,0x9926e5]
   $z = PixelSearch($area[0],$area[1],$area[2],$area[3],$area[4])
   $state = 0
   If IsArray($z) Then
	  $state = 1
   EndIf
   Return $state
EndFunc
