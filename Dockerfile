FROM python:3.14@sha256:7960a76b45493e8a3b87a0365e257c547b66e8d0c8cd629c029aec9c9e31ed5e

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
