; include global options
global USE_CUSTOM_CURSOR, CUSTOM_CURSOR, CHAT_ACTIVATION_KEY
       , TELL_ACTIVATION_KEY, GUILD_ACTIVATION_KEY, SCROLL_CHAT_UP_KEY
       , SCROLL_CHAT_DOWN_KEY, DISABLE_RESIZE
#include options.ahk

; check version, install files (for compiled scripts), set up global vars,
; start hotkey checking
goto STARTUP

; include hotkeys (must happen after window title group creation)
#include hotkeys.ahk


STARTUP:
	; check AHK version, exit if incompatible (v1.1.13 req for arrays)
	requiredVersion := "1.1.13"
	requiredVersionParts := StrSplit(requiredVersion, ".")
	runningVersionParts := StrSplit(A_AhkVersion, ".")
	Loop % requiredVersionParts.MaxIndex()
	{
		if (runningVersionParts[A_Index] > requiredVersionParts[A_Index]) {
			break
		} else if (runningVersionParts[A_Index]
		           < requiredVersionParts[A_Index]) {
			MsgBox, 16, You must update AHK!, % "Your version of AutoHotKey (v"
			  . A_AhkVersion . ") is not sufficient to correctly run "
			  . "realmscript!`nPlease download and install the latest version "
			  . "from http://ahkscript.org/ and run realmscript again."
			Run, http://ahkscript.org/
			ExitApp
		}
	}

	; ensure working directories, create dependencies for compiled versions
	IfNotExist, img/
		FileCreateDir, img
	IfNotExist, img/cursors/
		FileCreateDir, img/cursors
	FileInstall, img/change-high.png, img/change-high.png, 1
	FileInstall, img/change-med.png, img/change-med.png, 1
	FileInstall, img/change-low.png, img/change-low.png, 1
	FileInstall, img/close-low.png, img/close-low.png, 1
	FileInstall, img/enter-high.png, img/enter-high.png, 1
	FileInstall, img/enter-med.png, img/enter-med.png, 1
	FileInstall, img/enter-low.png, img/enter-low.png, 1
	FileInstall, img/inv-high.png, img/inv-high.png, 1
	FileInstall, img/inv-med.png, img/inv-med.png, 1
	FileInstall, img/inv-low.png, img/inv-low.png, 1
	FileInstall, img/realmscript.ico, img/realmscript.ico, 1
	FileInstall, img/realmscript_paused.ico, img/realmscript_paused.ico, 1
	FileInstall, img/cursors/bmj_precision.cur, img/cursors/bmj_precision.cur

	; set script directives, global settings, global vars
	OnExit, ExitSub
	#include includes/SetSystemCursor.ahk
	#NoEnv
	#SingleInstance force
	#ClipboardTimeout -1
	SetWorkingDir %A_ScriptDir%
	SendMode Input
	SetKeyDelay 0
	SetMouseDelay 0
	SetTitleMatchMode 3
	global menuHeight, vBorderWidth, hBorderWidth, titleHeight
	SysGet, menuHeight, 15
	SysGet, vBorderWidth, 32
	SysGet, hBorderWidth, 33
	SysGet, titleHeight, 4

	; set icon
	Menu, Tray, Icon, img/realmscript.ico, , 1

	Suspend On
	GroupAdd rotmg, % "Realm of the Mad God"
	GroupAdd rotmg, % "Realm of the Mad God - Mozilla Firefox"
	GroupAdd rotmg, % "Realm of the Mad God - Mozilla Firefox "
	                . "(Private Browsing)"
	GroupAdd rotmg, % "Realm of the Mad God - Google Chrome"
	GroupAdd rotmg, % "Realm of the Mad God - Opera"
	GroupAdd rotmg, % "Realm of the Mad God - Windows Internet Explorer"
	GroupAdd rotmg, % "Realm of the Mad God | Kabam"
	GroupAdd rotmg, % "Realm of the Mad God | Kabam - Mozilla Firefox"
	GroupAdd rotmg, % "Realm of the Mad God | Kabam - Mozilla Firefox "
	                . "(Private Browsing)"
	GroupAdd rotmg, % "Realm of the Mad God | Kabam - Google Chrome"
	GroupAdd rotmg, % "Realm of the Mad God | Kabam - Opera"
	GroupAdd rotmg, % "Realm of the Mad God | Kabam - Windows Internet Explorer"
	GroupAdd rotmg, % "Play Realm of the Mad God, a free online game on "
	                . "Kongregate"
	GroupAdd rotmg, % "Play Realm of the Mad God, a free online game on "
	                . "Kongregate - Mozilla Firefox"
	GroupAdd rotmg, % "Play Realm of the Mad God, a free online game on "
	                . "Kongregate - Mozilla Firefox (Private Browsing)"
	GroupAdd rotmg, % "Play Realm of the Mad God, a free online game on "
	                . "Kongregate - Google Chrome"
	GroupAdd rotmg, % "Play Realm of the Mad God, a free online game on "
	                . "Kongregate - Opera"
	GroupAdd rotmg, % "Play Realm of the Mad God, a free online game on "
	                . "Kongregate - Windows Internet Explorer"
	GroupAdd rotmg, % "Adobe Flash Player 10"
	GroupAdd rotmg, % "Adobe Flash Player 11"
	GroupAdd rotmg, % "Adobe Flash Player 12"
	GroupAdd rotmg, % "Adobe Flash Player 13"
	GroupAdd rotmg, % "Adobe Flash Player 14"
	GroupAdd rotmg, % "Adobe Flash Player 15"
	GroupAdd rotmg, % "Adobe Flash Player 16"
	GroupAdd rotmg, % "Adobe Flash Player 17"
	GroupAdd rotmg, % "Adobe Flash Player 18"
	GroupAdd rotmg, % "Adobe Flash Player 19"
	GroupAdd rotmg, % "Adobe Flash Player 20"
	GroupAdd rotmg, % "Adobe Flash Player 21"
	GroupAdd rotmg, % "Adobe Flash Player 22"
	GroupAdd rotmg, % "Adobe Flash Player 23"
	GroupAdd rotmg, % "Adobe Flash Player 24"
	GroupAdd rotmg, % "Adobe Flash Player 25"
	GroupAdd rotmg, % "Adobe Flash Player 26"
	GroupAdd rotmg, % "Adobe Flash Player 27"
	GroupAdd rotmg, % "Adobe Flash Player 28"
	GroupAdd rotmg, % "Adobe Flash Player 29"
	GroupAdd rotmg, % "Adobe Flash Player 30"
	WinNotActive()
