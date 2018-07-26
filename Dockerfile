FROM moodlehq/moodle-php-apache:7.1

RUN apt-get update && apt-get install -y git openssh-client

RUN useradd -u 127 nmoller && mkdir /home/nmoller/.ssh && \
	chown nmoller:nmoller /home/nmoller/.ssh/*