FROM moodlehq/moodle-php-apache:7.1

RUN apt-get update && apt-get install -y git openssh-client