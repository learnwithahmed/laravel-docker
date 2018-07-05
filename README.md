# Docker development environment PHP/Laravel 🐳

> بيئة تطويرية كاملة لبناء مشاريع بي اج بي بستخدام دوكر

Included Features:

- Nginx
- MySQL
- PHP-FPM
- PHPMyAdmin
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

3.  Install fresh new Laravel app and copy it into `web/` directory

    > تنزيل نسخة من مشروع لارافل ونسخها بداخل ملف الويب

4.  Copy `.env.example => .env` inside `web` where you laravel files

    > نسخ ملف المذكور في الاعلى

5.  You need to generate new laravel key, this can be done inside the container using:

    > بعد تنزيل نسخة من مشروع لارافل يجب توليد مفتاح جديد داخل الحاوية بستخدام الامر

    ```sh
      docker exec -it app sh
      # -it: يتيح لك التعامل مع الحاوية بشكل متفاعل  
      # app: اسم الحاوية بي اج بي
      # sh:  المفسّر الطلوب استخدامه لتنفيذ الامر توليد المفتاح
    ```

    then run this inside container | ومن ثم تحتاج تنفذ امر توليد مفتاح للبرنامج

    ```sh
      php artisan key:generate
    ```

    Or by using | او تستطيع ان تختصر الطريق وتنفذ الامرين مع بعض

    ```sh
      docker exec app php artisan key:generate.
    ```

6.  The application has been baked, it's dinner time 🍔 you can open the following in your browser:
    > تم اكمال الاعدادات، يمكنك تصفح الموقع وقاعدة البيانات من الروابط التالية

    - Laravel: [http://localhost:8000](http://localhost:8000/)
    - PHPMyAdmin: [http://localhost:8080](http://localhost:8080/)  
      > To login PHPMyAdmin use `username: root`, `password: root`. If you want to change the username and password you can do it from `.env` file by changing `MYSQL_ROOT_USER=root` and `MYSQL_ROOT_PASSWORD=root`
      
      > لاسم المستخدم والباسورد وايضا تستطيع تغيرها بداخل الملف .env بستخدام متغيرات المعرفة داخل ملف  phpmyadmin للدخول صفحة 
      


## Docker Command Tips 💡🐳

- To view all your containers stats with Container Names instead of IDs

  > لمراقبة حالة الحاويات بشكل مباشر

  ```sh
  docker stats $(docker inspect -f '{{.Name}}' $(docker ps -q) | cut -c 2-)
  ```

- To acces MySQL shell using CLI inside your container

  > sql للدخول لحاوية مايسكول وتنفيذ اوامر

  ```sh
  docker exec -it mysql bash
  # -it: يتيح لك التعامل مع الحاوية بشكل متفاعل  
  # mysql: اسم الحاوية  
  # bash: يعمل الشل كوسيط بينك وين الحاوية
  ```

  then for `username` and `password` you can find it inside `.env` file or you can use

  ```sh
    mysql -u"$MYSQL_ROOT_USER" -p"$MYSQL_ROOT_PASSWORD"
    #.env اما تستخدم متغيرات للاسم المستخدم والباسورد او تجلب الباسورد من داخل ملف
  ```

- To stop all your containers but don't remove them

  ```sh
    docker-compose stop
    # لإيقاف كل حاويات دون أن تقوم بإزالتها
  ```

- To stop and remove all stopped docker containers and volumes
  ```sh
  docker-compose down -v
  # لإيقاف وازالة كل حاويات.
  # ملاحظة: بعد تنفيذ هذا الامر تحتاج للانترنيت لتحميل الصور المطلوبة
  ```
