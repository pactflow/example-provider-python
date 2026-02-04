FROM python:3.14@sha256:1c4c033d666001d84b5c4d85280af2c5a21a4ea1eb86c2fc06e3ef2f33fa6776

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
