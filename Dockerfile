FROM python:3.13@sha256:0aafd87e2438b9db15ffc16e86eed18224c5bc10ab71671f379cae240f3c044e

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
