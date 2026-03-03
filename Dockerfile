FROM python:3.14@sha256:61346539f7b26521a230e72c11da5ebd872924745074b19736e7d65ba748c366

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
