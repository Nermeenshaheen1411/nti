FROM python:3.10-alpine
RUN pip install --upgrade pip
WORKDIR /app
COPY ./requirements.txt .
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add --no-cache mariadb-dev
RUN pip install -r requirements.txt
COPY ./src  /app
COPY ./entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]

