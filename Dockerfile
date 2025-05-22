FROM python:3.13@sha256:e3424acce37cdb1d7f885b2d13c14a550a0b6b96ff8a58d2a08883f3f865fd1e

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
