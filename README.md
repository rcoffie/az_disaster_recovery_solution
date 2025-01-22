# Disaster Recovery Solution with Terraform

This project demonstrates how to implement a **Disaster Recovery Solution** in Azure using **Terraform**. The solution ensures high availability and resiliency of critical virtual machines (VMs) through replication, backups, and failover capabilities.

## Features

1. **Infrastructure Deployment**:
   - Sets up primary and secondary resource groups in different Azure regions.
   - Creates virtual networks, subnets, and associated resources.
   - Deploys a Windows VM with a premium OS disk in the primary region.

2. **Backup and Recovery**:
   - Configures an Azure Recovery Services Vault for backup.
   - Implements Azure Site Recovery for VM replication between regions.
   - Configures failover and failback scenarios.

3. **Networking**:
   - Sets up public IP addresses and network interfaces for the VMs.
   - Maps primary and secondary networks for seamless disaster recovery.

4. **Randomized Resource Naming**:
   - Generates unique suffixes for storage accounts to avoid naming conflicts.

## Prerequisites

- **Terraform** (>= 1.0.0) installed on your system.
- Azure subscription with permissions to create resources.
- Service principal credentials for Terraform authentication.

## Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/rcoffie/az_disaster_recovery_solution.git
   cd az_disaster_recovery_solution 
   ```

2. **Navigate into the Terraform Folder**:
   ```bash
   cd terraform
   ```

3. **Initialize Terraform**:
   ```bash
   terraform init
   ```

4. **Preview the Changes**:
   ```bash
   terraform plan
   ```

5. **Apply the Configuration**:
   ```bash
   terraform apply
   ```
   Confirm the prompt to deploy the infrastructure.

6. **Verify Deployment**:
   - Check the Azure portal for resource groups, VMs, and Site Recovery settings.
   - Test the failover and failback scenarios as configured.

## Project Structure

```plaintext
.
├── main.tf        # Primary Terraform configuration file
├── version.tf        # Define the required Terraform and provider vesions
├── site_recovery.tf        # Terraform Conifguration for the site recovery
├── storage.tf        # Configuration for storage
├── vault.tf        # Vault configuration
├── network.tf        # Network Configuration
├── vm.tf        # Virtual Machine configuration
├── terraform.tfvars        # Stores input variables for Terraform configuration
├── variables.tf   # Input variables for the Terraform project
├── outputs.tf     # Outputs for key resource identifiers
├── README.md      # Project documentation
```

## Key Components

### 1. **Azure Resource Groups**
- Primary: `tfex-windows-vm-primary` (West US)
- Secondary: `tfex-windows-vm-secondary` (East US)

### 2. **Azure Site Recovery**
- Recovery Services Vault: `example-recovery-vault`
- Protection Containers and Replication Policies configured for seamless failover.

### 3. **Networking**
- Virtual Networks:
  - `network1` (Primary)
  - `network2` (Secondary)
- Subnets:
  - `network1-subnet`
  - `network2-subnet`

### 4. **VM Deployment**
- Name: `windows-vm`
- Size: `Standard_DS1_v2`
- OS: Windows Server 2019 Datacenter

## Design Overview

### **Disaster Recovery Plan**
- **Objective**: Establish a backup and recovery system for critical VMs.
- **Steps**:
  1. Use Azure Site Recovery for cross-region VM replication.
  2. Schedule regular backups via Azure Backup.
  3. Configure and test failover/failback scenarios.

### **Azure Services Used**
- **Azure Backup**: Ensures data integrity through scheduled backups.
- **Azure Site Recovery**: Handles VM replication and disaster recovery testing.

## Cleanup

To remove all deployed resources:
```bash
terraform destroy
```

Confirm the prompt to delete the infrastructure.

## References

- [Terraform Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure Site Recovery Overview](https://learn.microsoft.com/en-us/azure/site-recovery/site-recovery-overview)




