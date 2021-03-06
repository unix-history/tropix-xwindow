2.0.43
       1. More man page updates & Imake fixes
       2. Simple patch to help take care of some timing bugs
       3. Patch to fix resize oddities when hitting 'hard' edge introduced
          by EdgeScroll loop patch
       4. Fixed startup w/ no rc bug, plus added more defaults, so if
          started without an rc file, things should run ok.  Plus it now
          outputs error messages if Read fails, then tries to Read
          system.fvwm2rc (after first read fails).
       5. Patch to fix UseStyle problem w/ BackColor
       6. More FAQ updates
       7. Created an 'extras' dir, and moved some of the existing modules
          in there (the ones that aren't being built by default).
       8. More potential speedups in event processing
       9.  Decoupled warp from Focus, adding WarpToWindow function.
       10. Added SendToModule builtin to send arbitrary strings to modules
           to help implement more complex dynamic module abilities and
           allow for module to module communication
       11. Put old FvwmButtons back as FvwmGoodStuff, for people who
           prefer the simpler older version (in extras dir).  Also made it
           able to be passed in the name parameter on invocation so it
           doesn't have to be symbolically linked to the new names any
           more.
       12. Adding a new module FvwmForm2 in the extras directory,
           contributed by Frederic Cordier.  Based on FvwmForm but
           completely rewritten apparently.  It uses scripts, has a new
           more complex syntax (Pascal like) and adds RadioButtons.  I
           would like to eventually combine aspects of the two versions
           (and more) to make one killer module, perhaps.
       13. Made fvwm_msg send errors to modules, so FvwmTalk sees them
           like it used to (and any other module that looks for M_ERROR
           in the future)
       14. Added DestroyModuleConfig, based on patch from Toshi Isogai
       15. Modules can now send module config commands to fvwm (eg FvwmTalk)
       16. Removed implicit Exec exec stuff for the time being, until I
           come up with a better way to do it (back to old behavior)
       17. More mini icons added and some icons removed
       18. Added "KillMe" command that modules can send to fvwm asking for
           an assisted suicide (almost called this Kevorkian :)).  Mark
           Crimmins wanted this for probs with TkGoodStuff.
       19. Fixed RaiseWindow bug under some servers when no icon pixmap.
       20. Fixed one prob w/ FvwmAuto and menus being hidden (under click
           to focus - still needs work for other focus policies, but not
           entirely sure how to approach this yet          21. Added ExitFunction, to be executed on exit (before restarts too).
           Useful for explicitly killing modules, etc.
       22. Changed behavior of '-f' to just specify config file (now use
           -cmd to perform an actual command, like -cmd 'FvwmM4 .fvwm2rc')
       23. Updates to FvwmSaveDesk from Carsten Paeth so it should now
           actually work under    x, plus some other bugfixes too I
           believe.
       24. Added PipeRead function, which executes a program and Read's
           it's output.  Useful for making dynamic menus and such.
       25. Security fix for FvwmM4 & FvwmCpp from Austin Do    ly
       26. Added strerror for SunOS 4.1.x
       27. Added ability to remove mouse and key bindings without restart
           (do the binding but specify '-' as the function).  Probably
           needs more checking for removing mouse bindings from title bar
           buttons correctly, though.
       28. Updates to FvwmIconMan from Brady Montz.
       29. Updates to FvwmIconBox from Nobutaka Suzuki.
       30. Patch from Austin Donnelly for multi-keypress required for 
           WindowList problem.
       31. Patch to center text on left pixmaps in menus.
       32. Patch to allow menus to pop up left if not enough room     ight 
           (currently in ifdef -> define LEFT_MENUS to enable when compiling).

2.0.42
       1. More small Imake fixes & man page updates
       2. Optional Xpm support for titlebar buttons patch from Andrew
          Veliath
       3. Made event handler jump table be a bigger default size, since
          LASTEvent doesn't account for X Extension related events (eg
          SHAPE)
       4. FvwmPager display updates: DeskColor patch from Alan Wild,
          line distinctions between desks and pages, reinstated message mask
       5. Patch to make fvwm recognize some OpenLook WM hints (like MWM
          hints) from Andrew Taylor
       6. Added FvwmIconMan module (by Brady Montz)
       7. Replaced FvwmButtons with New & Improved version from Jarl Totland,
          had to patch to get to work ok under AIX (char's are unsigned by
          default under AIX)
       8. Added DestroyFunc for removing function definitions
       9. Made Exec use $SHELL, like mwm, if ExecUseSHELL is specified,
          plus Exec now does an explicit "exec" as the first arg (if it's
          not there already), to eliminate extra processes
       10. Completely replaced fvwm_err (removed) & most fprintf calls
           (those that were appropriate) w/ fvwm_msg (which has
           variable args, a consistent look, and will eventually
           optionally output to a file as well as to stderr)
       11. Fix from Nobutaka Suzuki for probs w/ Next/Prev Focus
       12. Patch from Henrique to make EdgeScroll wrap cleaner
       13. Patches to FvwmIconBox from Nobutaka Suzuki
       14. Patches for caching xpm files, modules having Popups on
           ButtonPress events, & rc line continuation (from Jarl)
       15. Make SHAPE extension runtime determinite in addition to compile
           time so same exec can run on different machines better (John
           Bazik, the author of XMX wanted this) - Haven't fixed up the
           modules that use SHAPE yet though (next release)
       16. New module FvwmConsole (a good potential replacement for
           FvwmTalk) from Toshi Isogai.  Currently won't build as part of
           the normal process (you'll have to do it by hand until I
           integrate it further).
       17. Added more mini icons from list members.
       18. Added new-system.fvwmrc, which is the beginning of a
           reformatted & commented rc file (from Eli Burke).  Feel free to
           provide your $0.02 on it.

