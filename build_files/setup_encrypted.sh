#!/bin/bash

set -ouex pipefail

mkdir /decrypted
chmod 700 /decrypted

echo "encrypted_data UUID=3e5f29c1-909e-4cbc-88cf-6ced13f6e5d5 /encrypted/encrypted_disk.img /var/roothome/key.keyfile=luks,discard" >> /etc/crypttab

echo "/dev/mapper/encrypted_disk /decrypted ext4 defaults,nofail,ro 0 2" >> /etc/fstab
