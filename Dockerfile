FROM python:3.13@sha256:ede46d7778a7ebac1e2f5253cdb9b59d3928c736b280636f68dcc60250619a03

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
