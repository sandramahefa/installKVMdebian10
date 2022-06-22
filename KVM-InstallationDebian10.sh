#1- Check Whether Virtualization Extension is enabled or not
egrep -c '(vmx|svm)' /proc/cpuinfo
grep -E --color '(vmx|svm)' /proc/cpuinfo
#2 Install QEMU-KVM & Libvirt packages along with virt-manager
#kvm, qemu, libvirt and virt-manager packages are available in the default repositories of Debian 10, run the beneath apt command to install these packages,
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y
sudo systemctl status libvirtd.service
#3- Start default network and add 
sudo virsh net-start default
sudo virsh net-autostart default
sudo modprobe vhost_net
echo "vhost_net" | sudo  tee -a /etc/modules
lsmod | grep vhost
# If you want a normal user to use virsh commands then add that user to libvirt and libvirt-qemu group using the following commands
sudo adduser sandra libvirt
sudo adduser sandra libvirt-qemu
newgrp libvirt
newgrp libvirt-qemu
