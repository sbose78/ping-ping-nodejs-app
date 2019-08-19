FROM python:3.7-alpine as base

FROM base as builder

COPY requirements.txt /srv/app/requirements.txt
RUN pip install -r /srv/app/requirements.txt


FROM base

COPY --from=builder /usr /usr
COPY . /srv/app

WORKDIR /srv/app
RUN chmod 777 /srv/app
RUN chmod 777 gunicornstart.sh

EXPOSE 8080

CMD ["./gunicornstart.sh"]
