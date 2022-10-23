FROM       python:3
RUN        mkdir /app
WORKDIR    /app

ADD        payment.ini /app
ADD        payment.py /app
ADD        rabbitmq.py /app
ADD        requirements.txt /app
RUN        pip3 install -r requirements.txt
ENTRYPOINT ["uwsgi", "--ini", "payment.ini"]
