Stouts.graphite-beacon
======================

[![Build Status](http://img.shields.io/travis/Stouts/Stouts.graphite-beacon.svg?style=flat-square)](https://travis-ci.org/Stouts/Stouts.graphite-beacon)
[![Galaxy](http://img.shields.io/badge/galaxy-Stouts.graphite-beacon-blue.svg?style=flat-square)](https://galaxy.graphite-beacon.com/list#/roles/1944)
[![Tag](http://img.shields.io/github/tag/Stouts/Stouts.graphite-beacon.svg?style=flat-square)]()

Ansible role which manage [Graphite-beacon](https://github.com/klen/graphite-beacon)

* Install and configure Graphite-beacon


#### Variables

Here is the list of all variables and their default values:

```yaml
graphite_beacon_enabled: yes                    # The role is enabled

# Setup options
graphite_beacon_graphite_url: "http://localhost"
graphite_beacon_auth_username:
graphite_beacon_auth_password:
graphite_beacon_pidfile:  "/opt/graphite/beacon/beacon.pid"
graphite_beacon_interval: 10minute
graphite_beacon_logging: info
graphite_beacon_method: average
graphite_beacon_prefix: "[BEACON]"
graphite_beacon_critical_handlers: [log, smtp]
graphite_beacon_warning_handlers: [log, smtp]
graphite_beacon_normal_handlers: [log, smtp]
graphite_beacon_repeat: 2hour
graphite_beacon_format: short

# SMTP Options
graphite_beacon_smtp_from: "beacon@{{inventory_hostname}}"
graphite_beacon_smtp_to: []
graphite_beacon_smtp_host: "localhost"
graphite_beacon_smtp_port: 25
graphite_beacon_smtp_username:
graphite_beacon_smtp_password:
graphite_beacon_smtp_use_tls: no

# HipChat options
graphite_beacon_hipchat_room:
graphite_beacon_hipchat_key:

# Place your alerts
graphite_beacon_alerts: []
```

#### Usage

Add `Stouts.graphite-beacon` to your roles and setup the variables in your playbook file.
Example:

```yaml

- hosts: all

  roles:
    - Stouts.graphite-beacon

  vars:
    graphite_beacon_graphite_url:  http://127.0.0.1:8080
    graphite_beacon_logging: debug
    graphite_beacon_smtp_from: beacon@graphite
    graphite_beacon_smtp_to: [admin@gmail.com]
    graphite_beacon_alerts:
    - name: Memory
      query: aliasByNode(*.memory.memory-free, 0)
      interval: 5minute
      rules:
        - type: critical
          operator: lt
          value: 100000000
        - type: warning
          operator: lt
          value: 200000000
```

#### License

Licensed under the MIT License. See the LICENSE file for details.

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Stouts/Stouts.graphite-beacon/issues)!
