#!/bin/bash

# 输入参数检查
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <image-name>"
    exit 1
fi

# 输入的镜像名
IMAGE_NAME=$1

# 判断镜像名中是否包含'/'
if [[ $IMAGE_NAME == *"/"* ]]; then
    # 包含'/'的情况，使用常规镜像代理命令
    PROXY_IMAGE="dockerproxy.com/$IMAGE_NAME"
else
    # 不包含'/'的情况，使用根镜像代理命令
    PROXY_IMAGE="dockerproxy.com/library/$IMAGE_NAME"
fi

# 拉取代理镜像
echo "Pulling proxy image: $PROXY_IMAGE"
docker pull $PROXY_IMAGE

# # 重命名镜像
echo "Tagging image: $IMAGE_NAME"
docker tag $PROXY_IMAGE $IMAGE_NAME

# # 可选：删除代理镜像标签
docker rmi $PROXY_IMAGE

echo "Done."
