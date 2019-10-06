; msgbox %A_ScreenWidth% x %A_ScreenHeight%
; WinGetPos, winX, winY, winW, winH, A
size1(winX, winY, winW, winH) {

MARGIN := 5
width := A_ScreenWidth - 2 * MARGIN
height := A_ScreenHeight / 3 - 2 * MARGIN
x := A_ScreenWidth / 2 - width / 2
y := A_ScreenHeight / 2 - height / 2
WinMove, A, , %winX%, %winY%, %width%, %height%
return
}
size2(winX, winY, winW, winH) {

return
}
global _count := 0
#T::
_count := _count + 1
if (_count == 4) {
  _count := 1
}
ToolTip, %_count%
WinGetPos, winX, winY, winW, winH, A

size%_count%(winX, winY, winW, winH)

return


