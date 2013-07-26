;;; Use the top section to set custom binds, custom cursors, etc.

; Set to 1 if you want to use a custom .cur file when the window is active, 0 otherwise
USE_CUSTOM_CURSOR := 1

; name of the .cur file as it appears in /img/cursors/
CUSTOM_CURSOR := "bmj_precision.cur"

; Custom chat activation key. If you use Enter as your chat activation key, leave this variable empty!
; See this link for a list of key names: http://www.autohotkey.com/docs/KeyList.htm
CHAT_ACTIVATION_KEY = 



;;;;;;;;;;;;;; DO NOT DELETE!!
goto STARTUP ; DO NOT DELETE!!
;;;;;;;;;;;;;; DO NOT DELETE!!



; Create custom binds by using the key combination followed by two colons (::), using the function
; enterChat, and passing the string you want as a bind in quotes. Follow this with a line reading
; only "Return". Below are some binds which you may keep, or use as examples for new binds.

F1::
	enterChat("Heal please?")
Return

F2::
	enterChat("Thank you. :)")
Return

F3::
	enterChat("MP please!")
Return

F4::
	enterChat("He lives and reigns and conquers the world")
Return

F11::
	enterChat("/tutorial")
Return

F12::
	enterChat("/nexustutorial")
Return



; Here are some other 'default' binds which you can leave as-is, delete, or change, if you wish.

