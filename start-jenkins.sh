# avvia jenkins con il socker per creare container effimeri al di fuori del container jenkins 
#!/bin/bash
# i dati restano nel volume
docker rm -f jenkins

docker run -d --name jenkins \
  --user root \
  -e GIT_CONFIG_COUNT=1 \
  -e GIT_CONFIG_KEY_0=safe.directory \
  -e GIT_CONFIG_VALUE_0='*' \
  -p 8080:8080 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  j3ynn/jennykins