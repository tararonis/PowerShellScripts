$MSBuild = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"

$root = "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats"

$Solutions = @(
    "C#_samples.sln",
    "C++_samples.sln",
    "Delphi_samples.groupproj",
    "VB.NET_samples.sln"
)

#Build x86 Samples
foreach($sln in $Solutions)
{
    try{
        $collectionOfArgs = @("$root\$sln", "/target:ReBuild", "/property:Configuration=Debug;Platform=x86")
        & $MSBuild $collectionOfArgs
        }
    catch{
    Write-Host "Can't build x64 $sln"
    Write-Host $_
        }
}
#Build x64 Samples
foreach($sln in $Solutions)
{
    try{
        $collectionOfArgs = @("$root\$sln", "/target:ReBuild", "/property:Configuration=Debug;Platform=x64")
        & $MSBuild $collectionOfArgs
        }
    catch{
    Write-Host "Can't build x64 $sln"
    Write-Host $_
        }
}

#For delphi platform - win32/win64