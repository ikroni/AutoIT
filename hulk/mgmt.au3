Global $pause
HotKeySet("{ESC}","Terminate")
HotKeySet("1","Start")
HotKeySet("2","Pause")

Func Terminate()
   Exit 0
EndFunc

Func Start()
   ToolTip('Script is started',0,0)
   Main()
EndFunc

Func Pause()
  $pause = not $pause
  while $pause
    sleep(100)
    ToolTip('Script is Paused',0,0)
 wend
 ToolTip('Script is started',0,0)
EndFunc
