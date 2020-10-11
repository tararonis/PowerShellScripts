Write-Host "Start building samples, because SDK_rebuild_samples=%SDK_rebuild_samples%"
$MSbuild_path = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
$root = "E:\Work\cvsroot\MPlatform\trunk\Utils"

#MSINK we won't rebuild because it's in the both installer(to prevent the exception) and changes in the MSink happend not very often(never)
#1. MPManifestMaker.exe
#2. MPVersionChecker
#3. Redistr Maker

$UtilsI = @(
    "$root\MPManifestMaker\MPManifestMaker.sln",
    "$root\MPVersionChecker\MPVersionChecker.sln",
    "$root\RedistributionMaker_MPlatform\Redistribution_MPlatform.sln"
)

foreach($i in $UtilsI)
{
    try{        
        $collectionOfArgs = @("$root\$sln", "/target:ReBuild", "/property:Configuration=Debug;Platform=x86")
        & $MSbuild_path $collectionOfArgs
        }
    catch{
    Write-Host "Can't build x86 $sln"
    Write-Host $_
        }
}