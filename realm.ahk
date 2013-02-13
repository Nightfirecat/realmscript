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

; send shift lclick on rclick and if lbutton was down when rclick happened, sets it to down again as it resets
RButton::
Send +{LButton}
	GetKeyState, LB, LButton, P
	if LB = D
		Send {LButton down}
Return

; sends rclick when ctrl+rclick is sent to get the flash context menu
^+RButton::
Click right
Return

; /who on ctrl+w
^w::
ClipSaved = %clipboard%
clipboard = /who
goto ek

; /server on ctrl+s
^s::
ClipSaved = %clipboard%
clipboard = /server
goto ek

; sets clipboard and sends off to ek (function to send clipboard using enter key)
;;;;; CHANGE ANY OF THE "clipboard = ___" TEXT OR BIND KEYS TO YOUR PREFERENCE
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

F5::
ClipSaved = %clipboard%
clipboard = SHIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIP
goto ek

F6::
ClipSaved = %clipboard%
clipboard = TRAAAAAAAAAAAAIIIIIIIIIIIIIIIINNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
goto ek

F7::
ClipSaved = %clipboard%
clipboard = Ain't nobody got time for that.
goto ek

F8::
ClipSaved = %clipboard%
clipboard = #aintnobodygottimeforthat
goto ek

F9::
ClipSaved = %clipboard%
clipboard = #werushing
goto ek

F10::
ClipSaved = %clipboard%
clipboard = You get a white bag, and you get a white bag, and you get a white bag. Everybody gets a white bag!!
goto ek

F11::
ClipSaved = %clipboard%
clipboard = /tutorial
goto ek

F12::
ClipSaved = %clipboard%
clipboard = /nexustutorial
goto ek

`::
ClipSaved = %clipboard%
clipboard = /pause
goto ek

; set a teleport target
^t::InputBox, tptarget, Teleport target, Please enter a person to teleport to:

; teleport to the target set with ctrl+n
+RButton::
ClipSaved = %clipboard%
clipboard = /teleport %tptarget%
goto ek

; double click on slot 1 in the inventory on ctrl+1 or 2
^1::
slot = 1	;;;;; CHANGE TO YOUR WEAPON SWAP INVENTORY SLOT
goto swap

^2::
slot = 2	;;;;; CHANGE TO YOUR ABILITY SWAP INVENTORY SLOT
goto swap

; fixed interact with ctrl+f
; KNOWN ISSUE: Will click mouse button at current location if image is not found.
^f::
MouseGetPos, mousePosX, mousePosY ;mousePosX/Y have old mouse position
WinGetPos, , , winSizeX, winSizeY, A ;winSizeX/Y have window size
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

; scroll the chat log with the default in game keybinds
+WheelUp::Send {PgUp}
+WheelDown::Send {PgDn}

; convert /tp to /teleport in the game chat
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
ClipSaved = ;save memory
Return

; sends clipboard to the chat using the enter key
ek:
Blockinput, on
Send {Enter}
Send ^v
Send {Enter}
Blockinput, off
Sleep 100
clipboard = %ClipSaved%
ClipSaved = ;save memory
Return

; sends clipboard to the chat using the tab key
tk:
Blockinput, on
Send {Tab}
Send ^v
Send {Enter}
Blockinput, off
Return

; swap function [inventory squares are 44px wide]
swap:
MouseGetPos, mousePosX, mousePosY ;mousePosX/Y have old mouse position
WinGetPos, , , winSizeX, winSizeY, A ;winSizeX/Y have window size
; imageLocX/Y have upper-left pixel of image when found,
; halved win sizes start search in middle of screen,
; whole win sizes end search in lower-right corner,
; img\inv-[low|med|high] will search for the image in every quality level if necessary
ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\inv-low.png
if ErrorLevel
	ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\inv-high.png
	if ErrorLevel
		ImageSearch, imageLocX, imageLocY, %winSizeX%/2, %winSizeY%/2, %winSizeX%, %winSizeY%, img\inv-med.png
; move the mouse to the correct slot, double-click (using events), and move it back
MouseMove, imageLocX + 30 + Mod((44 * (slot-1)), (4*44)), imageLocY + 50 + (44 * ((slot-1)//(4)))
SendEvent {LButton Down}
SendEvent {LButton Up}
SendEvent {LButton Down}
SendEvent {LButton Up}
MouseMove, mousePosX, mousePosY
Return
