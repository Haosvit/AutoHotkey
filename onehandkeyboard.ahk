#Persistent
; #InstallKeybdHook
global IsOneHandMode := false
global Mirror := false
global IsMirrorUsed := false

#T::
  IsOneHandMode := !IsOneHandMode
  TrayTip, One-handed Mode, % IsOneHandMode ? "On" : "Off"
return

Space::
  if (IsOneHandMode) {
    Mirror := true
  }
  else {
    Send {Space}
  }
return

Space up::
  if (IsOneHandMode && !IsMirrorUsed) {
    Send {Space}
  }
  IsMirrorUsed := false

  Mirror := false
return

UsedMirrorKey(key, keyType := "") {

  if (!keyType) {
    SendRaw, %key%
  }
  else if (keyType == "fnKey") {
    Send %key%
  }

  IsMirrorUsed := true
}

#B:: ExitApp

#if (IsOneHandMode && Mirror)
t::UsedMirrorKey("y")
r::UsedMirrorKey("u")
e::UsedMirrorKey("i")
w::UsedMirrorKey("o")
q::UsedMirrorKey("p")
g::UsedMirrorKey("h")
f::UsedMirrorKey("j")
d::UsedMirrorKey("k")
s::UsedMirrorKey("l")
a::UsedMirrorKey(";")
b::UsedMirrorKey("n")
v::UsedMirrorKey("m")
c::UsedMirrorKey(",")
x::UsedMirrorKey(".")
z::UsedMirrorKey("/")

+T::UsedMirrorKey("Y")
+R::UsedMirrorKey("U")
+E::UsedMirrorKey("I")
+W::UsedMirrorKey("O")
+Q::UsedMirrorKey("P")
+G::UsedMirrorKey("H")
+F::UsedMirrorKey("J")
+D::UsedMirrorKey("K")
+S::UsedMirrorKey("L")
+A::UsedMirrorKey(";")
+B::UsedMirrorKey("N")
+V::UsedMirrorKey("M")
+C::UsedMirrorKey(",")
+X::UsedMirrorKey(".")
+Z::UsedMirrorKey("/")
`::UsedMirrorKey("{BackSpace}", "fnKey")
Tab::UsedMirrorKey("{Enter}", "fnKey")