# AWS VPC Networking & Cross-VPC Architecture Guide

> **Note**: This document provides a detailed technical guide on AWS VPC default behaviors, IP planning, VPC Peering scalability challenges, and central hub architecture using AWS Transit Gateway, along with architectural comparisons to Google Cloud Platform (GCP) VPCs.

---

## 1. AWS VPC Default Behaviors & Rules

### Subnet Route Table Association
* **Implicit Association**: Any subnet created without explicit route table association automatically binds to the VPC's **Default Route Table**[cite: 1].
* **Security & Traffic Flow**: Modifying the default route table impacts all implicitly associated subnets. It is recommended best practice to explicitly associate subnets with dedicated custom route tables (e.g., Public RT, Private RT).

### Isolation & Private Routing
* **Default Boundary**: By default, VPCs are completely isolated boundary environments. Even if two VPCs exist in the **same AWS Region** (whether Default VPC or Custom VPC), they **cannot communicate directly** over private IP addresses[cite: 1].
* **Public Internet Fallback**: Traffic between two unpeered VPCs can only travel across the **Public Internet** (e.g., via Internet Gateways / Public IPs)[cite: 1].

### Outbound vs. Inbound Reachability (NAT Gateway)
* **EC2 Internet Access**: Instances within subnets configured with proper routing (IGW or NAT Gateway) can initiate outbound connections to the public internet and receive return traffic[cite: 1].
* **NAT Gateway Behavior**: A NAT Gateway enables instances in a private subnet to connect to external services (**outbound-initiated**), but explicitly **blocks all inbound-initiated connections** originating from outside[cite: 1].

### Critical Prerequisite: IP Address Planning
* Before designing or connecting multiple VPCs, **IP Address Planning** (selecting non-overlapping CIDR blocks) is mandatory[cite: 1].
* **VPC Peering Requirement**: Overlapping CIDRs (e.g., `172.31.0.0/16` in two different VPCs) will prevent VPC Peering or Transit Gateway routing from functioning properly[cite: 1].

---

## 2. Inter-VPC Connectivity & Scaling Models

When connecting multiple AWS VPCs, two main patterns exist: **VPC Peering** and **AWS Transit Gateway**.