FROM python:3.9 as poetry-init

WORKDIR /app
ENV YOUR_ENV=${YOUR_ENV} \
  PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_HOME=/py-poetry \
  POETRY_VIRTUALENVS_CREATE=0 \
  POETRY_VERSION=1.1.11


COPY bin bin

RUN python bin/install-poetry.py
ENV PATH="${POETRY_HOME}/bin:$PATH"

COPY pyproject.toml poetry.lock ./

RUN poetry install