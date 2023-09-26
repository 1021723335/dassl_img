# 指定基础镜像
FROM continuumio/anaconda3:main

# 更新apt-get并安装编译工具
RUN apt-get update && apt-get install -y build-essential 

# 创建名为basehome的conda环境，其中python版本为3.8
RUN conda create -n basehome python=3.8

# 使用新创建的conda环境
SHELL ["conda", "run", "-n", "basehome", "/bin/bash", "-c"]

# 设置工作目录
WORKDIR /workspace

# 安装torch, torchvision, torchaudio
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# 克隆detectron2仓库
RUN git clone https://github.com/facebookresearch/detectron2.git

# 从源码安装detectron2
WORKDIR /workspace/detectron2
RUN python -m pip install -e .