2.0.41
       1. More FAQ updates & man page corrections
       2. Patch to limit GetFdWidth to FD_SETSIZE to prevent fvwm from
          eating too much cpu under bsdi if 'unlimit descriptors' is used
       3. Ressurrected desktop edge wrap via EdgeScroll*1000 feature
       4. Fixed library link order (fixes the sometimes undefined
          XLoadQueryFont problem)
       5. Renamed fvwm_icons subdir to be just icons, documentation to be
          just docs
       6. Removed FvwmPrompt (use FvwmForm instead, since it's better anyways)
       7. Todd Fries 'UseStyle' patch
       8. XClientMessages sent to icon windows (that aren't
          XA_WM_CHANGE_STATE ones) are now sent along to to the apps
          window
       9. FvwmButtons fixes from Jarl for incorrectly drawn buttons and
          better no title handling
       10. FvwmForm now uses GetFontOrFixed, instead of silently failing
           if font can't be found
       11. New Imake setup based on patch from Mark Powell (let's see if
           people have less problems with this, since it's more 'standard'
           now)
       12. Changed top directory to contain version number
       13. Modified Style parsing to (hopefully) do less string compares
           for a potential speedup
       14. Modified DispatchEvent to use a jump table instead of a switch
           statement, again for a potential speedup
       15. FvwmIconBox patches from Nobutaka Suzuki

2.0.40
       1. Removed 'basename'    erence
       2. More small Imake fixes
       3. Renamed FvwmConfig .cc files to .C, because some C++ compilers
          can't handle the .cc extension (AIX's, for instance)
       4. FvwmForm now gets config info in standard way
       5. FvwmBanner now dissappears if you click on it (like in 1.xx)
       6. Renamed FvwmConfig's makefile to Makefile.std and cleaned it up
       7. More small man page cleanups
       8. Improved handling of nonexistant fonts (added GetFontOrFixed)
       9. More debug messges, and central fvwm_msg function for printing
          msgs (started converting fvwm_err and fprintf calls to use this
          instead, as it has variable args and allows for a consistent
          message feel and I'll use this to add -outfile <file> option
          eventually to capture all fvwm output to a file as well as
          stderr)
       10. Fixed function parm $9 coredump
       11. Added basic TitleStyle (for justfication & edge appearance)

