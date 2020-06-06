; Media
RButton::RButton
RButton & WheelUp:: send {Volume_Up 3}
RButton & WheelDown:: send {Volume_Down 3}
RButton & XButton2:: Media_Prev
RButton & XButton1:: Media_Next
RButton & MButton:: Media_Play_Pause

#IfWinActive, ahk_class KMPlayer 64X
XButton1::Send {Left}
XButton2::Send {Right}

#IfWinActive,