Return

WinActive() {
	WinGetTitle, winTitle, A
	WinGet, winProcessName, ProcessName, A
	Suspend Off
	Menu, Tray, Icon, img/realmscript.ico, , 1
	if (DISABLE_RESIZE
	    && (InStr(winTitle, "Adobe Flash Player")
	        || winProcessName == "Realm of the Mad God.exe")) {
		WinSet, Style, -0x40000, ahk_group rotmg ; disable resize borders
	}
	if (USE_CUSTOM_CURSOR) {
		SetSystemCursor("img/cursors/"+CUSTOM_CURSOR,0,0)
	}
	WinWaitNotActive ahk_group rotmg
	{
		WinNotActive()
	}
}

WinNotActive() {
	Suspend on
	Menu, Tray, Icon, img/realmscript_paused.ico, , 1
	if (USE_CUSTOM_CURSOR) {
		RestoreCursors()
	}
	WinWaitActive ahk_group rotmg
	{
		WinActive()
	}
}

; convert /tp to /teleport in the game chat
:*:/tp::
	ClipSaved := ClipboardAll
	clipboard := "/teleport"
	Blockinput, on
	Send ^a
	Send ^v
	Send {Space}
	Blockinput, off
	Sleep 100
	clipboard := ClipSaved
	ClipSaved := "" ; save memory
Return

; sends passed string to the chat using the specified mode
sendChat(message, mode="public") {
	if (mode == "public") {
		activationKey = %CHAT_ACTIVATION_KEY%
		key = Enter
	} else if (mode == "guild") {
		activationKey = %GUILD_ACTIVATION_KEY%
		key = g
	} else if (mode == "tell") {
		activationKey = %TELL_ACTIVATION_KEY%
		key = Tab
	}
	if (activationKey) {
		key = %activationKey%
	}
	ClipSaved := ClipboardAll
	clipboard := message
	Blockinput, on
	Send {%key%}
	Send ^v
	Send {Enter}
	Blockinput, off
	Sleep 100
	clipboard := ClipSaved
	ClipSaved := "" ; save memory
}

tpTarget() {
	global tptarget
	InputBox, tptarget, Teleport target, Please enter a person to teleport to:
}

