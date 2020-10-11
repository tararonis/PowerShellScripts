$SDK_git = "E:\Work\cvsroot\MPlatform\trunk"
$Source = "$SDK_git\Include"
$Destination = "$SDK_git\Samples\MFormats\C++\!Include"

Copy-Item -Path "$Source\Base\*" -Destination "$Destination\Base\" -Recurse -Force
Copy-Item -Path "$Source\Devices\*" -Destination "$Destination\Devices\" -Recurse -Force
Copy-Item -Path "$Source\WinAPI\*" -Destination "$Destination\WinAPI\" -Recurse -Force
Copy-Item -Path "$Source\XML\*" -Destination "$Destination\XML\" -Recurse -Force
Copy-Item -Path "$Source\IDL\*" -Destination "$Destination\IDL\" -Recurse -Force