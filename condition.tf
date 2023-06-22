provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA6LY2IB2S4TZSVP55"
  secret_key = "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"
}

variable "instacetype" {
    type = map
    default = {
        "dev" = "t2.micro"
        "test" = "t2.small"
        "dev" = "t2.medium"
    }
}
variable "image" {
    type = list
    default = ["ami-020916b60b78f7108","ami-0c1c37f51af03d30f"]  
}
variable "input" {
  
}
resource "aws_instance" "dev" {
    instance_type = var.instacetype["dev"]
    ami = var.image[0]
    count = var.input >= "2" ? 2: 0
        tags = {
          "name" = "dev-dep"
        }
}
