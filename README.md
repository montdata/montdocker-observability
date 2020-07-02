![](https://github.com/vegasbrianc/prometheus/workflows/prometheus%20test/badge.svg)
![Website](https://img.shields.io/website?down_color=red&down_message=offline&style=flat-square&up_color=blue&up_message=online&url=https://open.montd.io)
# Contents

- Introduction
  - [Overview](#a-prometheus--grafana-docker-compose-stack)
  - [Pre-requisites](#pre-requisites)
  - [Installation & Configuration](#installation--configuration)
    - [Add Datasources & Dashboards](#add-datasources-and-dashboards)
    - [Install Dashboards the Old Way](#install-dashboards-the-old-way)
  	- [Alerting](#alerting)
  	- [Test Alerts](#test-alerts)
    - [Add additional Datasources](#add-additional-datasources)
  - [Deploy Prometheus stack with Traefik](#deploy-prometheus-stack-with-traefik)
  - [Security Considerations](#security-considerations)
  	- [Production Security](#production-security)
  - [Troubleshooting](#troubleshooting)
  	- [Mac Users](#mac-users)
  - [Interesting Projects that use this Repo](#interesting-projects-that-use-this-repo)


# A Observability & Monitoring Stack

### Observability Stack :rocket:

A container based observability platform that can run in any Virtual Machine, Public Cloud as Microsoft Azure or Oracle Cloud and even Raspberry Pi (testing)
Creates a complete setup for Grafana, Alerta & Prometheus (Loki in the roadmap).

Montd.io project aims to be an open easy-to-use platform build with [Docker](https://docker.io) to observability (metrics, monitoring, and alerting), cloud management tools and dataops toolkit.

We provide container infrastructure for observability, with core and extended customizations using [Grafana](https://grafana.com/) to create and share custom analytical dashboards, [Prometheus](https://prometheus.io/) for metrics storage and [Alerta](https://alerta.io) for alerting dashboards.

You can deploy any montd.io stack by running only one docker-compose command on your shell for each stack (observability, CloudOps or DataOps)
The Docker Compose YAML file(docker-compose.yml) defines all the configurations, containers and components, making montd.io really easy to set up and start running.

Start [using it today](#usage).

# Pre-requisites
Before we get started installing the Montd.io Observability stack. Ensure you install the latest version of [docker](https://docker.io) and [docker-compose](https://docs.docker.com/compose/install/)[docker swarm](https://docs.docker.com/engine/swarm/swarm-tutorial/) on your Docker host machine. Docker Compose & Swarm is installed automatically when using Docker for Mac or Docker for Windows.

## Before you run :running:

* PREPARE TO USE DOCKER CONTAINERS
* Make sure you have Docker Compose in your enviroment (Swarm and Kubernetes on the way)* 
* Change the default ports on the 'docker-compose.yml' file.



```
# QUICK START - EXAMPLE
$ git clone https://github.com/montdata/observability
$ cd observability-stack/
$ docker-compose up -d .

```
## Ports to play :eyes:

** Observability
* AlertaWeb IP on port `8080`
* Grafana IP on port `3000`
* Prometheus IP on port `9090`




## Alerting
Alerting has been added to the stack with Slack integration. 2 Alerts have been added and are managed

Alerts              - `prometheus/alert.rules`
Slack configuration - `alertmanager/config.yml`

The Slack configuration requires to build a custom integration. #slack-integainer.

### Add Additional Datasources
Now we need to create the Prometheus Datasource in order to connect Grafana to Prometheus 
* Click the `Grafana` Menu at the top left corner (looks like a fireball)
* Click `Data Sources`
* Click the green button `Add Data Source`.

**Ensure the Datasource name `Prometheus`is using uppercase `P`**

<img src="https://raw.githubusercontent.com/vegasbrianc/prometheus/master/images/Add_Data_Source.png" width="400" heighth="400">

# Security Considerations
This project is intended to be a quick-start to get up and running with Docker and Prometheus. Security has not been implemented in this project. It is the users responsability to implement Firewall/IpTables and SSL.

Since this is a template to get started Prometheus and Alerting services are exposing their ports to allow for easy troubleshooting and understanding of how the stack works.


## Prometheus & Grafana now have hostnames

* Grafana - http://grafana.localhost
* Prometheus - http://prometheus.localhost


## Check the Metrics
Once all the services are up we can open the Traefik Dashboard. The dashboard should show us our frontend and backends configured for both Grafana and Prometheus.

    http://localhost:8080


Take a look at the metrics which Traefik is now producing in Prometheus metrics format

    http://localhost:8080/metrics


## Login to Grafana and Visualize Metrics

Grafana is an Open Source visualization tool for the metrics collected with Prometheus. Next, open Grafana to view the Traefik Dashboards.
**Note: Firefox doesn't properly work with the below URLS please use Chrome**

    http://grafana.localhost

Username: admin
Password: foobar

# Production Security:

Here are just a couple security considerations for this stack to help you get started.
* Remove the published ports from Prometheus and Alerting servicesi and only allow Grafana to be accessed
* Enable SSL for Grafana with a Proxy such as [jwilder/nginx-proxy](https://hub.docker.com/r/jwilder/nginx-proxy/) or [Traefik](https://traefik.io/) with Let's Encrypt
* Add user authentication via a Reverse Proxy [jwilder/nginx-proxy](https://hub.docker.com/r/jwilder/nginx-proxy/) or [Traefik](https://traefik.io/) for services cAdvisor, Prometheus, & Alerting as they don't support user authenticaiton
* Terminate all services/containers via HTTPS/SSL/TLS

# Troubleshooting

It appears some people have reported no data appearing in Grafana. If this is happening to you be sure to check the time range being queried within Grafana to ensure it is using Today's date with current time.

## Mac Users

1. The node-exporter does not run the same as Mac and Linux. Node-Exporter is not designed to run on Mac and in fact cannot collect metrics from the Mac OS due to the differences between Mac and Linux OS's. I recommend you comment out the node-exporter section in the `docker-compose.yml` file and instead just use the cAdvisor.

2. If you find after you deploy your project that the prometheus and alertmanager services are in pending status due to "no suitable node" this is due to file system permissions. Be sure to Open Docker for Mac Preferences -> File Sharing Menu and add the following:

![Docker for Mac File Sharing Settings](https://github.com/vegasbrianc/prometheus/raw/master/images/mac-filesystem.png)

# Interesting Projects that use this Repo
Several projects utilize this Prometheus stack. Here's the list of projects:

* [Docker Pulls](https://github.com/vegasbrianc/docker-pulls) - Visualize Docker-Hub pull statistics with Prometheus
* [GitHub Monitoring](https://github.com/vegasbrianc/github-monitoring) - Monitor your GitHub projects with Prometheus
* [Traefik Reverse Proxy/Load Balancer Monitoring](https://github.com/vegasbrianc/docker-traefik-prometheus) - Monitor the popular Reverse Proxy/Load Balancer Traefik with Prometheus
* [internet monitoring](https://github.com/maxandersen/internet-monitoring) - Monitor your local network, internet connection and speed with Prometheus.
* [Dockerize Your Dev](https://github.com/RiFi2k/dockerize-your-dev) - Docker compose a VM to get LetsEncrypt / NGINX proxy auto provisioning, ELK logging, Prometheus / Grafana monitoring, Portainer GUI, and more...

*Have an intersting Project which use this Repo? Submit yours to the list*
