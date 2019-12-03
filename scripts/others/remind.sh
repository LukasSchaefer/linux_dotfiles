#!/bin/zsh

remind(){

if [ "$#" -eq 0 ]
  then
  print "No argument given! Please give a time (and message)."

elif [ "$#" -eq 1 ]
  then
      while [ $1 != $(date +"%H%M") ]
      do sleep 30
      done
      osascript <<-EOF
        tell application "iTerm"
            create window with profile "Terminal-notifier"
            select first window
            launch session "Default Session"
                tell current session of first window
                    write text "terminal-notifier -title Reminder! -message Reminder"
                end tell
        end tell
      EOF

elif [ "$#" -eq 2 ]
  then
      while [ $1 != $(date +"%H%M") ]
      do sleep 30
      done
      osascript <<-EOF
        tell application "iTerm"
            create window with profile "Terminal-notifier"
            select first window
            launch session "Default Session"
                tell current session of first window
                    write text "terminal-notifier -title Reminder! -message $2"
                end tell
        end tell
      EOF

else
  print "Too many arguments given! Please give a time (and a message if wished)."

fi

}
