FROM python:3

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

RUN ansible-galaxy collection install hwceco.hwcollection --force

RUN wget -O consul.zip https://releases.hashicorp.com/consul/1.5.1/consul_1.5.1_linux_amd64.zip && unzip consul.zip -d /usr/local/bin && chmod u+x /usr/local/bin/consul && rm consul.zip

ADD inc/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]