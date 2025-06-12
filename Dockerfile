FROM python:3.13@sha256:93b9769eb30d8ac0351c4a26b7c41f739c2de6917910eddc7e4d94834a7beb99

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
