Param(
    [String]
    # Specifies the directory.
    # Default : Execute on the current directory. (i.e. './sample.ps1 .')
    $Arg1 = "."
)

# Execute etl2pcapng.exe to convert .etl to .pcapng for all .etl files on the directory.
$FileArray = (Get-ChildItem -Path $Arg1 -File).Name
Write-Host ($FileArray)
foreach($file in $FileArray){
    If($file.EndsWith('.etl')){
        $input = $Arg1  + '/' + $file
        $output = $Arg1  + '/' + $file + '.pcapng'
        Write-Host ('Input : ' + $input)
        Write-Host ('Ouput : ' + $output)
        etl2pcapng.exe $input $output
    }
}