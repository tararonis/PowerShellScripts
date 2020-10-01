$root="E:\Work\cvsroot\VT"
$source="$root\Install\Includes"

#clean folders
Remove-Item "$root\DLL\*" -Recurse -Force 
Remove-Item "$root\BuildedDlls\*" -Recurse -Force

#ffmpeg
New-Item -Path "$root\DLL" -Name "Codecs" -ItemType "directory"

Copy-Item -Path "$source\ffmpeg\*" -Destination "$root\DLL\Codecs\" -Recurse
Copy-Item -Path "$source\ffmpeg\*" -Destination "$root\BuildedDlls\" -Recurse

#NDI
New-Item -Path "$root\DLL" -Name "NDI" -ItemType "directory"

Copy-Item -Path "$source\NDI\*" -Destination "$root\DLL\NDI\" -Recurse
Copy-Item -Path "$source\NDI\*" -Destination "$root\BuildedDlls\" -Recurse

#Hardware
#Bluefish
Copy-Item -Path "$source\Hardware\BF\*" -Destination "$root\DLL\" -Recurse
Copy-Item -Path "$source\Hardware\BF\*" -Destination "$root\BuildedDlls\" -Recurse

#D3D&OpenGL
Copy-Item -Path "$source\OpenGL&D3D\*" -Destination "$root\DLL\" -Recurse
Copy-Item -Path "$source\OpenGL&D3D\*" -Destination "$root\BuildedDlls\" -Recurse

#Local_config, MServer
Copy-Item -Path "E:\Work\cvsroot\MPlatform\trunk\CustomProjects\NDI2Internet\Install\Local.Config.xml" -Destination "$source\Manifests_LocalConfig_TXT\" -Force
Copy-Item -Path "$source\Manifests_LocalConfig_TXT\Local.Config.xml" -Destination "$root\DLL\" -Force
Copy-Item -Path "$source\Manifests_LocalConfig_TXT\MServer.exe.manifest" -Destination "$root\DLL\" -Force