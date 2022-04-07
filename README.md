# N3IWF安裝流程
1. 安裝ubuntu 18.04 server
```
[non passwd]
echo 'k200 ALL=(ALL) NOPASSWD:ALL' | sudo tee --append /etc/sudoers.d/90-cloud-init-users
```

2. 下載free5GC & N3IWF & ngap & aper
```
git clone git@github.com:IreneLou/free5gc.git
git clone IreneLou@140.96.102.159:/git/n3iwf
git clone git@github.com:IreneLou/ngap.git
git clone git@github.com:IreneLou/aper.git
```

3. 寫PREPARE N3IWF事前部署腳本
```
vim PREPARE_N3IWF.sh

#!/usr/bin/env bash

sudo ip link del ipsec0
sudo ip link add ipsec0 type vti local 192.168.8.157 remote 192.168.8.158 key 5
sudo ip addr add 10.0.0.1/24 dev ipsec0
sudo ip link set ipsec0 up

sudo ip addr add 192.168.8.157/24 dev ens3
sudo ip addr add 10.200.200.2/24 dev ens3

sudo route add -net 192.168.102.0/28 gw 192.168.120.2
```

4. checkout branch
```
cd ~/irene/free5gc
git checkout RELEASE_1.0_20220314

cd ~/irene/free5gc/NFs/n3iwf
git checkout RELEASE_1.0_20220314

cd ~/irene/free5gc/NFs/ngap
git checkout RELEASE_1.0_20220314
```

5. N3IWF環境佈建

* A. Linux Kernel version
須5.0.0-23-generic or 5.4.x以上
```
uname -r
5.4.0-65-generic
```

* B. go version 1.15.15 
```
sudo wget https://golang.org/dl/go1.15.5.linux-amd64.tar.gz
sudo tar -C /usr/local -zxvf go1.15.5.linux-amd64.tar.gz
mkdir -p ~/go/{bin,pkg,src}
# The following assume that your shell is bash
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> ~/.bashrc
echo 'export GO111MODULE=auto' >> ~/.bashrc
source ~/.bashrc
```

6. build N3IWF
```
cd ~/irene/free5gc
make n3iwf

cd ~/moon_n3iwf
go build -o bin/n3iwf -x n3iwf/n3iwf.go
```
=============================================================
1. 安裝模擬 My5G UE
```
git clone git@github.com:IreneLou/my5G-core.git

cd my5G-core
git checkout RELEASE_1.0_20220314

cd my5G-core/lib/nas
git checkout RELEASE_1.0_20220314

```
2. 修改my5G UE參數
```
vim ~/my5G-core/config/uecfg.conf
vim ~/my5G-core/src/ue/trigger_initial_registration.sh
```

3. 搭配啟動指令

https://hackmd.io/WkqQkddGT5qT8Q72AFKVXA
