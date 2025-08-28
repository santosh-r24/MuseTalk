FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# Install Python and pip
RUN apt-get update && apt-get install -y python3.10 python3-pip git wget openssh-server

RUN ln -sf /usr/bin/python3.10 /usr/bin/python
RUN pip install --upgrade pip

# Install PyTorch for CUDA 11.8
RUN pip install torch==2.0.0 torchvision==0.15.1 --index-url https://download.pytorch.org/whl/cu118

# Copy your requirements.txt and install
COPY /workspace/requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Install mmlab/openmim libs
RUN pip install --no-cache-dir -U openmim && \
    mim install mmengine && \
    mim install "mmcv>=2.0.1" && \
    mim install "mmdet>=3.1.0" && \
    mim install "mmpose>=1.1.0"

# SSH Setup
RUN mkdir -p /var/run/sshd && \
    mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 22

ENTRYPOINT ["/startup.sh"]
