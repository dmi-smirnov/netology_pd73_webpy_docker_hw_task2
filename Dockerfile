# Создайте контейнер для REST API сервера любого вашего проекта из курса
# по Django (например, CRUD: Склады и запасы).
# ВАЖНО: поменяйте БД с postgresql на sqlite3. Чтобы ваш контейнер мог
# работать без зависимости от postgres (с этим мы разберемся на следующем занятии).
# Проверьте конфигурацию Django на использование переменных окружения (environment).
# Приложите в репозиторий Dockerfile и файлы приложения.
# В README.md описать типовые команды для запуска контейнера
# c backend-сервером.

FROM python:3.10.12

WORKDIR /usr/src/app

COPY ./netology_pd_django_hw_3.2_crud .
RUN pip install -r requirements.txt
RUN python manage.py makemigrations logistic
RUN python manage.py migrate

CMD python manage.py collectstatic --noinput; \
    gunicorn stocks_products.wsgi -b 0.0.0.0:80