#CyberWave Wordpress Auto Install
#Downloads plugins from cwave server
#Unzips the plugins

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
$selectedPlugin = Import-Csv "plugin.csv"
$folder = "$storageDir\plugins"

#To use different credentials uncomment the following line
#$wc.Credentials =  Get-Credential

#Create directory to download plugins into
if (!(Test-Path $folder)){
[void](new-item $folder -itemType directory) }

#-------------------------------------------------------------------------------
#Define the URL to download from
#-------------------------------------------------------------------------------
foreach($element in $selectedPlugin)
{
    switch($element.PluginName) #working
    {
           
            EventRegistration { 
                     "Downloading EventRegistration Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/Event-Registration.zip"
                     $file = "$storageDir\plugins\event-registration.zip"
                     $wc.DownloadFile($url,$file)              
                     }
            EventsManager { 
                     "Downloading EventsManager Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/Events-Manager.zip"
                     $file = "$storageDir\plugins\events-manager.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           
            GoogleMap { 
                     "Downloading GoogleMap Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/Google-Map.zip"
                     $file = "$storageDir\plugins\googlemap.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           GoogleAnalytics { 
                     "Downloading GoogleAnalytics Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/Google-Analytics.zip"
                     $file = "$storageDir\plugins\googleanalytics.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           GoogleXMLSitemap { 
                     "Downloading Google XML Sitemap Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/GoogleSitemap.zip"
                     $file = "$storageDir\plugins\google-xml-sitemaps-with-qtranslate-support.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           GravityFormsAddons { 
                     "Downloading GravityFormsAddons Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/Gravity-Forms-Addons.zip"
                     $file = "$storageDir\plugins\gravity-forms-addons.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           GravityForms { 
                     "Downloading GravityForms Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/Gravityforms.zip"
                     $file = "$storageDir\plugins\gravityforms.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           QuickPagepostRedirect { 
                     "Downloading QuickPagepostRedirect Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/QuickPagepost.zip"
                     $file = "$storageDir\plugins\quick-pagepost-redirect-plugin.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           Sharethis { 
                     "Downloading Sharethis Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/ShareThis.zip"
                     $file = "$storageDir\plugins\share-this.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           TweetOldPost { 
                     "Downloading TweetOldPost Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/TweetOldPost.zip"
                     $file = "$storageDir\plugins\tweet-old-post.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           WPRecaptcha { 
                     "Downloading WPRecaptcha Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/WP-Recaptcha.zip"
                     $file = "$storageDir\plugins\wp-recaptcha.zip"
                     $wc.DownloadFile($url,$file)              
                     }
            qTranslate { 
                     "Downloading qTranslate Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/qTranslate.zip"
                     $file = "$storageDir\plugins\qTranslate.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           WidgetLogic { 
                     "Downloading WidgetLogic Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/Widget-Logic-Visual.zip"
                     $file = "$storageDir\plugins\widget-logic.zip"
                     $wc.DownloadFile($url,$file)              
                     }  
           WPHTTPS   { 
                     "Downloading Wordpress HTTPS Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/WP-HTTPS.zip"
                     $file = "$storageDir\plugins\WP-HTTPS.zip"
                     $wc.DownloadFile($url,$file)              
                     }   
           ExploitScanner  { 
                     "Downloading Exploit Scanner Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/ExploitScanner.zip"
                     $file = "$storageDir\plugins\ExploitScanner.zip"
                     $wc.DownloadFile($url,$file)              
                     }  
           WPWunderground  { 
                     "Downloading WP Wunderground Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/WP-Wunderground.zip"
                     $file = "$storageDir\plugins\WP-Wunderground.zip"
                     $wc.DownloadFile($url,$file)              
                     } 
           NoRightClick { 
                     "Downloading No Right Click Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/NoRightClick.zip"
                     $file = "$storageDir\plugins\NoRightClick.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           ShadowboxJS { 
                     "Downloading Shadowbox JS Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/ShadowboxJS.zip"
                     $file = "$storageDir\plugins\ShadowboxJS.zip"
                     $wc.DownloadFile($url,$file)              
                     }
           AllInOneSlideshow { 
                     "Downloading All In One Slideshow Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/AllInOneSlideshow.zip"
                     $file = "$storageDir\plugins\AllInOneSlideshow.zip"
                     $wc.DownloadFile($url,$file)              
                     }
          NextgenGallery { 
                     "Downloading Nextgen Gallery Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/NextgenGallery.zip"
                     $file = "$storageDir\plugins\NextgenGallery.zip"
                     $wc.DownloadFile($url,$file)              
                     }
          NextgenScrollGallery { 
                     "Downloading Nextgen Gallery Plugin Please Wait...."
                     $url = "https://scc.cwave.com/svn/CyberWAVE/Web/Development/WPAuto/Plugins/NextgenScrollGallery.zip"
                     $file = "$storageDir\plugins\NextgenScrollGallery.zip"
                     $wc.DownloadFile($url,$file)              
                     }
             Default { "Error occured"}
        }
  }

#-------------------------------------------------------------------------------
#Unzip Plugins
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

foreach($element in $selectedPlugin)
{
    switch($element.PluginName) 
    {
  
  EventRegistration {extract-zip $storageDir\plugins\event-registration.zip $storageDir\wordpress\wp-content\plugins}
  EventsManager {extract-zip $storageDir\plugins\events-manager.zip $storageDir\wordpress\wp-content\plugins}
  GoogleMap {extract-zip $storageDir\plugins\googlemap.zip $storageDir\wordpress\wp-content\plugins}
  GoogleAnalytics {extract-zip $storageDir\plugins\googleanalytics.zip $storageDir\wordpress\wp-content\plugins} 
  GoogleXMLSitemap{extract-zip $storageDir\plugins\google-xml-sitemaps-with-qtranslate-support.zip $storageDir\wordpress\wp-content\plugins}  
  GravityFormsAddons{extract-zip $storageDir\plugins\gravity-forms-addons.zip $storageDir\wordpress\wp-content\plugins}
  GravityForms{extract-zip $storageDir\plugins\gravityforms.zip $storageDir\wordpress\wp-content\plugins}
  QuickPagepostRedirect{extract-zip $storageDir\plugins\quick-pagepost-redirect-plugin.zip $storageDir\wordpress\wp-content\plugins}
  Sharethis{extract-zip $storageDir\plugins\share-this.zip $storageDir\wordpress\wp-content\plugins} 
  TweetOldPost{extract-zip $storageDir\plugins\tweet-old-post.zip $storageDir\wordpress\wp-content\plugins}
  WPRecaptcha{extract-zip $storageDir\plugins\wp-recaptcha.zip $storageDir\wordpress\wp-content\plugins}
  qTranslate{extract-zip $storageDir\plugins\qTranslate.zip $storageDir\wordpress\wp-content\plugins}
  WidgetLogic{extract-zip = $storageDir\plugins\widget-logic.zip $storageDir\wordpress\wp-content\plugins}
  WPHTTPS{extract-zip = $storageDir\plugins\WP-HTTPS.zip $storageDir\wordpress\wp-content\plugins}
  ExploitScanner{extract-zip $storageDir\plugins\ExploitScanner.zip $strorageDir\wordpress\wp-content\plugins}
  WPWunderground{extract-zip $storageDir\plugins\WP-Wunderground.zip $storageDir\wordpress\wp-content\plugins}
  NoRightClick{extract-zip $storageDir\plugins\NoRightClick.zip $storageDir\wordpress\wp-content\plugins}
  ShadowboxJS{extract-zip $storageDir\plugins\ShadowboxJS.zip $storageDir\wordpress\wp-content\plugins}
  AllInOneSlideshow{extract-zip $storageDir\plugins\AllInOneSlideshow.zip $storageDir\wordpress\wp-content\plugins}
  NextgenGallery{extract-zip $storageDir\plugins\NextgenGallery.zip $storageDir\wordpress\wp-content\plugins}
  NextgenScrollGallery{extract-zip $storageDir\plugins\NextgenScrollGallery.zip $storageDir\wordpress\wp-content\plugins}
  default {"Unzip Error"}
 }
}

echo "All Files Unzipped!"
#Remove all temp files after completion
echo "Deleting temp files"
Remove-Item $storageDir\plugins -recurse -force
echo "Temp plugin files deleted"
echo ""
exit