^#R:: Reload
#Q::
  WinGetPos, x, y, w, h, A
  WinGetTitle, winTit, A

  if (winTit != WINSIZE_currentWinTitle) {
    WINSIZE_sizeIndex := 1
    WINSIZE_currentWinTitle := winTit
  }

  newW := WINSIZE_winSizes[WINSIZE_sizeIndex][1]
  newH := WINSIZE_winSizes[WINSIZE_sizeIndex][2]

  screenNr := (x // WINSIZE_SCREENSIZE_W) + 1
  if ((x + newW) > (screenNr) * WINSIZE_SCREENSIZE_W) {
     x := screenNr * WINSIZE_SCREENSIZE_W - (x + newW)
  }

  WinMove, A, , %x%, %y%, %newW%, %newH%
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
