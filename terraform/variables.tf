variable "environments" {
  type = map(object({
    name   = string
    location = string
  }))
  default = {
    "dev" = {
      "name"   = "dev"
      "location" = "uksouth"
    }
  }
}