variable "environments" {
  type = map(object({
    name   = string
    location = string
  }))
}