2.0.39
       1. More Imake fixes from Randall Winchester
       2. Started adding optional debug messages, to help people help me
          solve problems that I can't reproduce (a define in global.h
          to enable these, off by default)
       3. Added -blackout option, to black out screen during init and
          recapture (no blackout is default now)
       4. Removed some unused variables, cleaned up some code that
          generated compiler warnings
       5. More small doc & FAQ updates
       6. Fix for using "None" as font in FvwmPager to not have a Label
          (it now works)
       7. Making Resource = "NoResource" instead of "Untitled" (if class
          hints res_name is NULL) to differentiate between window Name &
          window Resource so Style commands for windows that have a
          WM_NAME but no WM_CLASS don't match Untitled
       8. Simple FvwmWinList refresh patch
       9. Added Imakefile for FvwmConfig (only works under X11R6)

2.0.38
       1. Fixed FvwmPager to die without causing X server to eat CPU if
          running under FvwmButtons & FvwmButtons dies or is killed
       2. Went to new M.I.P version number system in preparation for first
          official release (which will be 2.1.0 - until then fvwm2 is still
          pre-official release)
       3. Small fix to makefile for FvwmConfig
       4. More [icon_]name == NULL checks/fixes
       5. Added some things left out from Imakefiles, makefile.h & global.h
       6. FvwmButtons now handles Exec "" foobar correctly.
       7. Added Ludvig A. Norin's wonderful mini xpm icons
       8. Made scanForPixmap keep %name% or *name* in strings (restores
          original string) if pixmaps can't be found (this also allows
          window list to work for names w/ % or * in them too, or actually
          display a pixmap if it's in the window name), and corrected 2 col
          menu display bug that this showed (2nd col text didn't account for
          width of left justified pixmap)

pl 36 to 37
       1. Fixed coredump due to incomplete backout of NoName/NoClass patch
       2. Fix for multiple env var expansion core dump from Sverre H. Huseby
       3. Small doc fixes (spelling, etc)
       4. Imakefile/global.h enhancements from Randall S. Winchester
       5. Updated system.fvwmrc (FvwmIconBox changes from Nobutaka Suzuki)

pl 35 to 36
       1. Some more doc cleanups & FAQ updates, plus renamed fvwm.man to
          fvwm2.man, w/ symlink for fvwm.man (so install.man works correctly
          with rename of exec)
       2. Made utils subdir for scripts, added quantize_pixmap script
       3. FvwmPagerDeskTopScale patch
       4. Small changes to global.h defaults, plus added XPMINCLUDE
          and FVWM_MAN_DIR
       5. Added 'make depend' to MakeMakefiles script
       6. Reverting NoClass patch completely, as I think it's causing
          other problems
       7. Small change to make windows seem to close faster (hopefully)
       8. Patches to FvwmButtons to make it behave better when killed
          (kill swallowed modules, catch signals, etc)
       9. Patch from Sverre H. Huseby for env vars in ModulePath, PixmapPath
          and IconPath
       10. Patch to FvwmCpp for -cppopt to work correctly
       11. Added FvwmDebug back to distribution (still needs to be updated)
       12. Added BUGS file for known bugs

pl 34 to 35
       0. New maintainer for fvwm now, please go easy on him :)
       1. Fixed Title & Icon name change bug introduced in pl 34
       2. Applied another patch from Frederic Devernay
                  a. Keeps no class windows having no class & now handles
                     correctly
       3. Removed some extraneous files from the distribution, added
          preliminary FAQ, INSTALL & TO-DO files, added small README.
       4. Made conversion_script runnable
       5. Fixed FvwmPrompt
       6. Patch to rename fvwm & .fvwmrc in global.h added (on by default)
       7. Compile date & time added to -version.
       8. FvwmBanner Xpm & timeout can now be specified in fvwmrc

pl 33 to 34
       1. Applied patches from Frederic Devernay
	          a. Improved reading of window and icon names
		  b. improved handling of windows with no class.
	
pl 32 to 33
       1. More fixes to move/resize window when using m4.
       2. Added Sloppy Focus to FvwmConfig. Made FvwmConfig obtain initial
	  focus mode from fvwm.
       3. Add SCREEN macro to fvwmm4.
       4. Applied FvwmWinList patches.
	
pl 31 to 32
       1. Fixed color specification problem for ForeColor and BackCOlor
	  styles, so things like rgb:rr/gg/bb work again.
       2. Made MWMMenus style take effect on the Size/Resize window
	  even when using M4. Color selection of the Size/Resize window
	  is still broken.
	
