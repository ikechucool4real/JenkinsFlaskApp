FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install net-tools -y
RUN yum install httpd -y
RUN yum install python3 -y
COPY requirements.txt /app/
RUN pip3 install -r requirements.txt
COPY . /app/
ENTRYPOINT ["python3", "app.py"]
EXPOSE 3000 5050