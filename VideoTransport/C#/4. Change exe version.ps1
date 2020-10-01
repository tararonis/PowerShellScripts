$root="E:\Work\cvsroot\VT"

$ChangeVersionTool="$root\Install\Sign_Version\ChangeVersion\rcedit.exe"
$VT_git="$root\VT_UI"
$Path="$root\VT_UI\Builded\x86\Release"

$Files=@(
"Interop.VTCORELib.dll",
"VT_Common.dll",
"VT_Guest.exe",
"VT_Publisher.exe",
"VT_Receiver.exe")

$version=[string]"%vt_build_number%"
$q = $version.Split(".");

$maj=$q[0].ToString()
$min=$q[1].ToString()
$build=$q[2].ToString()
$incVersion=$q[3].ToString()

cd $VT_git
$hash= &git rev-parse --short HEAD
$branch= &git rev-parse --abbrev-ref HEAD 

Write-Host "$hash\$branch"
Write-Host "$maj.$min.$build.$incVersion"

foreach ($item in $Files){
    try{
        &$ChangeVersionTool "$Path\$item" --set-file-version "$maj.$min.$build.$incVersion" --set-product-version "$maj.$min.$build.$hash.$branch"        
        }
    catch{
        Write-Host "Can change version $item"
        Write-Host $_
        }
}