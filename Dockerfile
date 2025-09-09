FROM python:3.13@sha256:b41c4877ed4d8a4d6e04f0b341b84f2bd384325816975b1ebf7a2f2e02b7acaa

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
