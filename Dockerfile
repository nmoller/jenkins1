FROM moodlehq/moodle-php-apache:7.1

RUN apt-get update && apt-get install -y git openssh-client

RUN useradd -u 127 uqamena && mkdir -p /home/uqamena/code && \
	chown -R uqamena:uqamena /home/uqamena