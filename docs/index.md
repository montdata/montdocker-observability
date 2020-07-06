Montd.io project aims to be an open easy-to-use platform build with [Docker](https://docker.io) to Observability (metrics, monitoring, and alerting), cloud operations tools and dataops toolkit.

We provide container infrastructure for observability, with core and extended customizations using [Grafana](https://grafana.com/) to create and share custom analytical dashboards, [Prometheus](https://prometheus.io/) for metrics storage and [Alerta](https://alerta.io) for alerting dashboards.

You can deploy montd.io stack by running only one docker-compose command on your shell for each stack (Observability, CloudOps or DataOps)
The Docker Compose YAML file(docker-compose.yml) defines all the configurations, containers and components, making montd.io really easy to set up and start running :running:.

Start [using it today](#usage).


# Observability Stack :rocket:

A container based observability platform that can run in any Virtual Machine, Public Cloud as Microsoft Azure or Oracle Cloud and even Raspberry Pi (testing)

Creates a complete setup for Grafana, Alerta, Prometheus, Graphite (and Loki in the roadmap).

![Thumbnail of Architect](img/thumbnail.png)


# CloudOps Tools:cloud:

Open Platform for Cloud Professionals, easy to use AUTOMATION tools (Ansible/AWX), CI/CD(Jenkins) and ORCHESTRATION (Mist.io).The stack run in any Virtual Machine, Public Cloud as Microsoft Azure or Oracle Cloud and even Raspberry Pi (testing)

![Thumbnail of Architect](img/thumbnail.png)


# DataOps Open Platform :floppy_disk:

A container based observability platform that can run in any Virtual Machine, Public Cloud as Microsoft Azure or Oracle Cloud and even Raspberry Pi (testing)

Creates a complete setup for Grafana, Alerta, Prometheus, Graphite (and Loki in the roadmap).

![Thumbnail of Architect](img/thumbnail.png)

## Ports to play :eyes:

** Observability
* AlertaWeb IP on port `8080`
* Grafana IP on port `3000`
* Graphite IP on port `2003`
* Prometheus IP on port `9090`


** CloudOps
* AlertaWeb IP on port `8080`
* Grafana IP on port `3000`
* Graphite IP on port `2003`
* Prometheus IP on port `9090`

** DataOps
* AlertaWeb IP on port `8080`
* Grafana IP on port `3000`
* Graphite IP on port `2003`
* Prometheus IP on port `9090`

## Usage

We have three principal repositories:

- [Observability Stack](https://github.com/montdata/observability), using Grafana for dashboarding, Prometheus for metrics and Alerta.io for Alert list
- CloudOps Management Stack with Mist.io
- DataOps Stack, with PostgreSQL & Adminer


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

## Docker Compose Basic Services​ ​and​ S​t​ru​c​tu​re :information_source:

```
base docker-compose.yaml
services:
        dash:
                image: grafana/grafana
                ports:
                        - "3000:3000"
        apigraphite:
                image: graphiteapp/graphite-statsd
                restart: always
                ports:
                        - "80:80"
                        - "2003:2003"
        prom:
                image: prom/prometheus
                ports:
                        - "8000"
                        - "9090:9090"
        alertaweb:
                image: alerta/alerta-web
                ports:
                        - "8080:8080"
                depends_on:
                        - db
                environment:
                        - DEBUG=1...
                restart: always

```

## Note:
The code and scripts used in the project are written by [montdata.com](https://github.com/montdata) :+1:

## Roadmap
See the [open issues](https://github.com/pages-themes/architect/issues) for a list of proposed features (and known issues).

## Project philosophy

The montd-io project is intended to make it quick and easy for IT Professionals to start monitoring your infrastructure. 

montd-io observability stack should meet the vast majority of users' needs out of the box for **VMs**, **O.S.**, **APP**, **DB** and **CLOUD** ***Monitoring***

montd-io cloudops should help everyone that needs to manage costs, orchestrate or even have a webpage to start and stop **multi cloud** VMs. Based on https://mist.io/ with some additions and dashboards.

montd-io dataops is a complete stack for storing relational and non relational DATA (with postgreSQL and ElasticSearch), and have a easy management tool (https://www.adminer.org/)

## Contributing

Interested in contributing to this project? We'd love your help. Montd-io is an open platform, built one contribution at a time by users like you. See [the CONTRIBUTING file](docs/CONTRIBUTING.md) for instructions on how to contribute.

### Previewing the environment locally

If you'd like to preview the containers running locally (for example, in the process of local development):

1. Clone down the observability repository (`git clone https://github.com/montdata/montd-io`)
2. `cd` into the *observability-stack* directory
3. Run `docker-compose up -d` to start the montd-io servers (`docker-compose ps` to check containers online)
4. Visit [`localhost:3000`](http://localhost:3000) in your browser to enter Grafana (admin/admin)
