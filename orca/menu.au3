Func Menu($a)
   Dim $ow[6] = [ 851, 147, 797, 147, 896, 146 ]
   Switch $a
	  Case 0 ;;;;Белты
		 MouseClick("left", $ow[0], $ow[1])
		 Sleep(500)
	  Case 1 ;;;;Карабли
		 MouseClick("left", $ow[2], $ow[3])
		 Sleep(500)
	  Case 2 ;;;;Станции
		 MouseClick("left", $ow[4], $ow[5])
		 Sleep(500)
   EndSwitch
EndFunc
