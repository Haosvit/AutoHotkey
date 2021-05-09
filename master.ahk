#Persistent

; Tray
Menu, Tray, Add, Open source in VsCode, gOpenSourceInVsCode

; includes variables
#include %A_ScriptDir%/winSize/variables.ahk

; include hot keys/functions here
; self keys asigned
SetWorkingDir, %A_ScriptDir%/EmojiKeyBindings
#include %A_ScriptDir%/EmojiKeyBindings/emojiKeyBindings.ahk

SetWorkingDir, %A_ScriptDir%
#include %A_ScriptDir%/mediaKeyBindings.ahk
; import functions
#include, %A_ScriptDir%/winSize/winSize.ahk
#include, %A_ScriptDir%/guidgen.ahk
#include, %A_ScriptDir%/timestamp.ahk
#include, %A_ScriptDir%/readMode.ahk
#include, %A_ScriptDir%/onScreenKeyboard.ahk
#include, %A_ScriptDir%/pageZoom.ahk
#include, %A_ScriptDir%/onTopTransparent.ahk


; key bindings
; ^#R:: readMode()
+F6:: pasteLowercaseGuid()
+F5:: pasteTimestamp()
#Q:: cycleWindowSizes()
!+Q:: mouseDownWindowResizingCorner()
; RButton & LButton:: onScreenKeyBoard()
#T:: toggleWinOnTopTransparent(200)

~!WheelRight::nextDesktop()
~!WheelLeft::prevDesktop()


gOpenSourceInVsCode:
  command := "code -n " . A_ScriptDir
  Run %ComSpec% /c %command% 
return
