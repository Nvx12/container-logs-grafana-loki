# Docker Container Logging with Grafana and Loki
This repository provides a simple setup for logging Docker container outputs using Loki and visualizing the logs with Grafana.

Table of Contents
Introduction
Prerequisites
Architecture
Setup
1. Clone Repository
2. Configure Docker
3. Start Services
4. Access Grafana
Configuration
Loki Config
Promtail Config
Usage
Cleanup
Contributing

## Introduction
This project demonstrates how to collect logs from Docker containers using Loki, and visualize them using Grafana. Loki is a log aggregation system designed to store and query logs from applications.

## Prerequisites
Before you begin, ensure you have the following installed on your system:

Docker
Docker Compose
Architecture
The setup consists of three main components:

Loki - Log aggregation system.
Promtail - Agent that ships the logs to Loki.
Grafana - Visualization tool for querying and displaying the logs.
Setup
1. Clone Repository
Clone this repository to your local machine:
git clone https://github.com/Nvx12/container-logs-grafana-loki.git
<br/>
cd docker-logging-grafana-loki
<br/>
2. Configure Docker
Ensure that Docker and Docker Compose are properly configured and running on your system.
<br/>
3. Start Services
Use Docker Compose to start Loki, Promtail, and Grafana:
<br/>
docker-compose up -d
<br/>
5. Access Grafana
Open your browser and go to http://localhost:3000.
Default username: admin
Default password: admin
Upon first login, you will be prompted to change the password.
<br/>
## Usage Start your Docker containers.
Logs from the containers will be collected by Promtail and sent to Loki.
In Grafana, add Loki as a data source
Create dashboards and panels to visualize your logs.
## Cleanup
To stop and remove all the services, run:
docker-compose down
## To remove all the associated volumes:
docker-compose down -v
Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements.
