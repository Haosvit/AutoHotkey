#Persistent

; includes variables
#include %A_ScriptDir%/winSize/variables.ahk

Menu, Tray, Add, Show source folder, gShowSourceFolder


; include hot keys/functions here
SetWorkingDir, %A_ScriptDir%/EmojiKeyBindings
#include %A_ScriptDir%/EmojiKeyBindings/emojiKeyBindings.ahk

SetWorkingDir, %A_ScriptDir%
#include %A_ScriptDir%/mediaKeyBindings.ahk
#include, %A_ScriptDir%/winSize/winSize.ahk
#include, %A_ScriptDir%/guidgen.ahk
#include, %A_ScriptDir%/timestamp.ahk
#include, %A_ScriptDir%/readMode.ahk
#include, %A_ScriptDir%/onScreenKeyboard.ahk

; master's codes
gShowSourceFolder:
  explorerCmd := "explorer /select," A_ScriptDir
  Run %explorerCmd%
return
