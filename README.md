# Consul Cluster

Provision AWS resources to create consul cluster with 3 nodes

---

## Demo Steps

1. Set your AWS credentials as environment variables: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`

1. Set the Terraform variable values in a file named `terraform.tfvars`

    **Example:**

    ```shell
    # SSH key name to access EC2 instances (should already exist) in the region you are using
    keypair = "consul-test"

    # AWS Region
    aws_region = "ap-south-1"
    ```

1. Run Terraform:

    ```shell
    # Pull necessary plugins
    $ terraform init

    $ terraform plan

    # Output provides the SSH instruction
    $ terraform apply -auto-approve
    ```

1. Clean up resources

    ```plaintext
    $ terraform destroy -auto-approve
    $ rm -rf .terraform terraform.tfstate*
    ```