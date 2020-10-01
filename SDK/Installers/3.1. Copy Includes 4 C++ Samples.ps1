$root = "E:\Work\cvsroot\MPlatform\trunk"
$Source = "$root\Include"
$Destination = "$root\Samples\MFormats\C++\!Include"

Copy-Item -Path "$Source\Base\*" -Destination "$Destination\Base\*" -Recurse -Force
Copy-Item -Path "$Source\Devices\*" -Destination "$Destination\Devices\*" -Recurse -Force
Copy-Item -Path "$Source\WinAPI\*" -Destination "$Destination\WinAPI\*" -Recurse -Force
Copy-Item -Path "$Source\XML\*" -Destination "$Destination\XML\*" -Recurse -Force
Copy-Item -Path "$Source\IDL\*" -Destination "$Destination\IDL\*" -Recurse -Force