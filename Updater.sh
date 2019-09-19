#!/bin/bash

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

echo "Rebooting in 5 seconds..."
echo "Have a nice day!"
sleep 5
sudo reboot
