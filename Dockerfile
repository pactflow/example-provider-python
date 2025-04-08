FROM python:3.13@sha256:d95f742dc4805e4158e414c07863259f6c5ae28a43ccfbcbe7a6be813c6b84fe

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
