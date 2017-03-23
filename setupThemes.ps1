#CyberWave Wordpress Auto Install
#Downloads Themes from cwave server
#Unzips the Themes

#----------------------------------------------------------------------------
#Required to handle stream input from cmd.exe (Bugfix for Powershell)
#----------------------------------------------------------------------------
$bindingFlags = [Reflection.BindingFlags] “Instance,NonPublic,GetField”
$objectRef = $host.GetType().GetField(“externalHostRef”, $bindingFlags).GetValue($host)
$bindingFlags = [Reflection.BindingFlags] “Instance,NonPublic,GetProperty”
$consoleHost = $objectRef.GetType().GetProperty(“Value”, $bindingFlags).GetValue($objectRef, @())
[void] $consoleHost.GetType().GetProperty(“IsStandardOutputRedirected”, $bindingFlags).GetValue($consoleHost, @())
$bindingFlags = [Reflection.BindingFlags] “Instance,NonPublic,GetField”
$field = $consoleHost.GetType().GetField(“standardOutputWriter”, $bindingFlags)
$field.SetValue($consoleHost, [Console]::Out)
$field2 = $consoleHost.GetType().GetField(“standardErrorWriter”, $bindingFlags)
$field2.SetValue($consoleHost, [Console]::Out)
#----------------------------------------------------------------------------

$wc = new-object System.Net.WebClient
$username = "wordpress"
$password = "cyberw@ve"
$wc.Credentials = new-object System.Net.NetworkCredential ($username,$password)
$storageDir = $pwd
$folder = "$storageDir\themes"
$selectedTheme = $args[0]

#Create directory to download plugins into
if (!(Test-Path $folder)){
[void](new-item $folder -itemType directory) }
       
#-------------------------------------------------------------------------------
#Download the selected theme
#-------------------------------------------------------------------------------

switch ($selectedTheme)
{ 
    Awake {
           echo "Downloading $selectedTheme Theme Please Wait...."
           $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Themes/Awake.zip"
           $file = "$storageDir\themes\Awake.zip"
           $wc.DownloadFile($url,$file)
          }
    OvidCorporate {
           echo "Downloading $selectedTheme Theme Please Wait...."
           $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Themes/OvidCorporate.zip"
           $file = "$storageDir\themes\OvidCorporate.zip"
           $wc.DownloadFile($url,$file)
          }
    Chameleon {
           echo "Downloading $selectedTheme Theme Please Wait...."
           $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Themes/Chameleon.zip"
           $file = "$storageDir\themes\Chameleon.zip"
           $wc.DownloadFile($url,$file)
          }
    Metropolis {
           echo "Downloading $selectedTheme Theme Please Wait..."
           $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Themes/Metropolis.zip"
           $file = "$storageDir\themes\Metropolis.zip"
           $wc.DownloadFile($url,$file)
          }
    default{"An error occured while downloading selected theme"}
}


#-------------------------------------------------------------------------------
#Unzip themes
#-------------------------------------------------------------------------------
function Extract-Zip
{
	param([string]$zipfilename, [string] $destination)

	if(test-path($zipfilename))
	{	
		$shellApplication = new-object -com shell.application
		$zipPackage = $shellApplication.NameSpace($zipfilename)
		$destinationFolder = $shellApplication.NameSpace($destination)
		$destinationFolder.CopyHere($zipPackage.Items(),16)
	}
}

switch ($selectedTheme)
{
  Awake {extract-zip $storageDir\themes\Awake.zip $storageDir\wordpress\wp-content\themes}
  Chameleon {extract-zip $storageDir\themes\Chameleon.zip $storageDir\wordpress\wp-content\themes}
  OvidCorporate {extract-zip $storageDir\themes\OvidCorporate.zip $storageDir\wordpress\wp-content\themes}
  Metropolis {extract-zip $storageDir\themes\Metropolis.zip $storageDir\wordpress\wp-content\themes}
  default {"Unzip Error"}
 }

#After completion delete files from the temp folder
echo "All Files Unzipped!"
echo "Deleting temp theme files"
Remove-Item $storageDir\themes -recurse -force
echo "Temp theme files deleted"
echo ""
exit

