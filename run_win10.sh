

#!/bin/bash

# กำหนดชื่อไฟล์
DISK_IMAGE="win10.img"
WINDOWS_ISO="win10.iso"
VIRTIO_ISO="virtio-win.iso"
# รัน QEMU
qemu-system-x86_64 \
  -enable-kvm \
  -m 16G \
  -cpu host \
  -smp cores=8 \
  -machine type=q35,accel=kvm \
  -drive file=win10.img,if=virtio,format=qcow2 \
  -cdrom win10.iso \
  -drive file=virtio-win.iso,index=3,media=cdrom \
  -boot order=d \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0 \
  -device ich9-intel-hda -device hda-duplex \
  -vga virtio \
  -usb -device usb-tablet \
  -name "Windows10-VM" \
  -rtc clock=host,base=localtime

