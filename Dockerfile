FROM python:3.13@sha256:a9710c44d58cb3fcba391e09b20e52147caf99be418aac2ba4ffa128435fc303

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
