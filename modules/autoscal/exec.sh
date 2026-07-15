#!/bin/bash

set -e

sudo apt update -y
sudo apt install -y nginx

sudo systemctl enable nginx
sudo systemctl start nginx

echo "<h1>Hello from $(hostname)</h1>" | sudo tee /var/www/html/index.html

sudo systemctl restart nginx