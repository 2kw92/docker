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
```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
0e03bdcc26d7: Pull complete
Digest: sha256:8c5aeeb6a5f3ba4883347d3747a7249f491766ca1caa47e5da5dfcf6b9b717c0
Status: Downloaded newer image for hello-world:latest
Hello from Docker!
This message shows that your installation appears to be working correctly
```     
Который говорит нам что докер успешно установлен     

Далее собираем наш образ из Dockerfile, который прикрепен выши командой   
```docker build -t 2kw92/myimage:mynginx_v2 .```     
проверяем наш образ:        
```docker images```     
```
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
```curl localhost:1235```     
Вывод:       
```hello world```      


Заливаем наш образ на докер хаб.Для этого сначала Логинимся     
```docker login```     
```
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: 2kw92
Password:
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store
```

А потом пушим:     
```docker push 2kw92/myimage:mynginx_v2```       
```
The push refers to repository [docker.io/2kw92/myimage]
15a426f6c3bd: Pushed
93284f8371f7: Pushed
2941e40c2e78: Pushed
2367050c34dd: Mounted from library/nginx
2c8583333eb3: Mounted from library/nginx
e2a648dc6400: Mounted from library/nginx
93e19e6dd56b: Mounted from library/nginx
ace0eda3e3be: Mounted from library/nginx
mynginx_v2: digest: sha256:0411cb7b437ba94cae2f0c47a310e198c164cc4318b7d3ec6ccb536e2670fa33 size: 1985
```      
Ссылка на репо:      
```https://hub.docker.com/r/2kw92/myimage/tags```     


Теоретическая часть:     
Определите разницу между контейнером и образом:       

Основное различие между образом и контейнером — в доступном для записи верхнем слое.
Сам по себе Docker-образ невозможно «запускать». Команда docker run берет Docker-образ
в качестве темплейта и создает из него контейнер, который и запускается      

Можно ли в контейнере собрать ядро?      
Собрать-то ядро можно а вот загрузиться с ним вряд ли получится


