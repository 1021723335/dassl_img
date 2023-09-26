# 指定基础镜像，从NVIDIA的CUDA 11.0 base镜像开始
FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

# 更新apt-get和安装必要的软件包
RUN apt-get update && \
    apt-get install -y build-essential git wget libglib2.0-0 libsm6 libxext6 libxrender-dev

# 下载并安装Anaconda
RUN wget https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Linux-x86_64.sh \
    && bash Anaconda3-2023.07-2-Linux-x86_64.sh -b \
    && rm Anaconda3-2023.07-2-Linux-x86_64.sh

ENV PATH /root/anaconda3/bin:$PATH

# 创建名为basehome的conda环境
RUN conda create -n basehome python=3.8

# 使用新创建的conda环境
SHELL ["conda", "run", "-n", "basehome", "/bin/bash", "-c"]

# 设置工作目录
WORKDIR /workspace

# 安装PyTorch和相关的库
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# 克隆detectron2仓库
RUN git clone https://github.com/facebookresearch/detectron2.git

# 从源码安装detectron2
WORKDIR /workspace/detectron2
RUN python -m pip install -e .
