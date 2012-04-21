-- A script to automatically zoom the frontmost window. 
-- Â© 2006 by Daniel Jalkut, Inspired by:
--
-- http://www.macosxhints.com/article.php?story=20051227001809626&lsrc=osxh
--

tell application "System Events"
    set frontAppName to name of first application process whose frontmost is true
end tell

set tryZoomedAttribute to true
set tryMenuScripting to false
set tryButtonScripting to false
set allMethodsFailed to false

-- Special cases. For Applications whose behavior we know responds to one or the other
-- method, force that method here.
if (frontAppName is equal to "iTunes") then
    set tryZoomedAttribute to false
    set tryMenuScripting to true
end if

if (tryZoomedAttribute is equal to true) then
    tell application frontAppName
        try
            set zoomed of window 1 to not (zoomed of window 1)
        on error
            set tryMenuScripting to true
        end try
    end tell
end if

-- Make sure the user has UI scripting enabled before we go on...
if ((tryMenuScripting is equal to true) or (tryButtonScripting is equal to true)) then
    tell application "System Events"
        if UI elements enabled is false then
            tell application "System Preferences"
                activate
                set current pane to pane "com.apple.preference.universalaccess"
                display dialog "UI element scripting is not enabled. Check 'Enable access for assistive devices'"
            end tell
        end if
    end tell
end if

if (tryMenuScripting is equal to true) then
    tell application "System Events"
        tell process frontAppName
            try
                click menu item "Zoom" of menu of menu bar item "Window" of menu bar 1
            on error
                set tryButtonScripting to true
            end try
        end tell
    end tell
end if

if (tryButtonScripting is equal to true) then
    -- UI Scripting method:
    tell application "System Events"
        try
            tell process frontAppName
                click button 2 of window 1
            end tell
        on error
            set allMethodsFailed to true
        end try
    end tell
end if

if (allMethodsFailed is equal to true) then
    display dialog "I'm sorry, I couldn't figure out how to zoom this window."
end if
