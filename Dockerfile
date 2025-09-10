FROM python:3.13@sha256:35c05b6d32b11a1a8134f35dd0db68ef6fbb21ce62934a7aec6d50977915a92c

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
