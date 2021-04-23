
---
layout: default
title: Home
nav_order: 1
has_children: true
---
# montd.io documentation



Montd.io project aims to be an open easy-to-use platform build with [Docker](https://docker.io) to Observability (metrics, monitoring, and alerting), cloud operations tools and dataops toolkit.

We provide container infrastructure for observability, with core and extended customizations using [Grafana](https://grafana.com/) to create and share custom analytical dashboards, [Prometheus](https://prometheus.io/) for metrics storage and [Alerta](https://alerta.io) for alerting dashboards. We strive to build a free and open source observability stacks, 
for Docker, Cloud, Kubernetes or even Raspberry Pi.

You can deploy montd.io stack by running only one docker-compose command on your shell for each stack (Cloud, Infrastructure, Database, Application or Web)
The Docker Compose YAML file(docker-compose.yml) defines all the configurations, containers and components, making montd.io really easy to set up and start running

Start [using it today](#usage).


[Single / Demo Stack](https://github.com/montdata/montd-observability-demo){: .btn .btn-purple }
[Quick start](docs/quickstart.html){: .btn }
[GitHub Repos](https://github.com/montdata){: .btn }

* * *

The montd.io vision is to combine the best-in-class open source cloud native observability tools in a pre-configured turn-key solution. 
Using the Kubernetes package manager [Helm](https://helm.sh/) 
you can deploy the full stack in seconds. The stack is fully configurable 
and extendble via _Helm_. Of course you can enable and disable tools for 
a perfect fit to your infrastructure.

## License

The Observabilitystack configuration is distributed by an [MIT license](LICENSE).

## Contributing
When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change.


# Observability Stack :rocket:

A container based observability platform that can run in any Virtual Machine, Public Cloud as Microsoft Azure or Oracle Cloud and even Raspberry Pi (testing)

Creates a complete setup for Grafana, Alerta, Prometheus, Graphite (and Loki in the roadmap).

![Thumbnail of Architect](img/thumbnail.png)



## Ports to play :eyes:

** Observability
* AlertaWeb IP on port `8080`
* Grafana IP on port `3000`
* Graphite IP on port `2003`
* Prometheus IP on port `9090`


## Usage

We have three principal repositories:

- [Observability Stack](https://github.com/montdata/observability), using Grafana for dashboarding, Prometheus for metrics and Alerta.io for Alert list
- CloudOps Management Stack with Mist.io
- DataOps Stack, with PostgreSQL & Adminer


## Note:
The code and scripts used in the project are written by [montdata.com](https://github.com/montdata) :+1:

### Previewing the environment locally

If you'd like to preview the containers running locally (for example, in the process of local development):

1. Clone down the observability repository (`git clone https://github.com/montdata/observability`)
2. `cd` into the *observability* directory
3. Run `docker-compose up -d` to start the montd-io servers (`docker-compose ps` to check containers online)
4. Visit [`localhost:3000`](http://localhost:3000) in your browser to enter Grafana (admin/foobar)
