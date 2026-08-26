# AWS vs GCP Networking: VPC Behaviors, Peering & Transit Gateway

## 1. My Notes

### Default VPC Behavior
* **Route Tables**: If a subnet is not explicitly associated with any route table, it is automatically associated with the **Default Route Table**[cite: 1].
* **Isolation**: By default, VPCs (even in the same region, whether default or custom) **cannot communicate** with each other directly[cite: 1].
* **Internet Reachability**: EC2 instances inside default/configured subnets can communicate out to the internet and receive internet responses[cite: 1].
* **Prerequisite**: Proper **IP Address Planning** (non-overlapping CIDR blocks) is critical before designing inter-VPC networks[cite: 1].

---

### Inter-VPC Communication Challenges
* By default, VPCs in the same region cannot talk to each other directly over private IP addresses[cite: 1].
* **Public Internet Path**: They can only communicate by routing traffic out through the **Public Internet**[cite: 1].
* **NAT Gateway Limitation**: A NAT Gateway only allows **outbound** initiated traffic; it blocks **inbound** connections initiated from outside[cite: 1].

---

### Solution 1: VPC Peering
VPC Peering enables direct, private routing between two VPCs[cite: 1].
* **Supported Scenarios**:
  * Same Region (Same Account)[cite: 1]
  * Different Region (Same Account)[cite: 1]
  * Same Region (Different Account)[cite: 1]
  * Different Region (Different Account)[cite: 1]

#### Fully Mesh Formula
When using direct VPC Peering across $n$ VPCs, every VPC must be peered with every other VPC. The total number of peering connections required scales quadratically[cite: 1]:

$$\text{Total Connections} = \frac{n(n - 1)}{2}$$

* **Example**: For $n = 100$ VPCs:
  $$\frac{100 \times 99}{2} = 4,950 \text{ Peering Connections}$$

---

### Solution 2: AWS Transit Gateway
* **Eliminating Full Mesh**: To avoid managing thousands of peering connections without transitive routing support, use **AWS Transit Gateway**[cite: 1].
* **Hub-and-Spoke**: Acts as a central cloud router where each VPC only needs a single attachment, avoiding $n(n-1)/2$ complexity[cite: 1].

---

## 2. Comparison: AWS VPC vs. GCP VPC & Connectivity Paradigms

### Architectural Scope Comparison

| Feature | AWS VPC | GCP VPC |
| :--- | :--- | :--- |
| **Network Scope** | **Regional** (Bound to a single AWS region) | **Global** (Spans multiple GCP regions within one VPC) |
| **Subnet Scope** | Availability Zone (AZ) level | Regional level (spans all AZs in that region) |
| **Cross-Region Traffic** | Requires VPC Peering or Transit Gateway | **Native** out-of-the-box using internal GCP backbone |
| **Multi-Project / Account** | Requires RAM, VPC Peering, or TGW | **Shared VPC** allows subnets to be shared across projects natively |

---

### Connectivity Methods: Peering vs. Transit Gateway / Hubs

| Metric / Parameter | Full Mesh Peering (AWS / GCP) | AWS Transit Gateway (TGW) |
| :--- | :--- | :--- |
| **Topology Model** | Point-to-Point Mesh[cite: 1] | Centralized Hub-and-Spoke[cite: 1] |
| **Transitive Routing** | **Not Supported** (A $\leftrightarrow$ B and B $\leftrightarrow$ C does not mean A $\leftrightarrow$ C) | **Supported** (Traffic routes transitively through the hub) |
| **Connection Scaling** | Exponential: $\frac{n(n-1)}{2}$[cite: 1] | Linear: $n$ attachments |
| **Management Overhead** | High (Route tables grow exponentially) | Low (Centralized routing and security policy enforcement) |
| **Cost Structure** | Data transfer charges only | Base hourly attachment fee + per-GB data processing fee |
| **Best Use Case** | Small setups ($< 5$ VPCs) or isolated pairs | Enterprise multi-VPC, multi-account & hybrid infrastructure |