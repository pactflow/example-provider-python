FROM python:3.14@sha256:e6b1f7011589cc717a5112e6fdb56217e9e734a57e4cb50216e912b068b392a8

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
