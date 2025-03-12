FROM python:3.13@sha256:bc336add24c507d3a11b68a08fe694877faae3eab2d0e18b0653097f1a0db9f3

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
