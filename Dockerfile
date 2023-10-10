# 使用基础镜像
FROM continuumio/anaconda3:main

# 激活conda的base环境
SHELL ["conda", "run", "-n", "base", "/bin/bash", "-c"]

# 在base环境中执行以下命令
RUN apt-get update && apt-get install -y build-essential && \
    apt-get install -y libgl1-mesa-glx && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# 设置工作目录
WORKDIR /workspace

# 安装torch, torchvision, torchaudio
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# 克隆detectron2仓库
RUN git clone https://github.com/facebookresearch/detectron2.git

# 从源码安装detectron2
WORKDIR /workspace/detectron2
RUN python -m pip install -e .

# 安装opencv-python
RUN pip install opencv-python
