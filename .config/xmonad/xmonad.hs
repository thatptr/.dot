import XMonad

import XMonad.Util.EZConfig

import XMonad.Layout.NoBorders

import XMonad.Layout.Spacing
import XMonad.Layout.Gaps

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Util.Run

import XMonad.Actions.MouseResize
import XMonad.Layout.WindowArranger

myStartupHook :: X ()
myStartupHook = do
   spawn "~/.config/xmonad/xmonad.sh"

layout = avoidStruts (gaps [(U,2), (R,2), (L, 2), (D, 2)] $ mouseResize $ windowArrange $ spacingWithEdge 2 $ tiled ||| Mirror tiled ||| noBorders Full ||| Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

main = do 
  xmproc <- spawnPipe "xmobar"

  xmonad $ docks $ def
    { modMask = mod4Mask
    , terminal = "alacritty"
    , manageHook = manageDocks
    , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#dce0e8" "" . shorten 30
                        , ppSep = " | "
                        }
    , startupHook = myStartupHook
    , layoutHook = layout
    , borderWidth = 0
    } `additionalKeys` [((mod4Mask, xK_p), spawn "rofi -show drun")
    ,((mod4Mask, xK_t), withFocused toggleFloat)]
     where
            toggleFloat w = windows (\s -> if M.member w (W.floating s)
                            then W.sink w s
                            else (W.float w (W.RationalRect (1/3) (1/4) (1/2) (4/5)) s))
         