scrollChat(direction:="up") {
	if (direction == "up") {
		if (SCROLL_CHAT_UP_KEY) {
			key = %SCROLL_CHAT_UP_KEY%
		} else {
			key = PgUp
		}
	} else if (direction == "down") {
		if (SCROLL_CHAT_DOWN_KEY) {
			key = %SCROLL_CHAT_DOWN_KEY%
		} else {
			key = PgDn
		}
	}
	Send {%key%}
}

; interact key replacement
interact() {
	MouseGetPos, mousePosX, mousePosY
	WinGetPos, , , winSizeX, winSizeY, A
	stretched := false
	if (!imageQualitySearch("enter", imageLocX, imageLocY)) {
		stretched := !imageQualitySearch("change", imageLocX, imageLocY)
	}
	if (stretched) {
		clientButtonX := 698
		clientButtonY := 575
		stretchedWindowPosition(clientButtonX, clientButtonY, stretchedX, stretchedY)
		windowPosToClientPos(stretchedX, stretchedY, buttonCenterX, buttonCenterY)
	} else {
		imageSearchSizeX := 76
		imageSearchSizeY := 30
		windowPosToClientPos(imageLocX, imageLocY, posX, posY)
		buttonCenterX := posX + (imageSearchSizeX / 2)
		buttonCenterY := posY + (imageSearchSizeY / 2)
	}
	BlockInput, on
	CoordMode, Mouse, Client
	MouseMove, buttonCenterX, buttonCenterY
	SendEvent {LButton Down}
	SendEvent {LButton Up}
	CoordMode, Mouse, Window
	MouseMove, mousePosX, mousePosY
	BlockInput, off
	stretched := false
}

closeAd() {
	MouseGetPos, mousePosX, mousePosY
	WinGetPos, , , winSizeX, winSizeY, A
	stretched := !imageQualitySearch("close", imageLocX, imageLocY)
	if (stretched) {
		clientButtonX := 637
		clientButtonY := 104
		stretchedWindowPosition(clientButtonX, clientButtonY, stretchedX, stretchedY)
		windowPosToClientPos(stretchedX, stretchedY, buttonCenterX, buttonCenterY)
	} else {
		imageSearchSizeX := 24
		imageSearchSizeY := 25
		windowPosToClientPos(imageLocX, imageLocY, posX, posY)
		buttonCenterX := posX + Floor(imageSearchSizeX / 2)
		buttonCenterY := posY + Floor(imageSearchSizeY / 2)
	}
	BlockInput, on
	CoordMode, Mouse, Client
	MouseMove, buttonCenterX, buttonCenterY
	SendEvent {LButton Down}
	SendEvent {LButton Up}
	CoordMode, Mouse, Window
	MouseMove, mousePosX, mousePosY
	BlockInput, off
	stretched := false
}

