
# provider 'aws' {
#     region = 
# }

# resource "aws_instance" "exemple" {
#     ami = ""
#     instance_type = "t2.micro"
# }
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"  # Specify the version you want to use
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"  # Use this for Windows

  # If using Linux/macOS, replace with:
  # host = "unix:///var/run/docker.sock"
}

# Pull a Docker image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a Docker container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx_container"
  ports {
    internal = 80
    external = 8081
  }
}
