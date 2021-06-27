FROM python:3.8-slim
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app
RUN pip3 install -r requirements.txt
ADD . /app
EXPOSE 5000
ENTRYPOINT ["gunicorn", "--config=app/gunicorn_config.py", "app.wsgi:app"]
# RUN chmod +x ./entrypoint.sh
# ENTRYPOINT ["sh", "entrypoint.sh"]