FROM python:3.13@sha256:4b66748c4502b2e8250dc8166d6cec50c19ef839c8cd5a6b13ec76ddcfe59fb3

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
