Global $pause
HotKeySet("{ESC}","Terminate")
HotKeySet("1","Start")
HotKeySet("2","Pause")

Func Terminate()
   Exit 0
EndFunc

Func Start()
   ToolTip('Script is started',0,0)
   $orca_state = 1
   Main()
EndFunc

Func Pause()
  $pause = not $pause
  while $pause
	 $orca_state = 2
    sleep(100)
    ToolTip('Script is paused',0,0)
 wend
 $orca_state = 1
 ToolTip('Script is started',0,0)
EndFunc
