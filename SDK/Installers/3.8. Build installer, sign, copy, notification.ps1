$SDK_git="E:\Work\cvsroot\MPlatform\trunk"
#BUILD
$MSBUILD = [string]"%MSbuild_path%"
#$MSBUILD = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
$MFormats_wix = "E:\Work\cvsroot\MPlatform\trunk\Install\WIX\MFormats\MFormats.wixproj" 
try{    
    & $MSBUILD $collectionOfArgs $MFormats_wix
    }
catch{
Write-Host "Can't build $MFormats_wix"
Write-Host $_
    }

# #SIGN
$SignTool="$SDK_git\Install\Utils\signtool.exe"
$Key="$SDK_git\Install\Certificates\Medialooks.p12"
$Wix_bin = "$SDK_git\Install\WIX\MFormats\bin\Debug"
$Wix_name = "MFormats.msi"

try{
&$SignTool sign /f $Key /p mlCertPass1@ /t http://timestamp.comodoca.com/authenticode /d $Wix_name "$Wix_bin\$Wix_name"    
}
catch{
    Write-Host "Can't sign $Wix_name"
    Write-Host $_
}
#RENAME
$version =[string] "%SDK_build_number%"
#$version = "2.3.1.12666"
$q = $version.Split(".")

$maj=$q[0].ToString()
$min=$q[1].ToString()
$build=$q[2].ToString()
$incVersion=$q[3].ToString()

    #Get hash and branch
Set-Location $SDK_git
E:
$hash= &git rev-parse --short HEAD
$branch= &git rev-parse --abbrev-ref HEAD 

Write-Host "$hash\$branch"
Write-Host "$maj.$min.$build.$incVersion"
$date = Get-Date -Format "dd-MM-yyyy"
Write-Host $date

$new_name = "MFormats_SDK_$maj.$min.$build.$incVersion.($hash" + "_$date).$branch.msi"
Write-Host $new_name

Rename-Item -Path "$Wix_bin\$Wix_name" -NewName "$new_name"

#COPY
Copy-Item -Path "$Wix_bin/$new_name" -Destination "\\192.168.0.100\MLFiles\Releases\Nightly\Not_tested\" -Force

Invoke-WebRequest -Uri "$serverAddress/guestAuth/app/rest/projects/id:MLBuildSDK10/parameters/$SDK_flag" -ContentType "application/xml" -Method Put -Body $body_SDK_flag
# #NOTIFICATION
&"C:\Users\BuildServer3\Desktop\temp\bot\BuildSuc\bin\Debug\BotNotification.exe" "$new_name build completed"