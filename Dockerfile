FROM python:3.13@sha256:9be4c0532ffe350bda6aee0b2cb2be732c92ffd29b5835e9d5bd2667e2997fd7

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
