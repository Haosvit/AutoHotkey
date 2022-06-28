
locateWindowsInMonitor(x, y, w, h)
{
  SysGet, monitorCount, MonitorCount
  SysGet, primaryIndex, MonitorPrimary

  candidateIndex := primaryIndex
  prevDistance = -1

  Loop, %monitorCount%
  {
    SysGet, monRect, Monitor, %A_Index%

    monMidX := monRectLeft + (monRectRight - monRectLeft) / 2
    monMidY := monRectTop + (monRectBottom - monRectTop) / 2
    midX := x + w / 2
    midY := y + h / 2

    distance := Sqrt((midX - monMidX)**2 +(midY - monMidY)**2)

    if (distance < prevDistance || prevDistance < 0 ) {
      candidateIndex := A_Index
    }

    prevDistance := distance
  }

  return candidateIndex
}


cycleWindowSizes()
{
  WinGetPos, x, y, w, h, A
  monIndex := locateWindowsInMonitor(x, y, w, h)

  if (monIndex < 0) {
    msgbox error can't locate windows
  }

  SysGet, monWorkArea, MonitorWorkArea, %monIndex%
  monW := monWorkAreaRight - monWorkAreaLeft
  monH := monWorkAreaBottom - monWorkAreaTop

  ; newW := WINSIZE_winSizes[WINSIZE_sizeIndex][1]
  ; newH := WINSIZE_winSizes[WINSIZE_sizeIndex][2]
  percentW := WINSIZE_winSizes[WINSIZE_sizeIndex][1]
  percentH := WINSIZE_winSizes[WINSIZE_sizeIndex][2]
  
  if (percentW <> "") 
  {
    newW := percentW < 1 ? percentW * monW : percentW
  } 
  else 
  {
    newW := percentH < 1 ? percentH * monH : percentH
  }
  
  if (percentH <> "")
  {
    newH := percentH < 1 ? percentH * monH : percentH
  } 
  else 
  {
    newH := newW
  }
  
  newT := monWorkAreaTop + (monH - newH) / 2
  newL := monWorkAreaLeft + (monW - newW) /2

  WinMove, A, , %newL%, %newT%, %newW%, %newH%
  WinRestore, A

  ToolTip, %newW% x %newH%, 0, 0
  SetTimer, RemoveToolTip, 500

  WinGetTitle, winTit, A
  if (winTit != WINSIZE_currentWinTitle) {
    WINSIZE_sizeIndex := 1
    WINSIZE_currentWinTitle := winTit
  }

  WINSIZE_sizeIndex := WINSIZE_sizeIndex + 1
  if (WINSIZE_sizeIndex > WINSIZE_winSizes.Length()) {
    WINSIZE_sizeIndex := 1
  }
  return
}

RemoveToolTip:
  ToolTip
return


nextDesktop()
{
  Send ^#{Right}
}

prevDesktop()
{
  Send ^#{Left}
}

mouseDownWindowResizingCorner() 
{
  ;MouseGetPos, mouseX, mouseY
  WinGetPos, x, y, w, h, A
  MouseClick, L, % w - 3 , % h - 3, 1, 0, D
  ;Tooltip % "Resize windows, [LClick] to confirm, [Esc] to cancel"
  ; Restore mouse
  ; KeyWait, LButton, D
  ; KeyWait, LButton, U
  ; MouseMove, %mouseX%, %mouseY%, 0
}