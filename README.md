# netology_pd73_webpy_docker_hw_task2

## Сборка контейнера
Перейти в директорию с файлом Dockerfile и выполнить:
```bash
sudo docker build \
-t netology_pd73_webpy_docker_hw_task2 \
.
```

## Подготовка к запуску контейнера
Подготовить на хосте директорию, которая будет смонтирована в контейнер для выгрузки в неё статических файлов приложением, например, `/var/www/netology_pd73_webpy_docker_hw_task2/static`

## Запуск контейнера
```bash
sudo docker run \
-e SECRET_KEY='django-insecure-9m2%u2yq=+#)6c#^j7^1p+@mpiob-r)9ki+zrv%*ad779fz89l' \
-d \
-p 127.0.0.1:8000:80 \
--mount type=bind,source=/var/www/netology_pd73_webpy_docker_hw_task2/static,target=/usr/src/app/static \
--name netology_pd73_webpy_docker_hw_task2 \
netology_pd73_webpy_docker_hw_task2
```
`-e SECRET_KEY='...'` SECRET_KEY для приложения

`-d` запуск контейнера в фоновом режиме

`-p 127.0.0.1:8000:80` публикация порта приложения на хосте на 127.0.0.1:8000

`--mount type=bind,source=/var/www/netology_pd73_webpy_docker_hw_task2/static,target=/usr/src/app/static` монтирование в контейнер директории хоста, в которую приложение выгрузит статические файлы

`--name netology_pd73_webpy_docker_hw_task2` имя контейнера

`netology_pd73_webpy_docker_hw_task2` имя образа

## Запуск контейнера с режимом DEBUG для приложения
Передайте дополнительно переменную окружения DEBUG с любым значением, например, так:
```bash
sudo docker run \
-e SECRET_KEY='django-insecure-9m2%u2yq=+#)6c#^j7^1p+@mpiob-r)9ki+zrv%*ad779fz89l' \
-e DEBUG=1 \
-d \
-p 127.0.0.1:8000:80 \
--mount type=bind,source=/var/www/netology_pd73_webpy_docker_hw_task2/static,target=/usr/src/app/static \
--name netology_pd73_webpy_docker_hw_task2 \
netology_pd73_webpy_docker_hw_task2
```