$SDK_git="E:\Work\cvsroot\MPlatform\trunk"
$MLDisk = "\\192.168.0.100\MLFiles\Releases\DLLs\Debug"

Write-Host "Start"

#Get current branch
Set-Location $SDK_git
E:
$branch= &git rev-parse --abbrev-ref HEAD

#Create folder on ML Disk
if(-not (Test-Path "$MLDisk\$branch"))
{
    New-Item -Path "$MLDisk" -Name "$branch" -ItemType "directory"
    Write-Host "$MLDisk\$branch is not exist"
}
#Move previous debug dlls to archieve
if(-not (Test-Path "$MLDisk\$branch"))
{
    New-Item -Path "$MLDisk\Archive" -Name "$branch" -ItemType "directory"
    Write-Host "$MLDisk\Archive\$branch is not exist"
}
Write-Host "Move existed files from $MLDisk\$branch to $MLDisk\Archive\$branch"
Move-Item -Path "$MLDisk\$branch\*" -Destination "$MLDisk\Archive\$branch" -Force
$version = "2.3.1.12093"
# $version = %SDK_build_number%
$date = Get-Date -Format "yyyy.MM.dd"

$DIR_name = "$version" +"_$date" + "_$branch"
New-Item -Path "$MLDisk\$branch" -Name "$DIR_name" -ItemType "directory"
#Copy dlls
#create x86 and x64 folders
New-Item -Path "$MLDisk\$branch\$DIR_name" -Name "x86" -ItemType "directory"
New-Item -Path "$MLDisk\$branch\$DIR_name" -Name "x64" -ItemType "directory"

$MFormats_path = "$SDK_git\MFormats\MFormats"

#x86 dlls and pdb files
try{
$additional_files_x86 = @("MLProxyD")
Get-ChildItem "$MFormats_path\Debug\" -Filter M*.dll | Copy-Item -Destination "$MLDisk\$branch\$DIR_name\x86" -Force
Get-ChildItem "$MFormats_path\Debug\" -Filter M*.pdb | Copy-Item -Destination "$MLDisk\$branch\$DIR_name\x86" -Force
}
catch{
    Write-Host "Can't copy x86 file from $MFormats_path\Debug to $MLDisk\$branch\$DIR_name\x86"
    Write-Host $_
}

try{
foreach($file in $additional_files_x86)
{
    Copy-Item -Path "$MFormats_path\Debug\$file.dll" -Destination "$MLDisk\$branch\$DIR_name\x86" -Force
    Copy-Item -Path "$MFormats_path\Debug\$file.pdb" -Destination "$MLDisk\$branch\$DIR_name\x86" -Force
}
}
catch{
    Write-Host "Can't copy x86 $file to $MLDisk\$branch\$DIR_name\x86"
    Write-Host $_
}

#x64 dlls and pdb files
$additional_files_x64 = @("MLProxy64D")
try{
    Get-ChildItem "$MFormats_path\x64\Debug\" -Filter M*.dll | Copy-Item -Destination "$MLDisk\$branch\$DIR_name\x64" -Force
    Get-ChildItem "$MFormats_path\x64\Debug\" -Filter M*.pdb | Copy-Item -Destination "$MLDisk\$branch\$DIR_name\x64" -Force
}
catch{
    Write-Host "Can't copy x64 file from $MFormats_path\x64\Debug to $MLDisk\$branch\$DIR_name\x64"
    Write-Host $_
}
try{
foreach($file in $additional_files_x64)
    {
        Copy-Item -Path "$MFormats_path\x64\Debug\$file.dll" -Destination "$MLDisk\$branch\$DIR_name\x64" -Force
        Copy-Item -Path "$MFormats_path\x64\Debug\$file.pdb" -Destination "$MLDisk\$branch\$DIR_name\x64" -Force
    }
}
catch{
    Write-Host "Can't copy x64 $file to $MLDisk\$branch\$DIR_name\x64"
    Write-Host $_
}

