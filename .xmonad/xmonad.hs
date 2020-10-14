-- Base
import XMonad
import XMonad.Config.Desktop
import System.IO (hPutStrLn)
import System.Exit
import qualified XMonad.StackSet as W

-- Data
import Data.List
import Data.Monoid
import Data.Ratio
import Control.Monad (ap)

-- Utilities
import XMonad.Util.Loggers
import XMonad.Util.EZConfig
import XMonad.Util.Run (safeSpawn, unsafeSpawn, runInTerm, spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.ManageHook
import XMonad.Util.NamedScratchpad

-- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, defaultPP, wrap, pad, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat) 
import XMonad.Hooks.Place (placeHook, withGaps, smart)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops   -- required for xcomposite in obs to work

-- Actions
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import XMonad.Actions.CopyWindow (kill1, copyToAll, killAllOtherCopies, runOrCopy)
import XMonad.Actions.WindowGo (runOrRaise, raiseMaybe)
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Actions.CycleWS (moveTo, shiftTo, WSType(..), nextScreen, prevScreen, shiftNextScreen, shiftPrevScreen)
import XMonad.Actions.DynamicWorkspaces (addWorkspacePrompt, removeEmptyWorkspace)
import XMonad.Actions.MouseResize
import XMonad.Actions.SpawnOn
import qualified XMonad.Actions.ConstrainedResize as Sqr

-- Layouts modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.PerWorkspace (onWorkspace) 
import XMonad.Layout.Renamed (renamed, Rename(CutWordsLeft, Replace))
import XMonad.Layout.WorkspaceDir
import XMonad.Layout.Spacing
import XMonad.Util.Themes
import XMonad.Layout.NoBorders
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.Reflect (reflectVert, reflectHoriz, REFLECTX(..), REFLECTY(..))
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), Toggle(..), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))

-- Layouts
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.OneBig
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile
import XMonad.Layout.ZoomRow (zoomRow, zoomIn, zoomOut, zoomReset, ZoomMessage(ZoomFullToggle))
import XMonad.Layout.IM (withIM, Property(Role))

-- Prompt
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Man
import XMonad.Prompt.ConfirmPrompt

------------------------------------------------------------------------
-- 1. Variables
------------------------------------------------------------------------

myFont :: String
myFont = "xft:SauceCodePro Nerd Font Mono:regular:size=11:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4Mask -- Sets modkey to super/windows key

altMask :: KeyMask
altMask = mod1Mask -- this is the super key, but I have it remapped

myTerm :: String
myTerm = "alacritty"

myTextEditor :: String
myTextEditor = "nvim"

myBrowser :: String
myBrowser = "brave"

windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

------------------------------------------------------------------------
-- 2. Startup
------------------------------------------------------------------------

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "nitrogen --restore &" -- Background
  spawnOnce "dunst &" -- Notifications
  spawnOnce "udiskie &" -- Drive auto mounter
  -- https://hackage.haskell.org/package/xmonad-contrib-0.16/docs/XMonad-Hooks-SetWMName.html
  setWMName "LG3D"

------------------------------------------------------------------------
-- 3. Prompt
------------------------------------------------------------------------

promptConfig :: XPConfig
promptConfig = def
  { position = Top
  , font = myFont
  , bgColor = "#000000"
  , promptBorderWidth = 0
  , height = 40
  , alwaysHighlight = True
  }

------------------------------------------------------------------------
-- 4. Keybindings
------------------------------------------------------------------------

