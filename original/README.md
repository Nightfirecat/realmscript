#Realm Script

An <abbr title="AutoHotKey">AHK</abbr> script for Realm of the Mad God,
enhancing gameplay with hotkeys for useful text and click macros.

##Download and Setup

There are currently two options for using realmscript: running the source script
or using a compiled .exe of the script. Running the script from source
(recommended!) will allow greater flexibility and full access to realmscript's
features, where using the compiled .exe is a faster and easier way to get
started and does not require you to install AutoHotKey, *but does not support
most customization features*!

###Running from source:

* [Download the project's files
  here](https://github.com/Nightfirecat/realmscript/zipball/master).
* Extract the archive to a folder of your choice
* Install [Autohotkey](http://ahkscript.org/) for Windows
* Open `options.ahk` and `hotkeys.ahk` using your preferred text editor  
  **(Windows users, I recommend using
  [Notepad++](http://notepadplusplus.org/) or another editor which supports
  linux-style line endings)**
* Choose your default settings in `options.ahk` and add, delete, or edit binds
  as needed in `hotkeys.ahk`
* Run `realmscript.ahk` to initiate the script

###Running the compiled .exe:

* Visit
  [the releases page](https://github.com/Nightfirecat/realmscript/releases) and
  download the latest compiled script's archive
* Extract the archive to a folder of your choice
* Run the included .exe

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
* <kbd>Esc</kbd> : Close the package advertisement modal window that appears
  on login

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
	<dt>How can I edit my settings or hotkeys using the .exe?</dt>
	<dd>
		Sadly, you can't. This is one of the notable limitations, because
		compiled scripts will incorporate the code of <tt>#include</tt>d files
		rather than continue to obey normal <tt>#include</tt> commands, thus it
		can't be configured using <tt>options.ahk</tt> and <tt>hotkeys.ahk</tt>
		like the source script can.
	</dd>
	<dt>Can I change the cursor used for the .exe version?</dt>
	<dd>
		You can replace the <tt>bmj_precision.cur</tt> file that is generated
		with a cursor of your choice after the script has begun running. You may
		also delete it entirely, though that will cause an error message to
		appear each time your game comes into focus.
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
		I get an error reading <samp>#Include file
		"includes/SetSystemCursor.ahk" cannot be opened.</samp>
	</dt>
	<dd>
		Since July 20, 2013 (commit <a href=
		"https://github.com/Nightfirecat/realmscript/commit/2b7fcb3c6fb92a6ef959c85dff57078c6dddeb94"
		><tt>2b7fcb3</tt></a>), this script has included a small library to
		reliably set the system cursor. Please make sure you are using the
		latest version of this script.
	</dd>
	<dt>
		I get an error reading <samp>Error: Invalid file path or cursor
		name</samp>
	</dt>
	<dd>
		The cursors provided with this script reside in the "/img/cursors"
		directory - if they are not present, trying to use them for your custom
		cursor will cause this error. Make sure that they have been downloaded
		at that path, or ensure your cursor path is correct.
	</dd>
	<dt>
		I get an error containing <samp>This line does not contain a recognized
		action.</samp>
	</dt>
	<dd>
		You are running an old version of AutoHotKey. Visit the
		<a href="#download and setup">download and setup section</a> for a link
		to download and install the latest version of AutoHotKey.
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
