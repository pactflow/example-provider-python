FROM python:3.13@sha256:322065eea3a904d6d35050a44c1e52650c5a98a060ee115714a17b7bba130582

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