type Key = (KeyMask, KeySym)
myKeys :: XConfig l -> [(Key, X ())]
myKeys conf@XConfig {modMask = modm} =
  -- Xmonad
  -- ---------------------------------------------------------------------------
  -- Recompile xmonad
  [ ((modm .|. controlMask, xK_r), spawn "xmonad --recompile")
  -- Restart xmonad
  , ((modm .|. shiftMask, xK_r), spawn "xmonad --restart")
  -- Recompile & restart xmonad
  , ((modm, xK_r), spawn "xmonad --recompile && xmonad --restart")
  -- Prompt for quit xmonad
  , ((modm, xK_q), confirmPrompt promptConfig "quit xmonad?" $ io exitSuccess)
  -- Lock desktop
  , ((modm .|. shiftMask, xK_l), spawn "i3lock -c 000000")

  -- Windows
  -- ---------------------------------------------------------------------------
  -- Kill the currently focused client
  , ((modm .|. shiftMask, xK_c), kill1)
  -- Kill all the windows on current workspace
  , ((modm .|. shiftMask, xK_a), killAll)

  -- Screen Layouts
  -- ---------------------------------------------------------------------------
  -- , ("M-S-'", spawn "~/.screenlayout/mono.sh")   -- Change to a mono layout
  -- , ("M-S-¡", spawn "~/.screenlayout/common.sh") -- Change to a two screen layout

  -- Floating windows
  -- ---------------------------------------------------------------------------
  -- Push floating window back to tile.
  , ((modm, xK_Delete), withFocused $ windows . W.sink)
  -- Push ALL floating windows back to tile.
  , ((modm .|. shiftMask, xK_Delete), sinkAll)

  -- Windows navigation
  -- ---------------------------------------------------------------------------
  -- Move focus to the master window
  , ((modm, xK_m), windows W.focusMaster)
  -- Move focus to the next window
  , ((modm, xK_j), windows W.focusDown)
  -- Move focus to the prev window
  , ((modm, xK_k), windows W.focusUp)
  -- Swap the focused window and the master window
  , ((modm .|. shiftMask, xK_m), windows W.swapMaster)
  -- Swap the focused window with the next window
  , ((modm .|. shiftMask, xK_j), windows W.swapDown)
  -- Swap the focused window with the prev window
  , ((modm .|. shiftMask, xK_k), windows W.swapUp)
  -- Moves focused window to master, all others maintain order
  , ((modm, xK_BackSpace), promote)
  -- Rotate all windows except master and keep focus in place
  , ((altMask .|. shiftMask, xK_Tab), rotSlavesDown)
  -- Rotate all the windows in the current stack
  , ((altMask .|. controlMask, xK_Tab), rotAllDown)
  , ((modm .|. shiftMask, xK_s), windows copyToAll)
  , ((modm .|. controlMask, xK_s), killAllOtherCopies)
  , ((modm .|. controlMask .|. altMask, xK_Up), sendMessage Arrange)
  , ((modm .|. controlMask .|. altMask, xK_Down), sendMessage DeArrange)
  --  Move focused window to up
  , ((modm, xK_Up), sendMessage (MoveUp 10))
  --  Move focused window to down
  , ((modm, xK_Down), sendMessage (MoveDown 10))
  --  Move focused window to right
  , ((modm, xK_Right), sendMessage (MoveRight 10))
  --  Move focused window to left
  , ((modm, xK_Left), sendMessage (MoveLeft 10))
  --  Increase size of focused window up
  , ((modm, xK_Up), sendMessage (IncreaseUp 10))
  --  Increase size of focused window down
  , ((modm, xK_Down), sendMessage (IncreaseDown 10))
  --  Increase size of focused window right
  , ((modm .|. shiftMask, xK_Right), sendMessage (IncreaseRight 10))
  --  Increase size of focused window left
  , ((modm .|. shiftMask, xK_Left), sendMessage (IncreaseLeft 10))
  --  Decrease size of focused window up
  , ((modm .|. controlMask, xK_Up), sendMessage (DecreaseUp 10))
  --  Decrease size of focused window down
  , ((modm .|. controlMask, xK_Down), sendMessage (DecreaseDown 10))
  --  Decrease size of focused window right
  , ((modm .|. controlMask, xK_Right), sendMessage (DecreaseRight 10))
  --  Decrease size of focused window left
  , ((modm .|. controlMask, xK_Left), sendMessage (DecreaseLeft 10))

  -- Layouts
  -- ---------------------------------------------------------------------------
  -- Switch to next layout
  , ((modm, xK_Tab), sendMessage NextLayout)
  -- Toggle struts
  , ((modm .|. shiftMask, xK_space), sendMessage ToggleStruts)
  -- Toggle float
  , ((modm .|. shiftMask, xK_f), sendMessage (T.Toggle "float"))
  , ((modm .|. shiftMask, xK_x), sendMessage $ Toggle REFLECTX)
  , ((modm .|. shiftMask, xK_y), sendMessage $ Toggle REFLECTY)
  , ((modm .|. shiftMask, xK_m), sendMessage $ Toggle MIRROR)
  -- Increase number of clients in the master pane
  , ((modm, xK_asterisk), sendMessage (IncMasterN 1))
  -- Decrease number of clients in the master pane
  , ((modm, xK_slash), sendMessage (IncMasterN (-1)))
  -- Increase number of windows that can be shown
  , ((modm .|. shiftMask, xK_asterisk), increaseLimit)
  -- Decrease number of windows that can be shown
  , ((modm .|. shiftMask, xK_slash), decreaseLimit)
  -- Shrink current pane
  , ((modm, xK_h), sendMessage Shrink)
  -- Expand current pane
  , ((modm, xK_l), sendMessage Expand)
  , ((modm .|. controlMask, xK_j), sendMessage MirrorShrink)
  , ((modm .|. controlMask, xK_k), sendMessage MirrorExpand)

  -- TODO Review this shortkeys
  -- Reset zooom
  , ((modm .|. shiftMask, xK_semicolon), sendMessage zoomReset)
  -- Zoom full toggle
  , ((modm, xK_semicolon), sendMessage ZoomFullToggle)

  -- Workspaces
  -- ---------------------------------------------------------------------------
  -- Switch focus to next monitor
  , ((modm, xK_period), nextScreen)
  -- Switch focus to prev monitor
  , ((modm, xK_comma), prevScreen)

  -- Prompts
  -- ---------------------------------------------------------------------------
  -- Prompt for programs
  , ((modm, xK_p), shellPrompt promptConfig)
  -- Prompt for man docs
  , ((modm, xK_F1), manPrompt promptConfig)

  -- My Applications
  -- ---------------------------------------------------------------------------
  -- Open Terminal
  , ((modm, xK_Return), spawn myTerm)
  -- Open file manager
  , ((modm .|. shiftMask, xK_Return), spawn (myTerm ++ " -e ranger"))
  -- Open color picker
  , ((modm .|. altMask, xK_p), spawn "gpick")
  -- Open gif capture
  , ((modm .|. altMask, xK_c), spawn "peek")
 
  -- Screen capture
  -- ---------------------------------------------------------------------------
  , ((0, xK_Print), spawn "scrot 0")

  -- Scratchpads
  -- ---------------------------------------------------------------------------
  , ((modm .|. controlMask, xK_Return), namedScratchpadAction myScratchPads "term")
  , ((modm .|. controlMask, xK_s), namedScratchpadAction myScratchPads "spt")
  , ((modm .|. controlMask, xK_h), namedScratchpadAction myScratchPads "help")
  , ((modm .|. controlMask, xK_b), namedScratchpadAction myScratchPads "bpytop")
  , ((modm .|. controlMask, xK_n), namedScratchpadAction myScratchPads "node")

  -- Multimedia Keys
  -- ---------------------------------------------------------------------------
  -- Audio keys
  , ((0, stringToKeysym "XF86AudioMute"), spawn "amixer set Master toggle")
  , ((0, stringToKeysym "XF86AudioLowerVolume"), spawn "amixer set Master 5%- unmute")
  , ((0, stringToKeysym "XF86AudioRaiseVolume"), spawn "amixer set Master 5%+ unmute")
  , ((0, stringToKeysym "XF86AudioMicMute"), spawn "amixer set Capture toggle")
  -- Brightness
  -- , ("<XF86MonBrightnessUp>", spawn "echo")
  -- , ("<XF86MonBrightnessDown>", spawn "echo")
  -- Display
  -- , ("<XF86Display>", spawn "echo")
  -- Extra
  , ((0, stringToKeysym "XF86Favorites"), spawn myBrowser)
  ]

