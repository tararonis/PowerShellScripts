#Check that VT folder contain all required files
$root = "E:\Work\cvsroot\VT"
$VT_Archive ="$root\Install\VT_archive"
$VT_Folder="$VT_Archive\Video Transport %vt_build_number%\Video Transport %vt_build_number%"	

function not-exist { -not (Test-Path $args) }

if(not-exist "$VT_Archive\Video Transport %vt_build_number%"))
{
	& 'C:\Users\BuildServer3\Desktop\temp\bot\BuildSuc\bin\Debug\BotNotification.exe' "!!! Problem with VT-%vt_build_number%-$VT_Archive\Video Transport %vt_build_number%"
	throw "Folder %vt_build_number% didn't been created"
}

$main_files=@(
"Bin",
"DLL",
"Medialooks_EULA",
"Readme",
"VT_Guest.exe",
"VT_Guest.exe.config",
"VT_Guest.exe.manifest",
"VT_Publisher.exe",
"VT_Publisher.exe.config",
"VT_Publisher.exe.manifest",
"VT_Receiver.exe",
"VT_Receiver.exe.config",
"VT_Receiver.exe.manifest",
"VT_Server.exe",
"VT_Server.exe.manifest")

$Bin=@(
"ControlzEx.dll",
"Interop.VTCORELib.dll",
"MahApps.Metro.dll",
"MahApps.Metro.License.txt",
"Newtonsoft.Json.dll",
"Newtonsoft.Json.License.txt",
"System.Windows.Interactivity.dll",
"VT_Common.dll")

$DLL=@(
"Codecs",
"NDI",
"BlueHancUtils.dll",
"BlueVelvetC.dll",
"D3DCompiler_43.dll",
"d3dcompiler_47.dll",
"glew32.dll",
"Local.Config.xml",
"Medialooks.Device.AJA.x86.dll",
"Medialooks.Device.BF.x86.dll",
"Medialooks.Device.BMD.x86.dll",
"Medialooks.Device.DS.x86.dll",
"Medialooks.Device.SCR.x86.dll",
"Medialooks.Runtime.x86.dll",
"Medialooks.VTCore.x86.dll",
"Medialooks.WebRTC.x86.dll",
"MServer.exe",
"MServer.exe.manifest")

$Codecs=@(
"avcodec-58.dll",
"avdevice-58.dll",
"avfilter-7.dll",
"avformat-58.dll",
"avresample-4.dll",
"avutil-56.dll",
"FFmpeg_lgpl.txt",
"Medialooks.Codecs.FFM.x86.dll",
"Medialooks.Codecs.GPU.x86.dll",
"Medialooks.Codecs.SRT.x86.dll",
"Medialooks.MFReader.x86.dll",
"SRT.License.txt",
"swresample-3.dll",
"swscale-5.dll")

$NDI=@(
"concrt140.dll",
"Medialooks.Device.NDI.x86.dll",
"msvcp140.dll",
"Processing.NDI.Lib.x86.dll",
"vcruntime140.dll")

function Check_files($array, $path)
{
	foreach($item in $array)
    {
    	if(not-exist "$path\$item")
		{
			& 'C:\Users\BuildServer3\Desktop\temp\bot\BuildSuc\bin\Debug\BotNotification.exe' "!!! There is no $item in $path"
			throw "There is no $item in $path"
		}
    }
}
Check_files -array $main_files -path $VT_Folder
Check_files -array $Bin -path "$VT_Folder\Bin"
Check_files -array $DLL -path "$VT_Folder\DLL"
Check_files -array $Codecs -path "$VT_Folder\DLL\Codecs"
Check_files -array $NDI -path "$VT_Folder\DLL\NDI"

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Check version
$main_files=@(
"VT_Guest.exe",
"VT_Publisher.exe",
"VT_Receiver.exe",
"VT_Server.exe")

$Bin=@(
"Interop.VTCORELib.dll",
"VT_Common.dll")

$DLL=@(
"Medialooks.Device.AJA.x86.dll",
"Medialooks.Device.BF.x86.dll",
"Medialooks.Device.BMD.x86.dll",
"Medialooks.Device.DS.x86.dll",
"Medialooks.Device.SCR.x86.dll",
"Medialooks.Runtime.x86.dll",
"Medialooks.VTCore.x86.dll",
"Medialooks.WebRTC.x86.dll",
"MServer.exe")

$Codecs=@(
"Medialooks.Codecs.FFM.x86.dll",
"Medialooks.Codecs.GPU.x86.dll",
"Medialooks.Codecs.SRT.x86.dll",
"Medialooks.MFReader.x86.dll")

$NDI=@(
"Medialooks.Device.NDI.x86.dll")

function Check_version($files, $path){
	foreach($file in $files)
    {
     	$file_verison = [System.Diagnostics.FileVersionInfo]::GetVersionInfo("$path\$file").FileVersion 
    	if($file_verison -ne "%vt_build_number%")
		{
			& 'C:\Users\BuildServer3\Desktop\temp\bot\BuildSuc\bin\Debug\BotNotification.exe' "!!! $file is not %vt_build_number%"
			throw "$file is not %vt_build_number%"
		}
    }
}
Check_version -files $main_files -path $VT_Folder
Check_version -files $Bin -path "$VT_Folder\Bin"
Check_version -files $DLL -path "$VT_Folder\DLL"
Check_version -files $Codecs -path "$VT_Folder\DLL\Codecs"
Check_version -files $NDI -path "$VT_Folder\DLL\NDI"