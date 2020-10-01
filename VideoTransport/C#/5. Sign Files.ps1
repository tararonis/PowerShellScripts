$root="E:\Work\cvsroot\VT"

$SignTool="$root\Install\Sign_Version\Sign\signtool.exe"
$Key="$root\Install\Sign_Version\Sign\Medialooks.p12"
$Path="$root\VT_UI\Builded\x86\Release"

$Files=@(
"Interop.VTCORELib.dll",
"VT_Common.dll",
"VT_Guest.exe",
"VT_Publisher.exe",
"VT_Receiver.exe")

foreach ($item in $Files){
    try{
        &$SignTool sign /f $Key /p mlCertPass1@ /t http://timestamp.comodoca.com/authenticode /d $item $Path\$item
        }
    catch{
        Write-Host "Can't sign $item"
        Write-Host $_
        }
}