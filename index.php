<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
	</script>
	<title>Wordpress Themes and Plugins Download</title>
</head>

<body>

<?php
if(isset($_POST['formSubmit'])) 
    {
		$choosePlugin = $_POST['wpPlugin'];
		$account = $_POST['client'];
		$chooseTheme = $_POST['wpTheme'];
		
		$psDir = 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\';
		$psPath = $psDir. "powershell.exe";
		$isDone=false;
		$cmdCMDDriver = "driver.bat";
		$cmdCMDSetupServer = "serverFolder.bat";
		$cmdSetupWP = "setupWP.ps1";
		$psZip = "zip.ps1";
		$psSetupTheme ="setupThemes.ps1";
		$psSetupDB = "setupWPDB.ps1";
		$psSetupPlugins ="setupPlugins.ps1";
		$scriptPath = "D:\\data\\www\\wpinstall.cwave.com\\";
		$runThemeScript = $scriptPath. $psSetupTheme;
		$runPluginScript = $scriptPath. $psSetupPlugins;
		$runDBScript = $scriptPath. $psSetupDB;
		$runServerScript = $scriptPath. $cmdCMDSetupServer;
		$runZip = $scriptPath. $psZip;
		$csv_data =array_2_csv($choosePlugin);
		$space = "\r\n";
		$runCMDTheme = $psPath. " -InputFormat none -file " .$runThemeScript." " .$chooseTheme. ">> D:\\data\\www\\wpinstall.cwave.com\\logs\\errorlog.txt 2>&1 &";
		$runCMDSetupWP = $psPath. " -InputFormat none -file " .$cmdSetupWP. " > D:\\data\\www\\wpinstall.cwave.com\\logs\\errorlog.txt 2>&1 &";
		$runCMDDriver = $cmdCMDDriver." " .$account. ">> D:\\data\\www\\wpinstall.cwave.com\\logs\\errorlog.txt 2>&1 &";
		$runCMDPlugins = $psPath. " -WindowStyle Normal -InputFormat none -file " .$runPluginScript. ">> D:\\data\\www\\wpinstall.cwave.com\\logs\\errorlog.txt 2>&1 &";
		$runCMDSetupDB = $psPath. " -WindowStyle Normal -InputFormat none -file " .$runDBScript. " " .$account." > D:\\data\\www\\wpinstall.cwave.com\\logs\\dbscript.txt 2>&1 &";
		$runCMDSetupServer = $runServerScript. " " .$account. " > D:\\data\\www\\wpinstall.cwave.com\\logs\\serverSetup.txt 2>>&1 &";
		$runCMDZip = $psPath. " -WindowStyle Normal -InputFormat none -file ".$runZip. " " .$account." > D:\\data\\www\\wpinstall.cwave.com\\logs\\setupZip.txt 2>&1 &";
		
		

		if($account == '')
		{		
		echo "Please enter a client name";
		}
		
		else
		{


		$newCSV = explode(",",$csv_data);
		session_write_close(); //Required for exec to not hang
		exec($runCMDSetupWP,$out,$ret);
		session_start ();
				if(isset($_POST['wpTheme'])) 
				{
					session_write_close();
					exec($runCMDTheme,$out,$ret);	
					session_start ();	
				} 
				if(!empty($choosePlugin)) 
				{
					$N = count($choosePlugin);
					$fh = fopen('plugin.csv','w');
					fwrite($fh,"PluginName". PHP_EOL);
					
					foreach($newCSV as $item) {
					fwrite($fh,$item.$space);
					}
					
					fclose($fh);
					session_write_close();
					exec($runCMDPlugins,$out,$ret);
					session_start ();
					echo("</p>");
				}
				session_write_close();
			exec($runCMDSetupDB,$out,$ret);	
            session_start ();
sleep(2);
			
		session_write_close();	
		exec($runCMDSetupServer,$out,$ret);
		session_start ();
	
sleep(2);	
		session_write_close();	
		exec($runCMDZip,$out,$ret);
		session_start ();
	
sleep(10);	
		session_write_close();
		exec($runCMDDriver,$out,$ret);		
		}
		session_write_close();
	$isDone = true;
	}
		
function array_2_csv($array) {
$csv = array();
foreach ($array as $item) {
if (is_array($item)) {
    $csv[] = array_2_csv($item);
} else {
    $csv[] = $item;
}
}
$csv = implode(',', $csv);
$csv .= implode("\n",$csv);
return $csv;
}

function bottomText($info)
{
global $isDone;
global $account;
if ($isDone == true)
	{
echo "<centre>Wordpress AutoInstaller:";
echo "<br /> Finished Setting Up Wordpress";
echo "<br /> <a href='http://websites.cwave.com/$account/unzipWordpress.php' target='_blank'> Unzip files </a>";
echo "<br /> <a href='http://websites.cwave.com/$account/install.php' target='_blank'> Install script</a>";
echo "<br />Database Information: <br />";
echo "Host: Localhost <br /> 
         Database Name: cw_$account <br /> 
Login Name: cwavesales <br /> 
Password: 8PEwNp3VC9sXYT4VP5fN </centre>";
	}

else
	{
echo "<centre>How to use:";
echo "<br/>1)Select Plugin(s) and Theme";
echo "<br/>2)Enter client name (no spaces or special characters).  Client name is used for the database and url. ie websites.cwave.com/*clientname*/";
echo "<br/>3)Hit submit and wait for program to finish installing (Takes ~6-8min)";
echo "<br/>4)Follow instructions that appear on screen upon completion </centre>";
	}

}
	
	//Used for testing which plugins have been selected
    function IsChecked($chkname,$value)
    {
        if(!empty($_POST[$chkname]))
        {
            foreach($_POST[$chkname] as $chkval)
            {
                if($chkval == $value)
                {
                    return true;
                }
            }
        }
        return false;
    }
