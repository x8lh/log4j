# log4jScanLite
This script scans for all jar, ear and war files and search on its contents for the class of log4j, even if the file is renamed, it will be detected as containing the log4j class. Reference: https://msrc-blog.microsoft.com/2021/12/11/microsofts-response-to-cve-2021-44228-apache-log4j2/
It uses the strings executable from Microsoft/Sysinternals, you need to download it and put in the same directory that the log4jscanLite.ps1 script.
# How to install&run
 - Install:
    Download the files of this repository as a zip and extract all in a directory
    Download strings from microsoft (https://docs.microsoft.com/en-us/sysinternals/downloads/strings) unzip it and put the file strings.exe on the same direcotry that the script
    
 - Run:
     Execute log4jscanLite.ps1
     Wait for results on console or read results on output file jars.txt.
     If there are some jar/war/ear file vulnerable, you will gate a log like:
        [Vulnerable] somepath\somefile.jar
