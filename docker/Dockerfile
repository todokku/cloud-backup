FROM node:12-buster

WORKDIR /root

COPY . .

RUN bash setup.sh

ENV PATH="/root/rclone-v1.51.0-linux-amd64:$PATH"

CMD bash /root/start.sh
