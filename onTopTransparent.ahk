#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

global _aOT := false

toggleWinOnTopTransparent(transparency = 125)
{
  aot := _aOT ? "ON" : "OFF"
  WinSet, AlwaysOnTop, %aot%, A
  trans := _aOT ? transparency : 255
  WinSet, Trans, %trans%, A

  _aOT := !_aOT

  return
}