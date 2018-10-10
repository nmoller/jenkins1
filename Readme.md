# Builder image

```
docker build --tag nmoller/builder:0.0.1 .
```

Tester avant d'intégrer multistage build
```
docker run -it --rm -v /home/nmoller/.ssh:/home/uqamena/.ssh \
-v $(pwd)/test01:/home/uqamena/build \
--name builder nmoller/builder:0.0.1
```

Spécifier le fichier de config
```
docker run -it --rm -v /home/nmoller/.ssh:/home/uqamena/.ssh \
-v $(pwd)/test01:/home/uqamena/build \
--name builder nmoller/builder:0.0.1 MM-535.json
```

Seulement modifier un package (`theme_uqam`)
```
docker run -it --rm -v /home/nmoller/.ssh:/home/uqamena/.ssh \
-v $(pwd)/test01:/home/uqamena/build \
--name builder nmoller/builder:0.0.1 MM-535.json theme_uqam
```


# Running Jenkins inside docker

### Instructions de base

https://github.com/jenkinsci/docker/blob/master/README.md

```
docker run -d --privileged -v /home/nmoller/dev/docker/jenkins:/var/jenkins_home -v 
/var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker -p 8080:8080 -p 50000:50000 --name jenkins jenkins/jenkins:lts
```

### Installer docker et docker-compose

Se connecter au container en tant que root:
```
docker exec -it -u 0 jenkins bash
```
#### Docker
```
apt-get update

apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get install -y docker-ce
```

#### Docker-compose
```
curl -L \
https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) \
-o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

```


Problèmes pour voir les volumes docker-compose dans dind:

http://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/


### Autres

Dans le container, en tant que jenkins, faire une clone d'un dépôt github pour ajouter la clé du serveur aux hosts connus.

Quand on utilise docker-compose dans le container... les volumes sont vides...

Le uid de l'utilisateur jenkins doit être ajusté en conséquence dans le dockerfile.