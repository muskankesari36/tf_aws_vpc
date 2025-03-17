# tf_aws_vpc
Creating Central Terraform Module for AWS VPC

# Overview

This git repository (tf_aws_vpc) contains a terraform module pattern to provision an AWS VPC.

## Owners

- Landing Zone Engineers
- ERM DevOps Engineers

## Technologies Used

- Terraform

This module is considered a Remote.
This repo will not contain any terraform tfvars.
This repo will not contain any yaml pipeline files.
To use this module pattern, it should be **remote** referenced in the **'core_module'** of an **active** terraform pattern.
This repo's terraform pattern is considered to a "non-active" module ( in that this repo will not provisions resources, and record those in a remote state).
This module is considered a singleton, in that it will produce:

- 1 x vpc;



### Terraform Variables

The required variable values to be passed to the module are defined in the variables.tf file.

## Repo Folder structure and content


`-- main.tf`
`-- output.tf`
`-- README.md`
`-- variables.tf`
```

## Version control

| branch | latest semver Tag | Can be used? |
| ----------- | ------------ | ------------ |
| main (default) | 1.0.0 | yes |
| features/* | < none > | No |

## Release change log


### Example use

