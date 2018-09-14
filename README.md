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

1.  ```sh
    docker-compose up -d
    # لسحب كل الصورة للبرامج المطلوبة, مرات تاخذ وقت يجب الانتظار
    # 🐢 You need to be patient, this might take a several minutes 🐢
    ```

2.  If you want to attach yourself to the logs of all running services by running this command :

    > إذا أردت مشاهدة النتائج تفصيلية عن العمليات والاوامر الجاري تنفيذها بالوقت الحالي

    ```sh
    docker-compose logs -f -t
    # whereas -f means you follow the log output and the -t option gives you nice timestamps
    # يقوم بعرض الوقت والتاريخ بشكل مفهوم -t يقوم بتتبع النتائج بالوقت الحقيقي و  -f بينما
    ```

3.  Install fresh copy of laravel and name it `web`

    > تنزيل نسخة من مشروع لارافل تحت اسم ويب

    ```sh
      ./commands composer create-project --prefer-dist laravel/laravel web
      # ./command: ملف يحتوي على اوامر مختصره لكل حاوية
    ```

4.  Copy `.env.example => .env` inside `web` where you laravel files

    > المذكور فوقenv نسخ ملف

5.  Update DB config inside laravel `.env` file with this

    > حدث اعدادات قاعدة بيانات مشروعك

    ```sh
     DB_HOST     = db
     DB_PORT     = 3309
     DB_DATABASE = homestead
     DB_USERNAME = homestead
     DB_PASSWORD = secret
    ```

    > Note: you can change all db config in `.docker.env` as well.

    > `.docker.env` تستطيع تغير اعدادت قاعدة البيانات من داخل ملف

6.  You need to generate new laravel key, this can be done inside the container using:

    > في حالة اذ تحتاج لتوليد مفتاح جديد لمشروعك نفذالامر التالي

    ```sh
      ./commands artisan key:generate
      # ./command: ملف يحتوي على اوامر مختصره لكل حاوية
    ```

7.  The application has been baked, its dinner time 🍔 you can open the following in your browser:

    > تم اكمال الاعدادات، يمكنك تصفح الموقع وقاعدة البيانات من الروابط التالية

    - Laravel Applicaion: [http://localhost:8080](http://localhost:8080)
    - PHPMyAdmin: [http://localhost:8080](http://localhost:8080/)

    > To access PHPMyAdmin you need username and password, you can use `MYSQL_USER`, `MYSQL_PASSWORD` from `.docker.env` file.

    > Note: If you want to update/change the username and password inside `.docker.env`, don't forget to run `./commands rebuild`

    > `.docker.env` تحتاج لاسم المستخدم وكلمة المرور الموجوده داخل ملف PHPMyAdmin للدخول صفحة

## Useful Commands 💡🐳

Inside `commands` shell file, you can fine many useful commands to speedup your workflow. Lets see how to use them:

> داخل ملف الاومر يوجداوامر جاهزة ومختصره تخص دوكر لتسريع عملك اثناء التطوير

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
