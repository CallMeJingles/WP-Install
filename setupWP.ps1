#CyberWave Wordpress Auto Install

#Downloads wordpress from their server
#Unzip

$storageDir = $pwd
$wc = new-object System.Net.WebClient
$url= "http://wordpress.org/latest.zip"
$dlfile = "$storageDir\wordpress.zip"
$storageDir = $pwd

#Download wordpress
echo "Downloading Wordpress Please Wait.... "
$wc.DownloadFile($url,$dlfile)

#-------------------------------------------------------------------------------
#Unzip Wordpress
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

extract-zip $storageDir\wordpress.zip $storageDir\

#-------------------------------------------------------------------------

echo "Deleting temp files"
Remove-Item $storageDir\wordpress.zip -recurse -force
echo "Temp wordpress files deleted"
echo ""
exit