Func Dock()
   Dim $st[2] = [725,192]
   Dim $ow[2] = [742, 133]
   MouseClick("left", $ow[0], $ow[1])
   Sleep(1000)
   MouseClick("left",$st[0],$st[1])
EndFunc
