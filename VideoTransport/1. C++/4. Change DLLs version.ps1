$root="E:\Work\cvsroot\VT"

$ChangeVersionTool="$root\Install\Sign_Version\ChangeVersion\rcedit.exe"
$SDK_git="E:\Work\cvsroot\MPlatform\trunk\CustomProjects\NDI2Internet"
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

$version=[string]"%vt_build_number%"
$q = $version.Split(".")

$maj=$q[0].ToString()
$min=$q[1].ToString()
$build=$q[2].ToString()
$incVersion=$q[3].ToString()

cd $SDK_git
$hash= &git rev-parse --short HEAD
$branch= &git rev-parse --abbrev-ref HEAD 

Write-Host "$hash\$branch"
Write-Host "$maj.$min.$build.$incVersion"

foreach ($item in $Dlls){
    try{
        &$ChangeVersionTool "$Path\$item" --set-file-version "$maj.$min.$build.$incVersion" --set-product-version "$maj.$min.$build.$hash.$branch"        
        }
    catch{
        Write-Host "Can change version $item"
        Write-Host $_
        }
}