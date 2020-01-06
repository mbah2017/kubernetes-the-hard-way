#!/bin/bash
CERT_HOSTNAME=10.96.0.1,192.168.5.11,master-1,192.168.5.12,master-2,192.168.5.30,loadbalancer,127.0.0.1,localhost,kubernetes.default,kubernetes,kubernetes.default.svc,kubernetes.default.svc.cluster.local

{

cat > kubernetes-csr.json << EOF
{
  "CN": "kubernetes",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "US",
      "L": "Portland",
      "O": "Kubernetes",
      "OU": "Kubernetes The Hard Way",
      "ST": "Oregon"
    }
  ]
}
EOF

cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -hostname=${CERT_HOSTNAME} \
  -profile=kubernetes \
  kubernetes-csr.json | cfssljson -bare kubernetes

}
