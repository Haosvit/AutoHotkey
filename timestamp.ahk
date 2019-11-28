+F5::
  FormatTime, timestamp, %A_Now%, yyyy-MMM-dd-HHmmss
  backupClip := Clipboard
  Clipboard := timestamp
  SendInput,^v
  Clipboard := backupClip
return
