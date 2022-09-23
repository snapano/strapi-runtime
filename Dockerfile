# Based on node:16-alpine (for tiny size)
FROM node:16-alpine

RUN echo "http://mirrors.tuna.tsinghua.edu.cn/alpine/edge/main" > /etc/apk/repositories && \
    echo "http://mirrors.tuna.tsinghua.edu.cn/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    apk add --no-cache tzdata && \
    echo "Asia/shanghai" > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "hosts: files dns" > /etc/nsswitch.conf

COPY package.json favicon.ico /opt/strapi/
ADD node_modules/ /opt/strapi/node_modules
