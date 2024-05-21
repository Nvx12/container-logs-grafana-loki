Docker Container Logging with Grafana and Loki
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
License
Introduction
This project demonstrates how to collect logs from Docker containers using Loki, and visualize them using Grafana. Loki is a log aggregation system designed to store and query logs from applications.

Prerequisites
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

sh
Copy code
git clone https://github.com/yourusername/docker-logging-grafana-loki.git
cd docker-logging-grafana-loki
2. Configure Docker
Ensure that Docker and Docker Compose are properly configured and running on your system.

3. Start Services
Use Docker Compose to start Loki, Promtail, and Grafana:

sh
Copy code
docker-compose up -d
4. Access Grafana
Open your browser and go to http://localhost:3000.

Default username: admin
Default password: admin
Upon first login, you will be prompted to change the password.

Configuration
Loki Config
Loki's configuration is defined in loki-config.yaml. Here's a basic example:

yaml
Copy code
auth_enabled: false

server:
  http_listen_port: 3100

ingester:
  lifecycler:
    address: 127.0.0.1
    ring:
      kvstore:
        store: inmemory
    final_sleep: 0s
  chunk_idle_period: 5m
  chunk_retain_period: 30s
  max_transfer_retries: 0

schema_config:
  configs:
    - from: 2020-10-24
      store: boltdb-shipper
      object_store: filesystem
      schema: v11
      index:
        prefix: index_
        period: 168h

storage_config:
  boltdb_shipper:
    active_index_directory: /tmp/loki/index
    cache_location: /tmp/loki/boltdb-cache
    shared_store: filesystem
  filesystem:
    directory: /tmp/loki/chunks

limits_config:
  enforce_metric_name: false
  reject_old_samples: true
  reject_old_samples_max_age: 168h

chunk_store_config:
  max_look_back_period: 0s

table_manager:
  retention_deletes_enabled: false
  retention_period: 0s
Promtail Config
Promtail's configuration is defined in promtail-config.yaml. Here's a basic example:

yaml
Copy code
server:
  http_listen_port: 9080
  grpc_listen_port: 0

positions:
  filename: /tmp/positions.yaml

clients:
  - url: http://loki:3100/loki/api/v1/push

scrape_configs:
  - job_name: system
    static_configs:
      - targets:
          - localhost
        labels:
          job: varlogs
          __path__: /var/log/*log

  - job_name: docker
    docker_sd_configs:
      - host: unix:///var/run/docker.sock
        refresh_interval: 5s
    relabel_configs:
      - source_labels: [__meta_docker_container_name]
        target_label: container
      - source_labels: [__meta_docker_container_id]
        target_label: container_id
Usage
Start your Docker containers.
Logs from the containers will be collected by Promtail and sent to Loki.
In Grafana, add Loki as a data source (http://loki:3100).
Create dashboards and panels to visualize your logs.
Cleanup
To stop and remove all the services, run:

sh
Copy code
docker-compose down
To remove all the associated volumes:

sh
Copy code
docker-compose down -v
Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements.
