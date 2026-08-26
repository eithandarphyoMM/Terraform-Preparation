# AWS Networking Core Concepts & Cheat Sheet

This note file synthesizes core networking rules, routing logic, and firewall evaluation sequences derived from the VPC system design notes[cite: 1].

---

## 🔒 0 Trust: Trust Nothing, Verify Everything

The Zero Trust architecture operates on the principle that no connection, implicit route, or external entity is trusted by default[cite: 1]. 

* **Dual Network Layer Validation**: For traffic to flow, both the **Route Table (Network layer)** AND the **Security Group (Instance layer)** must explicitly authorize the pathway[cite: 1].
* **Inbound Lockdown**: An EC2 instance with an unconfigured/blank Inbound Security Group rule will drop all incoming traffic regardless of subnet settings[cite: 1].
* **Outbound Lockdown**: Attaching a NAT Gateway to a Route Table does NOT automatically grant internet access[cite: 1]. The EC2 instance's Security Group Outbound Rule must explicitly allow external destinations[cite: 1].
* **Network Isolation**: Complete isolation is achieved by removing external targets (`IGW`/`NAT GW`) from private Route Tables[cite: 1].

---

## 🔢 CIDR & Subnetting Reference

### 1. The `/24` Netmask Breakdown
* **Structure**: 32 bits total ($4 \times 8$-bit octets: `a.b.c.d`)[cite: 1].
* **Hosts per Subnet**: $2^8 = 256$ total addresses (251 usable due to 5 AWS-reserved IPs)[cite: 1].
* **Address Mapping**:
  * Network ID: `10.0.1.0`[cite: 1]
  * Usable IPs: `10.0.1.1` to `10.0.1.254`[cite: 1]
  * Broadcast ID: `10.0.1.255`[cite: 1]

### 2. The `/29` Micro-Subnetting Example
* **Hosts per Subnet**: $2^3 = 8$ IP addresses[cite: 1].
* **Subnet Ranges**:
  * 1st Subnet: `10.0.0.0/29`[cite: 1]
  * 2nd Subnet: `10.0.1.0/29`[cite: 1]
  * 3rd Subnet: `10.0.2.0/29`[cite: 1]
  * Last Subnet: `10.0.255.0/29`[cite: 1]

---

## 🗺️ Route Tables & Routing Rules

1. **Routing Hierarchy**: EC2 instances look at the **Route Table** associated with their subnet to determine network communication pathways[cite: 1].
2. **Immutable Local Route**: Every route table automatically includes `10.0.0.0/16 -> local`[cite: 1].
   * This default entry **cannot be deleted**[cite: 1].
   * It allows all subnets inside the VPC to communicate with each other locally[cite: 1].
3. **Isolated Subnets**: If a subnet's route table lacks an `IGW` or `NAT GW` target, instances inside it cannot reach the internet nor accept internet traffic[cite: 1].

---

## 🔌 NAT Gateways vs. Public IPs

* **NAT Gateway Characteristics**:
  * Deployed inside a public subnet[cite: 1].
  * Has both a **Private IP** and a **Public IPv4 IP**[cite: 1].
  * Allows private instances to initiate outbound requests while blocking inbound internet requests[cite: 1].
* **Constraint**: An instance must route through either a direct Public IP or a NAT Gateway—attempting conflicting setups can result in routing failures[cite: 1].

---

## 🔒 Security Group Evaluation Sequence

Security Groups operate as stateful firewalls at the EC2 instance level[cite: 1]:

* **Inbound Rules**: Evaluated when external clients attempt to connect *into* the instance[cite: 1].
  * If the rule set is blank, all incoming connections are **denied** by default[cite: 1].
* **Outbound Rules**: Evaluated when the instance initiates communication *outward*[cite: 1].
  * **Critical Dependency**: Even if a NAT Gateway or Internet Gateway is attached to the route table, **if the Security Group Outbound Rule is empty, the instance cannot reach the internet**[cite: 1].

| Rule Type | Setting | Result |
|---|---|---|
| **Inbound** | Empty / Blank | All incoming requests blocked[cite: 1]. |
| **Inbound** | `Port 22 (SSH)` from `0.0.0.0/0` | Open SSH access (*Security risk*)[cite: 1]. |
| **Inbound** | `Port 22 (SSH)` from `Custom IP` | Restricted SSH access[cite: 1]. |
| **Outbound** | `ALL / ALL` (`0.0.0.0/0`) | Egress permitted[cite: 1]. |
| **Outbound** | Empty / Blank | All outgoing traffic blocked (overrides NAT GW)[cite: 1]. |