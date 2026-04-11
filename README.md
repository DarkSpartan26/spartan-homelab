# 🛡️ Spartan Homelab (Transcontinental Deployment)

This repository contains the Infrastructure as Code (IaC), systemd service configurations, and declarative deployment stacks for my personal headless Debian server. 

**Deployment Architecture:** The bare-metal server is physically hosted in Delhi, India, and is entirely remotely administered, monitored, and maintained from Kaiserslautern, Germany. 

## 🏗️ Core Architecture & Automation

* **Host OS:** Debian Linux (Headless)
* **Automation:** Host security is maintained via `unattended-upgrades` for automated patching, alongside custom bash scripts for routine maintenance.
* **Service Segregation:** Applications are split between Docker containerization (for web/media services) and host-level systemd daemons (for core syncing and networking).

## 🌐 Networking & Security Posture

The network is designed to securely route traffic across continents while minimizing open ports.

* **Reverse Proxy & SSL:** **Caddy** handles reverse proxying and automated TLS certificate generation, dynamically routed via **DuckDNS**.
* **Mesh VPN & Routing:** **Tailscale** is used as the backbone for administrative SSH access. The server also functions as a Tailscale Exit Node, allowing secure tunneling and localized IP routing to India from Germany.
* **Authentication:** Strict SSH key-pair authentication.

## 📦 Containerized Stack (Docker Compose)

The following services are isolated in Docker containers and routed through the Caddy proxy where applicable:

* **Nextcloud:** Personal cloud storage and file synchronization.
* **Jellyfin:** Media streaming and hardware transcoding.
* **qBittorrent:** P2P file management.
* **Minecraft Server:** Dedicated multiplayer instance.

## ⚙️ Host-Level Services (systemd)

* **Syncthing:** Running as a native system daemon to handle decentralized, continuous synchronization of my Obsidian knowledge base across all my devices.

## 📂 Repository Structure

* `/docker` - Contains all `docker-compose.yml` stacks and Caddy configurations. (Environment variables handled via local `.env` files).
* `/scripts` - Automation and maintenance bash scripts.
* `/systemd` - Custom `.service` files for host-level daemon management.
