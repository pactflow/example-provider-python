FROM python:3.14@sha256:511f025a0718f01b977d5ad572bc431745b31887ceccc538c85b87e82ad2956f

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
