FROM python:3.13@sha256:a66f18ee22c568a3d45191dfd70bdea2e1bd8d303f982ea1bca276a065285a21

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
