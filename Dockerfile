FROM centos:7
RUN yum update -y
RUN yum install httpd httpd-tools -y
EXPOSE 8888
COPY . index.html /var/www/html/
CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND"]
