FROM python:3.13@sha256:3592650a0a8e6709cd4f3359dc7f1665c35bd9da6da34a9f22050aaf4878511f

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
