variable "VERSION" {
  default = "latest"
}

target "docker-metadata-action" {}

target "_common" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "Dockerfile"
}

target "_common_multi_platforms" {
  platforms = [
    "linux/amd64"
  ]
}

target "_common_tags" {
  tags = [
    "ghcr.io/enoqv/caddy-with-dns01:latest",
    "ghcr.io/enoqv/caddy-with-dns01:${VERSION}"
  ]
}

target "image-stable" {
  inherits = ["_common", "_common_multi_platforms", "_common_tags"]
}
