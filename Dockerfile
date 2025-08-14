FROM python:3.13@sha256:819daf0e0d5e5bb88927aea18a9279f870f746c234d45468fd493ab618729866

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
