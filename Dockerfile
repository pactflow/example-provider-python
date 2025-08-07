FROM python:3.13@sha256:ef3361c6ba7b5c8f5538ceb322e98bc7f93ba93e49492d92454db660dedb6389

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
