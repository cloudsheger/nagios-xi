# Installing Nagios XI on Supported Linux Distributions

Nagios Enterprises provides support for installing Nagios XI on specific 64-bit Linux distributions. Below are the supported distributions and prerequisites for installing Nagios XI.

## Supported Linux Distributions

- Red Hat Enterprise Linux 8 (RHEL 8)
  - **Note:** RHEL 8 requires enabling the CodeReady Builder repository. Use the following command to enable it:
    ```bash
    subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms
    ```

## Installation Methods

There are multiple methods available for installing Nagios XI, all of which perform a full installation of the software.

### Prerequisites

Before proceeding with the installation, ensure you have the required GPG key imported:
```bash
wget https://repo.nagios.com/GPG-KEY-NAGIOS-V3
rpm --import GPG-KEY-NAGIOS-V3
```

### RPM Installation

For RPM-based installations, refer to the Nagios Repositories for instructions on installing Nagios XI via online RPMs.

### Quick Installation

To quickly install Nagios XI with a single command, use the following in your terminal:
```bash
curl https://assets.nagios.com/downloads/nagiosxi/install.sh | sh
```
This command will download and install Nagios XI. Proceed to the "Finalize Installation" section after executing this command.

### Manual Installation

For manual installation, follow these steps:

1. Download the latest Nagios XI package:
   ```bash
   cd /tmp
   wget https://assets.nagios.com/downloads/nagiosxi/xi-latest.tar.gz
   ```

2. Extract the downloaded package:
   ```bash
   tar xzf xi-latest.tar.gz
   cd nagiosxi
   ```

3. Run the installation script:
   ```bash
   ./fullinstall
   ```

## Finalize Installation

Once the installation has completed successfully, you should see a message indicating the completion of the Nagios XI installation:

```
Nagios XI Installation Complete!
------------------------------------
You can access the Nagios XI web interface by visiting:
http://

Replace `<server_address>` with the IP address or hostname of your Nagios XI server.

---

By following these installation methods, you can set up Nagios XI on supported Linux distributions with ease. Make sure to refer to the official Nagios documentation for detailed configuration and usage instructions after installation.

```
https://support.nagios.com/kb/article/1-how-to-install-nagios-xi-917.html
```