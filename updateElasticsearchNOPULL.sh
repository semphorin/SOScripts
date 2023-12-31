#!/bin/bash
cd /home/admin/securityonion
# remove old ES files
sudo rm -rf /opt/so/saltstack/default/salt/sensoroni/files/analyzers/elasticsearch
sudo rm -rf /opt/so/saltstack/local/salt/sensoroni/files/analyzers/elasticsearch
sudo rm -f /opt/so/saltstack/default/salt/sensoroni/defaults.yaml
sudo rm -f /opt/so/saltstack/default/salt/sensoroni/soc_sensoroni.yaml
echo Removed old files...
# copy over new files
cd /home/admin/securityonion/salt/sensoroni/files/analyzers
sudo cp -r elasticsearch /opt/so/saltstack/default/salt/sensoroni/files/analyzers/elasticsearch
sudo cp -r elasticsearch /opt/so/saltstack/local/salt/sensoroni/files/analyzers/elasticsearch
cd /home/admin/securityonion/salt/sensoroni/
sudo cp defaults.yaml /opt/so/saltstack/default/salt/sensoroni/defaults.yaml
sudo cp soc_sensoroni.yaml /opt/so/saltstack/default/salt/sensoroni/soc_sensoroni.yaml
echo Copied new files.
sudo so-sensoroni-restart --force
echo Complete.
