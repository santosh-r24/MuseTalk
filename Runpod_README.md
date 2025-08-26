Instructions
Try with this image as runpod base img - rehabc/pytorch2.0.0-python3.10-cuda11.8-jupyter-jp

1. Install ffmpeg via apt 
2. `pip install -r requirements.txt`
3. 
```
pip install --no-cache-dir -U openmim
mim install mmengine
mim install "mmcv>=2.0.1"
mim install "mmdet>=3.1.0"
mim install "mmpose>=1.1.0"
```