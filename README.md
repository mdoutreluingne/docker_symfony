Env Dev Symfony with Docker
========

## Clone the repository

Clone the project to your hard drive with the command:
```text
https://github.com/mdoutreluingne/todoandco.git
```

## Mount image

```text
docker-compose up -d
docker ps
docker exec -ti id-image_php-fpm bash
```

## Download Symfony

In the Docker image, via bash:
```bash
clear && ls
git config --global user.email "your@email.fr"
git config --global user.name "your name"
symfony new my_project --full
```

## Launch Symfony internal server

In the Docker image, via bash:
```bash
cd my_project
symfony server:start
```

## Symfony – MySQL connection: .env file

```text
DATABASE_URL=mysql://root:root@mysql:3306/test?serverVersion=5.7
```

## phpMyAdmin

To access phpMyAdmin:

*   url : http://127.0.0.1:8080/
*   login : root
*   password : root

## Symfony project homepage

To access the Symfony project:

*   url : http://127.0.0.1:5000/
