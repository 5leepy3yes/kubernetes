# Local Kind Kubernetes CI/CD & Monitoring Lab

A lightweight, local 3-node Kubernetes cluster orchestrated via `kind` (Kubernetes in Docker), featuring an automated CI/CD pipeline using Jenkins-as-Code (JCasC) and Zabbix network monitoring.

---

## Architecture Overview

The environment runs locally on Docker Desktop and provisions a multi-node Kubernetes cluster configured for automated infrastructure provisioning and observability.

* **Cluster Topology:** 1 Control Plane node + 2 Worker nodes (configured via `kind`).
* **Tooling Stack:** Helm, Jenkins (Ephemeral Agent Pods), Terraform, Ansible, and Zabbix.
* **Namespaces:**
  * `jenkins` — Hosts Jenkins controller and dynamic worker pods.
  * `monitoring` — Hosts Zabbix server, frontend, and database components.
* **Network Integration:** Zabbix is pre-configured via JCasC deployments to automatically discover and monitor cluster subnets (e.g., `192.168.50.0/24`).

---

* ## Prerequisites

Ensure the following tools and versions are installed and available in your local Windows environment:
* [Docker Desktop](https://www.docker.com/) (running with sufficient resource allocation)
* [kind](https://kind.sigs.k8s.io/) (`v0.33.0` or later)
* [kubectl](https://kubernetes.io/docs/tasks/tools/) (`v1.37.2` or later)
* [Helm](https://helm.sh/) (`v4.3.1` or later)
* [PowerShell Core](https://learn.microsoft.com/en-us/powershell/scripting/install/install-powershell?view=powershell-7.6) (`7.6`)

---

## Deployment Guide

   ```
git clone https://github.com/5leepy3yes/kubernetes.git
cd kubernetes
   ```

---

## Screenshots

<img width="1851" height="418" alt="image" src="https://github.com/user-attachments/assets/e89bf909-0ce0-4f36-b94b-6eef81635a6d" />

<img width="2511" height="836" alt="image" src="https://github.com/user-attachments/assets/1a799545-cfd2-4b79-8e27-b2cb6ef4ad29" />

<img width="2541" height="885" alt="image" src="https://github.com/user-attachments/assets/8c1021c7-0486-488a-a1ec-0abef046fdf7" />
