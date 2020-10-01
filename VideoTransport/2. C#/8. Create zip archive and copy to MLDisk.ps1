$root = "E:\Work\cvsroot\VT"
$VT_Archive ="$root\Install\VT_archive"

$VT_Folder="$VT_Archive\Video Transport %vt_build_number%\Video Transport %vt_build_number%"			
$VT_Redist="$VT_Archive\Video Transport %vt_build_number%.zip"

#Remove archive if already exist
if(Test-path $VT_Redist) {
	Remove-item $VT_Redist
}
#Create zip archieve
Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::CreateFromDirectory("$VT_Archive\Video Transport %vt_build_number%", $VT_Redist)

Copy-Item $VT_Redist -Destination "\\192.168.0.100\MLFiles\Releases\VT"

#Inform admin about new version
& 'C:\Users\BuildServer3\Desktop\temp\bot\BuildSuc\bin\Debug\BotNotification.exe' "!!! Builded VT-%vt_build_number%"