#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Raycast Scripts
# @raycast.mode silent
# @raycast.packageName VS Code
#
# Optional parameters:
# @raycast.icon images/vscode.png
#
# Documentation:
# @raycast.description Opens current topmost directory in VSCode
# @raycast.author faisal3389
# @raycast.authorURL https://github.com/faisal3389

set dirPath to "/Users/faisalsiddiqui/workspace/raycast-script-commands"
do shell script "open -n -b \"com.microsoft.VSCode\" --args " & quoted form of POSIX path of (dirPath)