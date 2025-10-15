FROM python:3.13@sha256:9c5a9be272fbd980f0719e65addfe63f65a4d3b1afa33584d75f6c845b7119b1

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
