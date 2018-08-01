FROM moodlehq/moodle-php-apache:7.1

RUN apt-get update && apt-get install -y git openssh-client

RUN useradd -u 1000 jenkins && mkdir -p /home/jenkins/code && \
	chown -R jenkins:jenkins /home/jenkins