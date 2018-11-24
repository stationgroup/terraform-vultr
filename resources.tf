# Find the ID of the Silicon Valley region.
data "vultr_region" "silicon_valley" {
  filter {
    name   = "name"
    values = ["Silicon Valley"]
  }
}

# Find the ID for Ubuntu 18.04 x64 Linux.
data "vultr_os" "ubuntu18" {
  filter {
    name   = "name"
    values = ["Ubuntu 18.04 x64"]
  }
}

# Find the ID for Ubuntu 18.04 x64 Linux.
data "vultr_os" "ubuntu16" {
  filter {
    name   = "name"
    values = ["Ubuntu 16.04 x64"]
  }
}

# Find the ID for a starter plan.
# 5
data "vultr_plan" "vc2-5" {
  filter {
    name   = "price_per_month"
    values = ["5.00"]
  }

  filter {
    name   = "ram"
    values = ["1024"]
  }
}

# 10
data "vultr_plan" "vc2-10" {
  filter {
    name   = "price_per_month"
    values = ["10.00"]
  }

  filter {
    name   = "ram"
    values = ["2048"]
  }
}

# 20
data "vultr_plan" "vc2-20" {
  filter {
    name   = "price_per_month"
    values = ["20.00"]
  }

  filter {
    name   = "ram"
    values = ["4096"]
  }
}

# 40
data "vultr_plan" "vc2-40" {
  filter {
    name   = "price_per_month"
    values = ["40.00"]
  }

  filter {
    name   = "ram"
    values = ["8192"]
  }
}

# BARE METAL
data "vultr_bare_metal_plan" "bm-8" {
  filter {
    name   = "cpu_count"
    values = [8]
  }
}

# Find the ID of an existing SSH key.
data "vultr_ssh_key" "primary" {
  filter {
    name   = "name"
    values = ["example-primary"]
  }
}
