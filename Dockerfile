FROM python:3.13@sha256:92c10ac1cb14d85108fdf83f69c4daeddbcfc6ada628564475495f2d788240dc

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
