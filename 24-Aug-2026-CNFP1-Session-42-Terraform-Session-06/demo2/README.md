# Conditional EC2 Key Pair Provisioning

## Overview
A reusable Terraform module pattern for provisioning an AWS EC2 SSH Key Pair conditionally using the `count` meta-argument.

---

[ Input Variables ]
        │
        ├──> var.create_ec2_ssh_keypair ──> Checked by `count` (1 or 0)
        │
        ├──> var.ec2_ssh_public_key ─────> Attached to AWS Key Pair
        │
        └──> Tags (Prefix + Key Name + Common Tags) ──> Merged via `merge()`

## Key Features

■　Conditional Creation: Set `create_ec2_ssh_keypair = true` to deploy, or `false` to skip.
■　Dynamic Tag Merging: Combines a prefix-based `Name` tag, a key-specific `Name` tag, and custom `common_tags`.
■　Parameter-Driven: Fully configured via input variables without hardcoded values.

---

# Terraform `merge()` Conflict Resolution Rules

When multiple maps share the same key name, Terraform evaluates them from **left to right**. The last map in the list takes precedence and overwrites any earlier values for that key.

---
