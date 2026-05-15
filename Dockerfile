FROM python:3.14@sha256:89a288a9a9e9141b9f0c51744c358138da6369897792f1af3f5425e407d9529a

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
