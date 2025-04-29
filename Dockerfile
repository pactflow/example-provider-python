FROM python:3.13@sha256:c33390eacee652aecb774f9606c263b4f76415bc83926a6777ede0f853c6bc19

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
