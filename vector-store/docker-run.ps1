docker run -d `
       --name milvus-standalone `
       --security-opt seccomp:unconfined `
       -e ETCD_USE_EMBED=true `
       -e ETCD_DATA_DIR=/var/lib/milvus/etcd `
       -e ETCD_CONFIG_PATH=/milvus/configs/embedEtcd.yaml `
       -e COMMON_STORAGETYPE=local `
       -v $PSScriptRoot/.volumes/milvus:/var/lib/milvus `
       -v $PSScriptRoot/embedEtcd.yaml:/milvus/configs/embedEtcd.yaml `
       -v $PSScriptRoot/user.yaml:/milvus/configs/user.yaml `
       -p 19530:19530 `
       -p 9091:9091 `
       -p 2379:2379 `
       --health-cmd="curl -f http://localhost:9091/healthz" `
       --health-interval=30s `
       --health-start-period=90s `
       --health-timeout=20s `
       --health-retries=3 `
       milvusdb/milvus:v2.4.13-hotfix `
       milvus run standalone