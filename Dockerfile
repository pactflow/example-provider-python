FROM python:3.14@sha256:671d8548cfc6ec789cbdd74c8585bd614864d1005970167350a2586be8db5650

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
