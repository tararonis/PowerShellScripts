$vt_folder = "E:\Work\cvsroot\VT"
$dll_source = "$vt_folder\BuildedDlls"
$dll_dest = "$vt_folder\DLL"

#Codecs folder
Copy-Item "$dll_source\Medialooks.Codecs.FFM.x86.dll" -Destination "$dll_dest\Codecs\" -Force
Copy-Item "$dll_source\Medialooks.Codecs.GPU.x86.dll" -Destination "$dll_dest\Codecs\" -Force
Copy-Item "$dll_source\Medialooks.Codecs.SRT.x86.dll" -Destination "$dll_dest\Codecs\" -Force
Copy-Item "$dll_source\Medialooks.MFReader.x86.dll" -Destination "$dll_dest\Codecs\" -Force
#NDI folder
New-Item -Path "$dll_dest" -Name "NDI" -ItemType "directory"
Copy-Item "$dll_source\Medialooks.Device.NDI.x86.dll" -Destination "$dll_dest\NDI\" -Force
#Main folder
    #devices
Copy-Item "$dll_source\Medialooks.Device.AJA.x86.dll" -Destination "$dll_dest" -Force
Copy-Item "$dll_source\Medialooks.Device.BMD.x86.dll" -Destination "$dll_dest" -Force
Copy-Item "$dll_source\Medialooks.Device.BF.x86.dll" -Destination "$dll_dest" -Force
Copy-Item "$dll_source\Medialooks.Device.DS.x86.dll" -Destination "$dll_dest" -Force
Copy-Item "$dll_source\Medialooks.Device.SCR.x86.dll" -Destination "$dll_dest" -Force

Copy-Item "$dll_source\Medialooks.Runtime.x86.dll" -Destination "$dll_dest" -Force
Copy-Item "$dll_source\Medialooks.VTCore.x86.dll" -Destination "$dll_dest" -Force
Copy-Item "$dll_source\Medialooks.WebRTC.x86.dll" -Destination "$dll_dest" -Force
Copy-Item "$dll_source\MServer.exe" -Destination "$dll_dest" -Force