FROM python:3.14@sha256:c608f8ffb59800d6cc97a8fe3d0f1c5f7477cf43ff5120e05b6f74fd830699b7

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
