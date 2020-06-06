#Persistent

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

; key bindings
^#R:: readMode()
+F6:: pasteLowercaseGuid()
+F5:: pasteTimestamp()
#Q:: cycleWindowSizes()
RButton & LButton:: onScreenKeyBoard()

; Tray
Menu, Tray, Add, Show source folder, gShowSourceFolder
gShowSourceFolder:
  explorerCmd := "explorer /select," A_ScriptDir
  Run %explorerCmd%
return