------------------------------------------------------------------------
-- 5. Workspaces
------------------------------------------------------------------------

xmobarEscape = concatMap doubleLts
  where
    doubleLts '<' = "<<"
    doubleLts x   = [x]
        
myWorkspaces :: [String]   
myWorkspaces = clickable . map xmobarEscape 
  $ ["\xf121", "\xf484", "\xf040", "\xf489", "\xf719", "\xf001", "\xf502"]
  where                                                                      
    clickable l = [ "<action=xdotool key super+" ++ show n ++ ">" ++ ws ++ "</action>" | (i,ws) <- zip [1..7] l, let n = i ] 

------------------------------------------------------------------------
-- 6. Managehook
------------------------------------------------------------------------

myManageHook :: Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
 [ className =? "Gpick" --> doFloat
 , className =? "Peek" --> doFloat
 , (className =? "Brave-browser" <&&> resource =? "Dialog") --> doFloat  -- Float Browser Dialog
 ] <+> namedScratchpadManageHook myScratchPads

------------------------------------------------------------------------
-- 7. ScratchPads
------------------------------------------------------------------------

myScratchPads :: [NamedScratchpad]
myScratchPads =
  [ NS "term"
    (myTerm ++ " --class spterm")
    (resource =? "spterm")
    spconf

  , NS "bpytop"
    (myTerm ++ " --class spbpytop -e bpytop")
    (resource =? "spbpytop")
    spconf

  , NS "spt"
    (myTerm ++ " --class spspt -e spt")
    (resource =? "spspt")
    spconf

  , NS "help"
    (myTerm ++ " --class sphelp -e less ~/.xmonad/xmonad.md")
    (resource =? "sphelp")
    spconf

  , NS "node"
    (myTerm ++ " --class spnode -e node")
    (resource =? "spnode")
    spconf

  ] where
    spconf = customFloating $ W.RationalRect l t w h
      where
        h = 0.7
        w = 0.7
        t = (1 - h)/2
        l = (1 - w)/2

