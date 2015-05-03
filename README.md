#Realm Script

An <abbr title="AutoHotKey">AHK</abbr> script for Realm of the Mad God,
enhancing gameplay with hotkeys for useful text and click macros.

##Download and Setup

* [Download the project's files
  here](https://github.com/Nightfirecat/realmscript/zipball/master).
* Extract the archive to a folder of your choice
* Install [Autohotkey](http://ahkscript.org/) for Windows
* Open `options.ahk` and `hotkeys.ahk` using your preferred text editor
  **(Windows users, do not use Notepad; use
  [Notepad++](http://notepadplusplus.org/) or some other editor!)**
* Choose your default settings in `options.ahk` and add, delete, or edit binds
  as needed in `hotkeys.ahk`

##Running the Script

Just open `realm.ahk` after AutoHotKey is installed on your system, and you're
good to go!

##Default Binds

* `` ` `` : `/pause`
* `F1` : `Heal please?`
* `F2` : `Thank you!`
* `F3` : `MP please?`
* `F4` : `He lives and reigns and conquers the world`
* `F11` : `/tutorial`
* `F12` : `/nexustutorial`
* `/tp ...` : Automatically expands to `/teleport ...`
* <kbd>ctrl</kbd> + `1` : Double-click inventory slot 1
* <kbd>ctrl</kbd> + `2` : Double-click inventory slot 2
* <kbd>ctrl</kbd> + `q` : Disabled to avoid accidental tab or window closure.
* <kbd>ctrl</kbd> + `e` : Disabled to avoid accidental tab or window closure.
* <kbd>ctrl</kbd> + `f` : Interact functionality (clicks on `Enter` or `Change`
  for entering a portal or changing characters)
* <kbd>ctrl</kbd> + `w` : `/who`
* <kbd>ctrl</kbd> + `s` : `/server`
* <kbd>ctrl</kbd> + `d` :
  [`/tell mreyeball server`](http://www.realmeye.com/mreyeball#server)
* right-click : <kbd>shift</kbd> + left-click (identical to using ability or
  drinking potion)
* <kbd>ctrl</kbd> + right-click : Literal right-click (brings up Flash 
  right-click menu, for instance)
* <kbd>ctrl</kbd> + `t` : Dialog box to set a teleport anchor (person to
  teleport to using `/teleport ...`)
* <kbd>shift</kbd> + right-click : Teleport to set anchor
  (from <kbd>ctrl</kbd>+`t`)
* <kbd>shift</kbd> + scroll-wheel-up : <kbd>Page Up</kbd> (for scrolling chat
  up)
* <kbd>shift</kbd> + scroll-wheel-down : <kbd>Page Down</kbd>
  (for scrolling chat down)

##Features

* Right click sends shift+left click and resends left click if it was set when
  right clicking
* Ctrl+right click sends right click
* Ctrl+t, then shift+right click sets and teleports to anchor
* Several text send hotkeys
* Pause hotkey
* Tutorial and nexustutorial hotkeys
* Swap hotkeys (allows for slot selecting via bind editing)
* Shift+scroll wheel scrolls chat log
* /tp is converted to /teleport
* Resizable borders can be disabled for projector or Steam client players
* Ctrl+f acts as a fixed interact key for portals and character select
* Ctrl+1 and Ctrl+2 act as item-swap binds.
* Ctrl+q and Ctrl+e are disabled to avoid accidental presses.

##Frequently Asked Questions

<dl>
	<dt>I don't like one of the default binds. How do I get rid of it?</dt>
	<dd>
		Within <tt>hotkeys.ahk</tt>, search for the key pressed for the hotkey
		(for example, <kbd>F12</kbd>) and remove the lines from the beginning of
		the definition (eg. <tt>F12::</tt>) until the next line that reads
		<tt>Return</tt>.
	</dd>
	<dt>How many hotkeys can I add?</dt>
	<dd>
		As many as you'd like. Keep in mind that creating hotkeys without
		modifier keys (ctrl, alt, shift) may cause unintended effects for keys
		that are used otherwise.
	</dd>
</dl>

##Troubleshooting

This section will cover some common issues but will, of course, not be fully
comprehensive of all possible issues which can occur with this script.
If you encounter an issue which is not covered below, [please submit it to this
repository's issue tracker](issues) and I'd be more than happy to help resolve
the problem.

<dl>
	<dt>
		I get an error reading <u>#Include file "includes/SetSystemCursor.ahk"
		cannot be opened.</u>
	</dt>
	<dd>
		Since July 20, 2013 (commit <a
		href="commit/2b7fcb3c6fb92a6ef959c85dff57078c6dddeb94"><tt
		>2b7fcb3</tt></a>), this script has included a small library to reliably
		set the system cursor. Please make sure you are using the latest version
		of this script.
	</dd>
	<dt>
		I get an error reading <u>Error: Invalid file path or cursor name</u>
	</dt>
	<dd>
		The cursors provided with this script reside in the "/img/cursors"
		directory - if they are not present, trying to use them for your custom
		cursor will cause this error. Make sure that they have been downloaded
		at that path, or ensure your cursor path is correct.
	</dd>
	<dt>
		I get an error containing <u>This line does not contain a recognized
		action.</u>
	</dt>
	<dd>
		You are running an old version of AutoHotKey. Visit the
		<a href="#download and setup">download and setup section for a link to
		download and install the latest version of AutoHotKey.
	</dd>
</dl>

##Personal Thanks

I'd like to extend a big personal thanks to a couple people who made this
project possible.

I'd like to thank **[NGJMoses](http://www.realmeye.com/player/ngjmoses/)** for
his helping hand in testing, **[Kalle](https://github.com/kallerotmg)** for
creating the [original realmscript](https://github.com/kallerotmg/realmscript),
**[BMJ](http://www.realmtools.com/)** for his contributions to that with stuff
from [QuickSpeech](http://realmtools.com/info_qs.html) and
**[TKGP](https://forums.wildshadow.com/user/299)** for the item swap.
