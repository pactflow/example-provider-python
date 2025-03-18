FROM python:3.13@sha256:d392a962e9433ffa96f401a9b2f4387ed4f2d4058d94fe7358661abfdfbd1f5b

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
