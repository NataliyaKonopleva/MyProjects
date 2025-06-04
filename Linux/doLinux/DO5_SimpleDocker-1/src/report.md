# Simple Docker
Введение в докер. Разработка простого докер-образа для собственного сервера.

## Part 1. Готовый докер

1.Скачиваем докер-образ nginx последней версии `docker pull nginx`

![alt text](images/1_1.png)

2.Проверяем наличие докер-образа на локальной машине `docker images`

![alt text](images/1_2.png)

3.Запускаем контейнер из образа командой `docker run -d nginx` флаг -d или --detach для запуска контейнера в фоновом режиме

![alt text](images/1_3.png)

4.Проверяем, что образ запустился командой `docker ps`(флаг -а можно использовать, чтобы видеть и остановленные контейнеры).

![alt text](images/1_4.png)

5.Информацию о контейнере можно узнать с помощью `docker inspect id контейнера`

![alt text](images/1_5.png)

6.Список замапленных портов и ip контейнера по умолчанию

![alt text](images/1_6.png)

7.Для просмотра размера контейнера нужно добавить флаг -s или --size, так же можно отфильтровать json

![alt text](images/1_7.png)

8.Останавливаем контейнер  `docker stop id контейнера` и проверяем, что он остановился `docker ps -a`

![alt text](images/1_8.png)

9.Запускаем контейнер с мапингом портов 80 и 443 на такие же порты на локальной машине, через команду run

`docker run -p 80:80 -p 443:443 -d nginx`

![alt text](images/1_9.png)
![alt text](images/1_10.png)

10.Для проверки, что в браузере по адресу localhost:80 доступна стартовая страница nginx. Используем `curl localhost:80`

![alt text](images/1_11.png)

11.Перезапускаем контейнер `docker restart ` и проверяем, что контейнер запустился `docker ps`

![alt text](images/1_12.png)

## Part 2. Операции с контейнером

1.Прочитаем конфигурационный файл nginx.conf внутри докер контейнера через команду exec.

Для "входа" в контейнер выполняем `docker exec -it id контейнера cat /etc/nginx/nginx.conf`

![alt text](images/2_1.png)

2.Создаем на локальной машине файл nginx.conf.

Для настройки отдачи страницы статуса сервера nginx по пути /status, нужно дописать инструкцию в файл конфига.
За отдачу статуса отвечает модуль ngx_http_status_module, который должен быть по умолчанию включен в nginx

![alt text](images/2_2.png)

3.Копируем созданный файл nginx.conf внутрь через команду `docker cp nginx.conf <id conteiner>:/etc/nginx/nginx.conf`

![alt text](images/2_3.png)

4.Перезапускаем nginx внутри докер-образа. Для этого опять заходим внутрь контейнера и выполняем команды:

`nginx -t` для проверки правильности конфига

`service nginx reload` для перезапуска nginx с новым конфигом

![alt text](images/2_4.png)

5.Проверяем, что по адресу localhost:80/status отдается страничка со статусом сервера nginx.

![alt text](images/2_5_.png)

6.Экспортируем контейнер в файл container.tar через команду export

`docker export -o container.tar <id container>`

![alt text](images/2_6.png)

7.Останавливаем контейнер `docker stop <id container>`

![alt text](images/2_7.png)

8.Удаляем образ  `docker rmi <id image> -f` , не удаляя перед этим контейнеры. (так как нельзя удалить образ на основе которого в системе имеются контейнеры, используем флаг -f)

![alt text](images/2_8.png)

9.Удаляем остановленный контейнер `docker rm <id container>`

![alt text](images/2_9.png)


10.Импортируем контейнер обратно через команду import. docker import -c CMD ["nginx". "-g". "daemon off;"]container.tar nginx При этом следует использовать флаг -c с инструкцией CMD для корректного восстановления образа

![alt text](images/2_10.png)

11.Далее запускаем импортированный контейнер и проверяем, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

![alt text](images/2_11.png)
![alt text](images/2_12.png)

## Part 3. Мини веб-сервер

1.Напишем мини-сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!.

Создаем простейший сервер по официальной документации.

![alt text](images/3_1.png)

2.Меняем конфиг nginx

![alt text](images/3_2.png)

3.Удаляем старый контейнер и запускаем новый с маппингом 81 порта

![alt text](images/3_3.png)

4.Обновляем пакеты в контейнере и установить недостающее для компиляции сервера. 

