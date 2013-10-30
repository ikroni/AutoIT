Func Check_st()
   Dim $undb[6] = [904,170,970,200,0xe6b801,0xe6b802]
   $state = 0
   $z1 = PixelSearch($undb[0],$undb[1],$undb[2],$undb[3],$undb[4],5)
   $z2 = PixelSearch($undb[0],$undb[1],$undb[2],$undb[3],$undb[5],5)
   If IsArray($z1) or IsArray($z2) Then
	  $state = 1
	  ;MsgBox(0,"1","Docked")
   EndIf
  
   Return $state
EndFunc


Func Dock()
   Dim $st[2] = [785,188] ;;; Координаты первой станции
   Dim $Dock[2] = [837,81] ;;; Координаты кнопки док
   
   Send("d")
   Sleep(5000)
   MouseClick("left", $st[0], $st[1]+17*3)
   Sleep(1000)
   MouseClick("left", $Dock[0], $Dock[1])
   Sleep(15000)
EndFunc

Func Undep()
   $c = 0x010101
   Dim $1[4] = [320,129, 721,157]
   Dim $2[4] = [320,270, 736,330]
   Dim $3[4] = [365,438, 736,537]
   Dim $4[2] = [133,128]
   Dim $5[2] = [351,491] ;;;расположение кнопки флит ангара
   Dim $6[6] = [323,159, 319,329, 368,529] ;;;места для тыканья стака
   MouseMove(0, 0)
   Sleep(500)
   MouseClick("right", $5[0],$5[1])
   Sleep(500)
   MouseClick("left", $5[0]+10,$5[1]+30)
   Sleep(500)
   MouseClick("right", $6[0],$6[1])
   Sleep(500)
   MouseClick("left", $6[0]+10,$6[1]+50)
   Sleep(500)
   MouseClick("right", $6[2],$6[3])
   Sleep(500)
   MouseClick("left", $6[2]+10,$6[3]+50)
   Sleep(500)
   MouseClick("right", $6[4],$6[5])
   Sleep(500)
   MouseClick("left", $6[4]+10,$6[5]+50)
   Sleep(500)
   
   $z = PixelSearch($1[0],$1[1],$1[2],$1[3],$c)
   While IsArray($z)
	  MouseMove($z[0], $z[1])
	  MouseDown("left")
	  Sleep(500)
	  MouseMove($4[0],$4[1])
	  Sleep(500)
	  MouseUp("left")
	  Sleep(1000)
	  $z = PixelSearch($1[0],$1[1],$1[2],$1[3],$c)
   WEnd
   $z = PixelSearch($2[0],$2[1],$2[2],$2[3],$c)
   While IsArray($z)
	  MouseMove($z[0], $z[1])
	  MouseDown("left")
	  Sleep(500)
	  MouseMove($4[0],$4[1])
	  Sleep(500)
	  MouseUp("left")
	  Sleep(1000)
	  $z = PixelSearch($2[0],$2[1],$2[2],$2[3],$c)
   WEnd
   $z = PixelSearch($3[0],$3[1],$3[2],$3[3],$c)
   While IsArray($z)
	  MouseMove($z[0], $z[1])
	  MouseDown("left")
	  Sleep(500)
	  MouseMove($4[0],$4[1])
	  Sleep(500)
	  MouseUp("left")
	  Sleep(1000)
	  $z = PixelSearch($3[0],$3[1],$3[2],$3[3],$c)
   WEnd
   
EndFunc

Func Undock()
   Dim $undb[5] = [904,170,970,200,0xe6b801]
   
   ;;$InStation = Check_st()
   ;$ClearCargo = Check_clear_cargo()
   ;If $InStation == 1 And $ClearCargo == 0 Then
	  $z = PixelSearch($undb[0],$undb[1],$undb[2],$undb[3],$undb[4],5)
	  MouseMove (900, 170)
	  Sleep(1000)
	  MouseClick("left",$z[0], $z[1])
	  Sleep(20000)
	  Send("{CTRLDOWN}")
	  sleep(100)
	  Send("{SPACE}")
	  sleep(100)
	  Send("{F1}")
	  sleep(100)
	  Send("{F2}")
	  sleep(100)
	  Send("{CTRLUP}")
	  Sleep(10000)
   ;EndIf

EndFunc

