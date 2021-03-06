#!/bin/bash
VM='MV_4'
VBoxManage createhd --filename $VM.vdi --size 32768
VBoxManage createvm --name $VM --ostype "Ubuntu_64" --register
VBoxManage storagectl $VM --name "SATA Controller" --add sata \ --controller IntelAHCI
VBoxManage storageattach $VM --storagectl "SATA Controller" --port 0 \ --device 0 --type hdd --medium $VM.vdi
VBoxManage storagectl $VM --name "IDE Controller" --add ide
VBoxManage storageattach $VM --storagectl "IDE Controller" --port 0 \ --device 0 --type dvddrive --medium /home/rooot/Downloads/ubuntu-14.04-server-amd64.iso
VBoxManage modifyvm $VM --ioapic on
VBoxManage modifyvm $VM --boot1 dvd --boot2 disk --boot3 none --boot4 none
VBoxManage modifyvm $VM --memory 1024 --vram 128
VBoxManage modifyvm $VM --nic1 bridged --bridgeadapter1 e1000g0

