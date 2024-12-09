FROM postgres:14-alpine

RUN apk update && apk add --no-cache rsync

RUN apk add --no-cache openssh

RUN ssh-keygen -A && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

RUN echo "root:<pass>" | chpasswd

EXPOSE 22

CMD /usr/sbin/sshd
