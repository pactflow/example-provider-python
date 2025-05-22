FROM python:3.13@sha256:721b56139b0c6f8512286bd0d3d2edefe34dffc7ab488fc8aa39ed129e0ad6b5

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
