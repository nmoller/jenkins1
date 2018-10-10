FROM moodlehq/moodle-php-apache:7.1

# use
# 
# docker build --build-arg user_id=$( id -u )
#
# de cette manière, pas de problème de permissions pour
# dossier .ssh 
ARG user_id=1000

RUN apt-get update && apt-get install -y git openssh-client

COPY docker-entrypoint.sh /usr/local/bin/

RUN useradd -u ${user_id}  \
    -c "Build user" -s /bin/bash uqamena && \
    mkdir -p /home/uqamena/code && \
	chown -R uqamena:uqamena /home/uqamena && \
	chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

WORKDIR /home/uqamena
USER ${user_id}

CMD ["--"]