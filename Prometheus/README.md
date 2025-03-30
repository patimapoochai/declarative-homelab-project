## Overview
Prometheus will be installed using Helm to a Rocky Linux host in the `prometheus` group.

## Resources
node_exporter systemd examples from [github](https://github.com/prometheus/node_exporter/tree/master/examples/systemd)
prometheus install tutorial by [stevescargall](https://stevescargall.com/blog/2021/12/how-to-install-prometheus-and-grafana-on-fedora-server/)
setup with grafana tutorial by [Christian Lempa](https://www.youtube.com/watch?v=9TJx7QTrTyo)

## Installation
- Create the Prometheus configuration file at `prometheus-config/prometheus.yml`
- Install the Prometheus server by running the `setup-prometheus-rocky9.yml` playbook
- Install the node exporter to the host by running the `setup-node-exporter-rocky9.yml` playbook
