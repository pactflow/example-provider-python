FROM python:3.13@sha256:3abe339a3bc81ffabcecf9393445594124de6420b3cfddf248c52b1115218f04

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
