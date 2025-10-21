FROM python:3.14@sha256:232ea2cc4a26b0ed8ae7f609e1d975d7f469ecdebd8e958410cf1ff1a9ff1be1

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
