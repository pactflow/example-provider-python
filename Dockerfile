FROM python:3.13@sha256:4889af0e45f04b7c5dd741421a1280919499d38d3125d714b69fa86b23b1052a

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
