FROM python:3.14@sha256:29f6dd673b2788db9eef6bb8896ee6cec7b4506a63fe4a90a9258d3b82221a2a

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
