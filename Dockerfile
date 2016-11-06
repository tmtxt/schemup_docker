# Dockerfile for schemup
FROM python:2.7.9
MAINTAINER TruongTX <me@truongtx.me>

# install schemup
COPY . /schemup
WORKDIR /schemup
RUN pip install -r requirements.txt
