#!/bin/bash
# Spartan Maintenance Script
echo "Updating Debian Host..."
sudo apt update && sudo apt upgrade -y
echo "Updating Docker Containers..."
cd ~/homelab-config/docker
docker compose pull && docker compose up -d --remove-orphans
echo "Pruning unused images..."
docker image prune -f
