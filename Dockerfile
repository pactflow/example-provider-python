FROM python:3.14@sha256:183714ee0f359d1daadec0b49c118c6ff5861a91a0a4f8952f84d273b4419ab9

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
