FROM python:3.14@sha256:fe6ffb340c566fe7459832667da8b545896edb30c3dce0c3b1218ab4d377ba7d

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
