try
    set dotVisible to do shell script "defaults read com.apple.finder AppleShowAllFiles"
on error errorMessage number errorNumber
    set dotVisible to 0
end try

if dotVisible = "0" then
    do shell script "defaults write com.apple.finder AppleShowAllFiles 1"
else
    do shell script "defaults write com.apple.finder AppleShowAllFiles 0"
end if

tell application "Finder" to quit

delay 1

tell application "Finder" to activate

if dotVisible = "0" then
    say "VISIBLE"
else
    say "HIDDEN"
end if
