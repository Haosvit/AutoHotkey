#Persistent
; GLOBAL

global _IsEmojiModeOn := false
global _IsNotificationEnabled := true
global _Emojis := []
global _ConfigIniPath := ".\config.ini"

global _TrayTipTitle := "EMOJI KEYBOARD"
global _DefaultTrayTipDuration := 1 ;secs
global _MappedKeyPrefix := "Key"

LoadSetup()
UpdateTrayIcon()

!F1::Reload

*<!CapsLock:: 
{
	ToggleEmojiMode()  
}
return

!.:: Send {NumLock} 

#T::
_IsNotificationEnabled := !_IsNotificationEnabled
WriteCurrentSettings()
return

ToggleEmojiMode()
{
  _IsEmojiModeOn := not _IsEmojiModeOn 
  WriteCurrentSettings()

  UpdateTrayIcon()

  if _IsNotificationEnabled
  {
    onOrOff := _IsEmojiModeOn ? "ON" : "OFF"
    TrayTip, EMOJI KEYBOARD, Emoji keyboard is %onOrOff%`nWin + T to toggle notification, 1
  }
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
`::
{
	hexCode =
	Input hexCode, T5, {space} {enter} {esc}
	SendUnicode(hexCode)	
}
return

UpdateTrayIcon() 
{
	iconName := _IsEmojiModeOn ? "on.ico" : "off.ico"
	Menu, Tray, icon, %iconName%
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
