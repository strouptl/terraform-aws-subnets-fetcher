# AWS Subnets Fetcher Module
A Terraform/OpenTofu module for quickly fetching the default Subnets of a VPC.

## Example
Insert the following into your main.tf file:

    terraform {
      required_providers {
        aws = { 
          source  = "hashicorp/aws"
          version = "~> 5.17"
        }   
      }
      required_version = ">= 1.2.0"
    }
    
    provider "aws" {
      region  = "us-east-1"
    }
    
    # Default Subnets
    module "default_subnets" {
      source = "git@github.com:strouptl/terraform-aws-subnets-fetcher.git"
    }

## Usage
Once you have defined your Subnets module as above, you can then reference the ID's of the default subnets within your main.tf file. For example:

    module.default_subnets.ids

For real-world usage, see the [AWS Server Stacks](https://github.com/strouptl/terraform-aws-server-stack/blob/master/main.tf#L44) module.
