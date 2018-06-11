#Persistent
; GLOBAL

global _IsEmojiModeOn := false
global _IsNotificationEnabled := true
global _Emojis := ["263A", "1F602", "1F917", "1F60F", "2764", "", ""]

!F1::Reload

*<!CapsLock:: 
{
	ToggleEmojiMode()  
}
return

#T::
_IsNotificationEnabled := !_IsNotificationEnabled
return

; HELPERS

ToggleEmojiMode()
{
  _IsEmojiModeOn := not _IsEmojiModeOn 

  ShowNotificationIfAvailable()
  return
}

ShowNotificationIfAvailable()
{
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
