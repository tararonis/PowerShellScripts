#BUILD
#$MSBUILD = [string]"%MSbuild_path%"
$MSBUILD = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
$MFormats_wix = "E:\Work\cvsroot\MPlatform\trunk\Install\WIX\MFormats\MFormats.wixproj" 
try{    
    & $MSBUILD $collectionOfArgs $MFormats_wix
    }
catch{
Write-Host "Can't build $MFormats_wix"
Write-Host $_
    }

# #SIGN
# $SDK_git="E:\Work\cvsroot\MPlatform\trunk"
# $SignTool="$SDK_git\Install\Utils\signtool.exe"
# $Key="$SDK_git\Install\Certificates\Medialooks.p12"
# $Wix_bin = "$SDK_git\Install\WIX\MFormats\bin\Debug"
# $Wix_name = "MF"

# try{
# &$SignTool sign /f $Key /p mlCertPass1@ /t http://timestamp.comodoca.com/authenticode /d $dll $final_item    
# }
# catch{
#     Write-Host "Can't sign $MFormats_wix"
#     Write-Host $_
# }