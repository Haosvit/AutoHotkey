; Exposes two hotkeys:
; - Win+G generates & pastes a new lowercase guid
; - Win+Shift+G generates & pastes a new UPPERCASE guid
; In both cases, the guid is left on the clipboard so you can easily paste it more than once.
;
GUID()
{
   format = %A_FormatInteger%       ; save original integer format
   SetFormat Integer, Hex           ; for converting bytes to hex
   VarSetCapacity(A,16)
   DllCall("rpcrt4\UuidCreate","Str",A)
   Address := &A
   Loop 16
   {
      x := 256 + *Address           ; get byte in hex, set 17th bit
      StringTrimLeft x, x, 3        ; remove 0x1
      h = %x%%h%                    ; in memory: LS byte first
      Address++
   }
   SetFormat Integer, %format%      ; restore original format
   h := SubStr(h,1,8) . "-" . SubStr(h,9,4) . "-" . SubStr(h,13,4) . "-" . SubStr(h,17,4) . "-" . SubStr(h,21,12)
   return h
}

; Win+G - Generate and paste a GUID
+F6::
guid := GUID()
StringLower, guid, guid
Clipboard := guid
SendInput,^v
return

; Win+Shift+G - Generate an UPPERCASE GUID
#+F6::
guid := GUID()
StringUpper, guid, guid
Clipboard := guid
SendInput,^v
return
