FROM python:3.14@sha256:6632dac1bc03ec8ea49547d866f0e5763db8fb4827bc91169ad8909248fd8190

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
