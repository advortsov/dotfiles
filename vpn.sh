sudo apt-get update &&
sudo apt-get -y install openvpn net-tools &&
cd ~/Downloads &&
sudo openvpn --config omni-a_dvortsov.ovpn
