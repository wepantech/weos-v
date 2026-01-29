#!/bin/bash

set -ouex pipefail


tee /etc/systemd/startup-script.service <<EOF
[Unit]
Description=Mount encrypted part and run startup script after that
After=network.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c '/encrypted/mount_encrypted.sh && /encrypted/mountpoint/startup.sh'
RemainAfterExit=yes
User=root

[Install]
WantedBy=multi-user.target
EOF


systemd enable startup-script.service
