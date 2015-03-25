Stouts.graphite-beacon
======================

[![Build Status](http://img.shields.io/travis/Stouts/Stouts.graphite-beacon.svg?style=flat-square)](https://travis-ci.org/Stouts/Stouts.graphite-beacon)
[![Galaxy](http://img.shields.io/badge/galaxy-Stouts.graphite-beacon-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/2022)

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
graphite_beacon_handlers: [log, smtp]
graphite_beacon_critical_handlers: "{{graphite_beacon_handlers}}"
graphite_beacon_warning_handlers: "{{graphite_beacon_handlers}}"
graphite_beacon_normal_handlers: "{{graphite_beacon_handlers}}"
graphite_beacon_repeat: 2hour
graphite_beacon_format: short
graphite_beacon_send_initial: no

# SMTP Options
graphite_beacon_smtp_from: "beacon@{{inventory_hostname}}"
graphite_beacon_smtp_to: []
graphite_beacon_smtp_host: "localhost"
graphite_beacon_smtp_port: 25
graphite_beacon_smtp_username:
graphite_beacon_smtp_password:
graphite_beacon_smtp_use_tls: no
graphite_beacon_smtp_graphite_url: "{{graphite_beacon_graphite_url}}"

# HipChat options
graphite_beacon_hipchat_room:
graphite_beacon_hipchat_key:

# Slack options
graphite_beacon_slack_woobhook:
graphite_beacon_slack_channel:
graphite_beacon_slack_username: graphite-beacon

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
      - critical: < 100MB
      - warning: < 200MB
```

#### License

Licensed under the MIT License. See the LICENSE file for details.

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Stouts/Stouts.graphite-beacon/issues)!
