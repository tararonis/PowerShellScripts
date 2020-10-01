$root = "E:\Work\cvsroot\VT"
$VT_Archive ="$root\Install\VT_archive"

$VT_Folder="$VT_Archive\Video Transport %vt_build_number%\Video Transport %vt_build_number%"			
$VT_Redist="$VT_Archive\Video Transport %vt_build_number%.zip"

$VT_Csharp="$root\VT_UI\Builded\x86\Release"

$VT_txt="$root\Install\Includes\Manifests_LocalConfig_TXT"

#Create Folders
if([System.IO.File]::Exists("$root\Install\VT_archive\Video Transport %vt_build_number%"))
{
	Remove-Item "$root\Install\VT_archive\Video Transport %vt_build_number%" -Recurse -Force
    Write-Host "The version %vt_build_number% has been already builded"
}
New-Item -Path "$root\Install\VT_archive\" -Name "Video Transport %vt_build_number%" -ItemType "directory"
New-Item -Path "$root\Install\VT_archive\Video Transport %vt_build_number%" -Name "Video Transport %vt_build_number%" -ItemType "directory"
New-Item -Path "$VT_Folder" -Name "DLL" -ItemType "directory"
New-Item -Path "$VT_Folder" -Name "Bin" -ItemType "directory"

#Copy DLLs
Copy-Item -Path "$root\DLL\*" -Destination "$VT_Folder\DLL\" –Recurse
if([System.IO.File]::Exists("$VT_Folder\DLL\x64"))
{
	Remove-Item -Recurse -Force "$VT_Folder\DLL\x64" #remove x64 folder(easier to do)
}

#Copy files from C# solution
#Copy to bin folder
Copy-Item -Path "$VT_Csharp\ControlzEx.dll" -Destination "$VT_Folder\Bin"
Copy-Item -Path "$VT_Csharp\Interop.VTCORELib.dll" -Destination "$VT_Folder\Bin"
Copy-Item -Path "$VT_Csharp\MahApps.Metro.dll" -Destination "$VT_Folder\Bin"
Copy-Item -Path "$VT_Csharp\System.Windows.Interactivity.dll" -Destination "$VT_Folder\Bin"
Copy-Item -Path "$VT_Csharp\VT_Common.dll" -Destination "$VT_Folder\Bin"
Copy-Item -Path "$VT_Csharp\Newtonsoft.Json.dll" -Destination "$VT_Folder\Bin"
#Copy to main folder
Copy-Item -Path "$VT_Csharp\VT_Guest.exe" -Destination "$VT_Folder"
Copy-Item -Path "$VT_Csharp\VT_Guest.exe.config" -Destination "$VT_Folder"
Copy-Item -Path "$VT_Csharp\VT_Publisher.exe" -Destination "$VT_Folder"
Copy-Item -Path "$VT_Csharp\VT_Publisher.exe.config" -Destination "$VT_Folder"
Copy-Item -Path "$VT_Csharp\VT_Receiver.exe" -Destination "$VT_Folder"
Copy-Item -Path "$VT_Csharp\VT_Receiver.exe.config" -Destination "$VT_Folder"

#Copy VT_Server and Remove from DLLs
if([System.IO.File]::Exists("$VT_Folder\DLL\VT_Server.exe"))
{
	Remove-Item -Force "$VT_Folder\DLL\VT_Server.exe" #remove VT_Server.exe(easier to do) #remove x64 folder(easier to do)
}
Copy-Item -Path "$root\BuildedDlls\VT_Server.exe" -Destination "$VT_Folder\" 

#Copy manifests
Copy-Item -Path "$VT_txt\VT_Guest.exe.manifest" -Destination "$VT_Folder\"
Copy-Item -Path "$VT_txt\VT_Publisher.exe.manifest" -Destination "$VT_Folder\"
Copy-Item -Path "$VT_txt\VT_Receiver.exe.manifest" -Destination "$VT_Folder\"
Copy-Item -Path "$VT_txt\VT_Server.exe.manifest" -Destination "$VT_Folder\"

Copy-Item -Path "$VT_txt\MServer.exe.manifest" -Destination "$VT_Folder\DLL"

#Copy Local_config
Copy-Item -Path "$VT_txt\Local.Config.xml" -Destination "$VT_Folder\DLL"
#Copy Licenses
Copy-Item -Path "$VT_txt\SRT.License.txt" -Destination "$VT_Folder\DLL\Codecs"
Copy-Item -Path "$VT_txt\FFmpeg_lgpl.txt" -Destination "$VT_Folder\DLL\Codecs"

Copy-Item -Path "$VT_txt\MahApps.Metro.License.txt" -Destination "$VT_Folder\Bin\"
Copy-Item -Path "$VT_txt\Newtonsoft.Json.License.txt" -Destination "$VT_Folder\Bin\"
#EULA/Readme
Copy-Item -Path "$VT_txt\Medialooks_EULA.pdf" -Destination "$VT_Folder\"
Copy-Item -Path "$VT_txt\Readme.txt" -Destination "$VT_Folder\"