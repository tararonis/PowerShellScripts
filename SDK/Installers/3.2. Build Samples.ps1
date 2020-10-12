$MSbuild_path = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"

$root = "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats"

$Solutions = @(
    #"C#_samples.sln"#,
    #"C++_samples.sln"#, #For c++ - win32/x64
    #"Delphi_samples.groupproj"#, #For delphi platform - win32/win64
    "VB.NET_samples.sln"
)


#Build x86 Samples
foreach($sln in $Solutions)
{
    try{
        $plm86 = "x86"
        if($sln -eq "C++_samples.sln")
        {
            $plm86 = "win32"
        }
        $collectionOfArgs = @("$root\$sln", "/target:Build", "/property:Configuration=Debug;Platform=$plm86")
        #& $MSbuild_path $collectionOfArgs
        }
    catch{
    Write-Host "Can't build x86 $sln"
    Write-Host $_
        }
}
#Build x64 Samples
# foreach($sln in $Solutions)
# {
#     try{
#         $plm64 = "x64"
#         if($sln -eq "Delphi_samples.groupproj")
#         {
#             $plm86 = "win64"
#         }
#         $collectionOfArgs = @("$root\$sln", "/target:Build", "/property:Configuration=Debug;Platform=$plm64")
#         & $MSbuild_path $collectionOfArgs
#         }
#     catch{
#     Write-Host "Can't build x64 $sln"
#     Write-Host $_
#         }
# }

$Delphi_projects = @(
    "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats\Delphi\Sample File Playback\SampleFilePlayback.dproj"#,
    # "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats\Delphi\Sample File Transcoding\SampleFileTranscoding.dproj",
    # "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats\Delphi\Sample File Transition\SampleFileTransition.dproj",
    # "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats\Delphi\Sample HTML5 Plugin\SampleHTML5Plugin.dproj",
    # "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats\Delphi\Sample Live Mixing\SampleLiveMixing.dproj",
    # "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats\Delphi\Sample Live Overlay\SampleLiveOverlay.dproj",
    # "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats\Delphi\Sample Mixer Chroma Key\SampleMixerChromaKey.dproj",
    # "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats\Delphi\Sample Network Playback\SampleNetworkPlayback.dproj",
    # "E:\Work\cvsroot\MPlatform\trunk\Samples\MFormats\Delphi\Sample Writer\SampleWriter.dproj"
    )

    #Build Delphi x86
    $MSbuild_path_net="C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
foreach($project in $Delphi_projects)
{
    try{  
        
        $collectionOfArgs = @("$project", "/target:Deploy", "/p:config=Debug;Platform=win32", "/t:Debug Build")          
        #& $MSbuild_path $project "/target:Deploy /p:Configuration=Debug  /p:Platform=win32"
        #& $MSbuild_path_net $project $collectionOfArgs

        & "C:\Program Files (x86)\Embarcadero\RAD Studio\9.0\bin\rsvars.bat"
        Invoke-MsBuild -Path $project -MsBuildParameters "/t:Build /property:Configuration=Debug;Platform=win32"
        }
    catch{
    Write-Host "Can't build x86 $project"
    Write-Host $_
        }
}


