#!/bin/bash

# 定义一个包含期望下载镜像名称的数组
declare -a expected_images=(
    "portainer/portainer-ce:latest"
    "mysql:8"
    "mysql:8.0.31"
    "mysql:8.2.0"
    "nacos/nacos-server:v2.3.0"
    "minio/minio:RELEASE.2024-01-29T03-56-32Z"
    "xuxueli/xxl-job-admin:2.4.0"
    "nginx:latest"
    "elasticsearch:7.17.17"
    "kibana:7.17.17"
    "rabbitmq:3-management"
    "jenkins/jenkins:lts-jdk17"
    "registry:2.8.2"
    "joxit/docker-registry-ui:main"
    "openjdk:17"
    "node:16.17.0-slim"
)

# 获取docker images的输出，跳过第一行（标题行）
output=$(docker images -a | awk 'NR>1 {print $1 ":" $2}')

# 将输出转换为数组
readarray -t local_images <<< "$output"

# 初始化已存在和不存在的镜像数组
declare -a existing_images
declare -a missing_images

# 遍历期望下载的镜像数组
for expected_image in "${expected_images[@]}"; do
    if printf '%s\n' "${local_images[@]}" | grep -q "^$expected_image\$"; then
        existing_images+=("$expected_image")
    else
        missing_images+=("$expected_image")
    fi
done

# 打印已存在的镜像
echo "已存在的镜像:"
for image in "${existing_images[@]}"; do
    echo "  - $image"
done
# 打印即将拉取的镜像
echo "即将拉取的镜像:"
for image in "${missing_images[@]}"; do
    echo "  - $image"
done

param=$1
# 拉取不存在的镜像
for image in "${missing_images[@]}"; do
    echo "正在拉取 $image ..."
	# 判断参数是否为"proxy"
	if [ "$param" == "proxy" ]; then
		bash docker-p.sh "$image"
	else
		docker pull "$image"
	fi
done