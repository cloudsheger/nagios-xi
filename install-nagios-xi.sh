#!/bin/bash

# Script to install Nagios XI quickly on Red Hat Enterprise Linux 8

# Define variables
NAGIOS_XI_URL="https://assets.nagios.com/downloads/nagiosxi/install.sh"
GPG_KEY_URL="https://repo.nagios.com/GPG-KEY-NAGIOS-V3"
INSTALL_DIR="/tmp/nagiosxi"

# Function to display usage instructions
usage() {
    echo "Usage: $0 <server_address>"
    echo "Example: $0 mynagiosserver.local"
    exit 1
}

# Check if server address is provided as argument
if [ $# -ne 1 ]; then
    usage
fi

SERVER_ADDRESS="$1"

# Enable CodeReady Builder repository for RHEL 8
echo "Enabling CodeReady Builder repository..."
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms

# Download GPG key
echo "Downloading Nagios GPG key..."
wget -qO- "$GPG_KEY_URL" | sudo rpm --import -

# Download Nagios XI install script
echo "Downloading Nagios XI install script..."
curl -sSL "$NAGIOS_XI_URL" | sudo sh

# Finalize Installation
echo "Nagios XI Installation Complete!"
echo "------------------------------------"
echo "You can access the Nagios XI web interface by visiting:"
echo "http://$SERVER_ADDRESS/nagiosxi"

# Exit script
exit 0
