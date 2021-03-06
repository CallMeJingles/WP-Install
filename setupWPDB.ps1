#Creates and populates a new database using our specifications
$tempname = $args[0]
$dbname = "cw_" + $tempname

[void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
$dbusername = "cwavesales"
$dbpassword = "8PEwNp3VC9sXYT4VP5fN"

echo "Creating connection to server"
#Creates a connection to the server
$connStr ="server=websites.cwave.com;Persist Security Info=false;user id=" + $dbusername + ";pwd=" + $dbpassword + ";"
$conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr)
echo "Done"
#Open connection
$conn.Open()

if($conn.State -eq "Open")
{
echo "Connection open"
}
#Drops database if it currently exists
$cmd = New-Object MySql.Data.MySqlClient.MySqlCommand
$cmd.Connection  = $conn
$cmd.CommandText = "DROP DATABASE IF EXISTS " + $dbname
$cmd.ExecuteNonQuery()
#Create the new database
$cmd.CommandText = 'CREATE DATABASE `' + $dbname + '`'
$cmd.ExecuteNonQuery()

#Close connection
$conn.Close()
if($conn.State -eq "closed") {
echo "closed connection"
}
exit