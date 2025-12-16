FROM python:3.14@sha256:492b292a9449d096aefe5b1399cc64de53359845754da3e4d2539402013c826b

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
