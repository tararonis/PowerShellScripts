#Here we change version for WIX configuration file
#Version from it will be inside the installer
#We will read lines from file from previous build and write them to a new file with required modifications 
$file = "E:\Work\cvsroot\MPlatform\trunk\Install\WIX\MFormats\MFormatsInclude.wxi"
$new_file = "E:\Work\cvsroot\MPlatform\trunk\Install\WIX\MFormats\New_MFormatsInclude.wxi"

#Clear file(more for tests)
if([System.IO.File]::Exists($new_file))
{
    Clear-Content $new_file
}

#Get SDK version
try{
$version = "2.3.1.10666"
#$version=[string]"%SDK_build_number%"
$q = $version.Split(".")

$maj=$q[0].ToString()
$min=$q[1].ToString()
$build=$q[2].ToString()
$incVersion=$q[3].ToString()
}
catch{
    Write-Host "###Err The versuin number is invalid $version"
}
#Get file content from previous file
try{
$text = Get-Content $file}
catch
{
    Write-Host "###Err Can't get content from file: "
    Write-Host $file
}

#Read and write content line by line 
#and in case of searhing words(versions) add custom content 
try{
$n = 0
foreach($str in $text)
{ 
    if($str -like '*MajorVer=*')
    {        
        Add-Content $new_file "<?define MajorVer=""$maj"" ?>"  
        Write-Host "!!! $n-- Added maj"     
    }
    elseif($str -like '*MinorVer=*')
    {       
        Add-Content $new_file "<?define MinorVer=""$min"" ?>"
        Write-Host "!!! $n-- Added min"  
    }
    elseif($str -like '*BuildVer=*')
    {       
        Add-Content $new_file "<?define BuildVer=""$build"" ?>"
        Write-Host "!!! $n-- Added build"  
    }
    elseif($str -like '*RevVer=*')
    {       
        Add-Content $new_file "<?define RevVer=""$incVersion"" ?>"
        Write-Host "!!! $n-- Added incVersion"  
    }
    else{
            Add-Content $new_file $str
            Write-Host "$n-- $str"
        }
    $n = $n + 1
}
}
catch{
    Write-Host "###Err Problem to write to $new_file"
}
#Remove old file and set it's name to the new file 
try{
Remove-Item $file -Force
Rename-Item -Path $new_file -NewName "MFormatsInclude.wxi" -Force
}
catch{
    Write-Host "###Err Can't remove: $file"
    Write-Host "or rename $new_file"
    Write-Host $_
}