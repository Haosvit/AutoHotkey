; #Persistent
; GLOBAL
global _IsEmojiModeOn := false
; global _IsNotificationEnabled := true
global _Emojis := []
global _ConfigIniPath := A_WorkingDir . "/config.ini"
global _MappedKeyPrefix := "Key"

LoadSetup()
InitTrayMenu()
UpdateTrayIcon()

*<!CapsLock::
{
	ToggleEmojiMode()
}
return

!.:: Send {NumLock}

ToggleEmojiMode()
{
  _IsEmojiModeOn := not _IsEmojiModeOn
  WriteCurrentSettings()

  UpdateTrayIcon()
  return
}

SendUnicode(code)
{
	IfNotEqual, code, ;empty
	{
		Send {U+%code%}
	}
	return
}

; mapping
#if _IsEmojiModeOn
{
	*<!1:: SendUnicode(_Emojis[1])
	*<!2:: SendUnicode(_Emojis[2])
	*<!3:: SendUnicode(_Emojis[3])
	*<!4:: SendUnicode(_Emojis[4])
	*<!5:: SendUnicode(_Emojis[5])
	*<!6:: SendUnicode(_Emojis[6])
	*<!7:: SendUnicode(_Emojis[7])
	*<!8:: SendUnicode(_Emojis[8])
	*<!9:: SendUnicode(_Emojis[9])
	*<!0:: SendUnicode(_Emojis[10])
}
return

; send any unicode code in HEX
;`::
;{
;	hexCode =
;	Input hexCode, T5, {space} {enter} {esc}
;	SendUnicode(hexCode)
;}
;return

InitTrayMenu()
{
	Menu, Tray, Add,
	Menu, Tray, Add, Edit Emoji Mapping, gEditEmojiMapping
	return
}

UpdateTrayIcon()
{
	iconName := _IsEmojiModeOn ? "on.ico" : "off.ico"
  iconPath := A_WorkingDir . "/" . iconName
	Menu, Tray, icon, %iconPath%
	return
}

LoadSetup()
{
	mapKeyCount = 0
	IniRead, _IsEmojiModeOn, %_ConfigIniPath%, Main, IsEmojiModeOn, 0
	IniRead, _IsNotificationEnabled, %_ConfigIniPath%, Main, IsNotificationEnabled, 0
	IniRead, MappedKeyCount, %_ConfigIniPath%, Main, MappedKeyCount , 0
	Loop %MappedKeyCount%,
	{
		emojiCode =
		IniRead, emojiCode, %_ConfigIniPath%, Mapping, %_MappedKeyPrefix%%A_Index%
		_Emojis[A_Index] := emojiCode
	}

	IfNotExist %_ConfigIniPath%
	{
		WriteCurrentSettings()
		IniWrite, 10, %_ConfigIniPath%, Main, MappedKeyCount

		Loop 10,
		{
			value := _MappedKeyPrefix . Mod(A_Index, 10)
			IniWrite, "", %_ConfigIniPath%, Mapping, %value%
		}
	}
	return
}

WriteCurrentSettings()
{
	IniWrite, %_IsEmojiModeOn%, %_ConfigIniPath%, Main, IsEmojiModeOn
	IniWrite, %_IsNotificationEnabled%, %_ConfigIniPath%, Main, IsNotificationEnabled
	return
}

; Tray menu g lables
gEditEmojiMapping:
	Run %_ConfigIniPath%
return
