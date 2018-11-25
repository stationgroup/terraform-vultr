# Create a DNS domain.
resource "vultr_dns_domain" "example" {
  domain = "example.org"
  ip     = "10.0.0.1"
}