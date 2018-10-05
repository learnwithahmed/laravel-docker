# Docker development environment PHP/Laravel 🐳

> بيئة تطويرية كاملة لبناء مشاريع بي اج بي بستخدام دوكر

Included Features:

- Nginx
- MySQL
- PHP-FPM
- PHPMyAdmin
- Nodejs (including npm, yarn)
- Composer

## Important Instructions | تعليمات مهمة 💁‍♂️

Firs thing you need to do is to Make sure you have all these before you install this project

> قبل تنزيل المشروع تاكد من تنزيل وتنصيب البرامج التالية

- [Git](https://git-scm.com/downloads)
- [Docker](https://docs.docker.com/engine/installation/)
- [Docker Compose](https://docs.docker.com/compose/install/)

Then check if you install them correctly running the following commands :

> تحقق اذا قمت بتثبيتهم بشكل صحيح بستخدام الأوامر التالية

- Git
  ```sh
  git --version # للتاكد من نسخة الكيت
  ```
- Docker
  ```sh
  docker -v     # للتاكد من نسخة الدوكر
  ```
- Docker Compose
  ```sh
  docker-compose -v # للتاكد من نسخة دوكر كمبوس
  ```

## Clone the project | تحميل المشروع ⛷

Download the project by the following command :

> حمل المشروع

```sh
  git clone git@github.com:code2gether/laravel-docker.git
  or
  git clone https://github.com/code2gether/laravel-docker.git
```

Go to the project directory :

> ادخل لملف المشروع

```sh
  cd laravel-docker
```

## Run the application | تشغيل المشروع 🚀

To start the application run the following commands :

> لبدء تشغيل التطبيق يجب تنفيذ الأوامر التالية

1.  Spin up all docker containers

    > لتهيئة كل الحاويات المطلوبة

    ````sh
    docker-compose up -d
    # 🐢 You need to be patient, this might take a several minutes 🐢
    ```
    ````

2.  If you want to attach yourself to the logs of all running services by running this command :

    > لكل الحاويات logs لمشاهدة

    ```sh
    docker-compose logs -f -t
    # whereas -f means you follow the log output and the -t option gives you nice timestamps
    # يقوم بعرض الوقت والتاريخ بشكل مفهوم -t يقوم بتتبع النتائج بالوقت الحقيقي و  -f بينما
    ```

3.  Install fresh copy of laravel

    > تنزيل نسخة من مشروع لارافل بستخدام احدى الامرين

    ```sh
      # either by this command
      ./commands composer create-project laravel/laravel laravelapp --no-progress --profile --prefer-dist

      # or using Laravel installer
      laravel new laravelapp
    ```

    Move all laravel files into `web` directory | نقل المشروع او جميع الملفات من داخل مشروع لارافل لمسار الويب

    ```sh
      mv web/laravelapp/.* ./web
      mv web/laravelapp/* ./web
    ```

4.  If there is not `.env` file, then copy `.env.example => .env` inside `web` where you laravel files. you can do it through terminal:

    > بستخدام الامر الموجود في الاسفل env نسخ ملف

    ```sh
      cp .env.example .env
    ```

5.  For `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`, please refer to the docker `.env` file . You can also update the file `env` to update those configurations. Below are the default configurations.

    ```sh
    # وايضا تستطيع تحديثها في اي وقت ولكن لاتنسى تنفيذ امر env جميع اعدادات قاعدة البيانات متوفره داخل ملف
    # docker-compose up --build -d

    DB_PORT=3309 - # you can use this port if you want to connect to DB using SequelPro, TeamSQL, WorkBrench, ...etc.
    MYSQL_VERSION=5.7
    MYSQL_ROOT_PASSWORD=secret
    MYSQL_DATABASE=homestead
    MYSQL_USER=homestead
    MYSQL_PASSWORD=secret
    ```

6.  If you need to generate new laravel key, this can be done inside the container using:

    > في حالة اذ تحتاج لتوليد مفتاح جديد لمشروعك نفذ الامر التالي

    ```sh
      docker-compose exec app php artisan key:generate
      #or
      ./commands artisan key:generate
      # ./commands: ملف يحتوي على اوامر مختصره لكل حاوية
    ```

7.  The application has been baked, its dinner time 🍔. Now you can open the following in your browser:

    > تم تجهيز البيئة المطلوبة ، يمكنك زيارة الروابط التالية

    - Laravel Applicaion: [http://localhost:8080](http://localhost:8080)
    - PHPMyAdmin: [http://localhost:8081](http://localhost:8081/)

## Useful Commands 💡🐳

Inside `commands` shell file, you can fine many useful commands to speedup your workflow. Lets see how to use them:

> داخل ملف الاوامر يوجد مختصرات جاهزة لاوامر تخص دوكر لتسريع عملك

- To startup containers

  ```sh
  ./commands start
  # لتشغيل كل الحاويات المطلوبة
  ```

- To stop all containers but don't remove them

  ```sh
  ./commands stop
  # لإيقاف كل حاويات دون أن تقوم بإزالتها
  ```

- To stop and remove all stopped docker containers and volumes

  ```sh
  ./commands remove
  # لإيقاف وازالة كل حاويات.
  # ملاحظة: في حالة  تنفيذ هذا الامر تحتاج للانترنيت لتحميل الصور المطلوبة من جديد
  ```

- To view logs of all running services

  ```sh
  ./commands logs
  ```

- To require any package to your Laravel project using composer

  > لتنزيل اي مكتبة لمشروع لارافل

  ```sh
  ./commands composer require nesbot/carbon

  # Shortcut
  ./commands comp require nesbot/carbon
  # مختصر لامر السابق
  ```

- To use `artisan` command for doing anything

  > لتنفيذ اوامر لارافل

  ```sh
  ./commands artisan make:auth
  # OR
  ./commands artisan migrate

  # Shortcut
  ./commands art make:auth
  #  مختصر لامر السابق
  ```

- To monitor containers health in formatted way using containers name

  > لمراقبة حالة الحاويات بشكل مباشر

  ```sh
  ./commands stats
  ```

- When you working with Frontend development, you can use following commands:
  > npm او yarn تحتاج اما Frontend في حالة تنزيل مكتبات
  ```sh
  ./commands yarn
  # OR
   ./commands yarn add react
  # OR
  ./commands npm install
  # OR
  ./commands npm install --save react
  ```