------------------------------------------------------------------------
-- 8. Layouts
------------------------------------------------------------------------

myLayoutHook =
  avoidStruts $
  -- A layout modifier to resize windows with the mouse by grabbinf the window's
  -- lower right corner
  -- https://hackage.haskell.org/package/xmonad-contrib-0.13/docs/XMonad-Actions-MouseResize.html
  mouseResize $
  -- This is a pure layout modified that will let you move and resize windows
  -- with the keyboard in any layout
  -- https://hackage.haskell.org/package/xmonad-contrib-0.13/docs/XMonad-Layout-WindowArranger.html
  windowArrange $
  mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout where 
    myDefaultLayout = noBorders monocle ||| tall ||| grid ||| space

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw True (Border i i i i) True (Border i i i i) True

monocle    = renamed [Replace "monocle"]  $ limitWindows 20 Full
tall       = renamed [Replace "tall"]     $ limitWindows 12 $ mySpacing 3 $ ResizableTall 1 (3/100) (1/2) []
grid       = renamed [Replace "grid"]     $ limitWindows 12 $ mySpacing 3 $ mkToggle (single MIRROR) $ Grid (16/10)
space      = renamed [Replace "space"]    $ limitWindows 4  $ mySpacing 6 $ Mirror $ mkToggle (single MIRROR) $ mkToggle (single REFLECTX) $ mkToggle (single REFLECTY) $ OneBig (2/3) (2/3)

------------------------------------------------------------------------
-- 9. Main
------------------------------------------------------------------------

main = do
  -- Launching instances of xmobar on their monitors.
  xmproc0 <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobar.hs"
  xmproc1 <- spawnPipe "xmobar -x 1 ~/.config/xmobar/xmobar.hs"
  -- the xmonad, ya know...what the WM is named after!
  xmonad $ customKeys $ ewmh desktopConfig
    { manageHook = myManageHook <+> manageSpawn <+> manageHook desktopConfig <+> manageDocks
    , logHook = dynamicLogWithPP xmobarPP
      { ppOutput = \x -> hPutStrLn xmproc0 x  >> hPutStrLn xmproc1 x
      , ppCurrent = xmobarColor "grey" "" . wrap "[" "]" -- Current workspace in xmobar
      , ppVisible = xmobarColor "grey" ""                -- Visible but not current workspace
      , ppHidden = xmobarColor "grey" "" . wrap "*" ""   -- Hidden workspaces in xmobar
      , ppHiddenNoWindows = xmobarColor "#666666" ""     -- Hidden workspaces (no windows)
      , ppTitle = xmobarColor "grey" "" . shorten 60     -- Title of active window in xmobar
      , ppSep =  "<fc=#666666> | </fc>"                  -- Separators in xmobar
      , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"  -- Urgent workspace
      , ppExtras  = [windowCount]                        -- # of windows current workspace
      , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
      }
    , modMask            = myModMask
    , handleEventHook    = handleEventHook desktopConfig <+> fullscreenEventHook
    , terminal           = myTerm
    , startupHook        = myStartupHook
    , layoutHook         = myLayoutHook 
    , workspaces         = myWorkspaces
    , borderWidth        = 0
    , normalBorderColor  = "#292d3e"
    , focusedBorderColor = "#bbc5ff"
    }
  where
    customKeys = additionalKeys `ap` myKeys

