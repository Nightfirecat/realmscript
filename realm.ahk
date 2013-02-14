;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT EDIT UNTIL THE NEXT COMMENT SECTION ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%

SetKeyDelay 0
SetMouseDelay 0
SetTitleMatchMode 3

Suspend on
GroupAdd rotmg, Realm of the Mad God
GroupAdd rotmg, Realm of the Mad God - Mozilla Firefox
GroupAdd rotmg, Realm of the Mad God - Google Chrome
GroupAdd rotmg, realmofthemadgod
GroupAdd rotmg, AGCLoader
GroupAdd rotmg, Play Realm of the Mad God
GroupAdd rotmg, Adobe Flash Player 10
GroupAdd rotmg, Adobe Flash Player 11
GroupAdd rotmg, fla
WinNotActive()

WinActive()
{
	Suspend Off
	WinWaitNotActive ahk_group rotmg
	{
		WinNotActive()
	}
}
WinNotActive()
{
	Suspend on
	WinWaitActive ahk_group rotmg
	{
		WinActive()
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Add/change the hotkeys and/or binds (the text after 'clipboard = ') to your preference ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^w::
ClipSaved = %clipboard%
clipboard = /who
goto ek

^s::
ClipSaved = %clipboard%
clipboard = /server
goto ek

F1::
ClipSaved = %clipboard%
clipboard = Heal please?
goto ek

F2::
ClipSaved = %clipboard%
clipboard = Thank you. :)
goto ek

F3::
ClipSaved = %clipboard%
clipboard = MP please!
goto ek

F4::
ClipSaved = %clipboard%
clipboard = He lives and reigns and conquers the world
goto ek

F11::
ClipSaved = %clipboard%
clipboard = /tutorial
goto ek

F12::
ClipSaved = %clipboard%
clipboard = /nexustutorial
goto ek

; set a teleport target
^t::InputBox, tptarget, Teleport target, Please enter a person to teleport to:

; teleport to the set target
+RButton::
ClipSaved = %clipboard%
clipboard = /teleport %tptarget%
goto ek

; double click on the set slots in the inventory
^1::
slot = 1	;;;;; CHANGE TO YOUR WEAPON SWAP INVENTORY SLOT
goto swap

^2::
slot = 2	;;;;; CHANGE TO YOUR ABILITY SWAP INVENTORY SLOT
goto swap

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT EDIT BELOW UNLESS VERSED IN AUTOHOTKEY ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

RButton::
Send +{LButton}
	GetKeyState, LB, LButton, P
	if LB = D
		Send {LButton down}
Return

^+RButton::
Click right
Return

`::
ClipSaved = %clipboard%
clipboard = /pause
goto ek

^f::
MouseGetPos, mousePosX, mousePosY
WinGetPos, , , winSizeX, winSizeY, A
ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\enter-low.png
if ErrorLevel
	ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\change-low.png
	if ErrorLevel
		ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\enter-high.png
		if ErrorLevel
			ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\change-high.png
			if ErrorLevel
				ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\enter-med.png
				if ErrorLevel
					ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\change-med.png
MouseMove, imageLocX + 35, imageLocY + 14
SendEvent {LButton Down}
SendEvent {LButton Up}
MouseMove, mousePosX, mousePosY
Return

+WheelUp::Send {PgUp}
+WheelDown::Send {PgDn}

:*:/tp::
ClipSaved = %clipboard%
clipboard = /teleport
Blockinput, on
Send ^a
Send ^v
Send {space}
Blockinput, off
Sleep 100
clipboard = %ClipSaved%
ClipSaved = 
Return

ek:
Blockinput, on
Send {Enter}
Send ^v
Send {Enter}
Blockinput, off
Sleep 100
clipboard = %ClipSaved%
ClipSaved = 
Return

swap:
MouseGetPos, mousePosX, mousePosY
WinGetPos, , , winSizeX, winSizeY, A
ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\inv-low.png
if ErrorLevel
	ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\inv-high.png
	if ErrorLevel
		ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\inv-med.png
MouseMove, imageLocX + 30 + Mod((44 * (slot-1)), (4*44)), imageLocY + 50 + (44 * ((slot-1)//(4)))
SendEvent {LButton Down}
SendEvent {LButton Up}
SendEvent {LButton Down}
SendEvent {LButton Up}
MouseMove, mousePosX, mousePosY
Return