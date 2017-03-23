@echo off

 >  .\logs\serverDir.txt echo open websites.cwave.com
 >> .\logs\serverDir.txt echo cd httpdocs
 >> .\logs\serverDir.txt echo mkdir %1
 >> .\logs\serverDir.txt echo chmod 777 %1
 >> .\logs\serverDir.txt echo close
 >> .\logs\serverDir.txt echo quit
 psftp -l cwavesales -pw 8PEwNp3VC9sXYT4VP5fN -b .\logs\serverDir.txt > .\logs\psFTP.txt
exit
