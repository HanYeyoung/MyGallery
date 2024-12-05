FROM python:3.9.0

WORKDIR /home/

RUN echo "mygallery"

RUN git clone https://github.com/HanYeyoung/mygallery.git

WORKDIR /home/mygallery/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=mygallery.settings.deploy && python manage.py migrate --settings=mygallery.settings.deploy && gunicorn mygallery.wsgi --env DJANGO_SETTINGS_MODULE=mygallery.settings.deploy --bind 0.0.0.0:8000"]