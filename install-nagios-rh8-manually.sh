#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to print error messages and exit the script
print_error() {
    echo "Error: $1"
    exit 1
}

# Update the system packages.
echo "Updating system packages..."
sudo dnf update -y || print_error "Failed to update system packages."

# Enable the repository manually by setting "enabled=1" in the respective repository file.
echo "Enabling repository in /etc/yum.repos.d/redhat.repo..."
sudo sed -i 's/^enabled=0/enabled=1/' /etc/yum.repos.d/redhat.repo || print_error "Failed to enable repository."

# Enable the codeready-builder-for-rhel-8-x86_64-rpms repository.
echo "Enabling codeready-builder-for-rhel-8-x86_64-rpms repository..."
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms || print_error "Failed to enable repository codeready-builder-for-rhel-8-x86_64-rpms."

# Install wget package.
echo "Installing wget package..."
sudo dnf install wget -y || print_error "Failed to install wget."

# Change to the /tmp directory.
cd /tmp || print_error "Failed to change to /tmp directory."

# Download the latest version of Nagios XI.
echo "Downloading Nagios XI..."
wget https://assets.nagios.com/downloads/nagiosxi/xi-latest.tar.gz || print_error "Failed to download Nagios XI."

# Extract the downloaded tarball.
echo "Extracting Nagios XI..."
tar xzf xi-latest.tar.gz || print_error "Failed to extract Nagios XI."
# Remove the downloaded tarball to save space.
rm -rf xi-latest.tar.gz || print_error "Failed to remove downloaded tarball."

# Change to the Nagios XI directory.
cd nagiosxi || print_error "Failed to change to Nagios XI directory."

# Run the full installation script with superuser privileges.
echo "Running Nagios XI full installation..."
sudo ./fullinstall || print_error "Failed to install Nagios XI."

echo "Nagios XI installation is complete."
