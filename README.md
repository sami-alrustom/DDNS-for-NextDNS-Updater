# NextDNS DDNS Updater (Linux)

![Linux](https://img.shields.io/badge/platform-linux-blue)
![Bash](https://img.shields.io/badge/script-bash-green)
![License](https://img.shields.io/badge/license-MIT-yellow)
![Status](https://img.shields.io/badge/status-stable-success)

A lightweight **Bash-based Dynamic DNS updater for NextDNS** that automatically updates your public IP address using a cron job.

This project was created for **Linux servers and homelabs** where the public IP may change periodically. The script keeps your NextDNS configuration updated so DNS filtering continues working properly.

---

## Features

* Automatic public IP updates to NextDNS
* Simple Bash script
* Works on most Linux distributions
* Cron-based automation
* Timestamped logging
* Log rotation support
* Lightweight (only requires `curl`)

---

## Requirements

* Linux server (Ubuntu / Debian recommended)
* `curl`
* `cron`
* A NextDNS account

Works with systems like:

* Ubuntu Server
* Debian
* Proxmox
* VPS environments
* Homelab servers

---

## How It Works

NextDNS provides an endpoint that updates the **Linked IP** associated with your configuration.

The script:

1. Sends a request to the NextDNS update endpoint.
2. Logs the result with timestamp.
3. Runs automatically every few minutes using cron.

Example update endpoint:

```
https://link-ip.nextdns.io/YOUR_TOKEN
```

---

## Installation

### 1. Clone the repository

```
git clone https://github.com/YOURUSERNAME/nextdns-ddns-updater.git
cd nextdns-ddns-updater
```

---

### 2. Edit the script

Open the script and replace the token with your NextDNS update link.

```
nano update-nextdns.sh
```

Change:

```
URL="https://link-ip.nextdns.io/YOUR_TOKEN"
```

---

### 3. Install the script

```
sudo cp update-nextdns.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/update-nextdns.sh
```

---

### 4. Create the log file

```
sudo touch /var/log/nextdns-ddns.log
sudo chmod 600 /var/log/nextdns-ddns.log
```

---

### 5. Add the cron job

```
sudo crontab -e
```

Add this line:

```
*/5 * * * * /usr/local/bin/update-nextdns.sh
```

This will update your IP every **5 minutes**.

---

### 6. (Optional) Enable log rotation

Copy the logrotate configuration:

```
sudo cp logrotate-nextdns-ddns /etc/logrotate.d/nextdns-ddns
```

This will:

* rotate logs weekly
* keep 4 old logs
* compress old logs

---

## Testing

Run the script manually:

```
sudo /usr/local/bin/update-nextdns.sh
```

Check the log file:

```
tail -f /var/log/nextdns-ddns.log
```

Example output:

```
2026-02-27 03:36:59 [SUCCESS] IP Updated: 204.244.153.197
```

---

## Verifying NextDNS

Log into the NextDNS dashboard and confirm your **Linked IP** is updated.

You should see your current public IP and the **Last Seen timestamp** updating periodically.

---

## Project Structure

```
nextdns-ddns-updater
│
├── update-nextdns.sh
├── logrotate-nextdns-ddns
└── README.md
```

---

## Author

**Sami Alrustom**

Network Technician Student
Homelab & Networking Enthusiast

---

## License

This project is licensed under the MIT License.
