Func Check_link()
   $disp = 5
   $x1 = 612
   $y1 = 607
   $ret = 0
   $z110 = 0
   $z210 = 0
   $i = 0
   While $i < 20 ;;;¿¿¿¿¿¿¿¿¿ ¿¿¿¿¿¿¿¿ ¿¿¿ ¿¿¿¿¿¿¿¿ 50, ¿¿ ¿¿¿¿¿¿¿¿¿ ¿¿¿¿¿¿¿¿¿ ¿¿¿¿¿¿¿¿ ¿¿ 20
	  $z11 = PixelGetColor( $x1+54, $y1)
	  $z21 = PixelGetColor( $x1+95, $y1+3)
	  ;$z31 = PixelGetColor( $x1+100-5, $y1)
	  If $z110 == 0 Then
		 $z110 = $z11
		 $z210 = $z21
	  Else
		 If ($z110 <> $z11 ) and ($ret == 0 Or $ret == 10 Or $ret == 100 Or $ret == 110 ) Then ;;; Or $z120 <> $z12
			$ret = $ret + 1
		 EndIf
		 If ($z210 <> $z21 ) and ($ret == 0 Or $ret == 1 Or $ret == 100 Or $ret == 101) Then ;;;Or $z220 <> $z22
			$ret = $ret + 10
		 EndIf
	  EndIf
	  If $ret == 11 Then
	    ExitLoop
	  EndIf
	  $i = $i + 1
	  sleep(1)
   WEnd


   Return $ret   
EndFunc

Func link_act($res)
   if $res == 0 Or $res == 10 Then
	  Send("{F2}")
	  Sleep(100)
   ElseIf $res == 0 Or $res == 1 Then
	  Send("{F3}")
	  Sleep(100)
   EndIf

EndFunc


Func link()
   ;MsgBox(0,"1","1")
   $t = 0
   $res = 0
   While $res <> 11 or $t < 5
	  $res = Check_link()
	  link_act($res)
	  sleep(1000)
          $t = $t + 1
   WEnd
EndFunc