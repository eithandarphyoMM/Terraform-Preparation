# CNFP1 Session 34 - Terraform Session 03

## Overview
Notes and key concepts covering Terraform local values, input variables, variable evaluation hierarchy, automated environment management using `direnv`, and provider behavior.

---

## 1. Locals vs. Variables

* `locals`: Fixed internal logic and temporary values defined within the configuration. They cannot be overridden directly by CLI flags or external inputs.
* `variables`: Dynamic input parameters that allow external values to be passed into the Terraform configuration during execution.

---

## 2. Variable Precedence

When the same variable is set in multiple places, Terraform evaluates values in the following order (Highest to Lowest priority):

1. CLI Flags: `-var` or `-var-file` options passed directly into `terraform apply` or `plan`.
2. Auto Variable Files: Any `*.auto.tfvars` or `*.auto.tfvars.json` files loaded automatically.
3. Standard Variable File: `terraform.tfvars` or `terraform.tfvars.json`.
4. Environment Variables: Variables set in the OS environment starting with the `TF_VAR_` prefix (e.g., `TF_VAR_db_name`).
5. Block Defaults: Default values declared inside `variable "name" { default = "value" }`.

---

## 3. Environment Variables & `.envrc` Setup

* Manual Export: Running `export TF_VAR_name="value"` manually in a terminal only persists for that active session window.
* Automated via `direnv`:
  * Using a `.envrc` file alongside the `direnv` utility automatically exports variables whenever you enter the project directory.
  * Pattern: Define variables in `.envrc` using `export TF_VAR_<variable_name>="value"`.

---

## 4. Execution Behavior & Providers

### Random Provider
* Utility Provider: Operates entirely locally to generate random strings, numbers, or suffixes without making network calls or interacting with external infrastructure APIs (like AWS).
* No explicit provider block configuration is required before use.

### `known after apply`
* Computed Values: Shown in `terraform plan` when attribute values (e.g., resource IDs or random generator results) can only be calculated during actual resource provisioning.

### Resource Replacement (`-+`)
* `destroy and then create replacement`: Symbolized as `-+` in execution plans. This occurs when changing an attribute on a resource that AWS or the target API does not allow updating in-place, forcing Terraform to tear down the old resource and provision a new one.
