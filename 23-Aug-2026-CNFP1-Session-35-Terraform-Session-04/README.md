# CNFP1 Session 35 - Terraform Session 04

## Raw Session Notes

* State file stored on cloud.
* Transition: Local driven workflow to CLI driven workflow.

### Commands & Execution Behavior
* `terraform init`
  * *Local driven workflow:* Uses local backend.
  * *CLI driven workflow:* Initializing HCP Terraform.
* `terraform plan`
  * Running plan in HCP Terraform.
* `terraform apply`
  * Running apply in HCP Terraform.

---

## 1. Remote Backend Configuration

Add the `cloud` block inside your `terraform {}` configuration to link your local project directory to your HCP Terraform workspace:

```hcl
terraform {
  cloud {
    organization = "HelloCloud_learning" # Workspace organization name
    hostname     = "app.terraform.io"     # Default for HCP Terraform (optional unless using Terraform Enterprise)

    workspaces {
      name = "hellocloud-tfc-random-string" # Target workspace name
    }
  }
}


# Feature Comparison: HCP Terraform vs. AWS S3 + DynamoDB

| Feature                      | HCP Terraform (Terraform Cloud)            | AWS (S3 + DynamoDB) |
| :---                         | :---                                       | :--- |
| Backend Type                 | Managed SaaS (`cloud` block)               | Self-managed AWS (`s3` backend) |
| State File Storage           | Encrypted managed cloud storage            | AWS S3 Bucket (Requires manual bucket creation) |
| State Locking                | Built-in automatically                     | Managed via DynamoDB table with `LockID` primary key |
| Execution Engine             | Remote (HCP Cloud) or Local CLI            | Local machine or CI/CD runner |
| Secret & Variable Management | Native Workspace Variables & Secrets       | AWS Secrets Manager / Parameter Store / IAM |
| Setup Overhead               | Low (Sign up & add `cloud {}` block)       | Medium (Provision S3 bucket & DynamoDB table first) |
| Cost Model                   | Free tier available (per-user/run billing) | AWS usage pricing (S3 storage + DynamoDB RCU/WCU) |
| Collaboration Features       | Team RBAC, Policy-as-Code (Sentinel/OPA)   | IAM policies, GitHub Actions / CI pipeline integration |
