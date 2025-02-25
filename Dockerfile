FROM python:3.13@sha256:44def10060471c133916e37e361d295edec67f4330c6d52fdbcc19fd9315926d

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
