#!/bin/bash

clear

cd /

if [ -f settings ]; then
  echo "==============================="
  echo "           Settings            "
  echo "==============================="
  echo " "
  echo "Would you like to reboot after updating?"
  read $Rebooting
  cd /
  sudo rm settings

  if [ $Rebooting = "no" ]; then
    cd /
    sudo touch reboot
  else
    cd /
    sudo rm reboot
  fi
fi

clear

echo "==============================="
echo "        Pi-Hole Updater        "
echo "==============================="
echo " "

echo "All's good, starting  helper."
sleep 1
echo "Deleting Logs..."
cd /var/log/
sudo rm *.log
sudo rm *.1
echo "Done!"

echo " "
sleep 2

echo "Updating Pi-Hole..."
pihole -up
echo "Done!"

echo " "
sleep 2

echo "Updating Linux..."
sudo apt-get update
echo "Done!"
echo " "
sleep 2

echo "Upgrading Linux..."
sudo apt-get upgrade
echo "Done!"

echo " "

cd /

if [ ! -f reboot ]; then
        echo "Rebooting in 5 seconds..."
        echo "Have a nice day!"
        sleep 5
        sudo reboot
else
  echo "All done! Have a nice day!"
fi
