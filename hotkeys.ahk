; Create custom binds by using the key combination followed by two colons (::),
; using the function sendChat, and passing the string you want as a bind in
; quotes. Follow this with a line reading only `Return`.
; Below are some binds which you may use yourself, or use as templates for new
; binds. If you would like to make your own (custom) hotkeys, more is described
; here: http://ahkscript.org/docs/Hotkeys.htm#Intro

F1::
	sendChat("Heal please?")
Return

F2::
	sendChat("Thank you. :)")
Return

F3::
	sendChat("MP please!")
Return

F4::
	sendChat("He lives and reigns and conquers the world")
Return

F11::
	sendChat("/tutorial")
Return

F12::
	sendChat("/nexustutorial")
Return


; The following binds double-click on an inventory space to swap
; items/abilities/armors/rings. Add or remove them as you see fit.

^1::
	invSwap(1)	;;;;; CHANGE TO YOUR WEAPON SWAP INVENTORY SLOT
Return

^2::
	invSwap(2)	;;;;; CHANGE TO YOUR ABILITY SWAP INVENTORY SLOT
Return


; Here are some other 'default' binds which you can leave as-is, delete, or
; change, if you wish.

`:: ;(backtick)
	sendChat("/pause")
Return

^w::
	sendChat("/who")
Return

^s::
	sendChat("/server")
Return

^d::
	sendChat("/tell mreyeball server")
Return

; close script
^F8:: ExitApp


; The following are in place to prevent accidental closure of a window or tab
; because of nearby binds.

^q::
Return
^e::
Return


; Finally, here are some more core binds - adjust at your own risk~

RButton::
	Send +{LButton}
	GetKeyState, LB, LButton, P
	if (LB == "D") {
		Send {LButton down}
	}
Return

^RButton::
	Click Right
Return

; set a teleport target (input window title and text don't use quotes)
^t::InputBox, tptarget, Teleport target, Please enter a person to teleport to:

; teleport to the target set with shift+right-click
+RButton::
	sendChat("/teleport "+tptarget)
Return

; fixed interact with ctrl+f
^f::
	MouseGetPos, mousePosX, mousePosY
	WinGetPos, , , winSizeX, winSizeY, A
	global menuHeight
	global vBorderWidth
	global hBorderWidth
	global titleHeight
	stretched := false
	if (!imageQualitySearch("enter", imageLocX, imageLocY)) {
		stretched := !imageQualitySearch("change", imageLocX, imageLocY)
	}
	if (stretched) {
		intendedX := 698
		intendedY := 575
		stretchedWindowPosition(intendedX, intendedY, stretchedX, stretchedY)
		windowPosToClientPos(stretchedX, stretchedY, posX, posY)
	} else {
		windowPosToClientPos(imageLocX, imageLocY, posX, posY)
	}
	BlockInput, on
	CoordMode, Mouse, Client
	MouseMove, posX, posY
	SendEvent {LButton Down}
	SendEvent {LButton Up}
	CoordMode, Mouse, Window
	MouseMove, mousePosX, mousePosY
	BlockInput, off
	stretched := false
Return

; scroll the chat log with the default in game keybinds
+WheelUp::
	global SCROLL_CHAT_UP_KEY
	if (SCROLL_CHAT_UP_KEY) {
		key = %SCROLL_CHAT_UP_KEY%
	} else {
		key = PgUp
	}
	Send {%key%}
Return
+WheelDown::
	global SCROLL_CHAT_DOWN_KEY
	if (SCROLL_CHAT_UP_KEY) {
		key = %SCROLL_CHAT_UP_KEY%
	} else {
		key = PgDn
	}
	Send {%key%}
Return