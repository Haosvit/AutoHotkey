#Persistent
; GLOBAL

_IsEmojiModeOn = false
_IsNotificationEnabled = false

!F1::Reload

*<!CapsLock:: 
{
  ToggleEmojiMode()
  if _IsNotificationEnabled 
  {
    onOrOff := _IsEmojiModeOn ? "ON" : "OFF"
    TrayTip, EMOJI KEYBOARD, Emoji mode is %onOrOff%, 3
  }
}
return



; HELPERS

ToggleEmojiMode()
{
  _IsEmojiModeOn := !_IsEmojiModeOn
  msgbox %_isemojimodeon%
  return
}
