# DO-1

## Part 1. Установка ОС 
![](part1.png)

## Part 2. Создание пользователя
![alt text](part2_0.png)
![alt text](part2_1.png)
![alt text](part2.png)
![alt text](part2_.png)

## Part 3. Настройка сети ОС 

Задай название машины вида user-1

1. sudo vim /etc/hostname
2. "server_nata" -> "user-1"
3. save hostname
4. sudo reboot

Установи временную зону

1. sudo timedatectl set-timezone Europe/Moscow
2. timedatectl (для проверки)

Выведи названия сетевых интерфейсов

![alt text](part3_0.png)

Интерфейс lo (от "loopback") - это специальный сетевой интерфейс, который представляет собой петлю в операционной системе. Он используется для связи внутри одного компьютера, не выходя за пределы сетевой карты.

Используя консольную команду, получи ip адрес устройства от DHCP сервера

![alt text](part3_2.png)

DHCP (Dynamic Host Configuration Protocol - Протокол динамической конфигурации узла) - это протокол, который позволяет компьютерам автоматически получать настройки сети, такие как IP-адрес, маска подсети, адрес шлюза и DNS-серверы.

Определи и выведи на экран внешний 

ip-адрес шлюза (ip) и внутренний IP-адрес шлюза

![alt text](part3_4.png)

Задай статичные настройки ip, gw, dns

![alt text](part3_ip.png)

![alt text](part3_ping.png)

## Part 4. Обновление ОС
![alt text](part4.png)

## Part 5. Использование команды sudo

![alt text](part5.png)

Команда `sudo` — это мощный инструмент, который позволяет обычному пользователю временно получить права администратора (root) для выполнения команд, требующих повышенных привилегий.

## Part 6. Установка и настройка службы времени

![alt text](part6.png)

## Part 7. Установка и использование текстовых редакторов

![alt text](vim1.png)

Esc :wq

![alt text](nano1.png)

Ctrl+X yes

![alt text](joe1.png)

Ctrl+K -X

![alt text](vim2.png)

Esc :q!

![alt text](nano2.png)

Ctrl+X no

![alt text](joe2.png)

Ctrl+C

![alt text](vim3_1.png)

Esc :/<>

![alt text](nano3_1.png)

Ctrl+W

![alt text](joe3_1.png)

Ctrl+K -F

![alt text](vim3_2.png)

Esc :.s/<>/<>

![alt text](nano3_2.png)

Ctrl+\ yes

![alt text](joe3_2.png)

Ctrl+k -F R Y

## Part 8. Установка и базовая настройка сервиса SSHD

Установи службу SSHd

sudo apt install ssh

Добавь автостарт службы при загрузке системы

sudo systemctl enable ssh.service

Перенастрой службу SSHd на порт 2022

![alt text](part8_1.png)

Используя команду ps, покажи наличие процесса sshd. Для этого к команде нужно подобрать ключи

![](part8_2.png)

PS отвечает за отображение процессов -C выводит идентификаторы процессов по имени процесса

![alt text](part8_3.png)

t - По протоколу TCP
a - Отображение всех подключений и ожидающих портов.
n - Отображение адресов и номеров портов в числовом формате. 
Cтолбцы: 
Recv-Q -количество запросов в очередях на приём на данном узле/компьютере
Send-Q -количество запросов в очередях на отправку на данном узле/компьютере
Local Address - адрес и номер локального конца сокета
Foreign Address - адрес и номер порта удаленного порта сокета
State - состояние сокета
0.0.0.0 в качестве адреса означает - любой адрес

## Part 9. Установка и использование утилит top, htop

Top:

![alt text](part9.png)

uptime-18:19:00;
количество авторизованных пользователей-1;
средняя нагрузка на сервер-0.00,0.00,0.00(за 1,5 и 15 минут назад);
общее количество процессов-103;
загрузка cpu-(id-100%);
загрузка памяти-1971.4(all),1580.7(free),148.9(used);
pid процесса занимающего больше всего памяти-1;
pid процесса, занимающего больше всего процессорного времени-1;

Htop:

отсортированному по PID, PERCENT_CPU, PERCENT_MEM, TIME

![alt text](part9_pid.png)

![alt text](part9_cpu.png)

![alt text](part9_mem.png)

![alt text](part9_t.png)

отфильтрованному для процесса sshd

![alt text](part9_sshd.png)

с процессом syslog, найденным, используя поиск

![alt text](part9_syslog.png)

с добавленным выводом hostname, clock и uptime

![alt text](part9_time.png)

## Part 10. Использование утилиты fdisk 

sudo fdisk -l

![alt text](part10_1.png)

Disk model: VBOX HARDDISK;
Disk /dev/sda: 30.1 GiB;
4165005728 sectors.

![alt text](part10_2.png)

Swap: 2.0 GiB

## Part 11. Использование утилиты df 

![alt text](part11_1.png)

GB

![alt text](part11_2.png)

ext4 Lunix

## Part 12. Использование утилиты du

![alt text](part12.png)

## Part 13. Установка и использование утилиты ncdu

![alt text](part13_home.png)
![alt text](part13_var.png)
![alt text](part13_log.png)

## Part 14. Работа с системными журналами 

![alt text](Part14_dmesg.png)

![alt text](part14_syslog.png)

![alt text](part14_auth.png)

time: jul 21 17:03:31;
user: server_user;
type: sudo.

SSHD:

![alt text](Part14_sshd1.png)

![alt text](Part14_sshd.png)

## Part 15. Использование планировщика заданий CRON 

crontab -e

crontab -l

![alt text](Part15_list.png)

sudo grep CRON /var/log/syslog

![alt text](Part15_uptime.png)

![alt text](Part15_list1.png)
