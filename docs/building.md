---
layout: default
title: Quick Installation
nav_order: 100
---

* * *


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
