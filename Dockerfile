FROM python:3.13@sha256:2deb0891ec3f643b1d342f04cc22154e6b6a76b41044791b537093fae00b6884

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
