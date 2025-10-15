FROM python:3.13@sha256:b7341c0bd097a5f8763418c20553c539eb917d22cb87e9706fc2da0d4b702199

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
