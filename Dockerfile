FROM python:3.14@sha256:2ca6cda25055227533141435ab8ec0dd3afd9165d78d8bf0f58c8d959d57b9fc

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
