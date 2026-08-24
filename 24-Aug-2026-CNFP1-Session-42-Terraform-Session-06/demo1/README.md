# CNFP1 Session 42 - Terraform Session 06

ssh keygen

ssh keygen -t rsa

# Please use `-y -f flag` to derive the public key from the private key and compare it to your stored public key
ssh-keygen -y -f id_ed25519 > derived_public_key

# Use `diff` command to compare, and if there's no output from the diff command, the keys match.
diff derived_public_key id_ed25519.pub

##################################################################################################################################################


# Automated SSH Key Pair Management with Terraform

## Overview
Automated SSH key pair generation and management using Terraform. It dynamically creates a secure RSA 4096-bit SSH key pair, uploads the **public key** to AWS, and saves the **private key** locally with restricted `400` permissions.

---

## 1. Key Concept & SSH Architecture Pattern

### Key Direction
* **Private Key**: Saved **locally** on your workstation (`./generated/<deployment_id>-key.pem`).
* **Public Key**: Uploaded **to AWS** (`aws_key_pair`) for EC2 instance authorization.

> **Security Rule:** Never expose or push private keys to cloud providers or version control repository files.

---

## 2. Terraform Providers

This configuration uses **3 Terraform Providers**:

| Provider | Purpose | Resources Used |
| :--- | :--- | :--- |
| **`aws`** | Manages AWS EC2 SSH key pairs | `aws_key_pair.this` |
| **`tls`** | Generates secure in-memory RSA key pairs | `tls_private_key.ssh` |
| **`local`** ( & `random`) | Manages local filesystem outputs and dynamic string generation | `local_file.private_key`, `random_string.suffix` |

### How to Confirm Active Providers via CLI
Run the following command in your terminal to inspect used providers:

```bash
terraform providers

##################################################################################################################################################


# Permission Calculation Breakdown

## Target File
`hellocloud-tf-zqh0cqrc-key.pem`

---

## 1. Raw Output vs. Numeric Conversion

* Raw String: `-rwxr-xr-x`
* Calculated Octal: `755`

---

## 2. Detailed Breakdown

| Entity | String | Calculation | Result | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| File Type | `-` | N/A | `-` | Regular File |
| Owner | `rwx` | Read (4) + Write (2) + Execute (1) | 7 | Full Access |
| Group | `r-x` | Read (4) + Write (0) + Execute (1) | 5 | Read & Execute |
| Others | `r-x` | Read (4) + Write (0) + Execute (1) | 5 | Read & Execute |

---

## 3. SSH Security Note

* Current Permission (`755`): Unsafe for SSH key files. SSH clients require private keys to be unreadable by group or others.
* Required Permission (`400`): Sets read-only access strictly for the owner.

```bash
# Correct command to secure the key
chmod 400 hellocloud-tf-zqh0cqrc-key.pem

##################################################################################################################################################


# HCP Terraform Configuration
https://developer.hashicorp.com/terraform/language/settings/cloud

# Remote Operations
https://developer.hashicorp.com/terraform/cloud-docs/run/remote-operations

# CLI-driven Run Workflow
https://developer.hashicorp.com/terraform/cloud-docs/run/cli


# https://graphviz.org/download/#mac
brew install graphviz

💡https://developer.hashicorp.com/terraform/cli/commands/graph
terraform graph -type=plan | dot -Tpng >graph.png
