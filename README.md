# Vultr Terraform plan

# Getting started

### Install Terraform
```bash 
sudo apt install unzip ; cd ~ ; wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip && unzip terraform_0.11.10_linux_amd64.zip && sudo install terraform /usr/local/bin/ ; terraform --version
```

### Add Third-Party Provider Plugin (by [@squat](https://github.com/squat/terraform-provider-vultr))
```bash
terraform init && mkdir -p ~/.terraform.d/plugins && cd ~/.terraform.d/plugins && wget https://github.com/squat/terraform-provider-vultr/releases/download/v0.1.9/terraform-provider-vultr_v0.1.9_linux_amd64.tar.gz && wget https://github.com/squat/terraform-provider-vultr/releases/download/v0.1.9/terraform-provider-vultr_v0.1.9_linux_amd64.tar.gz.asc && tar -xzf terraform-provider-vultr_*.tar.gz && ls -hal && cd ~
```

### Clone this repository

```bash
git clone https://github.com/stationgroup/terraform-vultr.git
```

* Add your API Key to `provider.tf`

* Change the SSH key value to match your key name in `instance_*.tf`

### Initialize and Plan

Change directories to your working terraform plan.
```
terraform init
```

Test your plan.
```
terraform plan
```

If you like it, apply it.
```
terraform apply
```


## Examples

```tf
// Configure the Vultr provider. 
// Alternatively, export the API key as an environment variable: `export VULTR_API_KEY=<your-vultr-api-key>`.
provider "vultr" {
  api_key = "<your-vultr-api-key>"
}

// Find the ID of the Silicon Valley region.
data "vultr_region" "silicon_valley" {
  filter {
    name   = "name"
    values = ["Silicon Valley"]
  }
}

// Find the ID for CoreOS Container Linux.
data "vultr_os" "container_linux" {
  filter {
    name   = "family"
    values = ["coreos"]
  }
}

// Find the ID for a starter plan.
data "vultr_plan" "starter" {
  filter {
    name   = "price_per_month"
    values = ["5.00"]
  }

  filter {
    name   = "ram"
    values = ["1024"]
  }
}

// Find the ID of an existing SSH key.
data "vultr_ssh_key" "squat" {
  filter {
    name   = "name"
    values = ["squat"]
  }
}

// Create a Vultr virtual machine.
resource "vultr_instance" "example" {
  name              = "example"
  region_id         = "${data.vultr_region.silicon_valley.id}"
  plan_id           = "${data.vultr_plan.starter.id}"
  os_id             = "${data.vultr_os.container_linux.id}"
  ssh_key_ids       = ["${data.vultr_ssh_key.squat.id}"]
  hostname          = "example"
  tag               = "container-linux"
  firewall_group_id = "${vultr_firewall_group.example.id}"
}

// Create a new firewall group.
resource "vultr_firewall_group" "example" {
  description = "example group"
}

// Add a firewall rule to the group allowing SSH access.
resource "vultr_firewall_rule" "ssh" {
  firewall_group_id = "${vultr_firewall_group.example.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
}
```
