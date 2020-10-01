$root="E:\Work\cvsroot\VT"

$SignTool="$root\Install\Sign_Version\Sign\signtool.exe"
$Key="$root\Install\Sign_Version\Sign\Medialooks.p12"
$Path="$root\BuildedDlls"

$Dlls=@(
"Medialooks.Codecs.GPU.x86.dll",
"Medialooks.Codecs.FFM.x86.dll",
"Medialooks.Codecs.SRT.x86.dll",
"Medialooks.MFReader.x86.dll",
"Medialooks.Device.NDI.x86.dll",
"Medialooks.Device.AJA.x86.dll",
"Medialooks.Device.BMD.x86.dll",
"Medialooks.Device.BF.x86.dll",
"Medialooks.Device.DS.x86.dll",
"Medialooks.Device.SCR.x86.dll",
"Medialooks.Runtime.x86.dll",
"Medialooks.VTCore.x86.dll",
"Medialooks.WebRTC.x86.dll",
"MServer.exe",
"VT_Server.exe")

foreach ($item in $Dlls){
    try{
        &$SignTool sign /f $Key /p mlCertPass1@ /t http://timestamp.comodoca.com/authenticode /d $item $Path\$item
        }
    catch{
        Write-Host "Can sign $item"
        Write-Host $_
        }
}