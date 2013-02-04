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

; sets clipboard and sends off to ek (function to send clipboard using enter key)
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
;;^1::
;;slot = 1
;;goto swap

;;^2::
;;slot = 2
;;goto swap

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

; go to the character select
;;^r::
;;MouseGetPos, mousePosX, mousePosY
;;WinGetPos, , , winSizeX, winSizeY, A
;;Send {Esc}
;;Loop
;;{
;;	ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\charsel.png
;;	if ErrorLevel = 1
;;		continue
;;	else
;;		break
;;}
;;MouseClick, Left, imageLocX, imageLocY, 1
;;MouseClick, Left, imageLocX-240, imageLocY, 1 ; back to home is bugged
;;MouseMove, mousePosX, mousePosY
;;Return

; go to the server select screen
;;+^r::
;;MouseGetPos, mousePosX, mousePosY
;;WinGetPos, , , winSizeX, winSizeY, A
;;Send {Esc}
;;Loop
;;{
;;	ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\charsel.png
;;	if ErrorLevel = 1
;;		continue
;;	else
;;		break
;;}
;;MouseClick, Left, imageLocX, imageLocY, 1
;;MouseClick, Left, imageLocX-240, imageLocY, 1 ; back to home is bugged
;;Loop
;;{
;;	PixelGetColor, color, imageLocX-305, imageLocY, RGB
;;	if color = 0xFFFFFF
;;		break
;;	else
;;		continue
;;}
;;MouseClick, Left, imageLocX-300, imageLocY, 1
;;MouseClick, Left, imageLocX-300, imageLocY, 1
;;MouseMove, mousePosX, mousePosY
;;Return

; select all 8 slots while trading
;;^a::
;;MouseGetPos, mousePosX, mousePosY
;;WinGetPos, , , winSizeX, winSizeY, A
;;ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\trade.png
;;Xinc = 0
;;Yinc = 250
;;Loop 2
;;{
;;	Loop 4
;;	{
;;		MouseClick, Left, imageLocX+Xinc, imageLocY-Yinc, 1
;;		Xinc += 44
;;	}
;;	Xinc = 0
;;	Yinc -= 50
;;}
;;MouseMove, mousePosX, mousePosY
;;return

; pick up all 8 slots
;;^w::
;;SendMode Event
;;MouseGetPos, mousePosX, mousePosY
;;WinGetPos, , , winSizeX, winSizeY, A
;;ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\searchimage.png
;;imageLocX += 25
;;imageLocY += 55
;;Xinc = 0
;;Yinc = 0
;;Loop 2
;;{
;;	Loop 4
;;	{
;;		MouseMove, imageLocX + Xinc, imageLocY + Yinc
;;		SendEvent {LButton Down}
;;		MouseMove, imageLocX + Xinc + 3, imageLocY + Yinc + 3
;;		Sleep 260
;;		MouseMove, imageLocX + Xinc, imageLocY + Yinc - 125
;;		SendEvent {LButton Up}
;;		Sleep 260
;;		Xinc += 44
;;	}
;;	Xinc = 0
;;	Yinc += 50
;;}
;;MouseMove, mousePosX, mousePosY
;;Return

; drop all items in chest
;;^d::
;;SendMode Event
;;MouseGetPos, mousePosX, mousePosY
;;WinGetPos, , , winSizeX, winSizeY, A
;;ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\searchimage.png
;;imageLocX += 25
;;imageLocY -= 70
;;MouseMove, imageLocX, imageLocY
;;Xinc = 0
;;Yinc = 0
;;Loop 2
;;{
;;	Loop 4
;;	{
;;		MouseMove, imageLocX + Xinc, imageLocY + Yinc
;;		SendEvent {LButton Down}
;;		MouseMove, imageLocX + Xinc + 3, imageLocY + Yinc + 3
;;		Sleep 260
;;		MouseMove, imageLocX + Xinc, imageLocY + Yinc + 125
;;		SendEvent {LButton Up}
;;		Sleep 260
;;		Xinc += 44
;;	}
;;	Xinc = 0
;;	Yinc += 50
;;}
;;MouseMove, mousePosX, mousePosY
;;Return

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

; swap function
;;swap:
;;MouseGetPos, mousePosX, mousePosY
;;WinGetPos, , , winSizeX, winSizeY, A
;;ImageSearch, imageLocX, imageLocY, 0, 0, %winSizeX%, %winSizeY%, img\searchimage.png
;;MouseClick, Left, imageLocX + (44 * slot) + 30, imageLocY - 20, 2
;;MouseMove, mousePosX, mousePosY
;;Return
