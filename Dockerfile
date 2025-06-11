FROM python:3.13@sha256:eec1b4e88e8762b4711b9f5fd69648b96ac04864e56993769cf50a9891a1d317

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
