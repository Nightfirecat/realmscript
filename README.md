#Realm Script
- - -

An <abbr title="AutoHotKey">AHK</abbr> script for Realm of the Mad God, enhancing gameplay
with hotkeys for useful text and click macros.

##Download
- - -

You can [download the project's files here](https://github.com/Nightfirecat/realmscript/archive/master.zip).

##Directions for Use
- - -

* Extract the archive to a folder of your choice.
* Install [Autohotkey](http://www.autohotkey.com/) for Windows or [IronAHK](http://www.ironahk.net/)
  for OSX or Linux
* Open `realmscript.ahk` using your preferred text editor. **(Windows users, do not use Notepad; use
  [Notepad++](http://notepadplusplus.org/) or some other editor!)**
* Edit, add, or delete binds as needed in the top section of the code, as directed by the comments -
  the text that appears after semicolons. (`;`)

##Default Binds
- - -

* `` ` `` : `/pause`
* `F1` : `Heal please?`
* `F2` : `Thank you!`
* `F3` : `MP please?`
* `F4` : `He lives and reigns and conquers the world`
* `F11` : `/tutorial`
* `F12` : `/nexustutorial`
* `/tp ...` : Automatically expands to `/teleport ...`
* <kbd>ctrl</kbd> + `q` : Double-click inventory slot 1
* <kbd>ctrl</kbd> + `e` : Double-click inventory slot 2
* <kbd>ctrl</kbd> + `f` : Interact functionality (clicks on `Enter` or `Change` for
  entering a portal or changing characters)
* <kbd>ctrl</kbd> + `w` : `/who`
* <kbd>ctrl</kbd> + `s` : `/server`
* <kbd>ctrl</kbd> + `d` : [`/tell mreyeball server`](http://www.realmeye.com/mreyeball#server)
* right-click : <kbd>shift</kbd> + left-click (identical to using ability or drinking potion)
* <kbd>ctrl</kbd> + right-click : Literal right-click (brings up Flash right-click menu, for instance)
* <kbd>ctrl</kbd> + `t` : Dialog box to set a teleport anchor (person to teleport to using `/teleport ...`)
* <kbd>shift</kbd> + right-click : Teleport to set anchor (from <kbd>ctrl</kbd>+`t`)
* <kbd>shift</kbd> + scroll-wheel-up : <kbd>Page Up</kbd> (for scrolling chat up)
* <kbd>shift</kbd> + scroll-wheel-down : <kbd>Page Down</kbd> (for scrolling chat down)

##Features
- - -

* Right click sends shift+left click and resends left click if it was set when right clicking
* Ctrl+right click sends right click
* Ctrl+t, then shift+right click sets and teleports to anchor
* Several text send hotkeys
* Pause hotkey
* Tutorial and nexustutorial hotkeys
* Swap hotkeys (allows for slot selecting via bind editing)
* Shift+scroll wheel scrolls chat log
* /tp is converted to /teleport
* Ctrl+f acts as a fixed interact key for portals and character select

##Personal Thanks
- - -

I'd like to extend a big personal thanks to a couple people who made this project possible.  
I'd like to thank **[NGJMoses](http://www.realmeye.com/player/ngjmoses/)** for his
occasionally-helping hand, **[Kalle](https://github.com/kallerotmg)** for creating the
[original realmscript](https://github.com/kallerotmg/realmscript),
**[BMJ](http://www.realmtools.com/)** for his contributions to that with stuff from
[QuickSpeech](http://realmtools.com/info_qs.html) and
**[TKGP](https://forums.wildshadow.com/user/299)** for the item swap.
