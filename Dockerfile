FROM python as base
WORKDIR /usr/src/app
RUN pipenv install --deploy

FROM base as base-dev
RUN pipenv install --deploy --dev

FROM base as app
COPY ./app ./app

FROM base-dev as dev
COPY . .