?>
<div id="container">
		<div id="header">
        	<h1>Cyber<span class="off">Wave</span></h1>
			
            <h2>
			<a href="http://www.cwave.com">
			<img src="cyberwave.png">
			</a>
			</h2>
        </div>   
        
		 <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="http://developer.cwave.com">Developer Website</a></li>
            </ul>
        </div>

<form action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>" method="post">
	<p>
<table border="1" width="1000">
<tr>
		<td><input type="checkbox" title="Allows you to use 27 transition and 8 easing effects" name="wpPlugin[]" value="AllInOneSlideshow" />All In One Slideshow </td>
		<td><input type="checkbox" title="Takes online registrations for events and classes" name="wpPlugin[]" value="EventRegistration" />EventRegistration </td>
		<td><input type="checkbox" title="Fully featured event registration management for events, locations, calandars and Google map integration" name="wpPlugin[]" value="EventsManager" />EventsManager </td> 
</tr>
<tr>
		<td><input type="checkbox" title="Search the files and database of your Wordpress install for signs that may indicate that it has fallen vicim to hackers" name="wpPlugin[]" value="ExploitScanner" />Exploit Scanner </td>
		<td><input type="checkbox" title="A simple and intuitive, yet elegant and fully documented Google map plugin that installs as a wiedget and a short code" name="wpPlugin[]" value="GoogleMap" />Google Maps  </td>
		<td><input type="checkbox" title="Track your Wordpress site easily and with lots of metadata: views per author and category, automatic tracking of outbound clicks and pageviews" name="wpPlugin[]" value="GoogleAnalytics" />Google Analytics </td>
</tr>
<tr>	
		<td><input type="checkbox" title="This plugin will genrate a special XML sitemap which will help search engines to better index your blog" name="wpPlugin[]" value="GoogleXMLSitemap" />Google XML Sitemap </td>
		<td><input type="checkbox" title="Quickly build and design your WordPress forms using the form editor" name="wpPlugin[]" value="GravityForms" />Gravity Forms </td>
		<td><input type="checkbox" title="Add directory capabilities and other functionality to the great Gravity Forms plugin" name="wpPlugin[]" value="GravityFormsAddons" />Gravity Forms Addons </td>
</tr>
<tr>	
		<td><input type="checkbox" title="NextGEN Gallery is a full integrated image gallery plugin for WordPress with dozens of options and features" name="wpPlugin[]" value="NextgenGallery" />Nextgen Gallery </td>
		<td><input type="checkbox" title="Redirect Pages/Posts to another page/post or external URL" name="wpPlugin[]" value="QuickPagepostRedirect" />Quick PagePost Redirect </td>
		<td><input type="checkbox" title="Adds userfriendly multilingual content management and translation support into WordPress" name="wpPlugin[]" value="qTranslate" />QTranslate </td>
		
</tr>
<tr>
		<td><input type="checkbox" title="Adds links to the bottom of posts to share via Email, StumbleUpon, Digg, Facebook, Twitter" name="wpPlugin[]" value="Sharethis" />Share This </td>
		<td><input type="checkbox" title="Shadowbox is an online media viewing application similiar to Lightbox and Thickbox but with more functionality" name="wpPlugin[]" value="ShadowboxJS" />Shadowbox JS </td>
		<td><input type="checkbox" title="Plugin to tweet about your old posts to get more hits for them and keep them alive" name="wpPlugin[]" value="TweetOldPost" />Tweet Old Post </td>
</tr>
<tr>
		<td><input type="checkbox" title="Integrates reCAPTCHA anti-spam methods with WordPress including comment, registration, and email spam protection" name="wpPlugin[]" value="WPRecaptcha" />WP Recaptcha </td>
		<td><input type="checkbox" title="Widget Logic lets you control on which pages widgets appear using WP's conditional tags" name="wpPlugin[]" value="WidgetLogic" />Widget Logic</td>
		<td><input type="checkbox" title="WordPress HTTPS is intended to be an all-in-one solution to using SSL on WordPress sites" name="wpPlugin[]" value="WPHTTPS" />Wordpress HTTPS </td>
</tr>	
<tr>
		<td><input type="checkbox" title="Get accurate and beautiful weather forcasts powered by Wunderground.com for your content or your sidebar" name="wpPlugin[]" value="WPWunderground" />WP Wunderground </td>
</tr>
</table>
	</p>
	<p>
	
		Which theme would you like to download?
		<select name="wpTheme">
		<option value="NoTheme"> Pick A Theme </option>
		<option value="Awake"> Awake </option>
		<option value="Chameleon"> Chameleon </option>
		<option value="OvidCorporate"> Ovid Corporate  </option>
		<option value="Metropolis"> Metropolis </option>
		</select>
	</p>
	<p>
		Client Name: 
		<input name="client" size="15" type="text" />
	</p>
	<input type="submit" name="formSubmit" value="Submit" />
	</div>
</form>
<hr><br/>


<?php
	bottomText();
?>

</body>
</html>
