^#R::
  global READMODE_WINSIZE_W := 1024
  global READMODE_WINSIZE_H := 768
  global SCREEN_W := 1920
  global SCREEN_H := 1080
  global WINSIZE_TASKBAR_H := 30
  WinGetPos, x, y, w, h, A

  newW := READMODE_WINSIZE_W
  newH := READMODE_WINSIZE_H
  newL := (x // SCREEN_W) * SCREEN_W + (SCREEN_W - newW) // 2
  newT := (SCREEN_H - newH - WINSIZE_TASKBAR_H) // 2
  screenNr := (x // SCREEN_W) + 1

  WinMove, A, , %newL%, %newT%, %newW%, %newH%

  Send, ^{NumpadAdd}
return