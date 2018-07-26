FROM moodlehq/moodle-php-apache:7.1

RUN apt-get update && apt-get install -y git openssh-client

RUN useradd -u 127 nmoller && mkdir -p /home/nmoller/.ssh && \
	chown -R nmoller:nmoller /home/nmoller