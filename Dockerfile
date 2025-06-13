FROM python:3.13@sha256:3480fd92acd9bb3d9db0d9c62a62350891434c282d2379f84597c3c3dd4beb2e

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
