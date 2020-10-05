$MSbuild_path = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"

$root = "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats.WebRTC\"

$Solutions = @(
    "C#_samples.sln",    
    "Delphi_samples.groupproj", #For delphi platform - win32/win64
    "VB.NET_samples.sln"
)
#Build x86 Samples
foreach($sln in $Solutions)
{
    try{
        $plm86 = "x86"
        if($sln -eq "Delphi_samples.groupproj")
        {
            $plm86 = "win32"
        }
        $collectionOfArgs = @("$root\$sln", "/target:ReBuild", "/property:Configuration=Debug;Platform=$plm86")
        & $MSbuild_path $collectionOfArgs
        }
    catch{
    Write-Host "Can't build x86 $sln"
    Write-Host $_
        }
}
#Build x64 Samples
foreach($sln in $Solutions)
{
    try{
        $plm64 = "x64"
        if($sln -eq "Delphi_samples.groupproj")
        {
            $plm86 = "win64"
        }
        $collectionOfArgs = @("$root\$sln", "/target:ReBuild", "/property:Configuration=Debug;Platform=$plm64")
        & $MSbuild_path $collectionOfArgs
        }
    catch{
    Write-Host "Can't build x64 $sln"
    Write-Host $_
        }
}