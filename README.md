# SQL Server Deployment

Example of SQL Server provision on Google  Cloud Platform (GCP) using Terraform and Ansible.

This example has been used for testing of SQL Server deployment to GCP, to validate following concerns:
- High memory usage, more than 256GB, check for OOM and memory pressure
- Validate local SSD disk performance, mainly for TempDB
- Validate persistance disk performance (IOPS and throughput)
- Validate CPU usage (not critical)
- Validate all GCP specifics (custom instance with extended memory, local SSD, persistance disks)

What was out of scope:
- AlwaysOn deployment of SQL Server

## Quick start

```
# initialize terraform
terraform init

# check plan and components that will be deployed
terraform plan

# deploy components
terraform apply
```

## Configuration



