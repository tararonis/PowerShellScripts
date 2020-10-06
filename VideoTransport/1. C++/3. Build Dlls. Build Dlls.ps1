$msbuild="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
$root="E:\Work\cvsroot\MPlatform\trunk"

#Remove all files 
#MFCodecs
$MFCodecsFFM="$root\MFCodecs\MFCodecsFFM\MFCodecsFFM.vcxproj"
$MFCodecsGPU="$root\MFCodecs\MFCodecsGPU\MFCodecsGPU.vcxproj"
$MFCodecsSRT="$root\MFCodecs\MFCodecsSRT\MFCodecsSRT.vcxproj"
#MFDeivice
$MFDevice_AJA2="$root\MFDevices\MFDevice_AJA2\MFDevice_AJA2.vcxproj"
$MFDevice_BMD="$root\MFDevices\MFDevice_BMD\MFDevice_BMD.vcxproj"
$MFDevice_BF="$root\MFDevices\MFDeviceBF\MFDeviceBF.vcxproj"
$MFDevice_I="$root\MFDevices\MFDevice_I\MFDevice_I.vcxproj"
$MFDeviceNDI="$root\MFDevices\MFDeviceNDI\MFDeviceNDI.vcxproj"
$MFDeviceSCR="$root\MFDevices\MFDeviceSCR\MFDeviceSCR.vcxproj"


$MFReader="$root\MFormats\MFReader\MFReader.vcxproj"
$MRuntime="$root\MFormats\MRuntime\MRuntime.vcxproj"
$MServer="$root\Objects\MServer\MServer.vcxproj"
$MWebRTC_wServer="$root\WebRTC\MWebRTC\MWebRTC_wServer.vcxproj"
$VT_Server="$root\CustomProjects\NDI2Internet\VT_Server\VT_Server.vcxproj"
$VTCore="$root\CustomProjects\NDI2Internet\MediaPipeCore\VTCore.vcxproj"

$projectsRelease=($MFCodecsFFM, $MFCodecsGPU, $MFCodecsSRT,$MFDevice_AJA2, $MFDevice_BMD, $MFDevice_BF, $MFDevice_I, $MFDeviceNDI, $MFDeviceSCR, $MFReader, $MRuntime, $MServer, $MWebRTC_wServer, $VTCore, $VT_Server);
foreach($item in $projectsRelease){
    try{
        $collectionOfArgs = @("$item", "/target:ReBuild", "/property:Configuration=Release;Platform=Win32;OutDir=E:\Work\cvsroot\VT\BuildedDlls\")
        & $msbuild $collectionOfArgs
        }
    catch{
    Write-Host "Can't build $item"
    Write-Host $_
        }
}
$projectsReleasePX=($MFReader, $MRuntime, $MServer);
foreach($item in $projectsReleasePX){
    try{
        $collectionOfArgs = @("$item", "/target:ReBuild", "/property:Configuration=ReleasePX;Platform=Win32;OutDir=E:\Work\cvsroot\VT\BuildedDlls\")
        & $msbuild $collectionOfArgs
        }
    catch{
    Write-Host "Can't build $item"
    Write-Host $_
        }
}


#Build Dlls 4 GUI
$MFormats= "E:\Work\cvsroot\MPlatform\trunk\MFormats\MFormats\MFormats.vcxproj"
$VTCore="E:\Work\cvsroot\MPlatform\trunk\CustomProjects\NDI2Internet\MediaPipeCore\VTCore.vcxproj"

$GUI_Dlls =@($MFormats, $VTCore)
foreach($item in $GUI_Dlls){
    try{
        $collectionOfArgs = @("$item", "/target:ReBuild", "/property:Configuration=Release;Platform=Win32;OutDir=E:\Work\cvsroot\VT\VT_UI\RequiredDlls\")
        & $msbuild $collectionOfArgs
        }
    catch{
    Write-Host "Can't build $item"
    Write-Host $_
        }
}