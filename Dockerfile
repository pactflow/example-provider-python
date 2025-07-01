FROM python:3.13@sha256:9a4c72e547e3e21c5325a53289a52a21cd6f737358b2f83035c860647547051b

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
