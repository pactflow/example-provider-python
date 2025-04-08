FROM python:3.13@sha256:0293f851d58c726748c9f5d7dca65528ac2d38887b18a48e5689f6c59ef77ea9

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