; item swap function
; move the mouse to the correct slot, double-click, and move it back
invSwap(slot) {
	MouseGetPos, mousePosX, mousePosY ; mousePosX/Y have old mouse position
	WinGetPos, , , winSizeX, winSizeY, A ; winSizeX/Y have window size
	WinGet, winProcessName, ProcessName, A
	GetKeyState, LB, LButton, P

	; move the mouse to the correct slot, double-click (using events),
	; then move it back
	invIconOffsetX := 27
	invIconOffsetY := 46
	slotOffsetX := Mod((44 * (slot - 1)), (4 * 44))
	slotOffsetY := (44 * ((slot - 1) // 4))
	if (!imageQualitySearch("inv", imageLocX, imageLocY)) {
		; the image search failed (stretched screen)
		; determine if the window is a steam or projector window,
		; and adjust the value accordingly
		windowX := 634 + slotOffsetX
		windowY := 400 + slotOffsetY

		; stretchedX and stretchedY are set by the function call
		stretchedWindowPosition(windowX, windowY, stretchedX, stretchedY)

		; slotX and slotY are set by the function call
		windowPosToClientPos(stretchedX, stretchedY, slotX, slotY)
	} else {
		; not stretched, imageLocX/Y are set
		windowX := imageLocX + invIconOffsetX + slotOffsetX
		windowY := imageLocY + invIconOffsetY + slotOffsetY

		; slotX and slotY are set by the function call
		windowPosToClientPos(windowX, windowY, slotX, slotY)
	}
	BlockInput, on
	CoordMode, Mouse, Client
	MouseMove, slotX, slotY
	SendEvent {Control Up}
	SendEvent {LButton Down}
	SendEvent {LButton Up}
	SendEvent {LButton Down}
	SendEvent {LButton Up}
	CoordMode, Mouse, Window
	MouseMove, mousePosX, mousePosY
	if (LB == "D") {
		Send {LButton down}
	}
	BlockInput, off
	stretched := false
}

; @param imageName: base file name (<name>-[low|high|med].png); must be located
;                   in the img\ directory
; @param imageLocX: by-reference variable to be set to the window-related x
;                   position of the upper-left corner of the image
; @param imageLocY: by-reference variable to be set to the window-related y
;                   position of the upper-left corner of the image
; @return:          returns true if the search succeeds; false otherwise
; @notes:           If the image search fails (and the function returns false),
;                   imageLocX and imageLocY will not be set.
imageQualitySearch(imageName, byref imageLocX, byref imageLocY) {
	WinGetPos, , , winSizeX, winSizeY, A ; winSizeX/Y have window size

	; start with lowest quality level, and work up to high
	imageQuality := "low"
	ErrorLevel := 1
	while ErrorLevel {
		IfExist, img\%imageName%-%imageQuality%.png
		{
			ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%
			  , img\%imageName%-%imageQuality%.png
		}
		IfNotExist, img\%imageName%-%imageQuality%.png
		{
			return false
		}

		; increment quality for potential future image searches
		if (imageQuality == "low"){
			imageQuality := "med"
		} else if (imageQuality == "med") {
			imageQuality := "high"
		} else if (imageQuality == "high") {
			; stretched screen
			return false
		}
	}
	return true
}

; @param intendedX: what would otherwise be the correct x location in a
;                   non-stretched client
; @param intendedY: what would otherwise be the correct y location in a
;                   non-stretched client
; @param actualX:   by-reference variable to be set to the window-related x
;                   position of the new x position
; @param actualY:   by-reference variable to be set to the window-related x
;                   position of the new y position
stretchedWindowPosition(intendedX, intendedY, byref actualX, byref actualY) {
	WinGetPos, , , winSizeX, winSizeY, A ; winSizeX/Y have window size
	WinGet, winProcessName, ProcessName, A
	yMultiplierSubtract := (winProcessName == "Realm of the Mad God.exe")
		? ((hBorderWidth * 2) + titleHeight)
		: (menuHeight + (hBorderWidth * 2) + titleHeight)
	multiplierX := ((winSizeX - (vBorderWidth * 2)) / 800)
	multiplierY := ((winSizeY-yMultiplierSubtract) / 600)
	actualX := Round((intendedX * multiplierX) + (vBorderWidth*2))
	actualY := Round((intendedY * multiplierY) + (yMultiplierSubtract))
}

; @param windowX: x position of a window-related coordinate
; @param windowY: y position of a window-related coordinate
; @param outputX: by-reference variable to be set to a client-related
;                 x coordinate
; @param outputY: by-reference variable to be set to a client-related
;                 y coordinate
windowPosToClientPos(windowX, windowY, byref outputX, byref outputY) {
	WinGetTitle, winTitle, A
	WinGet, winProcessName, ProcessName, A
	WinGet, winMax, MinMax, A

	; chrome (not maximized)
	if (winTitle == "Realm of the Mad God - Google Chrome" && winMax == 0) {
		outputX := windowX
		outputY := windowY
	; opera, ff
	} else if (winTitle == "Realm of the Mad God - Opera"
	           || InStr(winTitle, "Realm of the Mad God - Mozilla Firefox")) {
		outputX := windowX - vBorderWidth
		outputY := windowY
	; IE, safari, steam
	} else if (winTitle == "Realm of the Mad God - Windows Internet Explorer"
	           || winProcessName == "Safari.exe"
	           || winProcessName == "Realm of the Mad God.exe") {
		outputX := windowX - vBorderWidth
		outputY := windowY - (hBorderWidth + titleHeight)
	; chrome (when maximized)
	} else if (winTitle == "Realm of the Mad God - Google Chrome"
	           && winMax == 1) {
		outputX := windowX - vBorderWidth
		outputY := windowY - hBorderWidth
	} else { ; projector
		outputX := windowX - vBorderWidth
		outputY := windowY - (menuHeight + hBorderWidth + titleHeight)
	}
}

ExitSub:
	RestoreCursors()
	ExitApp
