target "default" {
  context = "cwd:///tmp"
  dockerfile-inline = <<EOT
FROM alpine
WORKDIR /src
COPY . .
RUN ls -l && stop
EOT
  output = ["type=cacheonly"]
}

target "named" {
  contexts = {
    tmp = "cwd:///tmp"
  }
  dockerfile-inline = <<EOT
FROM alpine
WORKDIR /src
COPY --from=tmp . .
RUN ls -l && stop
EOT
}
