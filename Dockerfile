FROM python:3.11

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY . /app/

RUN pip3 install poetry

RUN poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi

RUN poetry install