mkdir ./elasticsearch/data

#mkdir -p ./minio/minio1/data1
#mkdir -p ./minio/minio1/data2
#mkdir -p ./minio/minio2/data1
#mkdir -p ./minio/minio2/data2
#mkdir -p ./minio/minio3/data1
#mkdir -p ./minio/minio3/data2
#mkdir -p ./minio/minio4/data1
#mkdir -p ./minio/minio4/data2
for i in {1..4}
do
  for j in {1..2}
  do
    mkdir -p "./minio/minio${i}/data${j}"
  done
done


mkdir -p ./mysql/data
mkdir -p ./mysql_nacos/data
mkdir -p ./nacos/standalone-logs
mkdir -p ./xxl_job/logs

docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
