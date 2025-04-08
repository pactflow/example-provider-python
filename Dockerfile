FROM python:3.13@sha256:18ecbd0f5b70ebd15c1b510b58899def5e0e21260f59477e8186565977d2402c

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
