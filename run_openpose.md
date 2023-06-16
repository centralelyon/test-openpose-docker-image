# Image Docker openpose

*mercredi 14 juin 2023*

On est partis d'une image de base 11.6.1

```dockerfile
FROM nvidia/cuda:11.6.1-devel-ubuntu20.04
```

> CUDA is a parallel computing platform and programming model developed by
> NVIDIA for general computing on graphical processing units (GPUs).

D'après leur "support-policy.md", il faudrait une image 11.6.2, 11.7.1 ou 11.8.0

- Latest CUDA = 12.1.1 : https://hub.docker.com/r/nvidia/cuda
- Supported tags : https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/supported-tags.md

```bash
$ docker run --rm -v /home/fconil/docker/openpose/videos:/data/videos -it openpose

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

La documentation d'installation (https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation/0_index.md#compiling-and-running-openpose-from-source)
à partir des sources dit de tester que l'installation a bien fonctionner en
lançant un des exemples.

https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/01_demo.md


```bash
root@8a50145941d0:/data/videos# /openpose/build/examples/openpose/openpose.bin --video /openpose/examples/media/video.avi 
Starting OpenPose demo...
Configuring OpenPose...
Starting thread(s)...

Error:
Cuda check failed (35 vs. 0): CUDA driver version is insufficient for CUDA runtime version

Coming from:
- /openpose/src/openpose/gpu/cuda.cpp:getCudaGpuNumber():48
- /openpose/src/openpose/gpu/cuda.cpp:cudaCheck():37
- /openpose/src/openpose/gpu/cuda.cpp:getCudaGpuNumber():58
- /openpose/src/openpose/gpu/gpu.cpp:getGpuNumber():27
- /openpose/include/openpose/wrapper/wrapperAuxiliary.hpp:configureThreadManager():1221
- /openpose/include/openpose/wrapper/wrapper.hpp:exec():424
```
