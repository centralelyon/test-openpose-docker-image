# https://github.com/CMU-Perceptual-Computing-Lab/openpose/issues/1786#issuecomment-1180161510

FROM nvidia/cuda:11.6.1-devel-ubuntu20.04

# Install dependencies for OpenPose and its installation
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update --yes && apt-get install --yes --auto-remove \
        libopencv-dev \
        protobuf-compiler \
        libgoogle-glog-dev \
        libboost-all-dev \
        libhdf5-dev \
        libatlas-base-dev \
        git \
        cmake \
        python3-dev \
        python3-pip && \
        apt-get clean && \
        rm -Rf /var/lib/apt/lists/*

# Install Pip dependencies
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install \
        numpy \
        opencv-python

# Clone the OpenPose repository and compile it
WORKDIR /openpose
RUN git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git ./ && \
    git submodule update --init --recursive --remote
WORKDIR  /openpose/build/
RUN cmake \
        -D BUILD_PYTHON=ON \
        -D BUILD_CAFFE=ON \
        -D BUILD_EXAMPLES=ON \
        -D GPU_MODE=CUDA \
        -D USE_CUDNN=OFF \
        -D CMAKE_BUILD_TYPE=Release \
        -D DOWNLOAD_BODY_COCO_MODEL=ON \
        -D DOWNLOAD_BODY_MPI_MODEL=ON \
        -D DOWNLOAD_HAND_MODEL=ON \
        -D DOWNLOAD_FACE_MODEL=ON \
        ..
RUN make --jobs `nproc`

WORKDIR /data/videos

CMD ["bash"]