pl 30 to 31
       1. Added patch to make FvwmButtons and FvwmPager accept -0
          geometries.
       2. Added code to FvwmConfig to make it read in current values for
	  colors and desktop sizes as it starts up. Made it handle case
	  of no more colors in colormap. 
	
	
pl 29 to 30
       1. Added color selection to fvwmconfig
	
pl 28 to 29
       1. Fixed problem of lost root window key bindings with FvwmM4
       2. Minor adjustments to FvwmConfig. Included a makefile. Compiles
	  with Sun's CC now, as well as with g++
pl 27 to 28
       1. Patch to FvwmButtons to fix the button-popping out problem.
       1. Added FvwmConfig. Requires g++ version 2.6.3 or thereabouts.
	  not automatically built or installed. Do it yourself.
	
pl 26 to 27
       1. Minor fix to FvwmScroll affecting handling of window resizes.
       2. Fixed core-dump problem (maybe) in pl26	
pl 25 to 26
       1. Corlormap handling bug fix.
       2. Finally, after years and years of saying, "thats not a
	  problem because people shouldn't have windows that small",
	  if fixed the handling of the corner pieces for teeny-tiny
	  windows.
pl 24 to 25
       1. Incorporated  colormap-focus patches
       2. Incorporated loads of patches - I have no idea what they
	  do, but at least the following
	   - allow use of ESC key to abort a move/resize
	   - Something about usign pager on B&W  display.
	   - stuff for FvwmIconBox
	   - stuff for FvwmWinList
	
pl 23 to 24
       1. Man page updates for style function
       2. Added stuff to over-ride motif modal dialogs. Makes apps
          think that mwm is running, but fvwm doesn't handle the
	  modality, so use with care. You have to set the
	  compilation flag: MODALITY_IS_EVIL in global.h to enable this
	  feature. Netscape users may wish to try this out.

pl 22 to 23
       1. Applied patches to FvwmIconBox and FvwmWinList.

pl 21 to 22
       1. Applied patch to fix up multi-screen support a little.
       2. Changed some strcasecmp calls to mystrcasecmp.
       3. Other stuff, can't remember what! (bug fixes)

pl 20 to 21
       1. Little bug-fix with motif-pop-up/pull-down menus and window
          focus
       2. Applied FvwmIconBox patch.
       3. Applied FvwmButtons patch to let you activate with a key press
          (return key) instead of mouse button.
       4. Re-worked the forking process for multi-screen displays. Can't
          test it, maybe someone can fix it now.

pl 19 to 20.
       1. Fixed resize buglet
       2. applied FvwmIconBox patch

pl 18 to 19.
       1. Not much

pl 17 to 18
       1. Fixed loss of key bindings on root window
       2. Fixed compile error in Picture.c
pl 16 to 17
       1. Applied patch to FvwmAudio.
       2. Allow menu-pixmaps to be above or to the left of
          menu labels, or both.
       3. Adjusted resize behavior for windows whose aspect
          ratio had max == min. Behavior was a little weird before.
       4. Added built-in KillModule
       5. Some changes to allow evil, poorly designed override-redirect
          windows to install their own colormaps. This abuse of override
	  redirect windows is primarily used by WABI, but a few others
	  too, I guess. This change is fairly fundamental, and could cause
	  problems. Also, if WABI comes up with a private colormap, it
	  is given control of the colormap immediately, since it thinks
	  that it should have focus.
	  
pl 15 to 16
       1. Applied patch to make menu short cuts work
       2. Made this menu config work as expected:
	  "*xcalc.xpm*"     Exec  exec xcalc &
       3. Restored ability to insert blank lines in
          menus, not just separators.
       4. Allow bitmaps in menus as well as xpm's
pl 14 to 15
       1. Added option to put pixmaps in menus.
          Modify your menu labels like so:
	  was:

+         "Calculator"     Exec  exec xcalc &
          is
+         "Calculator*xcalc.xpm*"     Exec  exec xcalc &
          pretty kool, man!

pl 13 to pl 14
       1. Assorted minor bug patches.

