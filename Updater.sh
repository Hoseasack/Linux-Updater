#!/bin/bash

clear

cd /

if [ ! -d /Pi-hole ]; then
  echo "Making directory..."
  sudo mkdir -p /Pi-hole
  cd /Pi-hole
  sudo touch settings
  echo "Please run the updater again to finsh setup."
else

  cd /Pi-hole

  if [ -f settings ]; then
    Rebooting=""
    Logs=""
    echo "==============================="
    echo "           Settings            "
    echo "==============================="
    echo " "
    echo "Would you like to reboot after updating?"
    read Rebooting

    if [ $Rebooting = "no" ]; then
      cd /Pi-hole
      sudo touch reboot
    else
      cd /Pi-hole
      sudo rm reboot
    fi
      echo "Would you like to remove the logs?"
      read Logs

    if [ $Logs = "no" ]; then
        cd /Pi-hole
        sudo touch logs
    else
        cd /Pi-hole
        sudo rm logs
    fi
    cd /Pi-hole
    sudo rm settings
  fi

  clear
  echo  "==============================="
  echo  "        Pi-Hole Updater        "
  echo  "==============================="
  echo " "

  echo "All's good, starting  helper."
  sleep 1

  cd /Pi-hole

  if [ ! -f logs ]; then
    echo "Deleting Logs..."
    cd /var/log/
    sudo rm *.log
    sudo rm *.1
    echo "Done!"
  fi

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

  cd /Pi-hole

  if [ ! -f reboot ]; then
    echo "Rebooting in 5 seconds..."
    echo "Have a nice day!"
    sleep 5
    sudo reboot
  else
    echo "All done! Have a nice day!"
  fi

fi
