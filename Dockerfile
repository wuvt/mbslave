FROM python:2-alpine

RUN apk --no-cache add postgresql-client
RUN apk --no-cache add --virtual build-dependencies gcc musl-dev postgresql-dev python-dev \
        && pip install psycopg2 \
        && apk del build-dependencies

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app
RUN ln -s /data/config/mbslave.conf mbslave.conf

CMD ["sh"]
