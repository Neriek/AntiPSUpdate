#!/bin/bash
echo "Warning, this install script was written with Fedora, RedHat, and CentOS in mind."
echo "I can't guarentee it will work with any other OS"
echo "Make sure you've edited all files in dns/etc/ with your IP address before you run this script"
echo -e "Have you done that? \\c"
read -r yn
#if user typed y   or   user typed yes  or  user typed nothing
if [ "$yn" = "y" ] || [ "$yn" = "yes" ] || [ "$yn" "" ]
    then
    # then run this
    source dns/installbind.sh
else
    exit 1
fi
sudo cp -rf dns/etc/ /
sudo systemctl enable named
sudo systemctl start named
if ( sudo systemctl is-active named >/dev/null 2>&1 )
    then
    echo "named is running, continuing..."
        
        sudo yum install httpd -y
        sudo systemctl enable httpd
        sudo systemctl start httpd
        
        if ( sudo systemctl is-active httpd >/dev/null 2>&1 )
            then
            echo "Apache successfully installed and running, continuing..."
                
                echo "Copying web portal and update lists..."
                cp -r html/ /var/www/

            else
            echo "error, something went wrong"
            exit 1
        fi
else
    echo "error: named isn't running, check named.conf and zone files for discrepencies."
    exit 1
fi
