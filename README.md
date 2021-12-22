# log4jScanLite<br />
The main purpose of the script is to detect all jar/war/ear on the system that contain the log4j class.<br />
This script scans for all jar, ear and war files and search on its contents for the class of log4j, even if the file is renamed, it will be detected as containing the log4j class. Reference: https://msrc-blog.microsoft.com/2021/12/11/microsofts-response-to-cve-2021-44228-apache-log4j2/<br /><br />
It uses the strings executable from Microsoft/Sysinternals, you need to download it and put in the same directory that the log4jscanLite.ps1 script.<br />
# How to install&run<br />
 - Install:<br />
    Download the files of this repository as a zip and extract all in a directory<br />
    Download strings from microsoft (https://docs.microsoft.com/en-us/sysinternals/downloads/strings) unzip it and put the file strings.exe on the same direcotry that the script<br /><br />
    
 - Run:<br />
     Read permissions for files to scan are needed<br />
     Execute log4jscanLite.ps1<br />
     Some read permission errors may appear on some files. Do not panic, analyze them later.<br />
     Wait for results on console or read results on output file jars.txt.<br />
     If there are some jar/war/ear file vulnerable, you will gate a log like:<br />
        [Vulnerable] somepath\somefile.jar<br />
     Evaluate the risk on file and remediate or mitigate it. if you need help with this you can check https://msrc-blog.microsoft.com/2021/12/11/microsofts-response-to-cve-2021-44228-apache-log4j2/
