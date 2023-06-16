# Try to build an openpose Docker image

## Call openpose from Jupyter notebook

A quick search on "jupyter call openpose" gives some information how to install and call openpose from Jupyter without Docker :

- https://medium.com/analytics-vidhya/sign-language-detection-using-openpose-in-colab-a2f364e3fcd2

## Dockerfile with openpose

A search on Dockerfile that contains openpose on GitHub gives the following example :

- https://github.com/tryolabs/norfair/blob/9b315b4cfa5f9cf145f068a21a2b7673703ac9e3/demos/openpose/Dockerfile (1)

which is based on a Dockerfile found in an openpose issue : https://github.com/CMU-Perceptual-Computing-Lab/openpose/issues/1786#issuecomment-1180161510

**WARNING** : this is a 2022 Dockerfile thus I got deprecation warning during compilation on C++11 and on the base image

## CUDA warnings when launching the build image

> The image was built on a machine without GPU

```
==========
== CUDA ==
==========

CUDA Version 11.6.1

Container image Copyright (c) 2016-2022, NVIDIA CORPORATION & AFFILIATES. All rights reserved.

This container image and its contents are governed by the NVIDIA Deep Learning Container License.
By pulling and using the container, you accept the terms and conditions of this license:
https://developer.nvidia.com/ngc/nvidia-deep-learning-container-license

A copy of this license is made available in this container at /NGC-DL-CONTAINER-LICENSE for your convenience.

WARNING: The NVIDIA Driver was not detected.  GPU functionality will not be available.
   Use the NVIDIA Container Toolkit to start this container with GPU support; see
   https://docs.nvidia.com/datacenter/cloud-native/ .

*************************
** DEPRECATION NOTICE! **
*************************
THIS IMAGE IS DEPRECATED and is scheduled for DELETION.
    https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/support-policy.md
```
