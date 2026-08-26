# AWS VPC Network Architecture & Infrastructure Guide

This repository contains the architecture breakdown, subnetting reference calculations, security configurations, and Zero Trust enforcement rules for an AWS Virtual Private Cloud (VPC) topology in the `ap-northeast-1` (Tokyo) region.

---

## 🌐 Architecture Diagram

```text
                    +-----------------------+
                    |    Remote Client      |
                    |   (abc-private-key)   |
                    +-----------+-----------+
                                | SSH (Port 22)
                                v
                      +-------------------+
                      |     Internet      |
                      +---------+---------+
                                |
                                v
                    +-----------------------+
                    |   Internet Gateway    |
                    +-----------+-----------+
                                |
        +-----------------------+-----------------------+
        |                                               |
        v                                               v
+-------------------------------+               +-------------------------------+
|     Public Subnets            |               |    Private Subnets            |
| - Public IP / NAT Gateways    |               | - App / DB EC2 Instances      |
| - Routes to IGW (0.0.0.0/0)   |               | - Egress via NAT GW           |
+-------------------------------+               +-------------------------------+