Global $pause
HotKeySet("{ESC}","Terminate")
HotKeySet("1","Start")
HotKeySet("2","Pause")

Func Terminate()
   Exit 0
EndFunc

Func Start()
   Main()
EndFunc

Func Pause()
  $pause = not $pause
  while $pause
    sleep(100)
  wend
EndFunc
