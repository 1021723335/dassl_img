# 第一阶段：构建依赖项
FROM continuumio/anaconda3:main as builder

# 更新apt-get并安装编译工具
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

# 第二阶段：最终镜像
FROM continuumio/anaconda3:main

# 复制第一阶段所需的文件和依赖项
COPY --from=builder /workspace /workspace

# 设置工作目录
WORKDIR /workspace

# 安装opencv-python
RUN pip install opencv-python

# 克隆Dassl仓库
RUN git clone https://github.com/KaiyangZhou/Dassl.pytorch.git

# 从源码安装Dassl
WORKDIR /workspace/Dassl.pytorch
RUN pip install -r requirements.txt
RUN python setup.py develop
