FROM python:3.14@sha256:78ad0471881f0232093c9e6edf58addade7bf106377732e0790c0f0c914b3b7b

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