pl 12 to pl 13
       1. Applied patches
           A. Something about XSetIOErrorHandler. Doesn`t seem to hurt,
	   but I don't know what it does.
       2. Patches for FvwmIconBox. Nobutaka Suzuki has been working hard
          on this top-notch module, and seems to be working to integrate
	  it more tightly with fvwm itself. The latest patches let the
	  IconBox read the Icon pixmap names from fvwm. Icons are only
	  shown in the IconBox if the NoIcon style is applied. Is this
	  right?

	  To get something in the icon-box, you can use
	  Style "XTerm" Icon xterm.xpm, NoIcon

       1. Added FvwmForm module. It looks like its for 1.24r, but seems
          to work with Fvwm-2.
       2. Tried to add Tom Feng's GoodStuff patches, but they are 
          incompatible with other changes.

pl 11 to pl 12
       1. Really fixed that memory problem in builtins.c this time.
       2. Fixed the inverting shading of the maximize button
          if MWMButtons is used.
pl 10 to pl 11
       1. Fixed some references to already freed memory areas,
          specifically related to FocusOnNextTimeStamp and Scr.Ungrabbed.
	  Only affected click-to-focus, and only soon after destroying
	  a window.
       2. Plugged a memory leak (?) in builtins.c. Watch out, maybe I
          broke something instead of fixing it. Not sure.
       
       
pl 9 to pl 10
       1. Fixed double click on title-button 1 problem. It used to work,
          but only if the mouse was not moved at all. Now, 3 pixels of
	  mouse movement are allowed, and the double-click action will 
	  still be performed. After 3 pixels, the double click action is
	  aborted.
       2. Fixed problem with focus in focus-follows-mouse mode, when
          changing desks. Some click-to-focus person sent in a patch which
	  caused focus to be returned to the last window that had focus on
	  desk N, when you switch to desk N. That was fine, but if there
	  was no such window, focus went to a sticky window. That was bad.
	  You see, I'm focus-follows-mouse, but I make most of my sticky
	  windows click-to-focus (ie pager), because I really don't want
	  it to get the focus. The above patch made the sticky window get
	  focus when switching desks, when I really wanted the root window
	  to get the focus (for keyboard activated menus, etc).
       3. Added a DestroyMenu function.
	  
       
pl 8 to 9
       1. Fixed misc bugs.
              A. Menus popped up in wrong place when NoButton style was
	         used.
	      B. Title bar would look pressed in if you moved out of it
	         by key presses.
       2. Added #define SCREEN 0 (or whatever) for fvwmcpp.
       3. Applied patch to FvwmIconBox.
pl7 to 8
       1. Fixed (probably) some unwanted free()s in the code.
          These caused core dumps on some machines.

pl6 to 7:
       1. Fixed IconBox style
       2. Fixed (?) FvwmM4 problem with not executing InitFunction &
          restartfunction, etc
       3. Fixed FvwmIdent module (Sticky, Ontop, Iconified, etc).
       4. Fixed StickyIcon style.
       5. Fixed FvwmWinList

pl 5 to 6
       1. Applied patch to FvwmAudio
       2. Applied patch to FvwmIconBox
       3. Got patch for m4 handling, didn't do anything.
       4. applied FvwmPager patch to eliminate flicker when
          selecting a window on the current page.
pl4 to 5
       1. Fixed FvwmM4 again.
pl3 to 4
       1. Fixed FvwmM4.

pl2 to 3
       1. Removed an unnecessary debugging printf
       2. Fixed FvwmBanner
       3. switched vfork back to fork, since some people apparantly
          don't have vfork.
       4. Changed the name of system.fvwmrc to .fvwmrc because its easier
          to handle within the program. Modified documentation and the
	  install stuff in the Imakefile
       5. Fiddled with time-stamp stuff a bit, so that maybe when people
          change their system clocks, it won't cause everything to stop.  
       6. Fixed a cause of core-dumps in the Next, Prev, None commands.
       
pl1 to pl2
       1. Assorted trivial bug fixes. Maybe something important too,
          I forgot.

2.0 pl 1:
       1. Switched from fork() to vfork() in two places. Its supposed to
       be better when you're only doing an exec anyway.

       2. Made fvwm parse out module arguments in a more standard way.
       see documentation/modules.tex for more details.

       3. Added FvwmM4 module. See its man page.
       4. Added FvwmCpp module.       

2.0 The beginning of time.
