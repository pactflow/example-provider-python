FROM python:3.13@sha256:b9a26ed0117af0612457ffdbfb8973f2b5d88f3670d7e353ed7db0fda9e177c8

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
