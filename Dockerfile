FROM python:3.14@sha256:934873f1360893d07afe0d25b99af46640e916a5900f1677fb86e41f73920253

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
