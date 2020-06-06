#Q::
  WinGetPos, x, y, w, h, A
  WinGetTitle, winTit, A

  if (winTit != WINSIZE_currentWinTitle) {
    WINSIZE_sizeIndex := 1
    WINSIZE_currentWinTitle := winTit
  }

  newW := WINSIZE_winSizes[WINSIZE_sizeIndex][1]
  newH := WINSIZE_winSizes[WINSIZE_sizeIndex][2]
  newL := (x // WINSIZE_SCREENSIZE_W) * WINSIZE_SCREENSIZE_W + (WINSIZE_SCREENSIZE_W - newW) // 2
  newT := (WINSIZE_SCREENSIZE_H - newH - WINSIZE_TASKBAR_H) // 2
  screenNr := (x // WINSIZE_SCREENSIZE_W) + 1

  WinMove, A, , %newL%, %newT%, %newW%, %newH%
  ToolTip, %newW% x %newH%, 0, 0
  SetTimer, RemoveToolTip, 500

  WINSIZE_sizeIndex := WINSIZE_sizeIndex + 1
  if (WINSIZE_sizeIndex > WINSIZE_winSizes.Length()) {
    WINSIZE_sizeIndex := 1
  }
return

RemoveToolTip:
ToolTip
return

; Win + k
#K:: ;dock the active window to top half of the specified screen
VERTICAL_MON_INDEX = 1;
SysGet, mon, Monitor, %VERTICAL_MON_INDEX%
w := monRight - monLeft
h := (monBottom - monTop) // 2
WinMove, A, , %monLeft%, %monTop%, %w%, %h%
return
