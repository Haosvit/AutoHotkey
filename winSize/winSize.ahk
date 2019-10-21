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

  WinMove, A, , %x%, %y%, %newW%, %newH%

  WINSIZE_sizeIndex := WINSIZE_sizeIndex + 1
  if (WINSIZE_sizeIndex > WINSIZE_winSizes.Length()) {
    WINSIZE_sizeIndex := 1
  }
return
