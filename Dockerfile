FROM python:3.13@sha256:653b0cf8fc50366277a21657209ddd54edd125499d20f3520c6b277eb8c828d3

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
