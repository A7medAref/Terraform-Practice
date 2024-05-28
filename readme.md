# Terraform Practice Repository

This repository contains various examples and practices for using Terraform to manage infrastructure. Each directory includes specific Terraform configurations and examples demonstrating different aspects of Terraform usage.

## Directory Structure

- **1-Simple-EC2-AWS-instance**: Basic example of creating an EC2 instance in AWS.
- **2-EC2-with-elastic-ip**: Example of creating an EC2 instance with an Elastic IP.
- **3-COUNTER-AND-VARIABLES**: Demonstrates the use of counters and variables in Terraform configurations.
- **4-DATASOURCES**: Shows how to use data sources in Terraform.
- **5-DATASOURCES**: Another example of using data sources.
- **6-GRAPH**: Illustrates Terraform's graphing capabilities.
- **7-REMOTE-EXEC-PROVISIONER**: Example using the remote-exec provisioner.

## Getting Started

1. **Install Terraform**: Ensure Terraform is installed on your system. You can download it from [Terraforms official website](https://www.terraform.io/downloads.html).
2. **Initialize Terraform**: Navigate to the desired example directory and run:

   ```bash
   terraform init
   ```

3. **Apply the Configuration**: Apply the Terraform configuration to create the infrastructure:

   ```bash
   terraform apply
   ```

4. **Destroy the Configuration**: To clean up and destroy the created infrastructure, run:

   ```bash
   terraform destroy
   ```

## Notes

- Each directory contains a `variables.tf` file to define input variables for the configuration.
- Review and update the `.tf` files with appropriate values for your environment before applying the configuration.

Feel free to explore each directory and modify the configurations to suit your learning and practice needs.
