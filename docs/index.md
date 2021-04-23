
---
layout: default
title: Home
nav_order: 1
has_children: true
---
# o12stack.org documentation

We strive to build a free and open source observability solution 
for Kubernetes with "smaller clusters, more of them" in mind.
{: .fs-6 .fw-300}

[Demos / Proof of concepts](https://github.com/observabilitystack/demo/blob/master/README.md){: .btn .btn-purple }
[Quick start](docs/quickstart.html){: .btn }
[View on GitHub](https://github.com/observabilitystack/k8s-stack){: .btn }

* * *

The _observabilitystack_ (o12stack) strives to combine the best-in-class 
open source monitoring and observability tools in a pre-configured turn-key 
solution. Using the Kubernetes package manager [Helm](https://helm.sh/) 
you can deploy the full stack in seconds. The stack is fully configurable 
and extendble via _Helm_. Of course you can enable and disable tools for 
a perfect fit to your infrastructure.

* * *

Coming soon
{: .label .label-yellow }

_We're currently ramping up our efforts to provide a seamless experience.
Stay tuned!_
{: .text-grey-dk-000}

## Tools to be included

* __Filebeat__ (Logfile harvester)
* __Logstash__ (Logfile enrichment and routing)
* __Elasticsearch__ (Metric storage)
* __Graylog__ (Logfile visualisation)
* __Prometheus__ (Cluster and Pod metrics)
* __Grafana__ (Metric visualisation)

## License

The Observabilitystack configuration is distributed by an [MIT license](LICENSE).

## Contributing
When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change.







Montd.io project aims to be an open easy-to-use platform build with [Docker](https://docker.io) to Observability (metrics, monitoring, and alerting), cloud operations tools and dataops toolkit.

We provide container infrastructure for observability, with core and extended customizations using [Grafana](https://grafana.com/) to create and share custom analytical dashboards, [Prometheus](https://prometheus.io/) for metrics storage and [Alerta](https://alerta.io) for alerting dashboards.

You can deploy montd.io stack by running only one docker-compose command on your shell for each stack (Observability, CloudOps or DataOps)
The Docker Compose YAML file(docker-compose.yml) defines all the configurations, containers and components, making montd.io really easy to set up and start running

Start [using it today](#usage).


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

## Note:
The code and scripts used in the project are written by [montdata.com](https://github.com/montdata) :+1:

### Previewing the environment locally

If you'd like to preview the containers running locally (for example, in the process of local development):

1. Clone down the observability repository (`git clone https://github.com/montdata/observability`)
2. `cd` into the *observability* directory
3. Run `docker-compose up -d` to start the montd-io servers (`docker-compose ps` to check containers online)
4. Visit [`localhost:3000`](http://localhost:3000) in your browser to enter Grafana (admin/foobar)
