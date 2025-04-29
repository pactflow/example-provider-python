FROM python:3.13@sha256:fdbba75f9d66e120e35bf89a384027518fdcf79902b751473cd80bc0d59adfda

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
