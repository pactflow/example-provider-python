FROM python:3.13@sha256:75ba988a6cd84bb048a05fafae370a2f4600344b844d53ef90730d3518802f67

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
