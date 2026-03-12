Architecture
This project keeps your NextDNS Linked IP updated automatically when your public IP changes.
Flow of operation:
Home Network
│
│ Public IP (ISP)
▼
Linux Server / VPS
│
│ Cron / Systemd Timer
│
▼
NextDNS Updater Script
│
│ HTTPS Request
▼
NextDNS API Endpoint
https://link-ip.nextdns.io/TOKEN
│
▼
NextDNS Configuration Updated

This ensures the correct public IP is always linked to your NextDNS configuration.
