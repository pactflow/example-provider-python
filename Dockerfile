FROM python:3.13@sha256:c32aeafeda56c09a4220b2b56d49d5efd0d803c302abdd5643b0bddb7ccd57aa

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
