# Nandland Go Board Learning
This will be a repo with my projects that I make for the Nandland Go Board as I go through the Getting Started with FPGAs book by Russell Merrick.

## Setting up the test environment
For this, I will be using the following software:
- Ubuntu 24.04 (Host OS)
- Virtualbox 7.2.4
- Windows 10 Pro (VM)
- APIO
- Lattice iceCube2
- Lattice Diamond

### Windows 10 ISO
You can still download the ISO from Microsoft at this link: https://www.microsoft.com/en-us/software-download/windows10ISO

I will be installing Windows 10 with the Pro license as I will be RDP-ing to this VM from my primary workstation computer. If you do not have a Pro license, you can still the Home edition and everything will work the same but you will just not be able to RDP into the VM.

### Installing Virtualbox
I will assume you have Ubuntu 24.04 already installed and will start at the installation of Virtualbox. Luckily this is pretty straightforward - just follow the instructions provided here: https://www.virtualbox.org/wiki/Linux_Downloads.

Specifically, you will want to follow the steps listed under 'Debian-based Linux Distributions'. As I am using Ubuntu 24.04, replace '<mydist>' with 'noble' (excluding the quotation marks). The commands should look like such as of the time of writing this page:

```
deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian noble contrib
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
sudo apt-get update
sudo apt-get install virtualbox-7.1
```

After this, Virtualbox should be installed successfully but there are a few more items that need to be added/fixed first.

First, let's install the Extension Pack:
- Navigate to this link: https://www.virtualbox.org/wiki/Downloads
- In the VirtualBox Extension Pack section, choose 'Accept and Download'
- In VirtualBox, navigate to the Extensions tab and choose Install
- Find the Extension Pack file and select it.

After the extension pack is installed, there is one more fix. If you try to start a VM and receive a warning such as:

> VirtualBox can't enable the AMD-V extension. Please disable the KVM kernel extension, recompile your kernel and reboot (VERR_SVM_IN_USE).

Perform the following steps to solve this issue (solution found here: https://unix.stackexchange.com/questions/798132/why-and-how-were-kvm-modules-unexpectedly-enabled-in-ubuntu-24-04):

```
# Modify GRUB file
sudo vim /etc/default/grub

# Edit the following line:
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

# To now look like:
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash kvm.enable_virt_at_load=0"

# Update GRUB
sudo update-grub

# Reboot to take effect
reboot
```

After rebooting, the VM should be able to launch fine now.

### Installing Windows 10 VM
Again, I will assume you have already taken care of this part and installed the VM. At this point you should have a fresh copy of Windows 10 installed; I would recommend taking a snapshot in VirtualBox in case you need to start over at any point with a fresh install.

To use the Nandland Go Board in this VM, we need to pass it through to the VM. By default, VirtualBox won't see USB devices due to the user you are logged in with not being in the VirtualBox users group (https://forums.virtualbox.org/viewtopic.php?t=96527).

Simply add yourself to this group, log out, and log back in to fix this issue:

```
sudo usermod -a -G vboxusers $USER
```

Plug the Go Board into the Ubuntu host machine and open the Windows 10 VM settings. Scroll down to the USB section and do the following:
- Ensure 'Enable USB Controller' and 'USB 3.0' are selected
- Click the icon with the green plus sign
- You should see 'FTDI Dual RS232-HS' - this is the Go Board
- Select it to pass it through to the VM

Once this is done, Windows should be able to see the device but APIO won't be able to just yet since we need to install the drivers for it during APIO installation.

### Installing APIO
APIO GitHub: https://github.com/FPGAwars/apio
APIO Docs: https://fpgawars.github.io/apio/docs/

Installing APIO is fairly straight-forward again; I used the pip install method after installing the latest version of Python found here: https://www.python.org/downloads/

There is also a walkthrough posted here: https://youtu.be/gtkQ84Euyww?si=HF29crEcyYCg7nu2
As some of the commands are from a previous version of APIO, follow the command conversion here: https://fpgawars.github.io/apio/docs/migrating-from-apio-0.9.5/#know-the-new-commands

I installed the latest version of APIO without any issues, being version 1.2.1 as of this writing. 

Ensure that APIO is placed into your path during installation or else you will need to fix it later to be able to run the commands properly.

When installing the drivers, I found that only the 'WinUSB' driver worked and allowed APIO to find the Go Board. Be sure that, when running this command, you are running it in a command prompt launched as Administrator. After installing, unplug and plug the Go Board back in and run the following command:

```
apio devices usb
```

You should see output that contains, at a minimum:
- 'Manufacturer: FTDI; Product: Dual RS232-HS' - this is the Go Board
- 'Manufacturer: VirtualBox; Product: USB Tablet' - I assume this is just from passthrough; it does not interfere with using the Go Board.

### Testing and Saving the Setup
After installing APIO, feel free to download an example Go Board file from APIO and ensure that you can upload the build to the board successfully. Once done, I suggest taking another snapshot of the VM in case you need to revert later.

## Lattice Software
If you are following the Getting Start with FPGAs book, you can also download the software recommended in there from Lattice. 

For iCEcube2, follow the steps listed under the 'iCEcube2 Makers Community' section: https://www.latticesemi.com/Products/DesignSoftwareAndIP/FPGAandLDS/iCEcube2#_12092ABF818047B59CC430396492212C

Download and install the latest version for Windows. After receiving your license, follow the instructions to activate the product.

You will also need the Diamond software found here: https://www.latticesemi.com/en/Products/DesignSoftwareAndIP/FPGAandLDS/LatticeDiamond#_0D41C8C1F8F44B3D8F35D9A0BD7C1F6A

Ensure you select 'Programmer Standalone 64-bit for Windows'.

Again, once this is complete, I suggest taking a snapshot to save the state of the VM if you need to revert later.


