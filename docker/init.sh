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


mkdir ./mysql/data
mkdir ./mysql_nacos/data
mkdir ./nacos/standalone-logs
mkdir ./xxl_job/logs