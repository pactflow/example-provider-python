FROM python:3.13@sha256:710f416809409efd8826234d3bd81c6e68432c26bc851d733aad18f71b3125f1

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
