#!/bin/bash
cd /home/SecurityOnion
# update to latest
sudo git pull origin 2.4/dev
echo Pulled latest edition.
# regen source packages
cd /home/SecurityOnion/salt/sensoroni/files/analyzers/elasticsearch
sudo rm -rf source-packages
sudo pip download -r requirements.txt -d source-packages
# remove old ES files
sudo rm -rf /opt/so/saltstack/default/salt/sensoroni/files/analyzers/elasticsearch
sudo rm -rf /opt/so/saltstack/local/salt/sensoroni/files/analyzers/elasticsearch
sudo rm -f /opt/so/saltstack/default/salt/sensoroni/defaults.yaml
sudo rm -f /opt/so/saltstack/default/salt/sensoroni/soc_sensoroni.yaml
echo Removed old files...
# copy over new files
cd ..
sudo cp -r elasticsearch /opt/so/saltstack/default/salt/sensoroni/files/analyzers/elasticsearch
sudo cp -r elasticsearch /opt/so/saltstack/local/salt/sensoroni/files/analyzers/elasticsearch
cd /home/SecurityOnion/salt/sensoroni/
sudo cp defaults.yaml /opt/so/saltstack/default/salt/sensoroni/defaults.yaml
sudo cp soc_sensoroni.yaml /opt/so/saltstack/default/salt/sensoroni/soc_sensoroni.yaml
echo Copied new files.
sudo so-sensoroni-restart --force
echo Complete.
