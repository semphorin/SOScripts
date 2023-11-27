#!/bin/bash
cd /home/analyst/securityonion
# update to latest
sudo git pull origin 2.4/dev
echo Pulled latest edition.
# remove old ES files
sudo rm -rf /opt/so/saltstack/default/salt/sensoroni/files/analyzers/elasticsearch
sudo rm -rf /opt/so/saltstack/local/salt/sensoroni/files/analyzers/elasticsearch
sudo rm -f /opt/so/saltstack/default/salt/sensoroni/defaults.yaml
sudo rm -f /opt/so/saltstack/default/salt/sensoroni/soc_sensoroni.yaml
echo Removed old files...
# copy over new files
cd /home/analyst/securityonion/salt/sensoroni/files/analyzers
sudo cp -r elasticsearch /opt/so/saltstack/default/salt/sensoroni/files/analyzers/elasticsearch
sudo cp -r elasticsearch /opt/so/saltstack/local/salt/sensoroni/files/analyzers/elasticsearch
cd /home/analyst/securityonion/salt/sensoroni/
sudo cp defaults.yaml /opt/so/saltstack/default/salt/sensoroni/defaults.yaml
sudo cp soc_sensoroni.yaml /opt/so/saltstack/default/salt/sensoroni/soc_sensoroni.yaml
echo Copied new files.
echo Complete.
