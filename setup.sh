echo "Warning, this install script was written with Fedora, RedHat, and CentOS in mind."
echo "I can't guarentee it will work with any other OS"
echo "Make sure you've edited all files in etc/ with your IP address before you run this script"
echo -e "Have you done that? \\c"
read -r yn
if ( $yn = "y") || ( $yn = "yes") || ( $yn "")
    source dns-files/installbind.sh
else
    break
fi
sudo cp -r etc/ /
sudo systemctl enable bind
sudo systemctl start bind