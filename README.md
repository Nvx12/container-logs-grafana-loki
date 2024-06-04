# Docker Container Logging with Grafana and Loki

This repository provides a simple setup for logging Docker container outputs using Loki and visualizing the logs with Grafana.

## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Architecture](#architecture)
- [Setup](#setup)
  - [Clone Repository](#1-clone-repository)
  - [Configure Docker](#2-configure-docker)
  - [Start Services](#3-start-services)
  - [Access Grafana](#4-access-grafana)
- [Configuration](#configuration)
  - [Loki Config](#loki-config)
  - [Promtail Config](#promtail-config)
- [Usage](#usage)
- [Cleanup](#cleanup)
- [Contributing](#contributing)

## Introduction

This project demonstrates how to collect logs from Docker containers using Loki, and visualize them using Grafana. Loki is a log aggregation system designed to store and query logs from applications.

## Prerequisites

Before you begin, ensure you have the following installed on your system:
- Docker
- Docker Compose

## Architecture

The setup consists of three main components:
- **Loki**: Log aggregation system.
- **Promtail**: Agent that ships the logs to Loki.
- **Grafana**: Visualization tool for querying and displaying the logs.

## Setup

### 1. Clone Repository

Clone this repository to your local machine:

git clone https://github.com/First-Delivery-Group/container-logs-grafana-loki.git
cd container-logs-grafana-loki
<br/>
2. Configure Docker
Ensure that Docker and Docker Compose are properly configured and running on your system.
<br/>
3. Start/Update Services
Use Docker Compose to start Loki, Promtail, and Grafana:
<br/>
docker stack deploy -c docker-compose.yml monitoring
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
<br/>
## Cleanup
To stop and remove all the services, run:
docker-compose down
<br/>
## To remove all the associated volumes:
docker-compose down -v
<br/>
## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements.
