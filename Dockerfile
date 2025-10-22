FROM python:3.14@sha256:6f488d4812c59fa17cfc1a766d8d09ceb102fde42f341230bd6229e15b3e78e8

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