Выполняем `docker exec <id container>  apt update` и затем  `docker exec <id conteiner> apt install -y gcc spawn-fcgi libfcgi-dev`(к контейнеру можно обращаться не только по ID, но и по имени). 

![alt text](images/3_4.png)
![alt text](images/3_5.png)

5.На основе получившегося контейнера делаем образ с установленными пакетами, чтобы в случае чего можно было легко запустить новый контейнер `docker commit <id container> <name image>`

![alt text](images/3_6.png)

6.Копируем ранее подготовленный nginx.conf и sourse сервера в контейнер

![alt text](images/3_7.png)

7.Компилируем исходник командой `docker exec <id conteiner> gcc ./server.c -l fcgi -o fcgi_server`и запускаем скомпилированный сервер на порту 8080 `docker exec <id conteiner> spawn-fcgi -p 8080 fcgi_server`

![alt text](images/3_8.png)

8.Перезапускаем nginx с новым конфигом, выполнив `docker exec <id container> nginx -s reload` и проверяем работоспособность `curl 127.0.0.1:81`

![alt text](images/3_9.png)

## Часть 4. Свой докер

Напишем свой докер-образ

1.Создаем файл Dockerfile на основе официального образа nginx

![alt text](images/4_1.png)

Директивы на 4, 5 и 6 строках копируют файлы в контейнер, на 3 строке обновляют пакеты и устанавливают необходимое для компиляции

На 9 строке запускают скрипт:

![alt text](images/4_2.png)

2.Собираем образ командой, задаем ему имя new_server и тег 05 `docker build . -t new_server:05` и проверяем:

![alt text](images/4_4.png)

3.Запускаем контейнер на основе нашего образа с маппингом 81 порта на 80 и пробрасываем на локалхост конфиг nginx, после этого проверяем что все запустилось и сервер корректно отвечает:

`docker run -d -p 80:81 -v ./nginx/nginx.conf:/etc/nginx/nginx.conf new_server:05`

`curl 127.0.0.1:80`

![alt text](images/4_5.png)

4.Изменяем nginx.conf дописав туда проксирование статуса сервера по пути /status:

![alt text](images/4_6.png)

5.Для применения изменений перезапускаем контейнер и проверяем появилась ли страница статуса:

`docker restart <id conteiner>` и `curl 127.0.0.1:80/status`

![alt text](images/4_7.png)

## Часть 5. Доккл

1.Устанавливаем dockle согласно официальной документации.
 
2.Запускаем командой:

`sudo dockle new_server:05` и получаем некоторое количество ошибок.

![alt text](images/5_1.png)

3.Приступаем к исправлению. 

3.1.Включаем Content Trust для Docker:

`export DOCKER_CONTENT_TRUST=1`

3.2.Исправляем Dockerfile. Добавляем пользователя, запускаем сервер от его имени и добавляем HEALTHCHECK для проверки работоспособности контейнеров.

3.3.Подтверждаем 'setgid и setuid'.

![alt text](images/5_2.png)

![alt text](images/5_2_1.png)

3.4.Так же dockle показывает, что в образе есть потенциально опасные ключи: CIS-DI-0010: Do not store credential in environment variables/files, но это ключи базового образа nginx.

Вывод этого сообщения можно подавить убрав ключи Nginx из сканирования:

`dockle --accept-key NGINX_GPGKEYS --accept-key NGINX_GPGKEY_PATH new_server:05`

3.5.Запускаем создание образа с новыми настройками и проверяем dockle.

![alt text](images/5_3.png)

## Часть 6. Базовый Docker Compose

1.Смотрим nginx.conf:

![alt text](images/6_16.png)

2.Для Nginx нужен свой конфиг nginx2.conf. Создаем и сохраняем в папку nginx:

![alt text](images/6_17.png)

3.Пишем docker-compose.yml:

![alt text](images/6_18.png)

4.Проверяем скрипт запуска сервера, порт должен быть согласно docker-compose - 8080

![alt text](images/6_19.png)

5.Проверяем, что нет запущенных контейнеров и создаем образ нашего сервера из docker-compose:

`docker compose build`

![alt text](images/6_13.png)

6.Запускаем: `docker compose up -d`, проверяем что контейнеры запустились, работают и тестируем работу сервисов, видим приветствие Hello World!:

![alt text](images/6_15.png)
