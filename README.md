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

## Install the project | تحميل المشروع ⛷
> بكون ممنون اذا احد الاخوه يقوم يترجمة هذا الجزء لان ماعندي وقت فراغ

If you already have an exsiting Laravel Project, skip step 1
1. Install a fresh copy of laravel using
    ```sh
    # using Laravel installer
    laravel new my-laravel-app

    # OR using Composer
    composer create-project --prefer-dist laravel/laravel my-laravel-app

    # OR using gitHub repository
    git clone https://github.com/laravel/laravel.git my-laravel-app
    ```

2. change into an existing project folder
    ```sh
    cd my-laravel-app
    ```

3. Now, let's check if git is already initialized in our laravel projet

    ```sh
    git status
    ```
    If you get this error message:
    > fatal: Not a git repository (or any of the parent directories): .git

    that means your laravel projet you are currently in is not being tracked by git. In that case, initialize git inside your project folder by typing 

    ```sh
    git init
    ```

4. Now, let add our `Laravel-Docker` project as a `submodule` to our laravel project and tracking the `master` branch using:
    > حمل المشروع

    ```sh
    # Adds a new submodule into our project and define that the master branch should be tracked
    git submodule add -b master git@github.com:code2gether/laravel-docker.git docker
    # Initialize submodule configuration
    git submodule init

    # If you already done steps above and want to fetch new update from Laravel Docker project use:
    git submodule update --remote
    ```

## Run the application | تشغيل المشروع 🚀

To start the application run the following commands :

> لبدء تشغيل التطبيق يجب تنفيذ الأوامر التالية

1. Change project directory 
    > ادخل لملف المشروع

    ```sh
    cd docker
    ```

2.  Spin up all docker containers

    >  لسحب كل الصورة للبرامج المطلوبة, ,قد تستغرق بعض الوقت

    ```sh
    docker-compose up -d
    # You need to be patient, this might take a several minutes 🐢
    ```

3.  If you want to attach yourself to the logs of all running services by running this command :

    > لكل الحاويات logs لمشاهدة

    ```sh
    docker-compose logs -f -t
    # whereas -f means you follow the log output and the -t option gives you nice timestamps
    # يقوم بعرض الوقت والتاريخ بشكل مفهوم -t يقوم بتتبع النتائج بالوقت الحقيقي و  -f بينما
    ```

4.  If there is no `.env` file insde `project` directory, then make a new copy using:
    > تحتاج لعمل نسخة للملف env في حال اذا كال المشروع لايحتوي على ملف

    ```sh
      cp .env.example .env
    ```

5.  Copy `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD` from docker's `.env` file . 
    > للدوكر env انسخ اعدادات قاعدة البيانات من ملف 
    
    ```sh
    DB_PORT=3306
    MYSQL_VERSION=5.7
    MYSQL_ROOT_PASSWORD=secret
    MYSQL_DATABASE=homestead
    MYSQL_USER=homestead
    MYSQL_PASSWORD=secret
    ```

    ```sh
    # You can udpate configuration above as well but dont forget to run:
    # او تغير الباسورد لقاعدة البيانات ... الخ ولكن لاتنسى تنفيذ امر mysql وايضا تستطيع تحديث الاعدادات في اي وقت مثلا تغير نسخة 
    
    docker-compose up --build -d
    ```
> 
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
  # لتشغيل كل الحاويات المطلوبة
  ./commands start
  ```

- To stop all containers but don't remove them

  ```sh
  # لإيقاف كل حاويات دون أن تقوم بإزالتها
  ./commands stop
  ```

- To stop and remove all stopped docker containers and volumes

  ```sh
  # لإيقاف وازالة كل حاويات.
  ./commands remove

  # ملاحظة: في حالة تنفيذ هذا الامر تحتاج للانترنيت لتحميل الصور المطلوبة من جديد
  ```

- To view logs of all running services

  ```sh
  # لكل الحاويات logs لمشاهدة
  ./commands logs
  ```

- To require any package to your Laravel project using composer


  ```sh
  # لتنزيل اي مكتبة لمشروع لارافل
  ./commands composer require nesbot/carbon

  # Shortcut
  ./commands comp require nesbot/carbon
  # مختصر لامر السابق
  ```

- To use `artisan` command for doing anything
  ```sh
  # لتنفيذ اوامر لارافل
  ./commands artisan make:auth
  # OR
  ./commands artisan migrate

  # Shortcut | مختصر لامر السابق
  ./commands art make:auth
  ```

- To monitor containers health in formatted way using containers name
  ```sh
  # لمراقبة حالة الحاويات بشكل مباشر
  ./commands stats
  ```

- When you working with Frontend development, you can use following commands:
  ```sh
  # npm او yarn لتنزيل مكتبات فرونت اند بستخدام احدى الادوات
  ./commands yarn add react

  # OR
  ./commands npm install --save react
  ```
