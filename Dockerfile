# Dockerfile for schemup
FROM python:2.7.9
MAINTAINER TruongTX <me@truongtx.me>

# install schemup
ADD requirements.txt /
WORKDIR /
RUN pip install -r requirements.txt
