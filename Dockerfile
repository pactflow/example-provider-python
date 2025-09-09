FROM python:3.13@sha256:74503e0bff6cf811f029590a05e0218cc9ba3e099a4b7df0ab84a67df081e1bc

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
