FROM zqing10/docker:v1.3.4
RUN /opt/conda/bin/python -m pip install --upgrade pip \
    && pip install pycocotools \
    && pip install lxml \
    && apt --fix-broken install -y \
    && python -m pip install detectron2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu111/torch1.10/index.html \
    && apt install sudo \
    && apt install wget \
    && apt install unzip -y \
    && wget -c --referer=https://pan.baidu.com/s/1-Y6vQUukDlh9tic2D98TpA -O Dassl.zip "https://allall02.baidupcs.com/file/cb3dbc906t5647903b03e18fcc31c59f?bkt=en-2a4ba40c42c88fabe6f83492acd9dde058b9420c32fc52ba2c781e9c5da5af0bc3150659f03c039c6d9013901e63e338b1c11fce720cee649f9def5c06097418&fid=909223067-250528-24318931551772&time=1640491236&sign=FDTAXUbGERLQlBHSKfWqiu-DCb740ccc5511e5e8fedcff06b081203-IoA0LCXgvfBBU%2B59Tfrz1LsLgw8%3D&to=80&size=165287&sta_dx=165287&sta_cs=0&sta_ft=zip&sta_ct=0&sta_mt=0&fm2=MH%2CBaoding%2CAnywhere%2C%2Cfujian%2Cct&ctime=1640491179&mtime=1640491179&resv0=0&resv1=0&resv2=rlim&resv3=5&resv4=165287&vuk=909223067&iv=0&htype=&randtype=&tkbind_id=0&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=en-24c8e6b964149c9a9083528e625d016ff00a2593b02db2547755cf393af22650dca9c9d48477aec69ea65f2390606c1f407ae3590ef833bd305a5e1275657320&sl=68616270&expires=8h&rt=sh&r=669303371&vbdid=2705783145&fin=Dassl.pytorch.zip&fn=Dassl.pytorch.zip&rtype=1&dp-logid=267378969605098927&dp-callid=0.1&hps=1&tsl=200&csl=200&fsl=0&csign=Ns%2BCH01Ch9HhF6MC5iuB1nqMHNM%3D&so=0&ut=6&uter=4&serv=0&uc=2132150883&ti=3dbf888e013f656328b0b7fd27de6ab2baa603385525beff&hflag=30&from_type=1&adg=c_eb2042605a8822f26d0d35622589a07f&reqlabel=250528_f_ca88641cc6bf3544b655be928e2faa95_-1_7da8d07bb97681b47b91143d7dacd947&by=themis&resvsflag=1-0-0-1-1-1" \
    && unzip Dassl.zip \
    && rm -rf Dassl.zip \
    && cd Dassl.pytorch \
    && pip install -r requirements.txt \
    && python setup.py develop
