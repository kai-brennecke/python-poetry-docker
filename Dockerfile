FROM python:3.13.7-alpine3.22

ENV POETRY_NO_INTERACTION=1 \
  POETRY_VIRTUALENVS_CREATE=false

RUN apk add --no-cache curl && \
    curl -sSL https://install.python-poetry.org | python3 - && \
    apk del curl

ENV PATH="/root/.local/bin:$PATH"

RUN python -V > .python_version && \
    poetry -V > .poetry_version && \
    cat /etc/os-release .python_version .poetry_version > .container_version && \
    rm .python_version && \
    rm .poetry_version
