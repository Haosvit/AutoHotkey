#Persistent
#InstallKeybdHook
global IsOneHandMode := true
global Mirror := false
global IsMirrorUsed := false

#R:: Reload

#T:: IsOneHandMode := !IsOneHandMode

GetSelectedWord()
ConvertToMirrorChar(char)

^Space::
  Selection := GetSelectedWord()
  newWord := ""
  Loop, parse, Selection
  {
    newWord .= ConvertToMirrorChar(A_LoopField)
  }

  ToolTip, %newWord%, 0, 0
return

GetSelectedWord() {
  return "tg es"
}

ConvertToMirrorChar(char) {
  left  := ["q", "w", "e", "r", "t","a", "s", "d", "f", "g"]
  right := ["p", "o", "i", "u", "y", ";", "l", "k", "j", "h"]

  StringLower, lowerChar, char
  mirrorChar := ""
  for index, value in left
  {
    if (value == lowerChar) {
      mirrorChar := right[index]
    }
  }

  if (lowerChar != char) {
    StringUpper, mirrorChar, mirrorChar
  }

  if (mirrorChar == "") {
    mirrorChar := char
  }

  return mirrorChar
}