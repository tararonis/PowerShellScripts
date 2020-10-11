$SDK_git="E:\Work\cvsroot\MPlatform\trunk"
#BUILD
$MSBUILD = [string]"%MSbuild_path%"
#$MSBUILD = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
$MPlatform_wix = "E:\Work\cvsroot\MPlatform\trunk\Install\WIX\MPlatform\MPlatform.wixproj"
try{    
    & $MSBUILD $collectionOfArgs $MPlatform_wix
    }
catch{
Write-Host "Can't build $MPlatform_wix"
Write-Host $_
    }

# #SIGN
$SignTool="$SDK_git\Install\Utils\signtool.exe"
$Key="$SDK_git\Install\Certificates\Medialooks.p12"
$Wix_bin = "$SDK_git\Install\WIX\MPlatform\bin\Debug"
$Wix_name = "MPlatform.msi"

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

$new_name = "MPlatform_SDK_$maj.$min.$build.$incVersion.($hash" + "_$date).$branch.msi"
Write-Host $new_name

Rename-Item -Path "$Wix_bin\$Wix_name" -NewName "$new_name"

#COPY
Copy-Item -Path "$Wix_bin/$new_name" -Destination "\\192.168.0.100\MLFiles\Releases\Nightly\Not_tested\" -Force

#Disable Rebuild Samples flag
#Change the value of "SDK_rebuild_samples" from "true" to "false" with Rest api
$serverAddress="http://ci.medialooks.com"
$SDK_flag = "SDK_rebuild_samples"
$body_SDK_flag = "<property name=""$SDK_flag"" value=""false""/>"

Invoke-WebRequest -Uri "$serverAddress/guestAuth/app/rest/projects/id:MLBuildSDK10/parameters/$SDK_flag" -ContentType "application/xml" -Method Put -Body $body_SDK_flag
# #NOTIFICATION
&"C:\Users\BuildServer3\Desktop\temp\bot\BuildSuc\bin\Debug\BotNotification.exe" "$new_name build completed"