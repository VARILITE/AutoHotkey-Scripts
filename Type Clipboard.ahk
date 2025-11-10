#Requires AutoHotkey v2
#SingleInstance Force

; Ctrl + Alt + V to type out the contents of the clipboard.

^!v::
{
	; Release Ctrl + Alt to fix sticky modifiers bug
	Sleep 100
	SendInput "{^ up}"
	SendInput "{! up}"

	; Get clipboard contents
	raw := "{Raw}" A_Clipboard

	; Replace carriage return newline with just newline.
	out := StrReplace(raw, "`r`n", "`n")

	; Send out
	SendEvent out
}
