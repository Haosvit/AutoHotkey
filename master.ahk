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

; master's codes
gShowSourceFolder:
  explorerCmd := "explorer /select," A_ScriptDir
  Run %explorerCmd%
Return