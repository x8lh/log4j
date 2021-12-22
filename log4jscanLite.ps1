# -------------------------------------------------------------------------------
# Name:         log4jscanLite
# Purpose:      Search log4j on all  jar, war , jar 
#
# Author:      Xavier Nogues
#
# Created:     15/12/2021
# -------------------------------------------------------------------------------

# Loj4j class reference: https://msrc-blog.microsoft.com/2021/12/11/microsofts-response-to-cve-2021-44228-apache-log4j2/
$log4j="logging/log4j/core/lookup/JndiLookup.class"



#Search for phisical drives and scan
$Drives = Get-PSDrive -PSProvider FileSystem
ForEach ($Drive in $Drives) {

    $files = Get-ChildItem -Path $Drive.Root -Recurse | Where-Object { $_.Name -match '\.[ejw]+ar$' } | Select-Object FullName
    ForEach ($file in $files) 
        {
        $results=""
        #Use strings from sysinternals to find class
        $results = .\strings.exe -nobanner -accepteula $file.FullName | findstr /i $log4j
        if (-not ([string]::IsNullOrEmpty($results)))
            {
            #Write results 
            "[Vulnerable]" + $file.FullName | Out-File -append  .\jars.txt
            "[Vulnerable]" + $file.FullName | Write-Host

            }
        }
}
#Wait for user input to end 
Write-Host -NoNewLine '[END] Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