`:: ;(backtick)
	enterChat("/pause")
Return

^w::
	enterChat("/who")
Return

^s::
	enterChat("/server")
Return

^d::
	enterChat("/tell mreyeball server")
Return

; close script
^F8:: ExitApp



; The following binds double-click on an inventory space to swap items/abilities/armors/rings.
; Add or remove them as you see fit.

^1::
	invSwap(1)	;;;;; CHANGE TO YOUR WEAPON SWAP INVENTORY SLOT
Return

^2::
	invSwap(2)	;;;;; CHANGE TO YOUR ABILITY SWAP INVENTORY SLOT
Return



; The following are in place to prevent accidental closure of a window or tab because of nearby binds.
^q::
Return
^e::
Return












STARTUP:
	OnExit, ExitSub
	#NoEnv
	#SingleInstance force
	SendMode Input
	SetWorkingDir %A_ScriptDir%
	SetKeyDelay 0
	SetMouseDelay 0
	SetTitleMatchMode 3	;match exact titles
	#include includes/SetSystemCursor.ahk

	Suspend On
	GroupAdd rotmg, Realm of the Mad God
	GroupAdd rotmg, Realm of the Mad God - Mozilla Firefox
	GroupAdd rotmg, Realm of the Mad God - Mozilla Firefox (Private Browsing)
	GroupAdd rotmg, Realm of the Mad God - Google Chrome
	GroupAdd rotmg, Realm of the Mad God - Opera
	GroupAdd rotmg, Realm of the Mad God - Windows Internet Explorer
	GroupAdd rotmg, Realm of the Mad God | Kabam
	GroupAdd rotmg, Realm of the Mad God | Kabam - Mozilla Firefox
	GroupAdd rotmg, Realm of the Mad God | Kabam - Mozilla Firefox (Private Browsing)
	GroupAdd rotmg, Realm of the Mad God | Kabam - Google Chrome
	GroupAdd rotmg, Realm of the Mad God | Kabam - Opera
	GroupAdd rotmg, Realm of the Mad God | Kabam - Windows Internet Explorer
	GroupAdd rotmg, Play Realm of the Mad God, a free online game on Kongregate
	GroupAdd rotmg, Play Realm of the Mad God, a free online game on Kongregate - Mozilla Firefox
	GroupAdd rotmg, Play Realm of the Mad God, a free online game on Kongregate - Mozilla Firefox (Private Browsing)
	GroupAdd rotmg, Play Realm of the Mad God, a free online game on Kongregate - Google Chrome
	GroupAdd rotmg, Play Realm of the Mad God, a free online game on Kongregate - Opera
	GroupAdd rotmg, Play Realm of the Mad God, a free online game on Kongregate - Windows Internet Explorer
	GroupAdd rotmg, Adobe Flash Player 10
	GroupAdd rotmg, Adobe Flash Player 11
	WinNotActive()
Return

WinActive(){
	global USE_CUSTOM_CURSOR, CUSTOM_CURSOR
	Suspend Off
	if(USE_CUSTOM_CURSOR){
		SetSystemCursor("img/cursors/"+CUSTOM_CURSOR,0,0)
	}
	WinWaitNotActive ahk_group rotmg
	{
		WinNotActive()
	}
}

WinNotActive(){
	global USE_CUSTOM_CURSOR
	Suspend on
	if(USE_CUSTOM_CURSOR){
		RestoreCursors()
	}
	WinWaitActive ahk_group rotmg
	{
		WinActive()
	}
}

RButton::
	Send +{LButton}
	GetKeyState, LB, LButton, P
	if (LB == "D"){
		Send {LButton down}
	}
Return

^+RButton::
	Click Right
Return

; set a teleport target (input window title and text don't use quotes)
^t::InputBox, tptarget, Teleport target, Please enter a person to teleport to:

; teleport to the target set with ctrl+n
+RButton::
	enterChat("/teleport "+tptarget)
Return

; fixed interact with ctrl+f
^f::
	MouseGetPos, mousePosX, mousePosY ;mousePosX/Y have old mouse position
	WinGetPos, , , winSizeX, winSizeY, A ;winSizeX/Y have window size
	SysGet, menuHeight, 15
	SysGet, vBorderWidth, 32
	SysGet, hBorderWidth, 33
	SysGet, titleHeight, 4
	ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\enter-low.png
	if ErrorLevel{
		ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\change-low.png
		if ErrorLevel{
			ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\enter-high.png
			if ErrorLevel{
				ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\change-high.png
				if ErrorLevel{
					ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\enter-med.png
					if ErrorLevel{
						ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\change-med.png
						if ErrorLevel{
							; screen is stretched
							stretched := true
						}
					}
				}
			}
		}
	}
	if(stretched){
		posX := 698
		posY := 575
		multiplierX := ((winSizeX-vBorderWidth)/800)
		multiplierY := ((winSizeY-(menuHeight+hBorderWidth+titleHeight))/600)
		posX *= multiplierX
		posY *= multiplierY
	} else {
		posX := imageLocX + 35 - vBorderWidth
		posY := imageLocY + 14 - (menuHeight+hBorderWidth+titleHeight)
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
+WheelUp::Send {PgUp}
+WheelDown::Send {PgDn}

; convert /tp to /teleport in the game chat
:*:/tp::
	ClipSaved := clipboard
	clipboard := "/teleport"
	Blockinput, on
	Send ^a
	Send ^v
	Send {Space}
	Blockinput, off
	Sleep 100
	clipboard := ClipSaved
	ClipSaved := "" ;save memory
Return

; sends passed string to the chat using the enter key
enterChat(message){
	global CHAT_ACTIVATION_KEY
	if(CHAT_ACTIVATION_KEY){
		key = %CHAT_ACTIVATION_KEY%
	} else {
		key = Enter
	}
	ClipSaved := clipboard
	clipboard := message
	Blockinput, on
	Send {%key%}
	Send ^v
	Send {Enter}
	Blockinput, off
	Sleep 100
	clipboard := ClipSaved
	ClipSaved := "" ;save memory
}

; sends passed string to the chat using the tab key
tabChat(message){
	ClipSaved := clipboard
	clipboard := message
	Blockinput, on
	Send {Tab}
	Send ^v
	Send {Enter}
	Blockinput, off
	Sleep 100
	clipboard := ClipSaved
	ClipSaved := "" ;save memory
}

; item swap function [inventory squares are 44px wide]
; move the mouse to the correct slot, double-click, and move it back
invSwap(slot){
	MouseGetPos, mousePosX, mousePosY ;mousePosX/Y have old mouse position
	WinGetPos, , , winSizeX, winSizeY, A ;winSizeX/Y have window size
	WinGet, winProcessName, ProcessName, A
	SysGet, menuHeight, 15
	SysGet, vBorderWidth, 32
	SysGet, hBorderWidth, 33
	SysGet, titleHeight, 4
	stretched:=false
	ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\inv-low.png
	if ErrorLevel {
		ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\inv-high.png
		if ErrorLevel {
			ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\inv-med.png
			if ErrorLevel {
				; screen is stretched
				stretched:=true
			}
		}
	}
	; move the mouse to the correct slot, double-click (using events), and move it back
	if(stretched){
		yMultiplierSubtract := (winProcessName=="Realm of the Mad God.exe")?(hBorderWidth+titleHeight):(menuHeight+hBorderWidth+titleHeight)
		posX := 634 + Mod((44 * (slot-1)), (4*44))
		posY := 400 + (44 * ((slot-1)//(4)))
		multiplierX := ((winSizeX-vBorderWidth)/800)
		multiplierY := ((winSizeY-yMultiplierSubtract)/600)
		posX *= multiplierX
		posY *= multiplierY
	} else { ;not stretched
		WinGetTitle, winTitle, A
		WinGet, winMax, MinMax, A
		;chrome (not maximized)
		if(winTitle=="Realm of the Mad God - Google Chrome"&&winMax==0){
			posX := imageLocX + 27 + Mod((44 * (slot-1)), (4*44))
			posY := imageLocY + 46 + (44 * ((slot-1)//(4)))
		;opera, ff
		} else if(winTitle=="Realm of the Mad God - Opera"||winTitle=="Realm of the Mad God - Mozilla Firefox"||winTitle=="Realm of the Mad God - Mozilla Firefox (Private Browsing)") {
			posX := imageLocX + 27 + Mod((44 * (slot-1)), (4*44)) - vBorderWidth
			posY := imageLocY + 46 + (44 * ((slot-1)//(4)))
		;IE, safari, steam
		} else if(winTitle=="Realm of the Mad God - Windows Internet Explorer"||winProcessName=="Safari.exe"||winProcessName=="Realm of the Mad God.exe"){
			posX := imageLocX + 27 + Mod((44 * (slot-1)), (4*44)) - vBorderWidth
			posY := imageLocY + 46 + (44 * ((slot-1)//(4))) - (hBorderWidth+titleHeight)
		;chrome (when maximized)
		} else if(winTitle=="Realm of the Mad God - Google Chrome"&&winMax==1){
			posX := imageLocX + 27 + Mod((44 * (slot-1)), (4*44)) - vBorderWidth
			posY := imageLocY + 46 + (44 * ((slot-1)//(4))) - hBorderWidth
		} else { ;projector
			posX := imageLocX + 27 + Mod((44 * (slot-1)), (4*44)) - vBorderWidth
			posY := imageLocY + 46 + (44 * ((slot-1)//(4))) - (menuHeight+hBorderWidth+titleHeight)
		}
	}
	BlockInput, on
	CoordMode, Mouse, Client
	MouseMove, posX, posY
	SendEvent {Control Up}
	SendEvent {LButton Down}
	SendEvent {LButton Up}
	SendEvent {LButton Down}
	SendEvent {LButton Up}
	CoordMode, Mouse, Window
	MouseMove, mousePosX, mousePosY
	BlockInput, off
	stretched := false
}

ExitSub:
	RestoreCursors()
	ExitApp