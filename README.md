# Python Ninja Base image

Image used for OpenCV (Computer Vision), usually used in Machine Learning models for image processing.

To visualize the info, use the container:

```console
$ docker run -ti marcellodesales/ubuntu:python-3.8-ninja-1.8.2 python3 --version
Python 3.8.10

$ docker run -ti marcellodesales/ubuntu:python-3.8-ninja-1.8.2 ninja --version
1.10.2.git.kitware.jobserver-1
```

# Build

```console
docker-compose build
```

# Reuse

```dockerfile
FROM marcellodesales/ubuntu:python-3.8-ninja-1.8.2 ninja
```
