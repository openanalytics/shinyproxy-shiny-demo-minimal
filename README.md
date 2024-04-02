# Running Shiny apps in ShinyProxy

This repository explains how to run a Shiny app in ShinyProxy. For simplicity,
the R code in this repository is not bundled into
a [R package](https://r-pkgs.org/).
See [this demo](https://github.com/openanalytics/shinyproxy-demo) that uses the
same code, but as an R package.

## Building the Docker image

To pull the image made in this repository from Docker Hub, use

```bash
sudo docker pull openanalytics/shinyproxy-demo-minimal
```

The relevant Docker Hub repository can be found at [https://hub.docker.com/r/openanalytics/shinyproxy-demo](https://hub.docker.com/r/openanalytics/shinyproxy-demo)

To build the image from the Dockerfile, navigate into the root directory of this repository and run

```bash
sudo docker build -t openanalytics/shinyproxy-demo-minimal .
```

Running the image for testing purposes outside ShinyProxy can be done using e.g.

```bash
sudo docker run -it -p 3838:3838 openanalytics/shinyproxy-demo-minimal
```

## ShinyProxy Configuration

Create a ShinyProxy configuration file (see [application.yml](application.yml)
for a complete file), containing:

```yaml
specs:
- id: euler
  container-image: openanalytics/shinyproxy-demo-minimal
```

**(c) Copyright Open Analytics NV, 2016-2024.**
