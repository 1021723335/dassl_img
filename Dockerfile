FROM zqing10/docker:v1.3.4
RUN /opt/conda/bin/python -m pip install --upgrade pip \
    && pip install pycocotools \
    && pip install lxml \
    && apt --fix-broken install -y \
    && python -m pip install detectron2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu111/torch1.10/index.html \
    && apt install sudo \
    && apt install wget \
    && apt install unzip -y \
    && wget -c --referer=https://pan.baidu.com/s/15l3dMF5o7zG6kpixdi0cPg -O Dassl.zip "https://allall02.baidupcs.com/file/25ef0534akda429891c9fc90d659e1c4?bkt=en-6f7dc9883530f8c96e31931794ecc446d0242f0c47993991c946c61d4cc752c2e648826788eaddcd54098a42905b289acbcb8d2f9d8f623d50bb9cf2b5fda72f&fid=131966578-250528-715781381180922&time=1661055795&sign=FDTAXUbGERLQlBHSKfWqiu-DCb740ccc5511e5e8fedcff06b081203-tIN5pMukLvNV8J7T5E01Yv4G3mo%3D&to=80&size=181469&sta_dx=181469&sta_cs=0&sta_ft=zip&sta_ct=0&sta_mt=0&fm2=MH%2CBaoding%2CAnywhere%2C%2Cfujian%2Cct&ctime=1661055649&mtime=1661055649&resv0=0&resv1=0&resv2=rlim&resv3=5&resv4=181469&vuk=131966578&iv=0&htype=&randtype=&tkbind_id=0&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=en-7502457ad459af5fc3aa7422b76c4c8597e6f3877dee8f4210cffe42ea1abff2ecb90084fde5d1b9f734a58620aff209183c59857b27c1e5305a5e1275657320&sl=68616270&expires=8h&rt=sh&r=924081687&vbdid=3034366956&fin=Dassl.zip&fn=Dassl.zip&rtype=1&dp-logid=8851470590203604868&dp-callid=0.1&hps=1&tsl=200&csl=200&fsl=0&csign=lAINbgfejeQIXfnWozArulqvoTM%3D&so=0&ut=6&uter=4&serv=0&uc=2837644654&ti=05df9239daa40647965dd408e2a4e3c9713d80ae3bb0bafd&hflag=30&from_type=1&adg=c_72d4806eca06ccc21fbfd6f6fcb5a50d&reqlabel=250528_f_3dd2a8f510467eafc9da6fbe1bf11eab_-1_9fd99e8c8413ba8b6ab46fa4b74674e8&by=themis&resvsflag=1-0-0-1-1-1" \
    && unzip Dassl.zip \
    && rm -rf Dassl.zip \
    && cd Dassl.pytorch \
    && pip install -r requirements.txt \
    && python setup.py develop
