# docker
ДЗ otus docker

Для начала устанавливаем докер:      
```yum install -y yum-utils```     
```yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo```     
```yum install docker-ce docker-ce-cli containerd.io -y```      

Далее запускаем докер:     
```systemctl start docker```
И проверяем:
```docker run hello-world```
Получаем следующий вывод:      
```Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
0e03bdcc26d7: Pull complete
Digest: sha256:8c5aeeb6a5f3ba4883347d3747a7249f491766ca1caa47e5da5dfcf6b9b717c0
Status: Downloaded newer image for hello-world:latest
Hello from Docker!
This message shows that your installation appears to be working correctly
```     
Который говорит нам что докер успешно установлен     

Далее собираем наш образ командой
```docker build -t 2kw92/myimage:mynginx_v2```     
проверяем наш образ:
```
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
2kw92/myimage       mynginx_v2          720ce0aa08ad        6 minutes ago       23.7MB
<none>              <none>              20d6dfbe4278        17 minutes ago      21.8MB
2kw92/myimage       mynginx             1267d940a8ec        33 minutes ago      21.8MB
<none>              <none>              112433d88809        41 minutes ago      21.4MB
nginx               alpine              e5dcd7aa4b5e        6 days ago          21.8MB
alpine              3.11                f70734b6a266        6 months ago        5.61MB
hello-world         latest              bf756fb1ae65        10 months ago       13.3kB
```
Запускаем контейнер     
```docker run -d -p 1235:80 2kw92/myimage:mynginx_v2```     
И провереям:       
```curl localhost:1235
hello world
```

