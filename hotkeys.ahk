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


; right-click -> shift+click, ctrl+right-click -> right-click
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
^t::
	tpTarget()
Return

; teleport to the target set with shift+right-click
+RButton::
	sendChat("/teleport "+tptarget)
Return

; fixed interact with ctrl+f
^f::
	interact()
Return

; shift+scroll through the chat log with the in-game keybinds
+WheelUp::
	scrollChat("up")
Return
+WheelDown::
	scrollChat("down")
Return