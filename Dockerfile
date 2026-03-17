FROM python:3.14@sha256:0040600478fe761fbaea26b16cb4ce1b520e5aa1cef26d0762c538ece5892c02

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
