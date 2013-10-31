Func InWarp()
   Dim $area[3] = [532,719,0x949494]
   $z = PixelSearch($area[0],$area[1],$area[0]+5,$area[1]+5,$area[2])
   $state = 1
   If IsArray($z) Then
	  $state = 0
   EndIf
   Return $state
EndFunc

Func Warp()
   Dim $fleet[2] = [155,510]
   MouseClick("right",$fleet[0],$fleet[1])
   Sleep(1000)
   MouseClick("left",$fleet[0]+15,$fleet[1]+10)
   Sleep(60000)
EndFunc
