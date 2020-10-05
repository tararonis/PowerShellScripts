$HEAT = "C:\Program Files (x86)\WiX Toolset v3.11\bin\heat.exe"
$SAMPLES = "E:\Work\cvsroot\MPlatform\trunk\Samples"
$WIX = "E:\Work\cvsroot\MPlatform\trunk\Install\WIX\MFormats"

#Common Samples
Write-Host "-------------------------------"
try{
    & $HEAT dir "$SAMPLES\MFormats" -cg Samples -gg -scom -sreg -sfrag -srd -dr SamplesDir -out "$WIX\Samples.wxs" -var var.Samples
    Write-Host "Done HEAT SAMPLES"    
}
catch{
	Write-Host "Can't do something with heat.exe - 1(Samples)"
    Write-Host $_
}

try{
    & "E:\Work\cvsroot\MPlatform\trunk\Install\WIX\MFormats\AddIncludeIntoWXS.exe" "$WIX\Samples.wxs" "<?include MFormatsInclude.wxi?>"
    Write-Host "Done AddIncludeIntoWXS Samples.wxs"
    Write-Host "-------------------------------"    
}
catch{
	Write-Host "Can't do something with AddIncludeIntoWXS.exe - 1(Samples)"
    Write-Host $_
}

#WebRTC Samples
try{
    & $HEAT dir "$SAMPLES\MFormats.WebRTC" -cg MFormats.WebRTC -gg -scom -sreg -sfrag -srd -dr SamplesWebRTCIF -out "$WIX\SamplesWebRTC.wxs" -var var.SamplesWebRTC
    Write-Host "Done HEAT SamplesWebRTCIF.wxs"   
}
catch{
	Write-Host "Can't do something with heat.exe - 2(WebRTC Samples)"
    Write-Host $_
}

try{
    & "E:\Work\cvsroot\MPlatform\trunk\Install\WIX\MFormats\AddIncludeIntoWXS.exe" "$WIX\SamplesWebRTC.wxs" "<?include MFormatsInclude.wxi?>"
    Write-Host "Done AddIncludeIntoWXS SamplesWebRTC.wxs"
    Write-Host "-------------------------------"
}
catch{
	Write-Host "Can't do something with AddIncludeIntoWXS.exe - 2(WebRTC Samples)"
    Write-Host $_
}
#WebRTC Signaling
try{
    & $HEAT dir "E:\Work\cvsroot\MPlatform\trunk\WebRTC\Signaling" -cg WebRTCSignaling -gg -scom -sreg -sfrag -srd -dr SamplesDir -out "$WIX\WebRTCSignaling.wxs" -var var.WebRTCSignaling
    Write-Host "Done HEAT WebRTCSignaling.wxs"    
}
catch{
	Write-Host "Can't do something with heat.exe - 3(WebRTCSignaling)"
    Write-Host $_
}

try{
    & "E:\Work\cvsroot\MPlatform\trunk\Install\WIX\MFormats\AddIncludeIntoWXS.exe" "$WIX\WebRTCSignaling.wxs" "<?include MFormatsInclude.wxi?>"
    Write-Host "Done AddIncludeIntoWXS WebRTCSignaling.wxs"
    Write-Host "-------------------------------"
}
catch{
	Write-Host "Can't do something with AddIncludeIntoWXS.exe - 3(WebRTCSignaling)"
    Write-Host $_
}

#CEFLocales
try{
    & $HEAT dir "E:\Work\cvsroot\MPlatform\trunk\Extern\CEF\bin\locales" -cg CEFLocales -gg -scom -sreg -sfrag -srd -dr SamplesDir -out "$WIX\CEFLocales.wxs" -var var.CEFLocales
    Write-Host "Done HEAT CEFLocales.wxs"   
}
catch{
	Write-Host "Can't do something with heat.exe - 4(CEFLocales)"
    Write-Host $_
}

try{
    & "E:\Work\cvsroot\MPlatform\trunk\Install\WIX\MFormats\AddIncludeIntoWXS.exe" "$WIX\CEFLocales.wxs" "<?include MFormatsInclude.wxi?>"
    Write-Host "Done AddIncludeIntoWXS CEFLocales.wxs"
    Write-Host "-------------------------------"
}
catch{
	Write-Host "Can't do something with AddIncludeIntoWXS.exe - 4(CEFLocales)"
    Write-Host $_
}

#CEFLocalesDir64
try{
    & $HEAT dir "E:\Work\cvsroot\MPlatform\trunk\Extern\CEF\bin\x64\locales" -cg CEFLocales64 -gg -scom -sreg -sfrag -srd -dr SamplesDir -out "$WIX\CEFLocales64.wxs" -var var.CEFLocales
    Write-Host "Done HEAT CEFLocales64.wxs"    
}
catch{
	Write-Host "Can't do something with heat.exe - 5(CEFLocales64)"
    Write-Host $_
}

try{
    & "E:\Work\cvsroot\MPlatform\trunk\Install\WIX\MFormats\AddIncludeIntoWXS.exe" "$WIX\CEFLocales64.wxs" "<?include MFormatsInclude.wxi?>"
    Write-Host "Done AddIncludeIntoWXS CEFLocales64.wxs"
    Write-Host "-------------------------------"
}
catch{
	Write-Host "Can't do something with AddIncludeIntoWXS.exe - 5(CEFLocales64)"
    Write-Host $_
}



